ARG ARCH=amd64
FROM gentoobuildservice/builder-"${ARCH}":latest
ENV FEATURES="-sandbox -usersandbox -userpriv"
RUN eselect profile set default/linux/amd64/17.0/systemd && \
emerge -C openrc eudev udev sysvinit && \
emerge --quiet systemd
CMD /usr/sbin/gentoo-builder
VOLUME /usr/portage
