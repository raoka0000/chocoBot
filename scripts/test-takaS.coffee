# Description:
#   AAを表示するbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.respond /(syamu)/i, (msg) ->
    text = """
    ウィィィィィィィィス
    """
    msg.send text
