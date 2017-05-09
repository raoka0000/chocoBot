
module.exports = (robot) ->

  robot.router.post "/line-becon", (req, res) ->
    if not req.body
      res.end ""
      return

    data = if req.body.payload? then JSON.parse req.body.payload else req.body
    robot.logger.error data.events.type
    robot.send {room: "C4LEAQHPW"}, "ビーコンに反応あり"
    res.end ""