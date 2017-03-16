# Description:
#   新しいチャンネルの完成を教えてくれるbot
# Author:
#   raoka0000

module.exports = (robot) ->

  robot.hear /疲れた/i, (msg) ->
    msg.send msg.random ["弱気になったとき、まず一ヵ月後の自分を想像してみる。それが自分の好きな姿だとしたら、そのために何をするべきかを考える。そうすれば、少なくともその日までは目的意識を保ち続けることができる", "独りで苦しんでるんだろう 辛いだろう？ 暗いんだろう？ じゃあエースをねらえを歌ってみろよ！！！", "みんな！！竹になろうよ 竹ってさあ台風が来てもしなやかじゃない。台風負けないんだよ雪が来てもね　おもいっきりそれを跳ね除ける！！力強さがあるんだよそう、みんな！！！竹になろう！！！バンブー！！！", "僕が偉そうに話してることは全て、これまで僕ができなかったこと"]

  robot.hear /帰りたい/i, (msg) ->
    msg.send msg.random ["どうした。文句があるなら、自分でプレーしろ！", "人は完璧を求める。しかし、完璧だと思った時から全てがやり直しになる", "じゃんけんの必勝法は、強く握り締めたグーを出すこと", "苦しいか？ 笑え！！"]

  robot.hear /test/i, (msg) ->
    idname = robot.adapter.client.rtm.dataStore.getUserByName('raoka0000').id
    mRoom = msg.envelope.room
    robot.send {room: mRoom}, "テスト中だよ #{idname}"

  robot.adapter.client.rtm.on 'raw_message', (msg) ->
    message = JSON.parse msg
    return unless message.type is 'hello'
    robot.send "成功"

