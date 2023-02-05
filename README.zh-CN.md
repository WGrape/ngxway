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
ngxway```[Nginx Way]```是一个基于Openresty的高性能轻量级Nginx网关服务。

## 二、特点

### 1、高性能低耗时

基于Openresty和Lua扩展实现高性能低耗时的Nginx层网关服务，关于性能您可以查看详细的[性能测试报告](./test/benchmark.md)。

### 2、容器化易部署

基于Docker构建，与Nginx底层配置解耦，省去所有的搭建流程，一个命令即可自动搭建起自己的Nginx网关服务。

### 3、轻量化可扩展

整个项目简单轻量化，您可以随意更改项目的各种配置，甚至修改和增加各种脚本以增强ngxway在您业务下的表现。

## 三、安装

执行以下命令即可快速完成安装

```bash
git clone https://github.com/WGrape/ngxway.git
bash install.sh
```

## 四、配置

在 [bin/common.sh](./bin/common.sh) 文件中定义了ngxway通用的一些功能，其中就包括了这些配置选项。

- ```local_volume_logs_dir```: ngxway映射在本地的日志目录
- ```ngxway_addr```: ngxway启动地址和端口号
- ```env```: ngxway的运行环境, 只允许 dev/test/gray/prod 4种环境


## 五、使用

### 1、启动服务
执行以下命令以启动ngxway服务。在开发模式下，成功后会自动在Chrome中打开ngxway页面。

```bash
bash start.sh
```

<img width="650" alt="image" src="https://user-images.githubusercontent.com/35942268/216760566-7cd85e99-5089-4055-909a-8253dd366d95.png">

### 2、停止服务
执行以下命令即可安全停止 ngxway 服务。

```bash
bash stop.sh
```

<img width="650" alt="image" src="https://user-images.githubusercontent.com/35942268/216760481-1eb24c24-58af-4260-afb3-96ea74dcdaca.png">

### 3、服务日志

ngxway在运行过程中的日志会记录到您在 [bin/common.sh](./bin/common.sh) 文件中定义的 ```local_volume_logs_dir``` 日志目录中，默认为 ```/tmp/logs``` 目录。

<img width="650" alt="image" src="https://user-images.githubusercontent.com/35942268/216760443-6c53d04a-f09d-4cbd-ae71-c29f8f566ba2.png">

## 六、贡献
在使用本项目的过程中，如遇到任何问题或有更好的项目，欢迎您的 [Issue](https://github.com/WGrape/ngxway/issues/new) 和 [Pull Request](https://github.com/WGrape/ngxway/pulls)

<img src="https://contrib.rocks/image?repo=wgrape/ngxway" >
