# Description:
#   リアクションに反応するbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.adapter.client.rtm.on 'raw_message', (msg) ->
    message = JSON.parse msg
    return unless message.type is 'reaction_added'
    switch message.reaction
      when 'gotiusa_tino'
        data =
          attachments: [
            author_name: "チノ"
            image_url: "http://otiai10.com/chino.gif"
            color: "ece0f8"
          ]
        robot.send {room: message.item.channel}, data
      when 'chocobot'
        arr = [
          "呼んだクエ？",
          "ナイスだクエ！",
          "リアクションありがとうクエ！",
          "クエックエックエ〜",
          "クエックエックエ〜チョコボール",
          "_チョコボ_",
          "素晴らしいクポ！"
        ]
        text = arr[Math.floor(Math.random() * (arr.length + 1))]
        robot.send {room: message.item.channel}, text