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
    <p>A high-performance and lightweight Nginx gateway service.</p>
    <p>Document ：<a href="/README.zh-CN.md">中文</a> / <a href="/README.md">English</a></p>
</div>

## 1. Introduction
ngxway is a high-performance, containerized and lightweight nginx gateway.

## 2. Features

### (1) High-performance
This gateway service is mainly implemented in Lua and, with built-in Nginx configuration and Linux parameter optimizations, it can achieve an average QPS of ```50,000``` even without any tuning, on an ```8c16G``` machine.

For more information on performance, you can refer to the detailed [performance report](https://wgrape.github.io/ngxway/html/benchmark.html). How was it generated? Please refer to the [benchmark document](./doc/benchmark.md) if necessary.

<img width="900" alt="image" src="https://user-images.githubusercontent.com/35942268/221419143-616c35b8-fd43-4c42-8ede-8a752125a6db.png">

### (2) Containerized

Built on Docker and decoupled from the underlying Nginx configuration, this gateway eliminates 90% of the setup process. With just one command, you can automatically set up your own Nginx gateway.

<!-- image -->

### (3) Lightweight

Compared to complex gateway implementations, this project is much lighter. You can freely modify various configurations of the project, as well as modify and add various Lua scripts to improve the overall performance of ngxway for your business.

<!-- image -->

## 3. Installation

To reduce installation costs and facilitate quick setup, simply execute the following command.

```bash
# install
git clone https://github.com/WGrape/ngxway.git && cd ngxway && bash install.sh

# uninstall
cd ngxway && bash uninstall.sh
```

## 4、Usage

### (1) Start the service
Execute the following command to start the ngxway service. If you can successfully open the ```127.0.0.1:8090``` page, it means that the service has started successfully.

```bash
bash bin/ngxway start
```

### (2) Stop service
Execute the following command to stop the ngxway service.

```bash
bash bin/ngxway stop
```

### (3) Restart service
Execute the following command to restart the ngxway service.

```bash
bash bin/ngxway restart
```

### (4) Service log
The logs of ngxway will be recorded in the ```local_volume_logs_dir``` log directory defined in the [./ngxway.conf](./ngxway.conf) file, the default is ```/tmp /logs``` directory.

## 6. Contribution
In the process of using this project, if you encounter any problems, please refer to [Q&A](https://github.com/WGrape/ngxway/wiki/Q&A) document. Welcome your [Issue](https://github.com/WGrape/ngxway/issues/new) and [Pull Request](https ://github.com/WGrape/ngxway/pulls).

<img src="https://contrib.rocks/image?repo=wgrape/ngxway">
