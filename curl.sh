#!/bin/env bash
outfile=~/.local/bin/curl
if [ -e $outfile ]; then
	echo "请确保 $outfile 文件不存在!!!"
else
	mkdir -p ~/.local/bin
	echo "#!/bin/env bash
  curl_path=$(which curl)" >$outfile
  echo 'curl() {
mirror_url="http://ghproxy.com/github.com"
url=$@
if [[ $url =~ "://github.com" ]]; then
	url=${url/"http://github.com"/$mirror_url}
	url=${url/"https://github.com"/$mirror_url}
fi
$curl_path $url
}
curl $@' >>$outfile
	chmod +x $outfile
	echo '文件释放完毕
请确认 ~/.local/bin 在PATH中,
否则请执行
export PATH=~/.local/bin:$PATH
'
fi
