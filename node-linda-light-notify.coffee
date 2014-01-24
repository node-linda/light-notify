path = require 'path'

config = require path.resolve 'config'
console.log config

LindaClient = require('linda-socket.io').Client
socket = require('socket.io-client').connect(config.url)
linda = new LindaClient().connect(socket)

tss = []
for name, yomi of config.spaces
  tss.push linda.tuplespace(name)

linda.io.on 'connect', ->
  console.log 'socket.io connect!!'
  for ts in tss
    last_value = null
    do (ts, last_value) ->
      console.log "watch #{ts.name}"
      ts.watch {type: "sensor", name: "light"}, (err, tuple) ->
        return if err
        tuple.data.value -= 0
        console.log "#{ts.name} -> #{tuple.data.value}, last:#{last_value}"
        if last_value != null and Date.now()
          if tuple.data.value > last_value
            if tuple.data.value / (last_value+1) > 2
              console.log msg = "#{config.spaces[ts.name]} で電気がつきました"
              broadcast msg, tuple.data.value
          else
            if last_value / (tuple.data.value+1) > 2
              console.log msg = "#{config.spaces[ts.name]} で電気が消えました"
              broadcast msg, tuple.data.value
        last_value = tuple.data.value

linda.io.on 'disconnect', ->
  console.log 'socket.io disoconnect..'

broadcast = (msg, value) ->
  for ts in tss
    ts.write {type: "say", value: msg}
    ts.write {type: "skype", cmd: "post", value: "#{msg} (#{value})"}
