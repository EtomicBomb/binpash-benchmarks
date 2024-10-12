FROM debian:12.7

WORKDIR /benchmarks

COPY . .

RUN apt update && apt install -y --no-install-recommends \
    tcpdump \
    curl \
    wget \
    unzip \
    samtools \
    minimap2 \
    bcftools \
    python3-pip \
    vim \
    ffmpeg unrtf imagemagick libarchive-tools libncurses5-dev libncursesw5-dev zstd liblzma-dev libbz2-dev zip unzip nodejs tcpdump \
    git

RUN pip3 install --break-system-packages \
    scikit-learn \
    kaggle

# this does not work for some reason. was trying to do this for aurpkg
# ENV MAKEDEB_RELEASE=makedeb
# ENV TERM=dumb
# RUN wget -qO install-makedeb.sh 'https://shlink.makedeb.org/install'
# RUN bash install-makedeb.sh

CMD ["bash"]
