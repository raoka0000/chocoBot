# Description:
#   大学のバスプールを確認するbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.respond /(bus|バス)/i, (msg) ->
    for i in [1..3]
      url = "https://post.kyoto-su.ac.jp/upload/webcam/buspool-bc#{i}.jpg"
      text = if i == 3 then "<https://post.kyoto-su.ac.jp/webcam/|学校ホームページURL>" else ""
      data =
        attachments: [
          text : text
          author_name: "バスプール"
          image_url: url
        ]
      msg.send data