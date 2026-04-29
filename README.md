# dbfound Spring Boot Demo

这是一个基于 Spring Boot 3 和 dbfound 的示例项目，项目中包含 dbfoundui 前端页面资源，可用于演示 dbfound 模型、JSP 页面和后台服务在 Spring Boot 项目中的集成方式。

## 技术栈

- Java 17
- Spring Boot 3.1.2
- dbfound-spring-boot-starter 4.3.6
- JSP + dbfoundui
- MySQL
- Maven

## 项目结构

```text
.
├── pom.xml                         # Maven 项目配置
├── sql/dbfound.sql                 # 示例数据库初始化脚本
└── src/main
    ├── java                        # Spring Boot 启动类、配置、控制器和服务
    ├── resources
    │   ├── config/application.yaml # dbfound 和 Spring Boot 配置
    │   └── model                   # dbfound 模型 XML
    └── webapp
        ├── DBFoundUI               # dbfoundui 前端资源
        ├── modules                 # 示例业务页面
        ├── login.jsp               # 登录页
        └── system.jsp              # 系统主页面
```

## 数据库准备

项目默认使用本机 MySQL，连接配置位于 `src/main/resources/config/application.yaml`：

```yaml
dbfound:
  datasource:
    db0:
      url: jdbc:mysql://127.0.0.1/dbfound?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8
      username: dbfound
      password: dbfound
```

初始化步骤：

1. 创建或确认 MySQL 用户 `dbfound`，密码为 `dbfound`。
2. 执行 `sql/dbfound.sql` 初始化示例库和测试数据。
3. 如需使用其他数据库地址、账号或密码，修改 `application.yaml` 中的 `dbfound.datasource.db0` 配置。

示例登录账号：

- 用户名：`ADMIN`
- 密码：`admin`

## 构建与部署

项目打包类型为 `war`，适合部署到外部 Servlet 容器中：

```bash
mvn clean package
```

构建完成后，WAR 文件位于：

```text
target/dbfound-springboot-demo.war
```

将该 WAR 部署到支持 Spring Boot 3 / Jakarta Servlet 的 Tomcat 10 或更高版本即可。

## 访问方式

部署完成后，根据实际上下文路径访问登录页。例如：

```text
http://localhost:8080/dbfound-springboot-demo/login.jsp
```

如果以根路径部署，则访问：

```text
http://localhost:8080/login.jsp
```

登录后可查看系统管理、基础数据、测试页面等示例模块。

## JSON 序列化说明

本项目包含 `dbfoundui` 前端页面资源，因此 `JacksonConfig` 中启用了 dbfound 提供的 `ResponseObjectSerializer`：

```java
module.addSerializer(ResponseObject.class, new JsonUtil.ResponseObjectSerializer());
```

`ResponseObjectSerializer` 主要用于适配 `dbfoundui`。启用后，`ResponseObject` 响应中的 `outParam`、`totalCounts` 会保持 dbfoundui 期望的驼峰命名，不会被 Jackson 的命名策略转换为 `out_param`、`total_counts`。

如果项目是纯前后端分离接口服务，并且不使用 `dbfoundui`，通常不需要配置 `ResponseObjectSerializer`，可以让响应字段遵循项目统一的 Jackson 命名策略。本 demo 因为要兼容 `dbfoundui`，所以保留该配置。

## 说明

- `src/main/resources/model` 下的 XML 文件是 dbfound 模型配置，定义了查询、保存、删除、校验等数据操作。
- `src/main/webapp/modules` 下的 JSP 页面是各功能模块的前端示例。
- `src/main/webapp/DBFoundUI` 为 dbfoundui 相关组件、模板和插件资源。
- `src/main/java` 中包含 Spring Boot 启动类、过滤器、控制器、服务和适配器示例。
