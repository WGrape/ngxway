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
    <p>A high-performance and lightweight Nginx gateway service based on Openresty.</p>
    <p>Document ：<a href="/README.zh-CN.md">中文</a> / <a href="/README.md">English</a></p>
</div>

## 1. Introduction
ngxway```[Nginx Way]```is a high-performance lightweight Nginx gateway service based on Openresty.

## 2. Features

### (1) High performance and low time consumption

Based on Openresty and Lua extensions, the Nginx layer gateway service with high performance and low time consumption is realized. For performance, you can check the detailed [benchmark test report](./doc/benchmark.md).

<!-- image -->

### (2) Containerized and easy to deploy

Based on Docker, it is decoupled from the underlying configuration of Nginx, eliminating all the construction process, and can automatically build its own Nginx gateway service with one command.

<!-- image -->

### (3) Lightweight and scalable

The whole project is simple and lightweight, you can change various configurations of the project at will, and even modify and add various scripts to enhance the performance of ngxway in your business.

<!-- image -->

## 3. Installation

Execute the following command to quickly complete the installation

```bash
git clone https://github.com/WGrape/ngxway.git
bash install.sh
```

## 4. Configuration

Some common functions of ngxway are defined in the [bin/common.sh](./bin/common.sh) file, which includes these configuration options.

- ```local_volume_logs_dir```: The local log directory mapped by ngxway
- ```ngxway_addr```: ngxway startup address and port number
- ```env```: The operating environment of ngxway, only allow dev/test/gray/prod 4 environments


## 5、Usage

### (1) Start the service
Execute the following command to start the ngxway service. In development mode, the ngxway page will be automatically opened in Chrome after success.

```bash
bash start.sh
```

<img width="650" alt="image" src="https://user-images.githubusercontent.com/35942268/216760566-7cd85e99-5089-4055-909a-8253dd366d95.png">

### (2) Stop service
Execute the following command to safely stop the ngxway service.

```bash
bash stop.sh
```

<img width="650" alt="image" src="https://user-images.githubusercontent.com/35942268/216760481-1eb24c24-58af-4260-afb3-96ea74dcdaca.png">

### (3) Service log

The logs of ngxway during operation will be recorded in the ```local_volume_logs_dir``` log directory defined in the [bin/common.sh](./bin/common.sh) file, the default is ```/tmp /logs``` directory.

<img width="650" alt="image" src="https://user-images.githubusercontent.com/35942268/216760443-6c53d04a-f09d-4cbd-ae71-c29f8f566ba2.png">

## 6. Contribution
In the process of using this project, if you encounter any problems or have better projects, welcome your [Issue](https://github.com/WGrape/ngxway/issues/new) and [Pull Request](https ://github.com/WGrape/ngxway/pulls)

<img src="https://contrib.rocks/image?repo=wgrape/ngxway">
