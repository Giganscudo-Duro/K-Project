
# デバッグログの出力関数
def debuglog(args, messages) :
    if args.verbose is True :
        # verbose オプションがあった場合は、デバッグログを出力する
        print(messages)
    else :
        pass
    return
