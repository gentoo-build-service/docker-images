ARG ARCH=amd64
FROM gentoobuildservice/builder-"${ARCH}":latest
ENV FEATURES="-sandbox -usersandbox -userpriv"
RUN emerge --quiet app-emulation/docker
CMD /usr/sbin/gentoo-builder
VOLUME /usr/portage
