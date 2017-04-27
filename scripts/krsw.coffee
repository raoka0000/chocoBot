# Description:
#   AAを表示するbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.respond /(krsw)/i, (msg) ->
    text = """
    あああああああああああああああああああああああああああああああ (ブリブリブリブリュリュリュリュリュリュ ブツチチブブブチチチチブリリイリブブブブゥゥゥゥッッッ )
    """
    msg.send text
