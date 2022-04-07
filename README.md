# Introduction

This Docker Template will allow you to build a Docker Image that runs a Python container that runs a Jupyter Notebook and any Python Packages that you choose.  

If you have any issues or feedback, please contact me.  
Alex Perkins  
a.j.p.perkins@sms.ed.ac.uk


# Usage

BUILD AND RUN DOCKER CONTAINER.

1. Check Docker is installed.  

If you've never installed Docker, use this tutorial.  
https://www.youtube.com/watch?v=_9AWYlt86B8

Check it's there:  
`docker --version`

2. Check that the docker Daemon is actually running.

`docker ps`

If it is, you see a list of your current containers. Might be empty.  
Either way, you'll this:

CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES  

If not:  
Some sort of error

This youtube vid will help you troubleshoot.  
https://www.youtube.com/watch?v=YFUhdxI4kcA


3. Open command line and navigate to the unpacked directory

You can get the path by 'Copy address as text' in the URL of your file manager.  
Be sure to stick the url in it's own quotes as below. This enters it as a string and will allow CMD to read any spaces in the path correctly.


`cd "C://mypath/directory/my project/subfolder"`

4. Download/clone the repo from git or unzip the zip file.

`docker clone `

5. Define the python packages that you wish to use in `requirements.txt` file.
e.g.  
matplotlib  
pandas  
numpy  

6. Build the docker image

`docker build -t jupyter_with_bespoke_python_packages .`

7. Run your container on port 8888
e.g.

Windows:  
`docker run -p 8888:8888 -v "%CD%":/src jupyter_with_bespoke_python_packages`

If you're on Mac or Linux:

`docker run -p 8888:8888 -v "%PWD":/src jupyter_with_bespoke_python_packages`


If the image isn't already on your machine, it'll be downloaded.

The way it works is by:
* Starting a Docker Container
* Mounting your current directory ("%CD%") to a directory in the container ("/src") so that files can be shared and moved in and out.
* Starting a jupyter server.


8. If it has started correctly, you'll get a url token. Copy the token provided into your brower URL

It should look like this:

http://127.0.0.1:8888/?token=3c96d2a50decb4302c3e96b87ba7444d286e335d07c478fe

It should open up a Jupyter File explorer in the directory in your browser.

## Troubleshooting

If Jupyter won't open but the server is clearly running:
* Just navigate to http://127.0.0.1:8888
* You should now see the see the jupyter server login page.
* Copy the hashed token from the url given in command line output and paste it in the box

If it still doesn't work, try mapping port 8888 on the container side to a different port on the local machine side.  
e.g. -p 8888:9999


# Close

You can now write jupyter Notebooks for data science.  
The files in the container should be mapped to the local directory specified in step 3.

I hope you find this useful and have fun!


My full list of requirements for reference:  
numpy==1.16  
pandas  
matplotlib  
sklearn  
scikit-learn  
scipy  
seaborn  
pymc3  
patsy  
lxml  
ipython  
ipywidgets  
mkl-service  
pydot  
graphviz  
setuptools  
theano-pymc  
xlrd  
