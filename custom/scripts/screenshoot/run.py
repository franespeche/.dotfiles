# Take a screenshot of a selected area and copy image url to clipboard

# v1.0.2 - 04/01/2022
# release notes:
# - future releases will draw a rectangle while selecting area
# - needs refactor and modularization
# - only main monitor supported (will support more)
# - known bugs:
#   - negative selection area not handled atm

from pynput.mouse import Listener
import mss.tools
import mss
from termcolor import colored
import base64
import pyautogui
import requests
import sys
import pyperclip as pc
import os
from datetime import datetime

from dotenv import load_dotenv
load_dotenv()

import optparse
p = optparse.OptionParser()
p.add_option('--expiration', '-e', default="0")
options, arguments = p.parse_args()


# clear console
def clearConsole(): return os.system(
    'cls' if os.name in ('nt', 'dos') else 'clear')

clearConsole()


class Controller():
    API_URL = os.getenv('API_URL')
    API_KEY = os.getenv('API_KEY')

    def init(self):
        self.region = Screenshot()

    def run(self):
        self.region.takeScreenshot()
        self.region.saveImage()
        self.region.uploadImage()
        imageURL = self.region.getImageURL()
        self.copyUrlToClipboard(imageURL)
        messageHandler.printInfoMessage('got screenshot url on clipboard: %s' % imageURL)
        messageHandler.printInfoMessage('image link expires in: %s seconds' % self.region.expiration)
        self.createTxtFile(self.region.name, self.region.imageURL, self.region.expiration)
        messageHandler.printInfoMessage('')
        # stop listener
        return False

    def createTxtFile(self, screenshotName, screenshotUrl, screenshotExpiration):
        messageHandler.printInfoMessage('saving files data to .got-screenshots')
        f = open('.got-screenshots', 'a')
        now = self.getCurrentTime()
        f.write('created at: %s\nfilename: %s \nurl: %s\nexpiration: %s seconds\n ' % (now, screenshotName, screenshotUrl, screenshotExpiration))
        f.write('------------------------------------------------------------------------------------------\n')
        f.close()
        messageHandler.printInfoMessage('done :)')
        messageHandler.printInfoMessage('')

    def copyUrlToClipboard(self, data):
        pc.copy(data)

    def getCurrentTime(self):
        now = datetime.now()
        dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
        return dt_string


class Screenshot(Controller):
    def __init__(self):
        messageHandler.printInfoMessage('select an area to take screenshot :)')

    def setStart(self, x, y):
        self.start = x, y

    def setEnd(self, x, y):
        self.end = x, y

    def getRegion(self):
        return self.start + self.end

    def takeScreenshot(self):
        messageHandler.printInfoMessage('taking screenshot')

        with mss.mss() as sct:
            # size data
            xStart, yStart = self.start[0], self.start[1]
            xEnd, yEnd = self.end[0], self.end[1]
            width = xEnd - xStart
            height = yEnd - yStart

            # set monitor
            self.monitor = {"left": xStart, "top": yStart,
                            "width": width, "height": height}

            # take screenshot
            screenshot = sct.grab(self.monitor)

        if screenshot:
            messageHandler.printInfoMessage('got screenshot :)')
            self.screenshot = screenshot

        else:
            messageHandler.printInfoMessage('couldn\'t take screenshot :(')
            raise RuntimeError


    def saveImage(self):
        if self.screenshot:
            try:
                # save screenshot image locally and set self.name
                name = "screenshot-{width}x{height}px.png".format(
                    **self.monitor)
                output = "screenshots/%s" % name
                self.name = output
                messageHandler.printInfoMessage(
                    'saving file locally: "%s"' % output)
                mss.tools.to_png(self.screenshot.rgb,
                                 self.screenshot.size, output=output)

                # get binary data and encode to base64 for later uploading
                inBytes = mss.tools.to_png(
                    self.screenshot.rgb, self.screenshot.size)
                self.imageBase64 = base64.b64encode(inBytes)

                return True

            except ValueError:
                messageHandler.printErrorMessage(
                    ' couldn\'t get output format from file name')

            except OSError:
                messageHandler.printErrorMessage(' couldn\'t write file.')


    def uploadImage(self):
        if self.screenshot:
            messageHandler.printInfoMessage('getting url')

            try:
                url = super().API_URL + '?expiration=' + options.expiration
                payload = {
                    "key": super().API_KEY,
                    "image": self.imageBase64,
                    "expiration": options.expiration
                }

                res = requests.post(url, payload)

                self.expiration = res.json()['data']['expiration']
                self.imageURL = res.json()['data']['url']

            except ConnectionError:
                messageHandler.printErrorMessage(' connection error')

            except Timeout:
                messageHandler.printErrorMessage(' connection timeout')

            except TooManyRedirects:
                messageHandler.printErrorMessage(' too many redirects')
        else:
            messageHandler.printErrorMessage(' no screenshot to upload')

    def getImageURL(self):
        return self.imageURL

# status messages handling
class MessageHandler():
    messageHistory = ''

    def printInfoMessage(self, message):
        clearConsole()
        if self.messageHistory:
            print(colored(self.messageHistory, 'white'))
        if message:
            formattedMessage = ('· %s' % message)
            self.messageHistory += '%s\n' % formattedMessage

            print(colored('%s\n' % formattedMessage, 'green'))

    def printErrorMessage(self, message):
        clearConsole()
        if messageHistory:
            print(messageHistory)

        formattedMessage = ('× %s' % message)
        self.messageHistory += '%s\n' % formattedMessage

        print(formattedMessage)

# init
controller = Controller()
messageHandler = MessageHandler()
controller.init()

# listeners
def on_click(x, y, button, isPressed):
    if isPressed:
        controller.region.setStart(int(x), int(y))
    else:
        controller.region.setEnd(int(x), int(y))

        # run
        return controller.run()


with Listener(
        on_click=on_click,
        # supress system click
        suppress=True) as listener:
    listener.join()
