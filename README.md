
# Data Science Project

This is a toy data science project which illustrates how Docker and Makefiles can be used to achieve reproducibility. It's based on [Cookiecutter Data Science](https://github.com/drivendata/cookiecutter-data-science).

## Docker

From the current directory, run 

```
docker build -t myproject .
```

to build the Docker image for the project. Then run 

```
docker run -it myproject
```

to start a container. 

## Make options

From inside the container, you can do

`make features` to process the data
`make train` to train the model
`make predict` to obtain model predictions
`make figures` to produce the figures
`make reports` to produce the report
