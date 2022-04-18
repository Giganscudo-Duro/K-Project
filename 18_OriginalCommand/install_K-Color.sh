#/bin/bash

# 必要項目の設定
COMMAND_NAME="K-Color"
COMMAND_SCRIPT="
#!/bin/bash
perl -pe \"s/\${1}/\\e[41;33;1m\$&\\e\[m/gi\" \${2}
"

# 必要なパッケージの一覧
# Packages=("qemu-kvm" "libvirt" "virt-manager") # 半角スペースで区切る
Packages=("perl")


########################################################################################
# 着色設定
COLOR_1="\e[32;1m"
COLOR_2="\e[32;1m"
COLOR_END="\e[m"
# 使い方
# echo -e "${COLOR_1}文字列${COLOR_END}"


# 関数：強調文
function StrongMessage () {
	echo -e "${COLOR_1}${1}${COLOR_END}"
}


# 関数：root ユーザか否かを確認
function CheckRootUser () {
	StrongMessage "root ユーザか否かを確認します。"
	
	if [ `whoami` = "root" ]
	then
		echo "  rootユーザである事を確認しました"
	else
		echo "  rootユーザになってから実行してください"
		exit 1
	fi
}

function CheckYesNo () {
	read input
	if [ -z $input ]
	then
		echo "  yes または no を入力して下さい."
		CheckYesNo
	elif [ $input = 'yes' ] || [ $input = 'YES' ] || [ $input = 'y' ] ; then
		echo "  スクリプトを実行します."
	elif [ $input = 'no' ] || [ $input = 'NO' ] || [ $input = 'n' ] ; then
		echo "  スクリプトを終了します."
		exit 1
	else
		echo "  yes または no を入力して下さい."
		CheckYesNo
	fi
}



function InstallPackages () {
	StrongMessage "このコマンドのインストールには以下のパッケージが必要です。"
	echo ${1}
	StrongMessage "インストールを続けますか？ y:Yes n:No"
	CheckYesNo

	for PACKAGE in ${1}
	do
		yum install -y  ${PACKAGE}
	done
}



# root ユーザかをチェック
CheckRootUser


# 必要なパッケージのインストール
InstallPackages "${Packages[*]}"


# ShellScript を配置
StrongMessage "コマンド \"${COMMAND_NAME}\" をインストールします。"
COMMAND_PATH="/usr/local/bin/${COMMAND_NAME}"
cat <<EOF > ${COMMAND_PATH}
${COMMAND_SCRIPT}
EOF
chmod 777 ${COMMAND_PATH}
echo "  インストールしました"
exit 0
