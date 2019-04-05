#!/bin/sh
_proxy=10.177.3.246
_proxyport=1080


exec socat STDIO PROXY:$_proxy:$1:$2,proxyport=$_proxyport

