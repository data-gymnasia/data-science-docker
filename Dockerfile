
FROM jupyter/datascience-notebook

# set working directory to home directory
WORKDIR /home/jovyan

# Install joblib for storing Python models. The 
# '--yes' option preempts "proceed?" questions
RUN conda install joblib --yes

# copy whole current directory into the image
COPY . project

# Get data from GitHub
USER root
RUN fix-permissions project && \
    cd project/data/raw && \
    wget https://browndsi.github.io/data/iris.csv
USER jovyan

# Enter bash session in the project directory when 
# the container is run
WORKDIR project
CMD /bin/bash