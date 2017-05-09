module.exports = (robot) ->

  robot.router.post "/line-becon", (req, res) ->
    if not req.body
      res.end ""
      return

    message = JSON.parse req
    robot.send {room: "C4LEAQHPW"}, message
    res.end ""