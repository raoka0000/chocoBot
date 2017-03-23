# Description:
#   くじ引きを行うbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.respond /(lottery|lot|くじ|抽選)(.*)/i, (msg) ->
    option = msg.match[2].trim()
    room = msg.envelope.room
    channel = robot.adapter.client.rtm.dataStore.getChannelGroupOrDMById(room)
    if channel.getType() is "dm"
      msg.send "DMではできないクエ"
      return
    loop #do-whileの代わり
      target = msg.random channel.members
      break if target != robot.adapter.self.id
    target_name = robot.adapter.client.rtm.dataStore.getUserById(target).real_name
    msg.send "当選者は#{target_name}だクエ"

  robot.respond /(order|ord|リスト|順番)(.*)/i, (msg) ->
    room = msg.envelope.room
    channel = robot.adapter.client.rtm.dataStore.getChannelGroupOrDMById(room)
    shuffle channel.members
    n = 0
    names = []
    for target in channel.members
      continue if target is robot.adapter.self.id
      name = robot.adapter.client.rtm.dataStore.getUserById(target).real_name
      names.push "#{++n}: #{name}"
    msg.send "#{names.join("\n")}"


#配列をシャッフル
shuffle = (array) ->
  i = array.length
  if i is 0 then return false
  while --i
    j = Math.floor Math.random() * (i + 1)
    tmpi = array[i]
    tmpj = array[j]
    array[i] = tmpj
    array[j] = tmpi
  return

