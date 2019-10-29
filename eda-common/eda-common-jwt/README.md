# jww-common-web
公共jwt实现模块

 **使用步骤** 
1. 引入模块，pom.xml增加：

```
        <dependency>
            <groupId>com.jww</groupId>
            <artifactId>jww-common-jwt</artifactId>
            <version>1.0.0</version>
        </dependency>
```
2. 增加jwt配置，如在配置文件（jww-ump\jww-ump-server\src\main\resources\application-dev.yml）增加如下配置：

```
jwt:
  isOpen: 1             # 是否开户jwt校验，1：开启；0：关闭
  header: Authorization   #http请求头所需要的字段
  secret: Secret        #jwt秘钥
  expiration: 300       #5分钟 单位:秒
  auth-path: wx/login     #认证请求的路径
  md5-key: randomKey      #md5加密混淆key
  excludePaths: (/swagger.*)|(/api-docs.*)|(/callback.*)|(/configuration/.*)|(/*/configuration/.*)|(/webjars/.*)|(/v2/.*)  #不校验路径

```

3. 在springboot启动类（如ServerApplication.java）中，增加扫描包

```
@ComponentScan(basePackages = {"com.jww.ump.server", "com.jww.common.web", "com.jww.common.dsession", "com.jww.common.log.web", "com.jww.common.redis","com.jww.common.jwt"})
```

4. 实现登录认证功能，示例：

```
    @Autowired
    private JwtTokenHelper jwtTokenHelper;

    @PostMapping("/wx/login")
    public ResultModel<User> login(@RequestBody @ApiParam(name = "用户对象", value = "传入json格式，必须：{appId:小程序APPID,code:登录code}，选填：{nickName:昵称,headImage:头像}", required = true) User user) {
        User u = userService.wxLogin(user);
        if (ObjectUtil.isNotNull(u)) {
            final String randomKey = jwtTokenHelper.getRandomKey();
            final String token = jwtTokenHelper.generateToken(String.valueOf(u.getId()), randomKey);
            u.setToken(token);
            u.setRandomKey(randomKey);
        }
        return ResultUtil.ok(u);
    }
```

