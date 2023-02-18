# Changelog

## [0.10.0](https://github.com/WGrape/ngxway/compare/v0.9.0...v0.10.0) (2023-02-18)


### Features

* add logrotate support ([bb65787](https://github.com/WGrape/ngxway/commit/bb65787dd4dd958d9eaeaf505a08dc509f7c0585))
* add logrotate support ([a01b372](https://github.com/WGrape/ngxway/commit/a01b3723330573239ec14d3da2190bc235620cae))
* add slow log ([e90174a](https://github.com/WGrape/ngxway/commit/e90174aa6b19b7a5f38923f790e0ec0d26abb842))
* remove log script files ([8388d92](https://github.com/WGrape/ngxway/commit/8388d92d1ab2715ffe2df59a4ec998a2a6aba1af))


### Bug Fixes

* access_log flush rollback ([8b71fdb](https://github.com/WGrape/ngxway/commit/8b71fdb25d254324865464e1aaea337b27dd5fbd))


### Performance Improvements

* compress html ([0f5b2a6](https://github.com/WGrape/ngxway/commit/0f5b2a6864b4fbc5ddcb4acf50b24b55a3f9cedf))
* modify the lua module structure to optimize system performance ([98cbeab](https://github.com/WGrape/ngxway/commit/98cbeab0ae80eba77b9e3ea0abbb3fec4f95f88b))


### Code Refactoring

* adjust the structure of scripts ([2800539](https://github.com/WGrape/ngxway/commit/28005395a98e1a980227b3857559ca5a61dce903))


### Tests

* modify benchmark test options ([e241653](https://github.com/WGrape/ngxway/commit/e24165379a5122b0749f186f90f572724790b40f))

## [0.9.0](https://github.com/WGrape/ngxway/compare/v0.8.0...v0.9.0) (2023-02-15)


### Features

* add information redirect of sed command in uninstall.sh script ([b47b759](https://github.com/WGrape/ngxway/commit/b47b7597db30a7a10184195dc263023a51d5b837))
* add information redirect of sed command in uninstall.sh script ([271f434](https://github.com/WGrape/ngxway/commit/271f4349a165de3e1274d6597ef51a4bed978812))
* add system parameters of net.core.somaxconn ([c989c10](https://github.com/WGrape/ngxway/commit/c989c104edb1ccf839429bc041031e1b83d76d05))
* ngxway cannot guarantee that the command will take effect in the global environment during installation ([baa48ce](https://github.com/WGrape/ngxway/commit/baa48ce3e39a0f129ce878c178c51c2cf6d59912))


### Bug Fixes

* fix failed to create ngxway lobal command ([89fa561](https://github.com/WGrape/ngxway/commit/89fa56118f090f5342fc334a395f9893ae96cadb))
* fix the bug No such file or directory: uninstall.sh ([c7b92e0](https://github.com/WGrape/ngxway/commit/c7b92e0ce964dd37c7c1e14849c269f463f68f02))
* fix the bug of adjusting system parameters ([d9bba20](https://github.com/WGrape/ngxway/commit/d9bba20cf19fc0a0dcfd760ec7ba056c1b4322ab))
* fix the bug of adjusting system parameters ([17f72e3](https://github.com/WGrape/ngxway/commit/17f72e3b4471d2325605a0bcc64cbb42d48c00db))
* fix the install.sh source not work ([48164d2](https://github.com/WGrape/ngxway/commit/48164d279fabaa1e5c3435e12f31b37931069240))
* fix the install.sh source not work ([45d16a2](https://github.com/WGrape/ngxway/commit/45d16a200e78b151a1f436c4e8e7ffc122d1f704))
* fix the install.sh source not work ([8a0cb15](https://github.com/WGrape/ngxway/commit/8a0cb159a8a0ba3d659fb678608fe1610fe07b16))
* fix the md5 command not found ([f37d3eb](https://github.com/WGrape/ngxway/commit/f37d3eb67c1ef4d694c1430a825ff2a5b58f6cf7))

## [0.8.0](https://github.com/WGrape/ngxway/compare/v0.7.2...v0.8.0) (2023-02-11)


### Features

* add the binary file of goserver ([b7f7874](https://github.com/WGrape/ngxway/commit/b7f787456c1ccea0779a5e669fdcec4693084122))
* add the uninstall.sh ([2e8ed96](https://github.com/WGrape/ngxway/commit/2e8ed969accf5ccd4c8038cd262b4b2a6a768cce))
* move the benchmark testing to the bin directory ([6a80880](https://github.com/WGrape/ngxway/commit/6a80880a59ada1c32fa7637c2f9c1f66bb9ac2c4))


### Bug Fixes

* fix adjust system params error ([6a04df7](https://github.com/WGrape/ngxway/commit/6a04df758a569748e8006b1c8b0682ee8ce071fc))
* fix some shell synatx bug ([6a6021d](https://github.com/WGrape/ngxway/commit/6a6021d3bbdce52a0054a7f930bb07ac374a44db))
* fix the bug of system check ([ca7b041](https://github.com/WGrape/ngxway/commit/ca7b04185762fe5e77d43061e04b93525e850a72))


### Docs

* add README of directories ([030806b](https://github.com/WGrape/ngxway/commit/030806bcf6bf7585bb1959f6383ded9a5448695b))
* update README.md ([b727412](https://github.com/WGrape/ngxway/commit/b7274125264e82d4d17d4d22984f9cbb2d9fc444))
* update README.md ([21ac1c5](https://github.com/WGrape/ngxway/commit/21ac1c537292c052af21f085100a7d356cf29907))


### Code Refactoring

* refactor the project design ([b05172d](https://github.com/WGrape/ngxway/commit/b05172d36447bb0db67a5920922d308f4e5d9d7b))
* refactor the project design 2th ([f4a77fb](https://github.com/WGrape/ngxway/commit/f4a77fbe5c75e0398c29fd69408a9a774878703f))

## [0.7.2](https://github.com/WGrape/ngxway/compare/v0.7.1...v0.7.2) (2023-02-11)


### Bug Fixes

* fix the keepalive of upstream ([909501d](https://github.com/WGrape/ngxway/commit/909501d06ea74cbf16b18450589ead6fae04dc4d))


### Code Refactoring

* refactor the project directory structure ([61cb636](https://github.com/WGrape/ngxway/commit/61cb6369a82d18e5e5adf6400cd29b5e7174de8f))

## [0.7.1](https://github.com/WGrape/ngxway/compare/v0.7.0...v0.7.1) (2023-02-09)


### Bug Fixes

* fix the bug of stop.sh for docker detecting ([3ee5699](https://github.com/WGrape/ngxway/commit/3ee5699592b48075a58d4ba98e98cf68e5f31d3e))
* miss keepalive option of upstream ([ed6246d](https://github.com/WGrape/ngxway/commit/ed6246d9e79bfe1042e20fbc15432f3a883498ad))


### Performance Improvements

* add -r option of benchmark.sh to raise QPS ([459b1da](https://github.com/WGrape/ngxway/commit/459b1da26feaba8ffba11ec22c1c859655f72749))

## [0.7.0](https://github.com/WGrape/ngxway/compare/v0.6.0...v0.7.0) (2023-02-07)


### Features

* add argument support of benchmark.sh ([c49b7bb](https://github.com/WGrape/ngxway/commit/c49b7bb2d3ad38e75da0c4f9fee9ae58515ad76e))
* add cli.sh to do something with replacements and autogenerated. ([4c52e6c](https://github.com/WGrape/ngxway/commit/4c52e6c705757d5712054089a8f3cae1f2b4e35f))


### Bug Fixes

* fix the nginx.reload.log not exist bug of start.sh script ([d3e16ee](https://github.com/WGrape/ngxway/commit/d3e16ee8985eaa0c4cfd1721ea556e95219709bc))
* fix the return value bug of stop.sh script ([035f918](https://github.com/WGrape/ngxway/commit/035f918fbbf091103e10af348f978881f9780014))


### Performance Improvements

* compress the html document ([a17fa2c](https://github.com/WGrape/ngxway/commit/a17fa2cbd7bda19299d0f1e98ee06eeb0011b321))
* increase the keepalive_requests option and turn on gzip ([1b75cc3](https://github.com/WGrape/ngxway/commit/1b75cc36ebbc12a6efa29938c3cb29d4dc683fad))
* remove the default favicon.ico file to decrease HTML transfer size ([87db19e](https://github.com/WGrape/ngxway/commit/87db19ebe434ac0051c1f9504d068334a4e67a6e))
* use epoll ([30bbdde](https://github.com/WGrape/ngxway/commit/30bbdde8ccc68236d8e07a2d6ab800d7063d4b2b))


### Docs

* make doc better ([a8f5f6a](https://github.com/WGrape/ngxway/commit/a8f5f6ac8ff40dc118a4a392220bdf5e02597387))


### Tests

* increase concurrency to get the larger QPS ([1d3b20e](https://github.com/WGrape/ngxway/commit/1d3b20e2d47276f24d844f3e3e1f0117bd940d0e))
* modify the content ([2dfd9c8](https://github.com/WGrape/ngxway/commit/2dfd9c8693b2e5670dbc9d5aeeb319ae7cc72da6))

## [0.6.0](https://github.com/WGrape/ngxway/compare/v0.5.0...v0.6.0) (2023-02-05)


### Features

* adjust computeSignedAPI to computeSignedRequest ([eeca00b](https://github.com/WGrape/ngxway/commit/eeca00be4cfe35b04e9d6b79ffd4e16d63c91d51))


### Bug Fixes

* fix bug(upstream timed out while connecting to upstream) ([9c658bf](https://github.com/WGrape/ngxway/commit/9c658bf344c0aa6987a69b37cd44eb47d2789e68))


### Performance Improvements

* add worker_process and worker_cpu_affinity to raise the QPS ([7fad6d1](https://github.com/WGrape/ngxway/commit/7fad6d1f505325fa221726c4700cce2e2f2c94bd))


### Styling

* change check_sign.lua code style ([6dc945a](https://github.com/WGrape/ngxway/commit/6dc945aa767432c8bd6b71e0aea36911957356d9))

## [0.5.0](https://github.com/WGrape/ngxway/compare/v0.4.2...v0.5.0) (2023-02-05)


### Features

* remove limit_traffic module by default ([6b4244c](https://github.com/WGrape/ngxway/commit/6b4244c2e767012b4f74f6ec8f5b05a9445da607))


### Bug Fixes

* fix the signedAPI of computeSignedAPI ([69c6b14](https://github.com/WGrape/ngxway/commit/69c6b14f73a6b06dd20fb85d62019e22d023184f))


### Tests

* add test/benchmark.sh for testing of benchmark ([e4a5cff](https://github.com/WGrape/ngxway/commit/e4a5cff8e739f56bd3839e53ff1a6c81f00fd3e5))


### Docs

* add benchmark testing document ([dc0d7ed](https://github.com/WGrape/ngxway/commit/dc0d7edc16840beb4e91460de391008d0f25163e))
* fix doc error ([e3bb4ef](https://github.com/WGrape/ngxway/commit/e3bb4ef7ced55abdce47e058db53c7ec6cbd96e5))

## [0.4.2](https://github.com/WGrape/ngxway/compare/v0.4.1...v0.4.2) (2023-02-05)


### Bug Fixes

* the repeat url param bug of check_sign.lua ([3c92761](https://github.com/WGrape/ngxway/commit/3c92761fc171d1572dc7a81c67ed75446a745cee))


### Performance Improvements

* fix disk io and improve the ngxway QPS ([5aebde4](https://github.com/WGrape/ngxway/commit/5aebde430549a81d95511ec4871e9d79202050b7))

## [0.4.1](https://github.com/WGrape/ngxway/compare/v0.4.0...v0.4.1) (2023-02-04)


### Styling

* change readme doc ([b8ac1db](https://github.com/WGrape/ngxway/commit/b8ac1dbe645f2dbe0f0f33c15337a22017f276a3))


### Code Refactoring

* adjust the directory of nginx ([bcad4f2](https://github.com/WGrape/ngxway/commit/bcad4f2beccb4bbf39ad0c3fffd7a7c5856481bc))
* simplify the design of conf files ([89f58ed](https://github.com/WGrape/ngxway/commit/89f58ed835ae400d3ec3d1bb6cf4d8d4829e0b50))

## [0.4.0](https://github.com/WGrape/ngxway/compare/v0.3.0...v0.4.0) (2023-02-04)


### Features

* add favicon.ico resource, restart.sh and test/benchmark.sh ([392e659](https://github.com/WGrape/ngxway/commit/392e65910a0cae20d7b8923af7e72e1023c70475))
* add proxy_pass and location feats ([1d80efa](https://github.com/WGrape/ngxway/commit/1d80efa628294b447fce195f072350d8335a7a7b))
* add upstream support ([1118252](https://github.com/WGrape/ngxway/commit/111825250b5bb853ddaa0c2f3de5015d02e8f4fe))


### Bug Fixes

* fix the panic of timestamp that string to number ([d56a285](https://github.com/WGrape/ngxway/commit/d56a285d8b2eee00618c7040a7b28665ffa647ce))


### Docs

* make doc better ([e132361](https://github.com/WGrape/ngxway/commit/e132361ad12681c515cb89980923da3e46a99124))


### Styling

* add test comment for lua/limit_traffic.lua ([282ca8c](https://github.com/WGrape/ngxway/commit/282ca8c4f669f755afd0c34ec1264d6784d7df14))

## [0.3.0](https://github.com/WGrape/ngxway/compare/v0.2.0...v0.3.0) (2023-02-04)


### Features

* add configuration support and many new features ([8f9bf91](https://github.com/WGrape/ngxway/commit/8f9bf91ab048f54611a325822476365a5f3bbaca))


### Tests

* add test ([35309bc](https://github.com/WGrape/ngxway/commit/35309bc04ae841bb0dc288bfd1db73c85269997b))


### Docs

* make doc better ([f0ecfff](https://github.com/WGrape/ngxway/commit/f0ecffff19bd200ea2c67fae5b2ef1a5f4cf96d5))
* make doc better ([a2c1e0c](https://github.com/WGrape/ngxway/commit/a2c1e0c94e0d489e38db9ba349b9b6da0a522b12))

## [0.2.0](https://github.com/WGrape/ngxway/compare/v0.1.0...v0.2.0) (2023-01-19)


### Features

* add blacklist/whitelist supprot ([d7b69c9](https://github.com/WGrape/ngxway/commit/d7b69c908bca8b20ef14258eafd17c6033838338))
* add limit_traffic lua support ([f0df487](https://github.com/WGrape/ngxway/commit/f0df487ec0ebaf050b7226fa4f51ec3ce59f3653))


### Bug Fixes

* write nginx reload console to local file ([8864878](https://github.com/WGrape/ngxway/commit/88648789598ef2afc402e1c2b9f5047573baf24f))
* 修复error日志文件名等bug ([6b9ede7](https://github.com/WGrape/ngxway/commit/6b9ede719feb5592914181a5f4280b15c6692eb1))


### Docs

* make doc better ([157a151](https://github.com/WGrape/ngxway/commit/157a151ca4ee25377ad3766e9cea62a4bd46833e))
* make doc better ([64cb0da](https://github.com/WGrape/ngxway/commit/64cb0da695938a1489166267afadd3898d68fbde))
* make doc better ([4b98718](https://github.com/WGrape/ngxway/commit/4b987181a4168598f90aa09515f570176364749c))

## [0.1.0](https://github.com/WGrape/ngxway/compare/v0.0.1...v0.1.0) (2022-11-29)


### Features

* 修改默认页面样式 ([8dd3779](https://github.com/WGrape/ngxway/commit/8dd3779c92b823ce18853859c70d9313adb5db65))
* 新增Lua处理和conf整体配置 ([7e84110](https://github.com/WGrape/ngxway/commit/7e8411045a103db84a2d69df55814f0d2033ab17))
* 新增workflow ([e40ff8e](https://github.com/WGrape/ngxway/commit/e40ff8e768c0eeece9b119a725ee57f1428b2cf1))


### Bug Fixes

* 修复时区和default替换为ngxway等问题 ([3e02e81](https://github.com/WGrape/ngxway/commit/3e02e812336492ae7b96e9d2f643ff89adcf834f))
* 修复构建镜像和container清理顺序导致的bug ([6fa7248](https://github.com/WGrape/ngxway/commit/6fa7248adafbb68398ea8238d106b4fade48b07f))
