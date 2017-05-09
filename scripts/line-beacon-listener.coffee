module.exports = (robot) ->

  robot.router.post "/line-becon", (req, res) ->
    if not req.body
      res.end ""
      return

    room_name = req.body.room
    message = req.body.message
    console.log  "test"
    console.log  req
    robot.send {room: "C4LEAQHPW"}, message
    res.end ""