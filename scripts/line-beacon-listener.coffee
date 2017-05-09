# Herokuに保存しているアドレスもしくはデバッグ用にローカルアドレス
config =
  baseUrl: process.env.HUBOT_HEROKU_KEEPALIVE_URL ? 'http://localhost:8080'

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
    res.end "send C4LEAQHPW #{message}"