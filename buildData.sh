#!/bin/sh

cp 1.txt ./process/OneLifeData7/1.txt
cp translate.js ./process/OneLifeData7/translate.js
cd ./process/OneLifeData7
node translate.js 1.txt
cd ../..
node process sprites
/usr/bin/cp -rf ./public/static-edge/* /www/wwwroot/guide_onehouronelife_cn/static
/usr/bin/cp -f ./public/sitemap.xml /www/wwwroot/guide_onehouronelife_cn/sitemap.xml