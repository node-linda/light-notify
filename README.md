Linda Light Notify
==================

- https://github.com/node-linda/light-notify

notify [light sensor](https://github.com/node-linda/arduino-sensor) value

to

- [slack chat](https://github.com/node-linda/slack-chat)
- [skype chat](https://github.com/node-linda/skype-chat)
- [mac-say](https://github.com/node-linda/mac-say)


- watch {"type": "sensor", "name": "light"}
  - write {"type": "say", "value": "#{space}で電気がつきました" or "消えました"}
  - write {"type": "slack", "cmd": "post", "value": "#{space}で電気がつきました" or "消えました"}
  - write {"type": "skype", "cmd": "post", "value": "#{space}で電気がつきました" or "消えました"}


## Install Dependencies

    % npm install


## Run

    % npm start
