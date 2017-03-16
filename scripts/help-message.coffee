# Description:
#   bot機能のコマンドまとめを表記するbot
# Author:
#   raoka0000


module.exports = (robot) ->
  robot.respond /(help|-h|-help|ヘルプ|詳細)/i, (msg) ->
    text1 = "バスの混み具合を確認する\n chocobot bus"
    data =
      attachments: [
        text: text1
        color: "ffbf00"
        mrkdwn_in: ["text"]
      ]
    msg.send data