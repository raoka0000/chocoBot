module.exports = (robot) ->

  robot.router.post "/line-becon", (req, res) ->
    if not req.body
      res.end ""
      robot.logger.error "＊＊＊＊＊＊＊＊＊＊＊＊＊＊ボディなんてねぇよ！！"
      return

    data = if req.body.payload? then JSON.parse req.body.payload else req.body
    robot.logger.error "＊＊＊＊＊＊＊＊＊＊＊＊＊＊#{req.body}"
    robot.logger.error "＊＊＊＊＊＊＊＊＊＊＊＊＊＊#{data}"
    robot.send {room: "C4LEAQHPW"}, "ビーコンに反応あり"
    res.end ""