# Description:
#   AAを表示するbot
# Author:
#   takaS

module.exports = (robot) ->
  robot.respond /(krsw)/i, (msg) ->
    text = """
    あああああああああああああああああああああああああああああああ (ブリブリブリブリュリュリュリュリュリュ ブツチチブブブチチチチブリリイリブブブブゥゥゥゥッッッ )
    """
    msg.send text
