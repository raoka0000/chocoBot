# Description:
#   bot機能のコマンドまとめを表記するbot
# Author:
#   raoka0000


module.exports = (robot) ->
  robot.respond /(-help|-h|ヘルプ|詳細)/i, (msg) ->
    text = """
    *チョコボットとDMで会話する際には"chocobot"この単語を消してください*
     バスの混み具合を確認する
     　`chocobot (bus or バス)`
     天気を聞く
     　`(今日 or 明日 or 明後日)の天気`
     電車の遅延を確認する
         `chocobot train kyoto`
          <http://transit.yahoo.co.jp/traininfo/detail/267/0|ここ>から直接読み取ってます。ここだけで不足であれば教えてください。
     時間割を出す
     　`chocobot (tt or timetable or 時間割)`
     　オプション
          `-test` [テスト期間中の時間割にする]
     可愛いチョコボを出す
     　`chocobot (AA or aa)`
    """
    data =
      attachments: [
        text: text
        color: "ffbf00"
        mrkdwn_in: ["text"]
      ]
    msg.send data