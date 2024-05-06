
# Dockerfile 04/2021
# Python environment for exporting data analysis for processing on remote systems. 

FROM ubuntu:22.04

# MAINTAINER
LABEL maintainer="Alex Perkins <a.j.p.perkins@sms.ed.ac.uk>"

RUN apt-get update && apt-get install -y \
    build-essential \
    python3.10 \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip3 install --no-cache-dir -q pip --upgrade

# Copy files into /app and work from there
WORKDIR /app
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Runs Jupyter Notebook on startup
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
