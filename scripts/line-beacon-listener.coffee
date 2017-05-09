module.exports = (robot) ->

  robot.router.post "/line-becon", (req, res) ->
    message = JSON.parse req
    robot.logger.error "＊＊＊＊＊＊＊＊＊＊＊＊＊＊#{message}"
    robot.send {room: "C4LEAQHPW"}, "ビーコンに反応あり"
    res.end ""