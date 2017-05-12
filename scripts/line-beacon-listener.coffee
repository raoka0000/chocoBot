module.exports = (robot) ->
  robot.router.post "/line-becon", (req, res) ->
    if not req.body
      res.end ""
      return
    data = if req.body.payload? then JSON.parse req.body.payload else req.body
    unless data.events?
      res.end ""
      return
    unless data.events[0].beacon?
      res.end ""
      return
    robot.logger.info data
    robot.send {room: process.env.ROOM_BOX_NOTIFICATION}, "ビーコンに反応あり 反応の種類#{data.events[0].beacon.type}"
    res.end ""