module.exports = (robot) ->

  robot.router.post "/line-becon", (req, res) ->
    robot.logger.error "＊＊＊＊＊＊＊＊＊＊＊＊＊＊#{req}"
    robot.send {room: "C4LEAQHPW"}, "ビーコンに反応あり"
    res.end ""