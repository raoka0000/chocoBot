# Description:
#   AAを表示するbot
# Author:
#   munonasalu

module.exports = (robot) ->
  robot.respond /(hiroto)/i, (msg) ->
    text = "Welcome to ようこそ ジャパリパーク！"
    msg.send text
