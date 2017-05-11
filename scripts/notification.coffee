# Description:
#   様々な通知を行うbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.adapter.client.rtm.on 'raw_message', (msg) ->
    #console.log msg
    message = JSON.parse msg
    switch message.type
      when 'channel_created'
        setTimeout ->
          creator = robot.adapter.client.rtm.dataStore.getUserById(message.channel.creator)
          channel = robot.adapter.client.rtm.dataStore.getChannelById(message.channel.id)
          purpose = ""
          purpose = channel.purpose.value if channel.purpose.value?
          robot.send {room: process.env.ROOM_GENERAL}, "新しいチャンネルができたよ！ ( ##{message.channel.name} ) By #{creator.real_name}\nどんなところ? -> #{purpose}"
        ,10000
      when 'emoji_changed'
        break unless message.subtype is 'add'
        robot.send {room: process.env.ROOM_GENERAL}, "新しい絵文字か追加されたよ!\n どんなの? -> :#{message.name}: [#{message.name}]\nちなみに追加は<https://c-a-c.slack.com/customize/emoji|ここ>からできるよ"