# use python to control matlab

import matlab.engine
import os
import shutil
import pangu_video2audio


def start_matlab():
	# prepare for matlab engine
	engines = matlab.engine.find_matlab()
	if len(engines) != 0:
		engine_name = engines[0]
		eng = matlab.engine.connect_matlab(engine_name)
		print("Successfully connect to --->>> {}".format(eng))
		return eng
	else:
		print("A matlab engine is required before execute matlab code!")
		print("Start a new engine -------->>> wait...")
		eng = matlab.engine.start_matlab()
		print("An engine is started! ----->>> {}".format(eng))
		return eng


def prepare_folder(path):
	root_path, folder_name = os.path.split(path)

	hard_folder = folder_name + "_hardcsv"
	lib_folder = folder_name + "_libcsv"

	hard_path = os.path.join(root_path, hard_folder)
	lib_path = os.path.join(root_path, lib_folder)

	if os.path.isdir(hard_path):
		shutil.rmtree(hard_path)
	os.makedirs(hard_path)
	print("Clean and make dir: {}".format(hard_path))

	if os.path.isdir(lib_path):
		shutil.rmtree(lib_path)
	os.makedirs(lib_path)
	print("Clean and make dir: {}".format(lib_path))

	return hard_path, lib_path


def count_audio(path):
	if os.path.isdir(path):
		folder_list = os.listdir(path)
		num_wav = 0
		num_mp3 = 0
		for name in folder_list:
			if name.endswith(".wav") or name.endswith(".WAV"):
				num_wav += 1
			if name.endswith(".mp3") or name.endswith(".MP3"):
				num_mp3 += 1
		print("There are ----------------->>> %d wave files" % num_wav)
		print("There are ----------------->>> %d mp3 files" % num_mp3)
		return num_mp3, num_wav
	else:
		print("The folder is bad! -------->>> BAD Folder!")


def folder2csv_hard(eng, src, des):
	dilation_size = 25.0
	time_del = 80.0
	freq_del = 55.0
	eng.bc_fp_folder2csv(src, des, dilation_size, time_del, freq_del, nargout=0)
	print("Hard FP is finished!")


def folder2csv_lib(eng, src, des):
	dilation_size = 30.0
	time_del = 40.0
	freq_del = 20.0
	
	eng.bc_fp_folder2csv(src, des, dilation_size, time_del, freq_del, nargout=0)
	print("Lib FP is finished!")


def fp_folder(path):

	hard_path, lib_path = prepare_folder(path)
	num_mp3, num_wav = count_audio(path)
	print("FP will be stored in {}, {}".format(hard_path, lib_path))

	if (num_mp3 != 0) | (num_wav != 0):
		eng = start_matlab()
		print("There are music! Let's run the fp")
		folder2csv_hard(eng, path, hard_path)
		folder2csv_lib(eng, path, lib_path)

	print("Program is properly finished!")


if __name__ == "__main__":
	path_ = "/Volumes/WD/test"
	pangu_video2audio.video2audio(path_)
	print("Audio is prepared!")
	fp_folder(path_)
	print("FP is finished!")
