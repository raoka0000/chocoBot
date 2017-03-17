# Description:
#   電車遅延情報を教えるbot
#   参考: https://github.com/hotatekaoru/myHubotScripts/blob/master/train-info.coffee


cheerio = require 'cheerio-httpcli'

module.exports = (robot) ->
  robot.respond /train (.+)/i, (msg) ->
    target = msg.match[1]
    # JR京都線
    jr_kyoto = 'http://transit.yahoo.co.jp/traininfo/detail/267/0/'
    if target == "kyoto"
      searchTrain(jr_kyoto, msg)
    else
      msg.send "#{target}は検索できないクエ！"

  searchTrain = (url, msg) ->
    cheerio.fetch url, (err, $, res) ->
      title = "#{$('h1').text()}"
      if $('.icnNormalLarge').length
        msg.send "#{title}は遅れていないクエ"
      else
        info = $('.trouble p').text()
        msg.send "#{title}は遅れているクエ \n#{info}"