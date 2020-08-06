FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y update 
RUN apt-get install -y build-essential python3.6 python3-pip python3-dev
RUN apt update && apt install -y libsm6 libxext6
RUN apt-get -y install tesseract-ocr

RUN mkdir src
WORKDIR src/
COPY . .

RUN pip3 install pillow
RUN pip3 install pytesseract
RUN pip3 install opencv-contrib-python
RUN pip3 install numpy
RUN pip3 install jupyter
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
