import os
import shutil


path = "/Users/baboo/tmp/weibo"

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


