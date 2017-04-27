# Description:
#   AAを表示するbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.respond /(ito)/i, (msg) ->
    text = """
    　　　　　　　　　　　_
    　　　　　　　　／"'￣フ／)　　　　　　　 、
    　　　　　　　,/ ,--、 ￣､__フ　　　　 ／/
    　　　　　　 ,ヘｌ⌒ﾉ 　　＞　　　　,／　/＿
    　　　　　　( ＿l_"_ニ_　く＿　 ／）　／　／
          ,＞　　　　　 フ､　　　　､､＞
    　　　　　　　 <"　（　　　　　　フ　_＿＞
    　　　　　　　　ヽ　 ＼､､　＿フ' ノ
    　　　　　　　　　＼、＿＿､､,_ノ゛
    　　　　　　　　　　 　　 〉ﾆ〉ﾆ〉
    　　　　　　　　　 　 ,､_/ﾆ/ﾆ/
    　　　　　　　　　　∠ｌ∠ｌ､ニ＞
    """
    msg.send text
