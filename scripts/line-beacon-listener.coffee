module.exports = (robot) ->

  robot.router.post "/line-becon", (req, res) ->
    message = req.body.messagereq
    robot.logger.error "＊＊＊＊＊＊＊＊＊＊＊＊＊＊#{message}"
    robot.send {room: "C4LEAQHPW"}, "ビーコンに反応あり"
    res.end ""