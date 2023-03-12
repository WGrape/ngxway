<div align="center">
<img width="250" src="https://user-images.githubusercontent.com/35942268/212838933-38bec2ca-c156-4c63-8563-c645bd476cb3.png">
</div>

<div align="center">
    <!-- oscs: https://www.oscs1024.com/cd/1543980900807675904?sign=a3d02348 -->
    <!-- https://www.murphysec.com/ -->
    <a href="https://www.oscs1024.com/project/oscs/WGrape/ngxway?ref=badge_small" alt="OSCS Status"><img src="https://www.oscs1024.com/platform/badge/WGrape/ngxway.svg?size=small"/></a>
    <!-- <img src="https://github.com/wgrape/ngxway/actions/workflows/build.yml/badge.svg"> -->
    <img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/wgrape/ngxway">
    <img src="https://img.shields.io/badge/Document-中文/English-orange.svg">
    <img src="https://img.shields.io/badge/License-MIT-green.svg">
</div>

<div align="center">
    <p>高性能轻量级的Nginx网关服务</p>
    <p>Document ：<a href="/README.zh-CN.md">中文</a> / <a href="/README.md">English</a> &nbsp; Wiki ：<a href="/README.zh-CN.md">English</a> </p>
</div>

## 一、项目介绍
ngxway是一款高性能、容器化、轻量化的Nginx网关服务。

## 二、项目特点

### 1、高性能

本网关服务主要基于Lua实现，在内置的Nginx配置和Linux参数优化下，默认当您下载启动此服务后，即使不进行任何调优，在```8c16G```机器下也有平均```5w QPS```的表现。

关于性能您可以查看详细的 [性能测试报告](https://wgrape.github.io/ngxway/html/benchmark.html) ，它是如何生成的呢？如果需要请查看 [如何压测](./doc/benchmark.zh-CN.md) 文档。

<img width="1000" alt="image" src="https://user-images.githubusercontent.com/35942268/224526169-3ca6cd09-380d-4acf-b184-b972db85685b.png">

### 2、容器化

基于Docker构建，与Nginx底层配置解耦，省去90%的搭建流程，1个命令即可自动搭建起自己的Nginx网关。

### 3、轻量化

比起复杂的网关实现，整个项目轻量化了许多。您可以随意更改项目的各种配置，也可以修改和增加各种Lua脚本以提高ngxway在您业务下的综合表现。

## 三、项目安装

为了降低安装成本方便您的快速上手，执行以下命令即可。

```bash
# 安装
git clone https://github.com/WGrape/ngxway.git && cd ngxway && bash install.sh

# 卸载
cd ngxway && bash uninstall.sh
```

注意ngxway只支持运行在有Docker环境的Unix系统上，如Linux、MacOS等。如果只是为了尝鲜体验，强烈建议使用 [在线Docker](https://labs.play-with-docker.com/) 测试使用。

## 四、快速开始

### 1. 启动服务
执行以下命令以启动ngxway服务，如果可以成功打开```127.0.0.1:8090```页面，则说明启动成功。

```bash
bash bin/ngxway start
```

### 2. 停止服务
执行以下命令即可安全停止 ngxway 服务。

```bash
bash bin/ngxway stop
```

### 3. 重启服务
执行以下命令即可自动重启 ngxway 服务。

```bash
bash bin/ngxway restart
```

### 4. 服务日志
ngxway在运行过程中的日志会记录到您在 [./ngxway.conf](./ngxway.conf) 文件中定义的 ```local_volume_logs_dir``` 日志目录中，默认为 ```/tmp/logs``` 目录。

### 5. 业务接入
恭喜您至此已安装并成功启动服务，不过在您未对项目做任何修改前，它还未能真正为你提供网关服务。如果您需要业务接入，请查看阅读 [Wiki](https://github.com/WGrape/ngxway/wiki/) 。

## 五、贡献
在使用本项目的过程中，如遇到任何问题可以参考 [Q&A](https://github.com/WGrape/ngxway/wiki/Q&A) ，也欢迎您的 [Issue](https://github.com/WGrape/ngxway/issues/new) 和 [Pull Request](https://github.com/WGrape/ngxway/pulls)

<img src="https://contrib.rocks/image?repo=wgrape/ngxway" >
