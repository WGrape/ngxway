# Benchmark
This project comes with a performance testing script ```ngxway_benchmark``` that provides observation indicators such as QPS, time consumption, memory usage, and CPU usage.

### Dependencies
- The stress test is mainly based on the ```ab tool```. If the ```ab tool``` is not installed on your machine, please [install the ab tool](https://github.com/WGrape/ngxway/wiki/Q&A#1-how-to-install-ab) first.

## 1. Usage
在启动本项目后，使用以下命令即可开始性能测试。

```bash
bash bin/ngxway_benchmark api
```

## 2. Testing
When starting, ```ngxway_benchmark``` will perform the following 14 test cases by default on the current machine:

- ```n 10000 -c 32``` : 32 concurrent requests, completing a total of 10,000 requests and ending
- ```n 10000 -c 64``` : 64 concurrent requests, completing a total of 10,000 requests and ending
- ```n 10000 -c 128``` : 128 concurrent requests, completing a total of 10,000 requests and ending
- ```n 10000 -c 256``` : 256 concurrent requests, completing a total of 10,000 requests and ending
- ```n 10000 -c 512``` : 512 concurrent requests, completing a total of 10,000 requests and ending
- ```n 10000 -c 1024``` : 1024 concurrent requests, completing a total of 10,000 requests and ending
- ```n 10000 -c 1200``` : 1200 concurrent requests, completing a total of 10,000 requests and ending
- ```n 100000 -c 32``` : 32 concurrent requests, completing a total of 100,000 requests and ending
- ```n 100000 -c 64``` : 64 concurrent requests, completing a total of 100,000 requests and ending
- ```n 100000 -c 128``` : 128 concurrent requests, completing a total of 100,000 requests and ending
- ```n 100000 -c 256``` : 256 concurrent requests, completing a total of 100,000 requests and ending
- ```n 100000 -c 512``` : 512 concurrent requests, completing a total of 100,000 requests and ending
- ```n 100000 -c 1024``` : 1024 concurrent requests, completing a total of 100,000 requests and ending
- ```n 100000 -c 1200``` : 1200 concurrent requests, completing a total of 100,000 requests and ending
During the process, the command will also display real-time stress test information.

<img width="876" alt="image" src="https://user-images.githubusercontent.com/35942268/224525700-692df740-92f5-4ad6-8343-0ea7ebccd8ad.png">

## 3. Report
After completing the test, the system will generate a test report file named ```{ngxwayPath}/logs/benchmark.html``` in the ```logs``` folder of the project root directory.

When you operate on a Mac system, the system automatically opens the test report in the Chrome browser. If your system is not a Mac or the test report fails to open normally, you can open it manually to view.

<img width="1000" alt="image" src="https://user-images.githubusercontent.com/35942268/224526169-3ca6cd09-380d-4acf-b184-b972db85685b.png">

## 4. Summary
On an ```8C16G``` machine, without any additional optimizations, the QPS of the ngxway gateway service fluctuated between ```30,000 to 60,000```, with an average of ```50,000```.

## 5、Comparison
In addition to testing the performance of ngxway, several performance comparisons were also conducted, with the following conclusions:

- The ```bridge``` network mode of Docker results in an additional performance loss of around ```30%``` for the service. Therefore, if you aim for higher performance, please set ```docker_network``` to ```host``` mode in the ```ngxway.conf``` configuration file.

- Under the same testing conditions, ngxway's performance is approximately ```50%~70%``` of the [go test API](https://github.com/WGrape/ngxway/blob/d11c8a10bbd1c1cf382e5564515907875a75d56e/example/goserver/main.go#L16) performance. This means that if the QPS of the [go test API](https://github.com/WGrape/ngxway/blob/d11c8a10bbd1c1cf382e5564515907875a75d56e/example/goserver/main.go#L16) on your machine can reach ```100,000```, then ngxway can reach a QPS of ```50,000~70,000```.
