FROM gentoo/stage3-amd64:latest

ARG ARCH=amd64
ARG SUFFIX

RUN echo "Building Gentoo Container image for ${ARCH}" && emerge-webrsync && emerge --quiet -j2 dev-vcs/git

ADD setup.sh /setup.sh

RUN /setup.sh

CMD /usr/sbin/gentoo-builder

VOLUME /usr/portage
