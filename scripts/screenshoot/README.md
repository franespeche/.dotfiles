# ScreenShoot
## made in Python3

Take a screenshot of a selected area and copy image url to clipboard

*v1.0.2 - 04/01/2022*
release notes:
- future releases will draw a rectangle while selecting area
- needs refactor and modularization
- only main monitor supported (will support more)
- known bugs:
  * negative selection area not handled atm

# Pre-requisites
- You will need Python3 installed on your computer. If you don't have it you can find it in https://www.python.org/downloads/
- You will also need to get an API_KEY from http://api.imdbb.com/ and put it in the .env file
- Install dependencies:
  * python3 -m pip install --upgrade mss
  * python3 -m pip install --upgrade termcolor
  * python3 -m pip install --upgrade base64
  * python3 -m pip install --upgrade requests
  * python3 -m pip install --upgrade pyperclip
  * python3 -m pip install --upgrade pynput
  * python3 -m pip install --upgrade python-dotenv

# Usage

Simply clone this repo and run `python3 run.py` <br />

---

PRs/suggestions are welcome :)
