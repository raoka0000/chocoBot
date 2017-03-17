# Description:
#   学校の時間割を表示するbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.respond /(時間割|tt|TT|timetable)/i, (msg) ->
    text = """
    1限目 09:00 ~ 10:30
    2限目 10:45 ~ 12:15
    3限目 13:15 ~ 14:45
    4限目 15:00 ~ 16:30
    5限目 16:45 ~ 18:15
    """
    msg.send text