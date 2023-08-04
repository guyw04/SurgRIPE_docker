# SurgRIPE_docker
To use the docker. you need to edit in start.sh line 31 about the data folder.

First, all the test and train folders will be put under the folder 'Dataset'

### Dataset Folder Structure
.
Dataset
├── LND
│   ├── TRAIN
│   ├── TEST
│   └── TEST_OCC
└── MBF
    ├── TRAIN
    ├── TEST
    └── TEST_OCC

Then, mound the dataset folder into the docker image below:
-v /LOCALFILEPATH/Dataset:/home/newuser/SurgRIPE/Dataset
