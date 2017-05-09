module.exports = (robot) ->

  robot.router.post "/line-becon", (req, res) ->
    message = JSON.parse res
    robot.logger.error "＊＊＊＊＊＊＊＊＊＊＊＊＊＊#{message.type}"
    robot.send {room: "C4LEAQHPW"}, "ビーコンに反応あり"
    res.end ""