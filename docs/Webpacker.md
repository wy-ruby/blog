## Webpacker的使用
### 1. 为什么要使用Webpacker  
> Rails 6 默认启用了 webpacker 作为 Javascript 文件的管理方案。 assets pipeline 从技术角度非常先进，一直以来是作为前端打包最佳实践被推荐的。但是有以下缺点：
1. 由于前端生态及webpack的发展，webpack
已经成为大多前端库安装的标准，它不仅在功能上与 assets pipeline 媲美，同样具备前端打包的最佳实践，
更还有 HMR 模块热加载等酷炫功能。
2. asset pipeline在大型项目中引入的库过多会导致编译过慢影响了开发的效率。
3. assets pipeline 要求前端库针对它作少量的适配，这样就会增加了不少使用成本。  
> webpacker解决了以下痛点
1. webpacker 有 webpack-dev-server 工具，轻松解决开发环境编译慢的问题，经测试，之前几十秒的编译过程，现在连 1s 都不到。
2. webpacker 是目前前端界标准事实的打包工具，从此引用 JS 库不用找 gem 包了。
3. webpacker 让你写 JS 更规范，可以直接用 ES6。
### 2. rails中安装使用Webpacker
**rails的Gemfile中添加 webpacker**
```ruby
gem 'webpacker', '~> 5.x'
```
**然后使用bundle install安装，然后运行命令**
```ruby
rails webpacker:install
```
然后可以看到：  
![webpacker生成的文件](http://qf51buuem.hn-bkt.clouddn.com/images/Webpacker/1597549925326.png)
