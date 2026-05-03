window.CLOUD_CONFIG = {
  provider: localStorage.getItem('CLOUD_PROVIDER') || 'none'
};

window.disableCloudSync = function () {
  localStorage.setItem('CLOUD_PROVIDER', 'none');
  window.location.reload();
};

window.enableNeonSync = function (syncToken) {
  if (typeof syncToken === 'string' && syncToken.trim()) {
    localStorage.setItem('CLOUD_SYNC_TOKEN', syncToken.trim());
  }
  localStorage.setItem('CLOUD_PROVIDER', 'neon');
  window.location.reload();
};

window.clearCloudConfig = function () {
  localStorage.removeItem('CLOUD_SYNC_TOKEN');
  localStorage.removeItem('CLOUD_PROVIDER');
  window.location.reload();
};

// 数据库表配置
window.DB_CONFIG = {
  tableName: 'order_records',
  columns: {
    id: 'id',
    nf: 'nf',
    pedido: 'pedido',
    company: 'company',
    issue_date: 'issue_date',
    final_value: 'final_value',
    order_type_description: 'order_type_description',
    representative: 'representative',
    status: 'status',
    cx: 'cx',
    operator: 'operator',
    created_at: 'created_at',
    updated_at: 'updated_at'
  }
};

// 同步配置
window.SYNC_CONFIG = {
  autoSync: true,
  syncInterval: 30000, // 30秒自动同步
  retryAttempts: 3,
  retryDelay: 2000 // 2秒重试延迟
};

// 注意：在生产环境中，建议使用环境变量来存储敏感信息
// 在Netlify中，您可以在站点设置的Environment variables中设置这些值
