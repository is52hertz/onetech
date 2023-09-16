# ONETECH-OHOL 制作参考

> 一小时一生活制作参考

在此查看： 
https://kazetsukai.github.io/onetech
http://onetech.onehouronelife.cn
http://moetech.onehouronelife.cn

本网站直接使用[游戏数据储存库](https://github.com/jasonrohrer/OneLifeData7)中的游戏数据建立。
它显示了物品之间的关系，让您可以探索物品是如何制作的。

与包含游戏 “智慧” 的维基不同，本网站只包含 “知识” 。 
本网站仅供参考。
如需更好的指南，请访问[游戏维基](https://onehouronelife.gamepedia.com/One_Hour_One_Life_Wiki)。


## 制作说明

该项目分为两个部分： 
- 一个节点脚本，用于处理游戏数据存储库（OneLifeData7）中的最新数据。
- 网站本身，使用 VueJS 构建。


### 编译过程

``` bash 
# 安装依赖项 
npm install

# 在 localhost:8080 进行热重载 
npm run dev

# 使用最小化功能为生产版本构建
npm run build
```

有关工作原理的详细解释，请查阅 [docs for vue-loader](http://vuejs.github.io/vue-loader)。


### 生成脚本

该脚本位于 `process` 文件夹下。
它将从游戏数据存储库中提取最新数据（如果提供了 `download` 作为命令行参数），然后为对象生成 JSON 文件。
它还会合成图元，并为游戏中的每个对象创建 PNG。


需要 nodejs 建议版本为 10
``` bash
curl -sL https://rpm.nodesource.com/setup_10.x | bash -
sudo yum clean all && sudo yum makecache fast
sudo yum install -y gcc-c++ make
sudo yum install -y nodejs
node -v
```


要运行它，您需要安装 [ImageMagick](https://www.imagemagick.org/script/index.php) 和 [Canvas 依赖项](https://github.com/Automattic/node-canvas/blob/v1.x/Readme.md#installation)

``` bash
yum install ImageMagick
sudo yum install cairo cairo-devel cairomm-devel libjpeg-turbo-devel pango pango-devel pangomm pangomm-devel giflib-devel
```

如果您的项目有超过 4096 个项目，您需要更改系统用户可以处理的上限。

打开文件: `/etc/security/limits.conf`


在末尾粘贴以下内容：
``` bash
*         hard    nofile      500000
*         soft    nofile      500000
root      hard    nofile      500000
root      soft    nofile      500000
```

500000 是个不错的数字。我不确定最大限制是多少，但我记得 999999（size-9）对我有用。 
保存文件后，您可能需要注销并重新登录。

然后:

``` bash
cd process

# 安装依赖项
npm install

# 运行脚本，包括下载最新数据和处理图元
node process.js dev download

# 下载一次后，可以不使用下载参数运行
node process.js dev

# 如果要重新处理精灵
node process.js dev sprites

# 删除用于生产的 dev 参数（在构建之前）
node process.js
```

如果您想提供自己的数据内容，可以覆盖 Git URL 或路径。

``` bash
export ONETECH_PROCESS_GIT_URL="https://github.com/custom-ohol-data"
# 或者
export ONETECH_PROCESS_GIT_PATH="/path/to/custom-ohol-data"
```

### 其他脚本
buildSite.sh 构建网站
buildData.sh 构建最新数据
reBuildData.sh 自动更新数据
buildSprite.sh 构建图片
pullData.sh 获取最新数据
copyData.sh 将结果复制到网络服务器

————————————————————————————————————————————————————————————————————————
### English
# onetech OHOL Crafting Reference

> One Hour One Life Crafting Reference

View here: https://kazetsukai.github.io/onetech

http://onetech.onehouronelife.cn

http://moetech.onehouronelife.cn

This site is built using the game data directly from [the game data repository](https://github.com/jasonrohrer/OneLifeData7).
It shows the relationships between items, and lets you explore how things are crafted.

Unlike the wiki, which contains "wisdom" about the game, this site contains only "knowledge".
This is a reference. For a better guide, go to the [game wiki](https://onehouronelife.gamepedia.com/One_Hour_One_Life_Wiki).


## Build description

The project is split into two parts:
- A node script that processes the latest data from the game data repository
- The site itself, built in VueJS


### Build process

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build
```

For detailed explanation on how things work, consult the [docs for vue-loader](http://vuejs.github.io/vue-loader).


### Build script

The script is under the folder `process`. It will pull the latest data from the game data repository (if provided `download` as a command line argument), and then generate JSON files for the objects. It will also composite the sprites and create PNGs for each object in the game.


Need nodejs recommended version is 10

``` bash
curl -sL https://rpm.nodesource.com/setup_10.x | bash -
sudo yum clean all && sudo yum makecache fast
sudo yum install -y gcc-c++ make
sudo yum install -y nodejs
node -v
```


To get it running, you will need to install [ImageMagick](https://www.imagemagick.org/script/index.php) and [Canvas dependencies](https://github.com/Automattic/node-canvas/blob/v1.x/Readme.md#installation)

``` bash
yum install ImageMagick
sudo yum install cairo cairo-devel cairomm-devel libjpeg-turbo-devel pango pango-devel pangomm pangomm-devel giflib-devel
```

If your project has items more than 4096 You need to change the limit your system user can handle

Open file: `/etc/security/limits.conf`


Paste following towards end:
``` bash
*         hard    nofile      500000
*         soft    nofile      500000
root      hard    nofile      500000
root      soft    nofile      500000
```

500000 is fair number. I am not sure what is max limit but 999999 (Six-9) worked for me once as far as I remember.
Once you save file, you may need to logout and login again.

and then:

``` bash
cd process

# install dependencies
npm install

# run script including downloading latest data and processing sprites
node process.js dev download

# after downloading once, you can run without the download argument
node process.js dev

# if you want to re-process the sprites
node process.js dev sprites

# remove the dev argument to process for production (before building)
node process.js
```

You can override the Git URL or path if you want to supply your own data content.

``` bash
export ONETECH_PROCESS_GIT_URL="https://github.com/custom-ohol-data"
# or
export ONETECH_PROCESS_GIT_PATH="/path/to/custom-ohol-data"
```

### Other scripts
buildSite.sh Build stie
buildData.sh Build newest data
reBuildData.sh Automaticlly update data
buildSprite.sh build images
pullData.sh fetch latest data
copyData.sh copy result to webserver

