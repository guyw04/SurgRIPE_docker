FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime
MAINTAINER Samyakh Tukra <samyakh.tukra17@himperial.ac.uk>

ENV DEBIAN_FRONTEND noninteractive
ENV FORCE_COLOR_PROMPT=yes
ENV VIRTUAL_ENV=/opt/venv
ENV HOME=/home

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    curl \
    ca-certificates \
    dirmngr \
    git \ 
    language-pack-ja \
    libgl1-mesa-dev \
    libpq-dev \
    libturbojpeg \
    libopencv-dev \
    libfreetype6-dev \
    libturbojpeg0-dev \
    lsb-release \
    openssh-server \
    poppler-utils \
    pkg-config \
    p7zip-full \
    p7zip-rar  \
    jq \
    python3-pip \
    python3-venv \
    software-properties-common \
    sudo \
    tmux \
    htop \
    tzdata \
    unzip \
    vim \
    && rm -rf /var/lib/apt/lists/*


ENV VIRTUAL_ENV=/opt/venv

# environment, dependencies and entry points
WORKDIR /home

# Avoid a shared jupyter config
ENV JUPYTER_CONFIG_DIR /jupyter/.jupyter
ENV JUPYTER_DATA_DIR /jupyter/.local/share/jupyter
ENV JUPYTER_RUNTIME_DIR /jupyter/.local/share/jupyter/runtime
RUN mkdir -p $JUPYTER_CONFIG_DIR \
  && mkdir -p $JUPYTER_DATA_DIR \
  && mkdir -p $JUPYTER_RUNTIME_DIR \
  && chmod -R 777 /jupyter

# Set Up Nexus repo
COPY pip.conf  $VIRTUAL_ENV/pip.conf

# Clone the conf files into the docker container
RUN git clone https://github.com/Cartucho/SurgT_benchmarking.git /home/newuser/surg_t/

# Core Python libs
# 16/08: pip new resolver is causing backtracking issues
# reverting to old resolver until we have a fix
RUN python3 -m pip install virtualenv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN chmod -R 777 $VIRTUAL_ENV


RUN python3 -m pip install --upgrade --no-cache-dir \
  cython \
  jupyterlab \
  ipywidgets \
  jupyter_contrib_nbextensions \
  jupyterlab-git \
  jupytext \
  nbconvert \
  notebook \
  pip==21.0 \
  setuptools

# Scientist stack
COPY surg_t_requirements.txt /home/newuser/surg_t/surg_t_requirements.txt
#COPY bash.bashrc /etc/bash.bashrc
RUN python3 -m pip install --use-deprecated=legacy-resolver --upgrade --no-cache-dir -r /home/newuser/surg_t/surg_t_requirements.txt


####### CREATE A USER #########
RUN useradd --create-home --groups sudo --shell /bin/bash newuser \
    && chown -R newuser: /home/newuser
RUN mkdir -p /etc/sudoers.d \
    && echo "newuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/newuser \
        && chmod 0440 /etc/sudoers.d/newuser

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda/:/usr/lib/
ENV PATH=$PATH:/usr/local/cuda/bin/
ENV PYTHONPATH=.
USER newuser
RUN chmod 777 /home/newuser

CMD ["/bin/bash"]