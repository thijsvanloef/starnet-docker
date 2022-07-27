FROM debian:bookworm-slim

USER root

RUN apt-get update && apt-get install -y \
    wget \
    unzip

RUN useradd -ms /bin/bash starnet
USER starnet

WORKDIR /home/starnet
RUN wget -q "https://www.starnetastro.com/wp-content/uploads/2022/03/StarNetv2CLI_linux.zip" -O starnet.zip && unzip -j -q starnet.zip -d ./application  && chmod +x ./application/run_starnet.sh ./application/starnet++ && rm starnet.zip
COPY scripts/* .
RUN mkdir /home/starnet/application/input /home/starnet/application/output 

ENTRYPOINT [ "./start.sh" ]



