FROM jodogne/orthanc-plugins:1.12.3

# Install dependencies and DICOMweb plugin
RUN apt-get update && \
    apt-get install -y wget unzip && \
    mkdir -p /usr/share/orthanc/plugins && \
    wget -O /tmp/dicomweb.zip https://github.com/orthanc/OrthancDicomWeb/releases/download/1.11.0/OrthancDicomWeb-1.11.0-Linux64.zip && \
    unzip /tmp/dicomweb.zip -d /usr/share/orthanc/plugins && \
    rm /tmp/dicomweb.zip

# Copy configuration
COPY orthanc.json /etc/orthanc/
