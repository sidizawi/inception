FROM debian:bullseye

WORKDIR /app
COPY ./conf .
VOLUME /var/www

RUN apt update \
	&& apt install -y vsftpd \
	&& adduser --disabled-password ftpuser \
	&& mkdir -p /var/www /var/run/vsftpd/empty \
	&& chown -R ftpuser:ftpuser /var/www /var/run/vsftpd/empty \
	&& chmod 755 /var/www \
	&& echo "pasv_enable=NO" >> /etc/vsftpd.conf \
	&& echo "local_root=/var/www" >> /etc/vsftpd.conf \
	# && echo "anonymous_enable=YES" >> /etc/vsftpd.conf \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 20 21

ENTRYPOINT [ "bash", "start.sh" ]
