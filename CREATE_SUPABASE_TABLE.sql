-- 在Supabase控制台的SQL编辑器中执行此脚本来创建order_records表

-- 创建order_records表
CREATE TABLE IF NOT EXISTS public.order_records (
    id BIGSERIAL PRIMARY KEY,
    nf VARCHAR(50),
    pedido VARCHAR(100),
    company VARCHAR(500) NOT NULL,
    issue_date DATE NOT NULL,
    final_value DECIMAL(15,2) NOT NULL DEFAULT 0,
    tab_preco VARCHAR(50) DEFAULT '',
    order_type_description VARCHAR(255),
    representative VARCHAR(255),
    status VARCHAR(50) NOT NULL DEFAULT 'Aguardando',
    cx VARCHAR(100),
    operator VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 创建索引以提高查询性能
CREATE INDEX IF NOT EXISTS idx_order_records_status ON public.order_records(status);
CREATE INDEX IF NOT EXISTS idx_order_records_issue_date ON public.order_records(issue_date);
CREATE INDEX IF NOT EXISTS idx_order_records_company ON public.order_records(company);
CREATE INDEX IF NOT EXISTS idx_order_records_pedido ON public.order_records(pedido);
CREATE INDEX IF NOT EXISTS idx_order_records_nf ON public.order_records(nf);
CREATE INDEX IF NOT EXISTS idx_order_records_created_at ON public.order_records(created_at);

-- 创建更新时间触发器函数
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- 创建触发器
DROP TRIGGER IF EXISTS update_order_records_updated_at ON public.order_records;
CREATE TRIGGER update_order_records_updated_at
    BEFORE UPDATE ON public.order_records
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- 启用行级安全策略（RLS）
ALTER TABLE public.order_records ENABLE ROW LEVEL SECURITY;

-- 创建允许所有操作的策略（在生产环境中应该根据实际需求调整）
-- 如果策略已存在则跳过
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'order_records' 
    AND policyname = 'Allow all operations on order_records'
  ) THEN
    CREATE POLICY "Allow all operations on order_records" ON public.order_records
        FOR ALL USING (true) WITH CHECK (true);
  END IF;
END $$;

-- 验证表创建
SELECT 
    table_name,
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns 
WHERE table_schema = 'public' 
AND table_name = 'order_records'
ORDER BY ordinal_position;

-- 插入测试数据（可选）
-- 只有在表为空时才插入测试数据
INSERT INTO public.order_records (
    nf, 
    pedido,
    company, 
    issue_date, 
    final_value,
    tab_preco, 
    order_type_description,
    representative,
    status, 
    cx,
    operator
)
SELECT * FROM (
    VALUES 
    (
        'NF001',
        '000000057413',
        '12345 - Empresa ABC Ltda',
        CURRENT_DATE,
        15000.00,
        '001-IMPORTADORA',
        'Venda Normal',
        'João Silva',
        'Aguardando',
        'CX001',
        'Maria Santos'
    ),
    (
        'NF002',
        '67890 - Tech Solutions',
        CURRENT_DATE - INTERVAL '1 day',
        25000.00,
        '002-ATACADO',
        'Venda Especial',
        'Ana Costa',
        'Em separação',
        'CX002',
        'Pedro Lima'
    )
) AS new_data(nf, pedido, company, issue_date, final_value, tab_preco, order_type_description, representative, status, cx, operator)
WHERE NOT EXISTS (SELECT 1 FROM public.order_records LIMIT 1);

-- 验证数据插入
SELECT COUNT(*) as total_records FROM public.order_records;
SELECT * FROM public.order_records ORDER BY created_at DESC LIMIT 5;