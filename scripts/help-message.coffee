# Description:
#   bot機能のコマンドまとめを表記するbot
# Author:
#   raoka0000


module.exports = (robot) ->
  robot.respond /(-help|h|-h|ヘルプ|詳細)/i, (msg) ->
    text = """
     バスの混み具合を確認する
     　chocobot bus or バス
     可愛いチョコボを出す
     　chocobot AA or aa
     天気を聞く
     　(今日|明日|明後日)の天気
     時間割を出す
     　chocobot tt or timetable or 時間割
     　オプション
          -test [テスト期間中の時間割にする]
    """
    data =
      attachments: [
        text: text
        color: "ffbf00"
        mrkdwn_in: ["text"]
      ]
    msg.send data