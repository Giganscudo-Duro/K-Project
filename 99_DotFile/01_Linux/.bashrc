






# プロンプトの表示
# cygwin の表示を真似て設定
PS1="\$(
    bar=\" \[\e[0;31;41m\]#\[\e[0m\e[0;37m\] \"
    echo -ne \"\n\"
    echo -ne \"\${bar}Host: \H | User: \u | Time: \D{%Y-%m-%d %H:%M:%S}\n\"
    echo -ne \"\${bar}Path: \w\n\"
    echo -ne \"\${bar}# \[\e[0m\]\"
)"

