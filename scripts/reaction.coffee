# Description:
#   リアクションに反応するbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.adapter.client.rtm.on 'raw_message', (msg) ->
    message = JSON.parse msg
    return unless message.type is 'reaction_added'
    return unless message.reaction is 'chocobot'
    arr = [
      "呼んだクエ？"
      "ナイスだクエ！"
      "リアクションありがとうクエ！"
      "クエックエックエ~"
      "クエックエックエ~チョコボール"
      "-チョコボ-"
    ]
    text = arr[Math.floor(Math.random() * (arr.length + 1))]
    robot.send {room: message.item.channel}, text