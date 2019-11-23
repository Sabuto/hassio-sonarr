# Hass.io Add-on: Sonarr 


![Supports aarch64 Architecture][aarch64-shield] 
![Supports amd64 Architecture][amd64-shield] 
![Supports armhf Architecture][armhf-shield] 
![Supports armv7 Architecture][armv7-shield] 
![Supports i386 Architecture][i386-shield] 


[![GitHub Release][releases-shield]][releases]
![License][license-shield]
![Travis Ci][travis-shield]
[![GitHub Activity][commits-shield]][commits]

* * *
![Sonarr Logo](images/sonarr-banner.png)


## About

[Sonarr] (formerly NZBdrone) is a PVR for usenet and bittorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

## Installation

The installation of this add-on is straightforward and easy to do.

1. Navigate in your Home Assistant frontend to **Hass.io** -> **Add-on Store**.
2. Add the Hass.io add-on repository https://github.com/Sabuto/hassio-repo/.
3. Install the "Sonarr" add-on.

## How to use

To get the add-on running:

1. Start the add-on.
2. Have some patience and wait a couple of minutes.
3. Check the add-on log output to see the result.


## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._
**Note**: _This section is still incomplete!
Example add-on configuration, with all available options:

```json
{
    "variable": "/share/sonarr"
}
```

**Note**: _This should only be changed if you know what you are doing._

### Option: `variable`

The `variable` option controls etc.


## Support

In case you've found a bug, please open an issue on our GitHub [issue].

## License

to be added

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[armv7-shield]: https://img.shields.io/badge/armv7-no-red.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[Sonarr]: https://github.com/linuxserver/docker-sonarr
[issue]: https://github.com/Sabuto/hassio-sonarr/issues
[travis-shield]: https://img.shields.io/travis/sabuto/hassio-sonarr
[releases-shield]: https://img.shields.io/github/v/release/sabuto/hassio-sonarr
[releases]: https://github.com/sabuto/hassio-sonarr/releases
[license-shield]: https://img.shields.io/github/license/sabuto/hassio-sonarr
[commits-shield]: https://img.shields.io/github/commit-activity/y/Sabuto/hassio-sonarr.svg
[commits]: https://github.com/Sabuto/hassio-sonarr/commits/
