FROM	alpine

ENV		USERNAME="hyukim" \
		PASSWORD="admin" \
		MYSQL_ROOT_PASSWORD="admin"

CMD		mkdir /tmp/
COPY	srcs/setup.sh /tmp/
COPY	srcs/latest.tar.gz /tmp/
#RUN		sh /tmp/setup.sh && \
#		rm -rf /tmp/

EXPOSE	80 443
CMD		sh
