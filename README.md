# SurgRIPE_docker
BEFORE you run the docker, you NEED to edit line 31 in start.sh. Follow this link to download the [challenge data](https://www.synapse.org/#!Synapse:syn51471789/wiki/623244).

Both the test and train datasets should be put under the same folder 'Dataset' as follows:

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

### How to Run the docker

> sudo docker run -it --gpus all -v /LOCALFILEPATH/Dataset:/home/newuser/SurgRIPE/Dataset surgripe:latest
> 
Please change LOCALFILEPATH accordingly
