# Description:
#   AAを表示するbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.respond /(hiroto)/i, (msg) ->
    text = "こんばんわんこそば"
    msg.send text
