# Introduction

This Docker Template will allow you to build a Docker Image that runs a Python container that runs a Jupyter Notebook and any Python Packages that you choose.  

If you have any issues or feedback, please contact me.  
Alex Perkins  
a.j.p.perkins@sms.ed.ac.uk

# Prerequisites & Assumed Knowledge

**You must have Docker and Git installed.**

You need to have a grasp what a Command Line Interface is. If you don't, watch this gentle tutorial:  

#### Command Line Interface (CLI) For Beginners:  
https://www.youtube.com/watch?v=mUXVBMhr7Xg


You also need to know roughly what Docker is and how it works, I will not be covering those topics in this repo.



# Usage

BUILD AND RUN DOCKER CONTAINER.

### 1. Open a Command Line Interface (CLI), or Terminal if you're on Mac, & check Docker is installed.  

If you've never installed Docker, use this tutorial.  
https://www.youtube.com/watch?v=_9AWYlt86B8

Check it's there:  
`docker --version`

### 2. Check that the Docker Daemon is actually running.

`docker ps`

If it is, you see a list of your current containers. Might be empty.  
Either way, you'll this:

CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES  

If not:  
Some sort of error

This youtube vid will help you troubleshoot.  
https://www.youtube.com/watch?v=YFUhdxI4kcA


### 3. In your CLI, navigate to your project folder

The format of the command should look *something like this* but with your path rather than the placeholder:

`cd "C://PlaceholderPath/directory/my project/subfolder"`

For example, I made an example folder on my desktop for the sake of demonstration:

`cd "C:\Users\Alex\OneDrive - University of Edinburgh\Desktop\example`

* I have a tip for doing this which you may find useful:  
* Open the project folder in File Explorer/Finder and 'Copy Address as text' (*See Image*), then paste that address into the Command Line **within double quotes**.  
* Be sure to stick the url in it's own quotes as below. This enters it as a string and will allow CMD to read any spaces in the path correctly.  
* This will allow you to jump to the target directory in one step rather than tedious: `cd documents`, `cd labbook`, `cd myexperiments` navigation.  

![nav](https://github.com/aperkins19/Git_Guide_for_Scientists/blob/main/Assets/docker_quick_start/cmd_nav.png)


### 4. Download/clone the repo from git or unzip the zip file.

`git clone https://github.com/aperkins19/Docker_template_python_datascience_jupyter_bespoke_packages`

![clone](https://github.com/aperkins19/Git_Guide_for_Scientists/blob/main/Assets/docker_quick_start/git_clone.png)

n.b. Git will download the whole repo into it's own folder so it's worth noting you'll have to navigate into that new folder to continue (or move everything up a level).

### 5. Define the python packages that you wish to use in `requirements.txt` file.
e.g.  
matplotlib  
pandas  
numpy

**Note: Everytime you want to add, delete or change a package in your workflow, you must re-build the docker image**  
![requirements](https://github.com/aperkins19/Git_Guide_for_Scientists/blob/main/Assets/docker_quick_start/requirements.png)

### 6. Build the docker image

`docker build -t jupyter_with_bespoke_python_packages .`

The `-t` flag stands for *tag*; so it's what you're calling the docker image.

![docker_build](https://github.com/aperkins19/Git_Guide_for_Scientists/blob/main/Assets/docker_quick_start/docker_build.png)


On completion, you see the image that you built in Docker Desktop:

![docker_cntr](https://github.com/aperkins19/Git_Guide_for_Scientists/blob/main/Assets/docker_quick_start/docker_desktop_img.png)


**N.B. Don't forget the `.` at the end**

### 7. Run your container on port 8888
e.g.

Windows:  
`docker run -p 8888:8888 -v "%CD%":/src --name data_science_docker_container jupyter_with_bespoke_python_packages`

If you're on Mac or Linux:

`docker run -p 8888:8888 -v "%PWD":/src --name data_science_docker_container jupyter_with_bespoke_python_packages`

![docker_run](https://github.com/aperkins19/Git_Guide_for_Scientists/blob/main/Assets/docker_quick_start/docker_run.png)


You can now see the container running in Docker Desktop:

![docker_cntr](https://github.com/aperkins19/Git_Guide_for_Scientists/blob/main/Assets/docker_quick_start/docker_desktop_cntr.png)

### Explanation 

The way it works is by:
* Starting a Docker Container
* Mounting your current directory ("%CD%") to a directory in the container ("/src") so that files can be shared and moved in and out.
* Starting a jupyter server on port 8888 inside the container which is then mapped to port 8888 on your local machine.

The `-p` flag stands for *port*. So you're mapping port 8888 on your computer to port 8888 on the container. N.B. The Jupyter server runs on port 8888 inside the container which is why we map that port.

The `-v` flag stands for *volume*. What this does is mirrors the `/src` directory inside container with the directory that you are currently in in your CLI `"%CD%"`so that files can be shared and moved in and out.

`--name` I'm sure you can work out what this does.



### 8. If it has started correctly, you'll get a url token. Copy the token provided into your brower URL

It should look like this - look in the CLI readout in the screenshot above:

http://127.0.0.1:8888/?token=3c96d2a50decb4302c3e96b87ba7444d286e335d07c478fe

It should open up a Jupyter File explorer in the project directory in your browser.


You can now write jupyter Notebooks for data science.  
**To make a new one, click the *NEW* button in the top right on the Juptyer File Explorer and select 'Python Notebook'.**  
The files in the container should be mapped to the local directory specified in step 3.

![docker_cntr](https://github.com/aperkins19/Git_Guide_for_Scientists/blob/main/Assets/docker_quick_start/jupyter_files.png)

## Troubleshooting

If Jupyter won't open but the server is clearly running:
* Just navigate to http://127.0.0.1:8888
* You should now see the see the jupyter server login page.
* Copy the hashed token from the url given in command line output and paste it in the box

![docker_cntr](https://github.com/aperkins19/Git_Guide_for_Scientists/blob/main/Assets/docker_quick_start/jupyter_login.png)

If it still doesn't work, try mapping port 8888 on the container side to a different port on the local machine side.  
e.g. -p 9999:8888


# Conclusion


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
