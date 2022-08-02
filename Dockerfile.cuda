FROM nvidia/cuda:11.7.0-runtime-ubuntu20.04

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libcudnn8 \
    && apt-get clean autoclean  \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN wget -c https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-gpu-linux-x86_64-2.8.0.tar.gz -O - | tar -xz -C /usr/local
RUN ldconfig /usr/local/lib 

ENV TF_FORCE_GPU_ALLOW_GROWTH=true

ENV PARALLEL=false \
    STRIDE=128

WORKDIR /starnet
RUN wget -q "https://www.starnetastro.com/wp-content/uploads/2022/03/StarNetv2CLI_linux.zip" -O starnet.zip && unzip -j -q starnet.zip -d /starnet/application  && chmod +x /starnet/application/starnet++ && rm starnet.zip
COPY scripts/* ./
RUN rm /starnet/application/libtensorflow*
RUN mkdir /starnet/input /starnet/output 

ENTRYPOINT [ "./start-cuda.sh" ]
