FROM pavolab/warband:dedicated

ENV WORKDIR=/home/warband/dedicated \
    TERM=xterm \
    DISPLAY=:0.0\
    MOD=Native \
    MODE=bt \
    PASSWORD_ADMIN=passwordadmin \
    PASSWORD_PRIVATE=value \
    SERVER_NAME=FSPNetwork \
    WELCOME_MESSAGE=value \
    VALVE_ANTI_CHEAT=0 \
    MAXPLAYERS=32 \
    BOTS_VOTEABLE=20 \
    LIMIT_TEAM_POINT=1 \
    LIMIT_UPLOAD=value \
    PORT=7240 \
    PORT_STEAM=7241 

WORKDIR ${WORKDIR}

COPY --chown=warband:warband . Modules/Native
COPY --chown=1 run.sh run.sh
ADD --chown=warband:warband https://orion.fspn.app/warband?mod=${MOD}&password_admin=${PASSWORD_ADMIN}&server_name=${SERVER_NAME}&mission=${MODE}&port=${PORT} config.txt

EXPOSE ${PORT}/udp

ENTRYPOINT bash run.sh