# Description:
#   bot機能のコマンドまとめを表記するbot
# Author:
#   raoka0000


module.exports = (robot) ->
  robot.respond /(help|-h|-help|ヘルプ|詳細)/i, (msg) ->
    text = """
     バスの混み具合を確認する
     chocobot bus
     可愛いチョコボを出す
     chocobot AA
    """
    data =
      attachments: [
        text: text
        color: "ffbf00"
        mrkdwn_in: ["text"]
      ]
    msg.send data