import json
from requests_oauthlib import OAuth1Session

# 独自のパッケージ
from callAPI import status
from callAPI import user
from callAPI import account
import common

def delete(twitter, args) :
    if args.all is True :
        # 全部削除する場合
        common.debuglog(args, "DEBUG: 全てのつぶやきを削除")
        params = {
            "include_entities" : "false",
            "skip_status"      : "true",
            "include_email"    : "true"
        }
        res = account.verify_credentials(twitter, params = params)
        userinfo = json.loads(res.text)
        params = {
            "user_id" : userinfo['screen_name']
        }
        res = status.user_timeline(twitter, params = params)
        if res.status_code == 200:
            timelines = json.loads(res.text)
            for line in timelines: #タイムラインリストをループ処理
                params = {
                    "id" : line['id_str']
                }
                res = status.destroy(twitter, params = params)
        else:
            print("DEBUG: Failed. : %d"% res.status_code)
    else :
        params = {
            "id" : args.id
        }
        res = status.destroy(twitter, params = params)

    if res.status_code == 200:
        print("Delete Success.")
    else:
        print("Delete Failed. : %d"% res.status_code)
