# Supabase 配置指南 - Pedido 系统

## 1. 创建 Supabase 项目

1. 访问 [Supabase](https://supabase.com) 并创建账户
2. 创建新项目
3. 记录项目的 URL 和 anon key

## 2. 配置数据库

### 2.1 创建数据表

在 Supabase 的 SQL Editor 中执行 `CREATE_SUPABASE_TABLE.sql` 文件中的 SQL 脚本。

### 2.2 配置行级安全 (RLS)

表已经启用了行级安全策略，允许匿名用户进行基本的 CRUD 操作。

## 3. 更新配置文件

编辑 `config.js` 文件，更新以下配置：

```javascript
window.SUPABASE_CONFIG = {
  url: 'YOUR_SUPABASE_URL',        // 替换为你的 Supabase URL
  anonKey: 'YOUR_SUPABASE_ANON_KEY' // 替换为你的 Supabase anon key
};
```

## 4. 数据表结构说明

### order_records 表字段：

- `id`: 主键，自动递增
- `nf`: NF 号码
- `pedido`: 订单号
- `company`: 公司名称
- `issue_date`: 发行日期
- `final_value`: 最终价值
- `order_type_description`: 订单类型描述
- `representative`: 代表
- `status`: 状态
- `cx`: CX 字段
- `operator`: 操作员
- `created_at`: 创建时间（自动）
- `updated_at`: 更新时间（自动）

## 5. 功能特性

### 5.1 自动同步
- 每30秒自动同步一次
- 数据变更时自动同步到云端
- 支持离线模式，重新连接时自动同步

### 5.2 数据合并
- 智能合并本地和云端数据
- 避免数据重复
- 保持数据一致性

### 5.3 错误处理
- 网络错误自动重试
- 同步状态实时显示
- 详细的错误日志

## 6. 测试配置

1. 打开浏览器开发者工具
2. 查看控制台是否有 Supabase 连接成功的消息
3. 添加一个测试订单，检查是否同步到 Supabase
4. 刷新页面，检查数据是否从云端正确加载

## 7. 故障排除

### 常见问题：

1. **连接失败**
   - 检查 URL 和 anon key 是否正确
   - 确认网络连接正常

2. **数据不同步**
   - 检查表名是否正确
   - 确认 RLS 策略已正确配置

3. **权限错误**
   - 检查 Supabase 项目的 RLS 设置
   - 确认 anon key 有足够权限

4. **策略已存在错误**
   - 如果看到 "policy already exists" 错误，这是正常的
   - SQL 脚本已经包含了防重复创建的逻辑
   - 可以安全地忽略此错误，或者删除现有策略后重新运行

5. **表已存在**
   - 如果表已经存在，脚本会跳过创建步骤
   - 使用 `CREATE TABLE IF NOT EXISTS` 确保安全执行

6. **重复数据插入错误**
   - 如果看到 "duplicate key value violates unique constraint" 错误
   - 这表明测试数据已经存在，脚本现在会自动跳过重复插入
   - 可以安全地重新运行脚本，不会插入重复的测试数据

## 8. 安全建议

1. 定期更新 Supabase 密钥
2. 根据需要调整 RLS 策略
3. 监控数据库使用情况
4. 定期备份重要数据

---

配置完成后，系统将自动在本地存储和云端存储之间同步数据，确保数据的安全性和可访问性。