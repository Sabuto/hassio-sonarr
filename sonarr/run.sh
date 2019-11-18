#!/usr/bin/env bashio
WAIT_PIDS=()

bashio::log.info "Setting up frontend...."

sed -i "s/%%PORT%%/8080/g" /etc/nginx/nginx-ingress.conf
sed -i "s/%%PORT_INGRESS%%/8099/g" /etc/nginx/nginx-ingress.conf

nginx -c /etc/nginx/nginx-ingress.conf &
WAIT_PIDS+=($!)

bashio::log.info "Starting the Sonarr addon...."

cd /opt/NzbDrone || bashio::exit.nok "setup gone wrong!"

exec mono --debug NzbDrone.exe -nobrowser -data=/data &
WAIT_PIDS+=($!)

function stop_addon() {
	bashio::log.info "Kill Processes..."
	kill -15 "${WAIT_PIDS[@]}"
	bashio::log.info "Done"
}

trap "stop_addon" SIGTERM SIGHUP

#Wait until all is done
bashio::log.info "All is running smoothly"
wait "${WAIT_PIDS[@]}"