# 智能农业系统

## 项目简介

智能农业系统是一个基于HarmonyOS开发的物联网应用，旨在通过智能设备和数据分析，帮助农民实现精准农业管理，提高生产效率和农作物质量。

## 技术栈

### 前端
- **开发语言**: ArkTS (HarmonyOS 开发语言)
- **框架**: HarmonyOS SDK
- **UI组件**: ArkUI
- **状态管理**: ViewModel模式
- **网络通信**: WebSocket、HTTP
- **数据存储**: Preferences、本地存储

### 后端
- **开发语言**: Java
- **框架**: Spring Boot
- **数据库**: MySQL
- **MQTT**: 物联网设备通信
- **WebSocket**: 实时数据推送
- **AI集成**: 集成了聊天和图像分析功能

## 项目结构

### 前端结构 (`smartAgriculture-app`)

```
smartAgriculture-app/
├── AppScope/           # 应用全局配置
├── entry/              # 主应用入口
│   ├── src/main/ets/   # ArkTS 代码
│   │   ├── components/ # 自定义组件
│   │   ├── controller/ # 控制器
│   │   ├── data/       # 数据管理
│   │   ├── pages/      # 页面
│   │   ├── utils/      # 工具类
│   │   └── viewmodel/  # 视图模型
│   └── resources/      # 资源文件
└── hvigor/             # 构建工具配置
```

### 后端结构 (`smartAgriculture-server`)

```
smartAgriculture-server/
├── sky-common/         # 公共模块
├── sky-pojo/           # 数据模型
└── sky-server/         # 主服务
    └── src/main/java/com/zhyu/
        ├── agent/      # AI 代理
        ├── config/     # 配置
        ├── controller/ # 控制器
        ├── dto/        # 数据传输对象
        ├── mapper/     # 数据访问
        └── service/    # 业务逻辑
```

## 核心功能模块

### 1. 地块管理
- 地块列表展示
- 地块详情查看
- 环境数据监测（温度、湿度、土壤湿度、CO₂浓度、光照强度）
- 历史数据趋势分析

### 2. 设备管理
- 设备列表展示
- 设备详情查看
- 设备控制（灌溉、灯光、风扇、水泵等）
- 设备状态监控

### 3. 灌溉系统
- 灌溉控制
- 药水模式切换
- 自动控制设置
- 灌溉进度显示

### 4. 灯光系统
- RGB颜色调节
- 亮度控制
- 自动控制设置

### 5. 环境监测
- 实时数据展示
- 历史数据图表
- 异常告警

### 6. 离线模式
- 无网络环境下的设备控制
- 基本功能保障

### 7. AI 功能
- AI 聊天助手
- 图像分析
- 智能建议

## 快速开始

### 环境要求
- **前端**: HarmonyOS SDK 4.0+
- **后端**: JDK 11+, Maven 3.6+, MySQL 5.7+
- **开发工具**: DevEco Studio

### 安装步骤

#### 1. 后端安装
1. 克隆项目
   ```bash
   git clone <项目地址>
   cd smartAgriculture/smartAgriculture-server
   ```

2. 数据库配置
   - 创建数据库 `smart_agriculture`
   - 执行 `script.sql` 初始化数据库结构

3. 配置文件修改
   - 修改 `application.yml` 中的数据库连接信息

4. 启动服务
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

#### 2. 前端安装
1. 打开 DevEco Studio
2. 导入 `smartAgriculture-app` 项目
3. 配置 HarmonyOS SDK 路径
4. 构建并运行应用

### 配置说明

#### 前端配置
- **网络配置**: 修改 `data/HttpFuntion.ets` 中的 API 地址
- **WebSocket配置**: 修改 `data/WebSocketManager.ets` 中的 WebSocket 地址

#### 后端配置
- **数据库配置**: `application.yml` 中的 `spring.datasource`
- **MQTT配置**: `application.yml` 中的 `mqtt` 配置
- **AI配置**: `application.yml` 中的 AI 相关配置

## 主要页面

| 页面名称 | 路径 | 功能描述 |
|---------|------|----------|
| 登录页面 | pages/LoginPage.ets | 用户登录 |
| 首页 | pages/Index.ets | 系统主页，包含地块概览 |
| 地块列表 | pages/FieldListPage.ets | 展示所有地块 |
| 地块详情 | pages/FieldDetailPage.ets | 地块详细信息和环境数据 |
| 设备管理 | pages/GatewayPage.ets | 设备列表和控制 |
| 离线模式 | pages/OfflinePage.ets | 无网络环境下的设备控制 |
| AI 聊天 | pages/AIChatPage.ets | AI 助手聊天界面 |
| 天气页面 | pages/WeatherPage.ets | 天气信息展示 |

## 设备类型

| 类型 | 名称 | 功能 |
|-----|------|------|
| 1 | 土壤传感器 | 监测土壤温度和湿度 |
| 2 | 环境传感器 | 监测空气温度和湿度 |
| 11 | 灌溉控制器 | 控制灌溉系统 |
| 13 | 灯带控制器 | 控制灯光颜色和亮度 |
| 15 | 风扇控制器 | 控制风扇 |
| 16 | 水泵控制器 | 控制水泵 |
| 17 | 摄像头 | 监控地块情况 |

## 数据结构

### 地块数据
```typescript
interface FieldData {
  id: number;
  name: string;
  area: number;
  status: number;
  image: string;
  cropType: string;
  irrigationVolume: number;
  temp: number;
  humidity: number;
  landTemp: number;
  landHumidity: number;
  concentration_co2: number;
  lightIntensity: number;
  density: string;
}
```

### 设备数据
```typescript
interface DeviceInfo {
  id: string;
  name: string;
  type: number;
  status: string;
  content: string;
  sn: string;
}
```

## 常见问题

1. **无法连接后端服务**
   - 检查网络连接
   - 确认后端服务是否启动
   - 检查 API 地址配置

2. **设备控制无响应**
   - 检查设备是否在线
   - 确认 MQTT 服务是否正常
   - 检查设备 SN 是否正确

3. **数据显示异常**
   - 检查传感器是否正常工作
   - 确认数据传输是否畅通
   - 查看后端日志是否有错误

## 开发指南

### 代码规范
- 遵循 HarmonyOS 开发规范
- 使用 TypeScript 类型定义
- 采用 ViewModel 模式管理状态
- 组件化开发

### 调试技巧
- 使用 DevEco Studio 的调试工具
- 查看前端日志：`console.log()`
- 查看后端日志：Spring Boot 日志
- 网络请求：使用 DevEco Studio 的网络调试工具

## 未来规划

- [ ] 移动端适配
- [ ] 多语言支持
- [ ] 更丰富的数据分析图表
- [ ] 更多智能设备接入
- [ ] 增强 AI 功能
- [ ] 云服务集成

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

本项目采用 MIT 许可证。

## 联系方式

- 项目维护者: [Your Name]
- 邮箱: [your.email@example.com]
- 项目地址: <项目仓库地址>