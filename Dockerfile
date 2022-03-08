## Buildstage ##
FROM lsiobase/alpine:3.11 as buildstage

## Download dependencies ##
RUN apk add --no-cache \
	wget \
	git

WORKDIR /root-layer/build

RUN wget https://sourceforge.net/projects/cmusphinx/files/sphinxbase/5prealpha/sphinxbase-5prealpha.tar.gz/download -O sphinxbase.tar.gz \
	&& tar -xzvf sphinxbase.tar.gz \
	&& rm sphinxbase.tar.gz

RUN wget https://sourceforge.net/projects/cmusphinx/files/pocketsphinx/5prealpha/pocketsphinx-5prealpha.tar.gz/download -O pocketsphinx.tar.gz \
	&& tar -xzvf pocketsphinx.tar.gz \
	&& rm pocketsphinx.tar.gz

ENV FFMPEGVER https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz

RUN mkdir /root-layer/build/ffmpeg
RUN cd /root-layer/build \
	&& wget "$FFMPEGVER" \
	&& tar xf ffmpeg-release-amd64-static.tar.xz --directory ffmpeg/ \
	&& rm ffmpeg-release-amd64-static.tar.xz

## Download Subsync ##
RUN git clone -b '0.17' https://github.com/sc0ty/subsync.git /root-layer/app/subsync
WORKDIR /root-layer/
COPY app/ /root-layer/app/
	
# add local files
COPY root/ /root-layer/

RUN chmod +x /root-layer/app/subsync
	
## Single layer deployed image ##
FROM scratch

# Add files from buildstage
COPY --from=buildstage /root-layer/ /
