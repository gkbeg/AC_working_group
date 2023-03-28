import subprocess
from dotenv import load_dotenv
import os

load_dotenv()
dirPath = os.getenv('DIR_PATH')  
PWD = os.getcwd()
SSH = os.getenv('SSH')

subprocess.call(['bash','./transfer.sh', dirPath, SSH, PWD] )