module.exports = (robot) ->

  robot.router.post "/line-becon", (msg) ->
    message = JSON.parse msg
    robot.send {room: "C4LEAQHPW"}, message
    res.end()