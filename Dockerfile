FROM base-sci-app

MAINTAINER Walter Moreira <wmoreira@tacc.utexas.edu>

ENV _APP Bowtie 2
ENV _VERSION 2.2.3
ENV _LICENSE ___
ENV _AUTHOR Ben Langmead

ADD examples.txt /docs/bowtie2/examples.txt
ADD usage.txt /docs/bowtie2/usage.txt
COPY bowtie2-2.2.3-linux-x86_64.zip /

RUN yum install -y perl unzip

WORKDIR /
RUN unzip bowtie2-2.2.3-linux-x86_64.zip && \
    mv bowtie2-2.2.3 bowtie2 && \
    rm /bowtie2-2.2.3-linux-x86_64.zip && \
    ln -s /bowtie2/example /examples && \
    ln -s /bowtie2/MANUAL /docs/bowtie2/intro.txt

WORKDIR /data

ENV EXTRA_PATH /bowtie2
