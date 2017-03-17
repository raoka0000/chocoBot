# Description:
#   天気を知らせるbot
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.hear /((.*))の天気/i, (msg) ->
    day = -1
    day =  0 unless msg.match[1].indexOf("今日") == -1
    day =  1 unless msg.match[1].indexOf("明日") == -1
    day =  2 unless msg.match[1].indexOf("明後日") == -1
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=260010')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      if day == -1 then forecast = 'わからないクエ' else forecast = "#{msg.match[1]}の天気[京都]\n" + json['forecasts'][day]['telop']
      msg.send forecast