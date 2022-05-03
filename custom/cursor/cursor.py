# v1.0.2 - 04/01/2022
# release notes:
# - design pattern needs a review
# - future releases will add a visual rectangle while holding mouse click

from termcolor import colored
import base64
import pyautogui
import requests
import pyperclip as pc
import os

import mss
import mss.tools

from pynput.mouse import Listener

# clear console
clearConsole = lambda: os.system('cls' if os.name in ('nt', 'dos') else 'clear')
clearConsole()



class ScreenRegion():
    #TODO: make this a Singleton
    API_URL = 'https://api.imgbb.com/1/upload'
    API_KEY = '4d32c7fcd681f4061b537f428804f6ed'

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
            self.monitor = {"left": xStart, "top": yStart, "width": width, "height": height}

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
                # save screenshot image locally
                output = "screenshot-{width}x{height}px.png".format(**self.monitor)
                messageHandler.printInfoMessage('saving file locally: "%s"' % output)
                mss.tools.to_png(self.screenshot.rgb, self.screenshot.size, output=output)

                # get binary data and encode to base64 for later uploading
                inBytes = mss.tools.to_png(self.screenshot.rgb, self.screenshot.size)
                self.imageBase64 = base64.b64encode(inBytes)

                return True

            except ValueError:
                messageHandler.printErrorMessage(' couldn\'t get output format from file name')

            except OSError:
                messageHandler.printErrorMessage(' couldn\'t write file.')

    def uploadImage(self):
        if self.screenshot:
            messageHandler.printInfoMessage('getting url')
            try:
                #TODO: get this from a Singleton
                payload = {
                        "key": self.API_KEY,
                        "image": self.imageBase64
                    }

                res = requests.post(self.API_URL, payload)

                self.imageURL = res.json()['data']['display_url']

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

class Controller():
    def init(self):
        self.region = ScreenRegion()

    def run(self):
        self.region.takeScreenshot()
        self.region.saveImage()
        self.region.uploadImage()
        self.copyUrlToClipboard(self.region.getImageURL())
        messageHandler.printInfoMessage('got screenshot url on clipboard :)')
        messageHandler.printInfoMessage('')
        # stop listener
        return False

    def copyUrlToClipboard(self, data):
        pc.copy(data)

        
# init
controller = Controller()
messageHandler = MessageHandler()
controller.init()

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
