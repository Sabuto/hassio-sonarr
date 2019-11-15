#!/usr/bin/env bashio
bashio::log.info "Starting the Sonarr addon...."

cd /opt/NzbDrone || bashio::exit.nok "setup gone wrong!"

exec mono --debug NzbDrone.exe -nobrowser -data=/data


