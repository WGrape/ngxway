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
    <p>基于Openresty的高性能轻量级Nginx网关服务</p>
    <p>Document ：<a href="/README.zh-CN.md">中文</a> / <a href="/README.md">English</a></p>
</div>

## 一、介绍
ngxway是一个基于Openresty的高性能、容器化、轻量化的Nginx网关。

## 二、特点

### 1、高性能

基于Openresty对Lua模块的支持，ngxway通过编写Lua模块和对Linux参数调优，在实现Nginx网关的同时，也达到平均```10w QPS / 8c16G```的高性能。关于性能您可以查看详细的[性能测试报告](./doc/benchmark.md)。

<img width="900" alt="image" src="https://user-images.githubusercontent.com/35942268/221419143-616c35b8-fd43-4c42-8ede-8a752125a6db.png">

### 2、容器化

基于Docker构建，与Nginx底层配置解耦，省去99%的搭建流程，1个命令即可自动搭建起自己的Nginx网关。

### 3、轻量化

比起复杂的网关实现，整个项目轻量化了许多。您可以随意更改项目的各种配置，甚至修改和增加各种Lua脚本以提高ngxway在您业务下的综合表现。

## 三、获取

### 1、如何安装

为了降低安装成本方便您的快速上手，本项目提供了```install.sh```集成脚本，执行以下命令即可完成安装。

```bash
git clone https://github.com/WGrape/ngxway.git && cd ngxway && bash install.sh
```

### 2、如何卸载

在本项目下也提供了用于卸载的```uninstall.sh```集成脚本，执行以下命令即可完成安装。

```bash
cd ngxway && bash uninstall.sh
```

### 3、注意事项
注意ngxway只支持运行在有Docker环境的Unix系统上，如Linux、MacOS等。如果只是为了尝鲜体验，强烈建议使用 [在线Docker](https://labs.play-with-docker.com/) 测试使用。

## 四、配置

在 [./ngxway.conf](./ngxway.conf) 文件中定义了ngxway通用的一些功能，其中就包括了这些配置选项。

- ```local_volume_logs_dir```: ngxway映射在本地的日志目录
- ```ngxway_addr```: ngxway启动地址和端口号
- ```env```: ngxway的运行环境, 只允许 dev/test/gray/prod 4种环境


## 五、使用

### 1、启动服务
执行以下命令以启动ngxway服务。在开发模式下，成功后会自动在Chrome中打开ngxway页面。

```bash
ngxway start
```

<img width="650" alt="image" src="https://user-images.githubusercontent.com/35942268/216760566-7cd85e99-5089-4055-909a-8253dd366d95.png">

### 2、停止服务
执行以下命令即可安全停止 ngxway 服务。

```bash
ngxway stop
```

### 3、重启服务
执行以下命令即可自动重启 ngxway 服务。

```bash
ngxway restart
```

<img width="650" alt="image" src="https://user-images.githubusercontent.com/35942268/216760481-1eb24c24-58af-4260-afb3-96ea74dcdaca.png">

### 4、服务日志

ngxway在运行过程中的日志会记录到您在 [./ngxway.conf](./ngxway.conf) 文件中定义的 ```local_volume_logs_dir``` 日志目录中，默认为 ```/tmp/logs``` 目录。

<img width="650" alt="image" src="https://user-images.githubusercontent.com/35942268/216760443-6c53d04a-f09d-4cbd-ae71-c29f8f566ba2.png">

## 六、贡献
在使用本项目的过程中，如遇到任何问题或有更好的项目，欢迎您的 [Issue](https://github.com/WGrape/ngxway/issues/new) 和 [Pull Request](https://github.com/WGrape/ngxway/pulls)

<img src="https://contrib.rocks/image?repo=wgrape/ngxway" >
