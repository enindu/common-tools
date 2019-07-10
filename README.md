# Common Tools
Some tools that used by me on several situations. Most of them grabbed from internet and some of them made by me. Cheers.

## Change Resolution
This script built to change monitor screen resolution. All credit must go to, [https://gist.github.com/chirag64/7853413](https://gist.github.com/chirag64/7853413).

### Usage
```
$ ./chnage-resolution.sh "<width> <height> <refresh rate>"
```

### Example
```
$ ./change-resolotion.sh "1920 1080 60"
```

## Download Website
This script built to download entire frontend (Including assets) of any kind of website. You'll probably need to install [wget](https://www.gnu.org/software/wget/) to use this script. All credits must go to, [https://www.linuxjournal.com/content/downloading-entire-web-site-wget](https://www.linuxjournal.com/content/downloading-entire-web-site-wget).

### Usage
```
$ ./download-website.sh <website> <domain>
```

### Example
```
$ ./download-website.sh http://www.website.org website.org
```

## Get Weather
You can get current weather of specified city using [Open Weather Map](https://openweathermap.org/) API. For get done you'll probaby need to update `KEY` and `CITY` in script. Also you need to install [jq](https://stedolan.github.io/jq/) and [Font Awesome](https://fontawesome.com/) as dependencies. This tool is primarily created for [Polybar](https://github.com/polybar/polybar). All credits mus go to, [https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/openweathermap-detailed](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/openweathermap-detailed). For usage refer [How to add custom script to Polybar](https://github.com/polybar/polybar/wiki/Module:-script).