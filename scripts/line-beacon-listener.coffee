module.exports = (robot) ->

  robot.router.post "/line-becon", (req, res) ->
    robot.logger.error "Please set the HUBOT_MAIL_NOTIFIER_ROOMS environment variable."
    robot.send {room: "C4LEAQHPW"}, "ビーコンに反応あり"
    res.end ""