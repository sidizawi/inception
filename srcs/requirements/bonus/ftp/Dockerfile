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
	&& echo "pasv_enable=YES" >> /etc/vsftpd.conf \
	&& echo "pasv_min_port=21000" >> /etc/vsftpd.conf \
	&& echo "pasv_max_port=21010" >> /etc/vsftpd.conf \
	&& echo "pasv_address=127.0.0.1" >> /etc/vsftpd.conf \
	&& echo "local_root=/var/www" >> /etc/vsftpd.conf \
	&& echo "write_enable=YES" >> /etc/vsftpd.conf \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 21 21000-21010

ENTRYPOINT [ "bash", "start.sh" ]

# Commands: ls, get, put, mkdir
# ftp -p localhost
