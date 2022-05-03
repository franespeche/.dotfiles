# ref:
# https://pythonhosted.org/pynput/mouse.html
# https://python-mss.readthedocs.io/examples.html
# https://pyshark.com/take-screenshot-using-python/

# 01/03/2022
# release notes:
# - there is a bug in the region width
# - there are still some things to refactor (TODO)
# - design pattern needs a review
# - future releases will need to fix these and also add a visual rectangle while holding mouse click

import base64
import pyautogui
import requests
import pyperclip as pc
import os

import mss
import mss.tools

from pynput.mouse import Listener
from io import BytesIO

# clear console
clearConsole = lambda: os.system('cls' if os.name in ('nt', 'dos') else 'clear')
clearConsole()

# status messages handling
        
def printInfoMessage(message):
    clearConsole()
    
    formattedMessage = ('· %s' % message)
    #logHistory += '%s\n' % formattedMessage

    print(formattedMessage)

def printErrorMessage(message):
    formattedMessage = ('× %s' % message)

    errorMessagesQueue.append(formattedMessage)
    print(formattedMessage)


class ScreenRegion():
    #TODO: make this a Singleton
    API_URL = 'https://api.imgbb.com/1/upload'
    API_KEY = '4d32c7fcd681f4061b537f428804f6ed'

    def __init__(self):
        printInfoMessage('select an area to take screenshot :)')

    def setStart(self, x, y):
        self.start = x, y

    def setEnd(self, x, y):
        self.end = x, y

    def getRegion(self):
        return self.start + self.end

    def takeScreenshot(self):
        printInfoMessage('taking screenshot')

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
            printInfoMessage('got screenshot :)')
            self.screenshot = screenshot

        else:
            printInfoMessage('couldn\'t take screenshot :(')
            raise RuntimeError

    def saveImage(self):
        if self.screenshot:
            try:
                # save screenshot image locally
                output = "screenshot-{width}x{height}px.png".format(**self.monitor)
                printInfoMessage('saving file locally: "%s"' % output)
                mss.tools.to_png(self.screenshot.rgb, self.screenshot.size, output=output)

                # get binary data and encode to base64 for later uploading
                inBytes = mss.tools.to_png(self.screenshot.rgb, self.screenshot.size)
                self.imageBase64 = base64.b64encode(inBytes)

                return True

            except ValueError:
                printErrorMessage(' couldn\'t get output format from file name')

            except OSError:
                printErrorMessage(' couldn\'t write file.')

    def uploadImage(self):
        if self.screenshot:
            printInfoMessage('getting url')
            try:
                #TODO: get this from a Singleton
                payload = {
                        "key": self.API_KEY,
                        "image": self.imageBase64
                    }

                res = requests.post(self.API_URL, payload)

                self.imageURL = res.json()['data']['display_url']

            except ConnectionError:
                printErrorMessage(' connection error')

            except Timeout:
                printErrorMessage(' connection timeout')

            except TooManyRedirects:
                printErrorMessage(' too many redirects')
        else:
            printErrorMessage(' no screenshot to upload')

    def getImageURL(self):
        return self.imageURL

# init
region = ScreenRegion()

def copyUrlToClipboard(data):
    pc.copy(data)

def run():
    region.takeScreenshot()
    region.saveImage()
    region.uploadImage()
    copyUrlToClipboard(region.getImageURL())
    printInfoMessage('got screenshot url on clipboard :)')

    # stop listener
    return False
    
def on_click(x, y, button, isPressed):
    if isPressed:
        region.setStart(int(x), int(y))
    else:
        region.setEnd(int(x), int(y))

        # run
        return run()

with Listener(
        on_click=on_click, 
        # supress system click
        suppress=True) as listener:
    listener.join()
