# Description:
#   リアクションに反応するbot
# Author:
#   raoka0000

slack = require 'hubot-slack'

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
      when 'serval-chan'
        data =
          username: "サーバルちゃん"
          icon_emoji: ":serval-chan:"
          as_user: false
        client = robot.adapter.client
        arr = [
          "すごーい",
          "フレンズのみんなー！元気ー？",
          "すごーい！あなたは素敵なフレンズなんだね！",
          "おもしろーい！",
          "わーい！",
          "美味しいものを食べてこその人生だよ！",
          "わーい！すごーい！"
        ]
        text = arr[Math.floor(Math.random() * (arr.length + 1))]
        client.web.chat.postMessage(message.item.channel, text, data)
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