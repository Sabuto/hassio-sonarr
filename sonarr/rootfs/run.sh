#!/usr/bin/env bashio
declare port
declare certfile
declare hassio_dns
declare ingress_interface
declare ingress_port
declare ingress_entry

WAIT_PIDS=()

if [ ! -f "/data/config.xml" ]; then
	mv /etc/sonarr/config.xml /data/config.xml
	rm -r /etc/sonarr
fi

bashio::log.info "Setting up frontend...."

port=$(bashio::addon.port 80)
ingress_entry=$(bashio::addon.ingress_entry)
if bashio::var.has_value "${port}"; then
	mv /etc/nginx/servers/direct.disabled /etc/nginx/servers/direct.conf

	sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/servers/direct.conf
fi


ingress_port=$(bashio::addon.ingress_port)
ingress_interface=$(bashio::addon.ip_address)
sed -i "s/%%port%%/${ingress_port}/g" /etc/nginx/servers/ingress.conf
sed -i "s/%%interface%%/${ingress_interface}/g" /etc/nginx/servers/ingress.conf
sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/servers/ingress.conf
sed -i "s#%%ingress_entry%%#${ingress_entry:1}#g" /data/config.xml

hassio_dns=$(bashio::dns.host)
sed -i "s/%%hassio_dns%%/${hassio_dns}/g" /etc/nginx/includes/resolver.conf

exec nginx &
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