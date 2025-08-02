# YOUBAI - Sistema de Gerenciamento de Pedidos

## 📋 Descrição

Sistema completo de gerenciamento de pedidos desenvolvido para a YOUBAI. O sistema oferece funcionalidades avançadas para controle e acompanhamento de pedidos, com interface moderna e responsiva.

## ✨ Funcionalidades

- 📊 **Dashboard com estatísticas** - Visão geral dos pedidos e métricas
- 🔍 **Busca e filtros avançados** - Localização rápida de pedidos
- 📱 **Design responsivo** - Funciona perfeitamente em desktop e mobile
- 📤 **Importação de dados** - Suporte para arquivos Excel
- 🖨️ **Impressão de relatórios** - Geração de relatórios em PDF
- ⚡ **Operações em lote** - Processamento eficiente de múltiplos pedidos
- 🎨 **Interface moderna** - Design clean com Tailwind CSS

## 🚀 Tecnologias Utilizadas

- **HTML5** - Estrutura semântica
- **CSS3** - Estilização moderna
- **JavaScript** - Funcionalidades interativas
- **Tailwind CSS** - Framework CSS utilitário
- **Font Awesome** - Ícones
- **SheetJS** - Processamento de arquivos Excel

## 📦 Estrutura do Projeto

```
Pedido/
├── index.html          # Arquivo principal da aplicação
├── netlify.toml        # Configuração do Netlify
├── _redirects          # Regras de redirecionamento
└── README.md           # Documentação do projeto
```

## 🌐 Deploy no Netlify

### Método 1: Deploy via Git (Recomendado)

1. **Criar repositório no GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: YOUBAI Order Management System"
   git branch -M main
   git remote add origin https://github.com/seu-usuario/youbai-orders.git
   git push -u origin main
   ```

2. **Conectar ao Netlify:**
   - Acesse [netlify.com](https://netlify.com)
   - Clique em "New site from Git"
   - Conecte sua conta GitHub
   - Selecione o repositório
   - Configure:
     - **Build command:** `echo 'No build required'`
     - **Publish directory:** `.`
   - Clique em "Deploy site"

### Método 2: Deploy Manual

1. **Preparar arquivos:**
   - Compacte todos os arquivos da pasta `Pedido/` em um arquivo ZIP
   - Certifique-se de incluir `index.html`, `netlify.toml` e `_redirects`

2. **Upload no Netlify:**
   - Acesse [netlify.com](https://netlify.com)
   - Arraste o arquivo ZIP para a área de deploy
   - Aguarde o processamento

### Método 3: Netlify CLI

```bash
# Instalar Netlify CLI
npm install -g netlify-cli

# Fazer login
netlify login

# Deploy da pasta atual
netlify deploy --prod --dir=.
```

## ⚙️ Configurações do Netlify

O arquivo `netlify.toml` inclui:

- **Redirecionamentos SPA** - Todas as rotas apontam para index.html
- **Headers de segurança** - Proteção contra XSS e clickjacking
- **Otimização de cache** - Melhora a performance
- **Compressão de assets** - Reduz o tamanho dos arquivos

## 🔧 Personalização

### Alterar cores do tema:
Edite as variáveis CSS no arquivo `index.html`:

```css
colors: {
  primary: '#165DFF',    // Cor principal
  success: '#00B42A',    // Cor de sucesso
  warning: '#FF7D00',    // Cor de aviso
  danger: '#F53F3F',     // Cor de erro
}
```

### Configurar domínio personalizado:
1. No painel do Netlify, vá em "Domain settings"
2. Clique em "Add custom domain"
3. Configure os DNS conforme instruções

## 📱 Recursos Mobile

- Interface totalmente responsiva
- Menu hambúrguer para navegação
- Otimizações de toque
- Performance otimizada para dispositivos móveis

## 🔒 Segurança

- Headers de segurança configurados
- Proteção contra XSS
- Validação de dados no frontend
- HTTPS forçado

## 📈 Performance

- Lazy loading de componentes
- Compressão de assets
- Cache otimizado
- Minificação automática

## 🐛 Solução de Problemas

### Site não carrega após deploy:
1. Verifique se o arquivo `index.html` está na raiz
2. Confirme se o `netlify.toml` está configurado corretamente
3. Verifique os logs de build no painel do Netlify

### Problemas de redirecionamento:
1. Confirme se o arquivo `_redirects` está presente
2. Verifique a sintaxe das regras de redirecionamento

## 📞 Suporte

Para suporte técnico ou dúvidas sobre o sistema, entre em contato com a equipe de desenvolvimento da YOUBAI.

---

**YOUBAI** - Sistema de Gerenciamento de Pedidos  
Versão 1.0 - 2024