import json
from requests_oauthlib import OAuth1Session
import os
import magic

# 独自のパッケージ
from callAPI import status
from callAPI import media
from callAPI import status
from callAPI import user
from callAPI import user
import common


# 実装中
# https://developer.twitter.com/ja/docs/media/upload-media/api-reference/post-media-upload
# python で画像を扱う
# https://note.nkmk.me/python-numpy-image-processing/
# https://qiita.com/danishi/items/7f1569151a766b678b02

# 指定されたファイルをアップロードし、ファイルを表示するためのメディアIDを取得する
def getMediaID(twitter, args) :
    common.debuglog(args, "DEBUG: Start encodeMedia.")

    common.debuglog(args, "DEBUG: Start encodeMedia - init.")
    filepath = args.media
    files = {
        "media": open(filepath, 'rb')
        }
    mediasize = os.path.getsize(filepath)               # ファイルのサイズ取得
    mediatype = magic.from_file(filepath, mime=True)    # ファイルのメディアタイプ取得
    params = {
        "command"       : "INIT",
        "media_type"    : mediatype,
        "total_bytes"   : mediasize,
        }
    common.debuglog(args, "DEBUG: params = " + str(params))
    res = media.upload_init(twitter, params = params)
    init_res = json.loads(res.text)
    common.debuglog(args, "DEBUG: res1 = " + str(res))
    common.debuglog(args, "DEBUG: res2 = " + str(init_res))
    common.debuglog(args, "DEBUG: Finish encodeMedia - init.")

    # chunk の対処をも行いたい
    common.debuglog(args, "DEBUG: Start encodeMedia - append.")
    params = {
        "command"       : "APPEND",
        "media_id"      : init_res['media_id'],
        "segment_index" : 0
        }
    common.debuglog(args, "DEBUG: params = " + str(params))
    res = media.upload_append(twitter, params = params, files = files)
    common.debuglog(args, "DEBUG: res1 = " + str(res))
    common.debuglog(args, "DEBUG: Finish encodeMedia - append.")


    # ここが巧く動かない
    # ループを回し、アップロードが完了するまでFinalizeに進まないようにしたい
    common.debuglog(args, "")
    common.debuglog(args, "DEBUG: Start encodeMedia_status.")
    print("DEBUG: Start encodeMedia_status.")
    params = {
        "command"       : "STATUS",
        "media_id"      : init_res['media_id'],
        }
    res = media.upload_status(twitter, params = params)
    print(res)
    print(res.text)
    common.debuglog(args, "DEBUG: Finish encodeMedia_status.")
    common.debuglog(args, "")
    print("DEBUG: Finish encodeMedia_status.")
    # ここまで

    common.debuglog(args, "DEBUG: Start encodeMedia - finalize.")
    params = {
        "command"       : "FINALIZE",
        "media_id"      : init_res['media_id'],
        }
    common.debuglog(args, "DEBUG: params = " + str(params))
    res = media.upload_finalize(twitter, params = params)
    finalize_res = json.loads(res.text)
    common.debuglog(args, "DEBUG: res1 = " + str(res))
    common.debuglog(args, "DEBUG: res2 = " + str(finalize_res))
    common.debuglog(args, "DEBUG: Finish encodeMedia - finalize.")

    mediaid = finalize_res['media_id']
    common.debuglog(args, "DEBUG: media_id = " + str(mediaid))
    common.debuglog(args, "DEBUG: Finish encodeMedia.")
    return mediaid


def postTweet(twitter, args) :
    common.debuglog(args, "DEBUG: Start postTweet.")

    if args.media is None:
        common.debuglog(args, "DEBUG: メディアの添付がない")
        mediaid = None
    else :
        common.debuglog(args, "DEBUG: メディアの添付がある")
        mediaid = getMediaID(twitter, args)
        common.debuglog(args, "DEBUG: mediaid = " + str(mediaid))

    if args.replyid is None :
        common.debuglog(args, "DEBUG: 通常のつぶやき")
        params = {
            "status"                : args.messages,
            "in_reply_to_status_id" : args.replyid,
            "lat"                   : args.lat,
            "long"                  : args.long,
            "possibly_sensitive"    : args.sensitive,
            "media_ids"             : mediaid
            }
    else :
        common.debuglog(args, "DEBUG: 誰かへの返信")
        params = {
            "id" : args.replyid
            }
        res = status.show(twitter, params = params)
        tweetinfo = json.loads(res.text)
        params = {
            "status"                : "@"+tweetinfo['user']['screen_name']+" "+args.messages,
            "in_reply_to_status_id" : args.replyid,
            "lat"                   : args.lat,
            "long"                  : args.long,
            "possibly_sensitive"    : args.sensitive,
            "media_ids"             : mediaid
            }
    res = status.update(twitter, params = params)

    if res.status_code == 200:
        # 正常投稿出来た場合
        print("Post Success.")
    else:
        #正常投稿出来なかった場合
        print("Post Failed. : %d"% res.status_code)

    common.debuglog(args, "DEBUG: Finish postTweet.")
