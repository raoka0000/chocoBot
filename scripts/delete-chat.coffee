# Description:
#   botのコメントを削除する
# Author:
#   raoka0000

module.exports = (robot) ->
  robot.adapter.client.rtm.on 'raw_message', (msg) ->
    message = JSON.parse msg
    return unless message.type == "reaction_added"
    return unless message.reaction == "trash"
    if message.item_user == robot.adapter.self.id
      robot.adapter.client.web.chat.delete(message.item.ts,message.item.channel)

