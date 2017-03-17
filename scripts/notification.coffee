# Description:
#   新しいチャンネルの完成を教えてくれるbot
# Author:
#   raoka0000

module.exports = (robot) ->
  ###robot.hear /test/i, (msg) ->
    userId = robot.adapter.client.rtm.dataStore.getUserByName('raoka0000').id
    roomId = msg.envelope.room
    tRoom = robot.adapter.client.rtm.dataStore.getChannelById(roomId)
    #console.log  tRoom
    robot.send {room: roomId}, "テスト中だよ #{userId} | #{roomId}\n(##{tRoom.name})\n: #{tRoom.purpose.value}"###

  robot.adapter.client.rtm.on 'raw_message', (msg) ->
    #console.log msg
    message = JSON.parse msg
    return unless message.type is 'channel_created'
    creator = robot.adapter.client.rtm.dataStore.getUserById(message.channel.creator)
    #console.log creator
    robot.send {room: "C0P4MNTT8"}, "新しいチャンネルができたよ！ (##{message.channel.name}) By #{creator.real_name}"

