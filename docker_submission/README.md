## How to create a docker image?
1. Download the **docker_submission/** folder.
2. Create an environment requirements file **docker_submission/surg_ripe_requirements.txt**, to specify the libraries you used:
     + For conda: **conda env export > surg_ripe_requirements.txt**
     + For virtualenv: **pip freeze > surg_ripe_requirements.txt**
3. Edit line 60 in the Dockerfile to upload your code to the docker image
    + Option 1: copy SurgTbenchmarking folder (containing your code) from your local computer to the docker image using: COPY [path/to/your/SurgRIPE_benchmarking] /home/newuser/surg_ripe/
    + Option 2: upload the SurgTbenchmarking folder (containing your code) on GitHub and use: RUN **https://github.com/CVRS-Hamlyn/SurgRIPETest.git /home/newuser/surg_ripe/**
4. Run the following commands to build Docker and test it is working: **sh build.sh**, **sh start.sh**.
5. Compress docker image for uploading : **docker save -o surgt.tar surgripe:latest**
6. Upload to synapse the **docker image**, the **docker file** and the **trained model weight** -  **ALSO** please provide a **README** text file giving instructions on how to run the docker image and code.
    + If somehow the file size is too large, please upload a .tar to any remote file storage of choice Google Drive, Box, DropBox etc