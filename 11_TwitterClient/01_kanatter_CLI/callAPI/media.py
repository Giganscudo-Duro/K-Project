# 参考
# https://developer.twitter.com/ja/docs/media/upload-media/api-reference/post-media-upload
# https://www.imamura.biz/blog/22873
# https://developer.twitter.com/ja/docs/media/upload-media/api-reference/post-media-upload-init



def upload_init(twitter, params):
    url = "https://upload.twitter.com/1.1/media/upload.json"
    res = twitter.post(url, params = params)
    return res


def upload_append(twitter, params, files):
    url = "https://upload.twitter.com/1.1/media/upload.json"
    res = twitter.post(url, params = params, files = files)
    return res


def upload_status(twitter, params):
    url = "https://upload.twitter.com/1.1/media/upload.json"
    res = twitter.post(url, params = params)
    return res


def upload_finalize(twitter, params):
    url = "https://upload.twitter.com/1.1/media/upload.json"
    res = twitter.post(url, params = params)
    return res


