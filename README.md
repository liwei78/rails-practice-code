# 代码调试说明

该代码最初编写于2015年初，后来经过各种版本升级和 bug 修复，导致一些代码无法正确运行，现在用了新的办法来调试这些代码，尽量避免在环境调试上浪费太多时间。

## 安装 docker

我的开发环境是 mac + docker，如果你是 windows 作为开发机器，可以和我一样安装 docker，具体的文档在 https://docs.docker.com

## 使用 Ruby 镜像

`docker pull ruby:2.3.3`

## 创建镜像

在每一份代码里，我增加了 README.md，里面介绍了如何创建容器及运行程序，通常是：

`docker run -itd -p 3000:3000 --name shop -v "$PWD":/data -w /data ruby:2.3.3 bash`

创建一个容器，然后使用 `docker exec -it shop bash` 进入该容器的 bash 环境，调试和运行 Rails 命令。

`rails s -b 0.0.0.0 -p 3000` 启动时的命令稍微不同，需要增加 -b 参数，-p 参数指定容器开放的端口。这样我们方便调试每个章节涉及的代码，并独立运行在自己的端口上。

## 其他安装方法

当然还可以继续使用 rvm 或者 rbenv，或者直接安装 ruby-2.3.3 进行开发使用。大家请各自尝试。

## 建议

不要在 windows 下直接安装 ruby 进行代码调试，那样会产生很多异常情况。为了节省时间，建议直接使用 ubuntu 或者 linux 的虚拟机。

2017年2月
