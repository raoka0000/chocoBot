# Description:
#   くじ引きを行うbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.respond /(lottery|lot|くじ|抽選)(.*)/i, (msg) ->
    option = msg.match[2].trim()
    room = msg.envelope.room
    channel = robot.adapter.client.rtm.dataStore.getChannelGroupOrDMById(room)
    if option != ""
      names = option.replace(/\@/g, "").replace(/(　)/g, " ").split(" ")
      targets = []
      for name in names
        user = robot.adapter.client.rtm.dataStore.getUserByName(name)
        if user? then targets.push user.real_name else targets.push name
      console.log targets
      target_name = msg.random targets
    else
      if channel.getType() is "dm"
        msg.send "DMではできないクエ"
        return
      loop #do-whileの代わり
        target = msg.random channel.members
        break if target != robot.adapter.self.id
      target_name = robot.adapter.client.rtm.dataStore.getUserById(target).real_name
    msg.send "結果は#{target_name}だクエ"

#TODO_あとで手直しする
  robot.respond /(order|ord|リスト|順番)(.*)/i, (msg) ->
    option = msg.match[2].trim()
    room = msg.envelope.room
    channel = robot.adapter.client.rtm.dataStore.getChannelGroupOrDMById(room)
    if option != ""
      names = option.replace(/\@/g, "").split(" ")
      targets = []
      for name in names
        user = robot.adapter.client.rtm.dataStore.getUserByName(name)
        if user? then targets.push user.real_name else targets.push name
    else
      if channel.getType() is "dm"
        msg.send "DMではできないクエ"
        return
      targets = for menber in channel.members
        continue if menber == robot.adapter.self.id
        robot.adapter.client.rtm.dataStore.getUserById(menber).real_name
    shuffle targets
    n = 0
    names = ("#{++n}: #{target}" for target in targets)
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

