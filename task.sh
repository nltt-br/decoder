#!/usr/bin/env bash 

MENSAGEM="

	$0 - [OPCOES]

	-b - base64decode
	-be - base64encode
	-d - urldecode
	-de - urlencode
	-f - format

"
URLDECODE="$(echo $2 | python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()))" 2>/dev/null)"
URLENCODE="$(echo $2 | python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.stdin.read()))" 2>/dev/null)"
BASE64DECODE="$(echo $2 | base64 -d 2>/dev/null)"
BASE64ENCODE="$(echo $2 | base64 2>/dev/null)"
FORMAT="$(echo $2 | sed 's/\\r\\n/\n\n/g' 2>/dev/null)"

[ -z $1 ] && echo "./$0 -h"


case $1 in
	-h) echo "$MENSAGEM" ;;
	-d) echo "$URLDECODE" ;;
	-de) echo "$URLENCODE" ;;
	-b) echo "$BASE64DECODE" ;;
	-be) echo "$BASE64ENCODE" ;;
	-f) echo "$FORMAT" ;;
	*) echo "./$0 -h" ;;
esac


