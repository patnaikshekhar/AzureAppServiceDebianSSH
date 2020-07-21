FROM tiangolo/meinheld-gunicorn-flask:python3.7

ENV SSH_PORT 2222
EXPOSE 80 2222

RUN apt-get update -y && \
    apt-get install -y openssh-server && \
    echo "root:Docker!" | chpasswd 

RUN rm -f /etc/ssh/sshd_config && \
    mkdir -p /var/run/sshd
    
COPY sshd_config /etc/ssh/
COPY start.sh /start.sh

WORKDIR /app

COPY main.py .

