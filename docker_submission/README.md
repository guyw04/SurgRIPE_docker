## How to create a docker image?
1. Run the following commands to build Docker and test it is working: 
   + **sh build.sh**
   + **sudo docker run -it --gpus all -v /LOCALFILEPATH/Dataset:/home/newuser/SurgRIPE/Dataset surgripe:latest**
     - Please change LOCALFILEPATH accordingly
2. Compress docker image for uploading : **docker save -o surgt.tar surgripe:latest**
3. Upload to synapse the **docker image**, the **docker file** and the **trained model weight** -  **ALSO** please provide a **README** text file giving instructions on how to run the docker image and code.
    + If somehow the file size is too large, please upload a .tar to any remote file storage of choice Google Drive, Box, DropBox etc
