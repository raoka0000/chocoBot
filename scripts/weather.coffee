module.exports = (robot) ->
  robot.respond /((.*))の天気(.*)/i, (msg) ->
   switch msg.match[1]
      when '今日'
        day = 0
      when '明日'
        day = 1
      when '明後日'
        day = 2
      else
        day = -1
        break
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=260010')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      if day == -1 then forecast = 'わからないクエ' else forecast = "#{msg.match[1]}の天気[京都]\n" + json['forecasts'][day]['telop']
      msg.reply forecast