# Description:
#   天気を知らせるbot
#　　参考:http://koheikimura.hatenablog.com/entry/2016/02/07/142501
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.hear /((.*))天気/i, (msg) ->
    day = -1
    day =  0 unless msg.match[1].indexOf("今日") == -1
    day =  1 unless msg.match[1].indexOf("明日") == -1
    day =  2 unless msg.match[1].indexOf("明後日") == -1
    day_label = ["今日","明日","明後日"]
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=260010')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      if day == -1
        forecast = "#{json['description']['text']}"
        day = 0
      else
        forecast = """
          #{day_label[day]}の天気[京都]
          #{json['forecasts'][day]['telop']}<http://weather.livedoor.com/area/forecast/2610100|[詳細]>
          """
      data =
        attachments: [
          color: "81daf5"
          text : forecast
          thumb_url: json['forecasts'][day]['image']['url']
          footer: "<#{json['copyright']['link']}|#{json['copyright']['title']}>"
        ]
      #console.log json
      msg.send data