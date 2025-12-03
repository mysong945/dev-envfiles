docker run -d --name easyconnect \
  --device /dev/net/tun \
  --cap-add NET_ADMIN \
  -e PASSWORD=123456 \
  -e URLWIN=1 \
  -e DISABLE_PKG_VERSION_XML=1 \
  -v $HOME/.ecdata:/root \
  -p 127.0.0.1:5901:5901 \
  -p 127.0.0.1:1080:1080 \
  -p 127.0.0.1:8888:8888 \
  docker.1ms.run/hagb/docker-easyconnect:7.6.7
