// Supabase配置
// YOUBAI订单管理系统云同步配置
window.SUPABASE_CONFIG = {
  url: 'https://myjrokuwbgbrtheeblkz.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im15anJva3V3YmdicnRoZWVibGt6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY4MzE0NzgsImV4cCI6MjA3MjQwNzQ3OH0.BbJTCPe1KrftdR6bED0Magm0RUPGLfy3Dh9XAMeAd3c'
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