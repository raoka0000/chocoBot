# Description:
#   学校の時間割を表示するbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.respond /(時間割|tt|TT|timetable)(.*)/i, (msg) ->
    if (if msg.match[2]? then (msg.match[2].trim() == "-test") else false)
      text = """
      [テスト期間]
      1限目 09:30 ~ 10:30
      2限目 11:00 ~ 12:00
      3限目 13:00 ~ 14:00
      4限目 14:30 ~ 15:30
      5限目 16:00 ~ 17:00
      """
    else
      text = """
      1限目 09:00 ~ 10:30
      2限目 10:45 ~ 12:15
      3限目 13:15 ~ 14:45
      4限目 15:00 ~ 16:30
      5限目 16:45 ~ 18:15
      """
    msg.send text