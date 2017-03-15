# Description:
#   Slackで新しいチャンネルができたら通知するやつ
# Author:
#   hiraoka

module.exports = (robot) ->
  robot.hear /疲れた/i, (msg) ->
    msg.send msg.random ["弱気になったとき、まず一ヵ月後の自分を想像してみる。それが自分の好きな姿だとしたら、そのために何をするべきかを考える。そうすれば、少なくともその日までは目的意識を保ち続けることができる", "独りで苦しんでるんだろう 辛いだろう？ 暗いんだろう？ じゃあエースをねらえを歌ってみろよ！！！", "みんな！！竹になろうよ 竹ってさあ台風が来てもしなやかじゃない。台風負けないんだよ雪が来てもね　おもいっきりそれを跳ね除ける！！力強さがあるんだよそう、みんな！！！竹になろう！！！バンブー！！！", "僕が偉そうに話してることは全て、これまで僕ができなかったこと"]

  robot.hear /帰りたい/i, (msg) ->
    msg.send msg.random ["どうした。文句があるなら、自分でプレーしろ！", "人は完璧を求める。しかし、完璧だと思った時から全てがやり直しになる", "じゃんけんの必勝法は、強く握り締めたグーを出すこと", "苦しいか？ 笑え！！"]

  robot.hear /test/i, (msg) ->
    msg.send "@raoka0000"

  robot.adapter.client?.on? 'raw_message', (msg) ->
    return unless msg.type is 'channel_created'
    text = ":star: @#{msg.channel.name} "
    robot.send {room: 'command-test'}, text

  robot.adapter.client?.on? 'raw_message', (msg) ->
    return unless msg.type is 'star_added'
    return unless msg.item.message.permalink
    user = robot.adapter.client.getUserByID msg.user
    text = ":star: @#{user.name} added star #{msg.item.message.permalink}"
    robot.send {room: 'stars'}, text