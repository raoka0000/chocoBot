module.exports = (robot) ->

  robot.router.post "/line-becon", (req, res) ->
    message = JSON.parse req
    robot.send {room: "C4LEAQHPW"}, "req"
    res.end()