# Description:
#   大学のバスプールを確認するbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.respond /(bus|バス)/i, (msg) ->
    url = ("https://post.kyoto-su.ac.jp/upload/webcam/buspool-bc#{i}.jpg" for i in [1..3])
    data =
      attachments: [
        {
          text : "<https://post.kyoto-su.ac.jp/webcam/|学校ホームページURL>"
        },
        {
          author_name: "バスプール1"
          image_url: url[0]
        },
        {
          author_name: "バスプール2"
          image_url: url[1]
        },
        {
          author_name: "バスプール3"
          image_url: url[2]
        }
      ]
    msg.send data