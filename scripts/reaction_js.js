// Author:
//   gammaaex

var ConsecutiveChecker = (function(){

    // コンストラクタ
    var ConsecutiveChecker = function(){
        //id(ユーザ名)と時間をストックしておく配列
        this.idAndTsArray = [];
    };

    ConsecutiveChecker.prototype.run = function(id,ts,time){
        var index = this.checkID(id);

        if(index >= 0){
            if(this.checkTs(index,ts,time)){
                this.removeArrayElement(index);
                this.setArray(id,ts);
                return true;
            }else{
                return false;
            }
        }else{
            this.setArray(id,ts);
            return true;
        }
    };

    // 行動した人物が存在するかチェックする
    ConsecutiveChecker.prototype.checkID = function(id){
        var array = this.getArray();

        for(var i=0; i<array.length; i++){
            if(id == array[i][0]){
                return i;
            }
        }
        return -1;
    };

    // 指定時間以内に行動されていないかチェックする
    ConsecutiveChecker.prototype.checkTs = function(index,ts,sec){
        var array = this.getArray();

        if(ts - array[index][1] > sec){
            return true;
        }else{
            return false;
        }
    };

    // idAndTsArrayのgetter
    ConsecutiveChecker.prototype.getArray = function(){
        return this.idAndTsArray;
    };

    // idAndTsArrayのsetter
    ConsecutiveChecker.prototype.setArray = function(id,ts){
        this.idAndTsArray.push([id,ts]);
    };

    // idAndTsArrayの指定されたインデックスの要素を削除する
    ConsecutiveChecker.prototype.removeArrayElement = function(index){
        this.idAndTsArray.splice(index,1);
    }

    return ConsecutiveChecker;
}());


// --------------------ここからbot------------------------


// Description:
//   リアクションに反応するbot
// Author:
//   raoka0000

var slack = require('hubot-slack');

var checker = new ConsecutiveChecker();

module.exports = function(robot) {
  return robot.adapter.client.rtm.on('raw_message', function(msg) {
    var arr,
        client,
        data,
        message,
        text;

    message = JSON.parse(msg);
    if (message.type !== 'reaction_added') return;
    switch (message.reaction) {
      case 'gotiusa_tino':
        if (!checker.run(message.user, message.ts, 5)) return;
        data = {
          attachments: [
            {
              author_name: "チノ",
              image_url: "http://otiai10.com/chino.gif",
              color: "ece0f8"
            }
          ]
        };
        return robot.send({
          room: message.item.channel
        }, data);

      case 'serval-chan':
        if (!checker.run(message.user, message.ts, 5)) return;
        data = {
          username: "サーバルちゃん",
          icon_emoji: ":serval-chan:",
          as_user: false
        };
        client = robot.adapter.client;
        arr = [
            "すごーい！！",
            "フレンズのみんなー！元気ー？",
            "すごーい！あなたは素敵なフレンズなんだね！",
            "おもしろーい！！",
            "わーい！！",
            "美味しいものを食べてこその人生だよ！",
            "わーい！すごーい！",
            "すごーい！！なにこれー？",
            "わーい！おもしろーい！！"
            ];
        text = arr[Math.floor(Math.random() * (arr.length))];
        return client.web.chat.postMessage(message.item.channel, text, data);

      case 'chocobot':
        if (!checker.run(message.user, message.ts, 5)) return;
        arr = [
            "呼んだクエ？",
            "ナイスだクエ！",
            "リアクションありがとうクエ！",
            "クエックエックエ〜",
            "クエックエックエ〜チョコボール",
            "_チョコボ_",
            "~チョコボ~",
            "素晴らしいクポ！"
            ];
        text = arr[Math.floor(Math.random() * (arr.length))];
        return robot.send({
          room: message.item.channel
        }, text);

    }
  });
};