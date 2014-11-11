FROM fedora:21

RUN yum -y install xlogo xset xauth \
	dejavu-fonts-common dejavu-sans-mono \
	dejavu-sans-fonts dejavu-serif-fonts
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

VOLUME /home

