# Description:
#   gamailの送信内容をゲットする
#　　参考:https://github.com/gangstead/hubot-mail-listener
# Author:
#   raoka0000

MailListener = require "mail-listener2"
moment = require("moment")

config =
  rooms: (process.env.HUBOT_MAIL_LISTENER_ROOMS or 'C4LFH6ACA').split(',')
  username: process.env.HUBOT_MAIL_NOTIFIER_USERNAME
  password: process.env.HUBOT_MAIL_NOTIFIER_PASSWORD
  host: process.env.HUBOT_MAIL_NOTIFIER_HOST
  port: process.env.HUBOT_MAIL_NOTIFIER_PORT
  tls: process.env.HUBOT_MAIL_NOTIFIER_SECURE
  mailbox: process.env.HUBOT_MAIL_NOTIFIER_MAILBOX
  markSeen: process.env.HUBOT_MAIL_NOTIFIER_MARK_SEEN
  fetchUnreadOnStart: process.env.HUBOT_MAIL_NOTIFIER_FETCH_UNREAD
  attachments: false

module.exports = (robot) ->
  unless config.rooms[0].length > 0
    robot.logger.error "Please set the HUBOT_MAIL_NOTIFIER_ROOMS environment variable."
    return

  unless config.username
    robot.logger.error "Please set the HUBOT_MAIL_NOTIFIER_USERNAME environment variable."
    return

  unless config.password
    robot.logger.error "Please set the HUBOT_MAIL_NOTIFIER_PASSWORD environment variable."
    return

  unless config.host
    robot.logger.error "Please set the HUBOT_MAIL_NOTIFIER_HOST environment variable."
    return

  unless config.port
    config.port = 993

  unless config.tls
    config.tls = true

  unless config.mailbox
    config.mailbox = "INBOX"

  unless config.markSeen
    config.markSeen = true

  unless config.fetchUnreadOnStart
    config.fetchUnreadOnStart = true

  mailListener = new MailListener config
  mailListener.start()

  mailListener.on "server:connected", ->
    robot.logger.info "hubot-mail connected as #{config.username} to #{config.host}:#{config.port}"

  mailListener.on "server:disconnected", ->
    robot.logger.info "hubot-mail disconnected"
    mailListener.start()

  mailListener.on "error", (err) ->
    robot.logger.error "hubot-mail error", err

  mailListener.on "mail", (mail, seqno, attributes) ->
    #console.log mail
    from = ("#{sender.name} <#{sender.address}>" for sender in mail.from)
    date = moment(mail.headers.date)
    options =
      attachments: [
        fallback: mail.subject
        color: '3a6f8f'
        author_name: "✉️ #{from.join(',')}"
        title: mail.subject
        text: mail.text
        footer: "#{date.format('LLLL')}"
      ]
      username: "Gmail"
      icon_url: "https://cdn4.iconfinder.com/data/icons/free-colorful-icons/128/gmail.png"
      as_user: false
    for room in config.rooms
      robot.adapter.client.web.chat.postMessage(room, '', options)



