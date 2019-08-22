Matlab APIs are required before import matlab package in Python:
cd "matlabroot/extern/engines/python"
python setup.py install

Open matlab as shared engine:
>>matlab.engine.shareEngine

Connect to matlab engine:
import matlab.engine
engines = matlab.engine.find_matlab()


Anaconda enviroment control:
list all env: conda info -e
change env: conda activate envNAME

Windows:
python path£ºC:\Program Files\MATLAB\R2018b\extern\engines\python


VIP:
ffmpeg is required!
