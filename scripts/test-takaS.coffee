# Description:
#   AAを表示するbot
# Author:
#   takaS

module.exports = (robot) ->
  robot.respond /(syamu)/i, (msg) ->
    text = """
    ウィィィィィィィィス
    """
    msg.send text
