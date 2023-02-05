import json
from requests_oauthlib import OAuth1Session

# 独自のパッケージ
from callAPI import status
from callAPI import user
import common

def user_timeline(twitter, args):
    common.debuglog(args, "DEBUG: Start user_timeline")

    # ユーザ特定用のパラメタ作成
    params = {
        "user_id"     : None,
        "screen_name" : args.username
    }
    res = user.show(twitter, params = params)
    userinfo = json.loads(res.text)

    # ツイート取得用のパラメタ作成
    params = {
        "user_id"  : userinfo['id'],
        "count"    : args.count,
        "since_id" : args.since_id,
        "max_id"   : args.max_id
    }
    res = status.user_timeline(twitter, params = params)
    if res.status_code == 200:
        common.debuglog(args, "DEBUG: user_timeline Success.")
        timelines = json.loads(res.text)
        print('*******************************************')
        for line in timelines: #タイムラインリストをループ処理
            print(line['user']['name']+' , '+line['created_at'])
            print("id = ", line['id'])
            print("-----")
            print(line['text'])
            print('*******************************************')

    else:
        print("DEBUG: user_timeline Failed. : %d"% res.status_code)

    common.debuglog(args, "DEBUG: Finish user_timeline.")



def home_timeline(twitter, args):
    common.debuglog(args, "DEBUG: Start home_timeline")
    params = {
        "count" : args.count
    }
    res = status.home_timeline(twitter, params = params)
    if res.status_code == 200:
        print("DEBUG: home_timeline Success.")
        timelines = json.loads(res.text) #レスポンスからタイムラインリストを取得
        print('*******************************************')
        for line in timelines: #タイムラインリストをループ処理
            print(line['user']['name']+' , '+line['created_at'])
            print(line['id'])
            print("-----")
            print(line['text'])
            print('*******************************************')
    else:
        print("DEBUG: home_timeline Failed. : %d"% res.status_code)
    common.debuglog(args, "DEBUG: Finish home_timeline")
