Linda Light Notify
==================
notify [light sensor](https://github.com/node-linda/ruby-linda-arduino-sensor) value to [skype](https://github.com/node-linda/ruby-linda-skype) and [mac-say](https://github.com/node-linda/node-linda-mac-say)


- watch {"type": "sensor", "name": "light"}
  - write {"type": "say", "value": "#{space}で電気がつきました" or "消えました"}
  - write {"type": "skype", "cmd": "post", "value": "#{space}で電気がつきました" or "消えました"}

- https://github.com/node-linda/node-linda-light-notify


## Install Dependencies

    % npm install

## Config

    % cp sample.config.json config.json

## Run

    % npm start


## Install as Service

    % gem install foreman

for launchd (Mac OSX)

    % sudo foreman export launchd /Library/LaunchDaemons/ --app node-linda-light-notify -u `whoami`
    % sudo launchctl load -w /Library/LaunchDaemons/node-linda-light-notify-main-1.plist

for upstart (Ubuntu)

    % sudo foreman export upstart /etc/init/ --app node-linda-light-notify -d `pwd` -u `whoami`
    % sudo service node-linda-light-notify start
