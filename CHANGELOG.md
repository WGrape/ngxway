# Changelog

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
