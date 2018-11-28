DATA_DIR = "appleoutput40"
SC_DATA_DIR = "split_appleoutput40"
VAL_PERCENTAGE = 0.2
from os.path import normpath, basename
from shutil import copyfile
import random
import os
subdir_imgs = [(subdir, files) for subdir, dirs, files in os.walk(DATA_DIR) if len(files)>50]



for subdir, imgs in subdir_imgs:
    random.shuffle(imgs)
    class_dir = os.path.basename(os.path.normpath(subdir))
    train_dir = os.path.join(SC_DATA_DIR, "train", class_dir)
    val_dir = os.path.join(SC_DATA_DIR, "val", class_dir)
    
    if not os.path.exists(train_dir):
            os.makedirs(train_dir)
    if not os.path.exists(val_dir):
            os.makedirs(val_dir)
    n = len(imgs)
    split_point = int((1-VAL_PERCENTAGE)*n)
    train_imgs = imgs[:split_point]
    val_imgs = imgs[split_point:]
    
    for img in train_imgs:
        copyfile(os.path.join(subdir, img), os.path.join(train_dir, img))
    for img in val_imgs:
        copyfile(os.path.join(subdir, img), os.path.join(val_dir, img))
#for file in files:
#        print os.path.join(subdir, file)