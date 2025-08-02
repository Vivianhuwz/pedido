@echo off
echo ========================================
echo YOUBAI - Sistema de Gerenciamento de Pedidos
echo Netlify Deploy Script
echo ========================================
echo.

echo [1/4] Verificando arquivos necessarios...
if not exist "index.html" (
    echo ERRO: index.html nao encontrado!
    pause
    exit /b 1
)

if not exist "netlify.toml" (
    echo ERRO: netlify.toml nao encontrado!
    pause
    exit /b 1
)

echo ✓ Todos os arquivos necessarios encontrados
echo.

echo [2/4] Opcoes de deploy:
echo 1. Deploy manual (ZIP)
echo 2. Configurar Git e GitHub
echo 3. Instalar Netlify CLI
echo 4. Abrir Netlify no navegador
echo.

set /p choice="Escolha uma opcao (1-4): "

if "%choice%"=="1" goto manual_deploy
if "%choice%"=="2" goto git_setup
if "%choice%"=="3" goto cli_install
if "%choice%"=="4" goto open_netlify
goto invalid_choice

:manual_deploy
echo.
echo [3/4] Criando arquivo ZIP para deploy manual...
powershell -command "Compress-Archive -Path '*.html','*.toml','_redirects','README.md' -DestinationPath 'youbai-orders-deploy.zip' -Force"
echo ✓ Arquivo youbai-orders-deploy.zip criado
echo.
echo [4/4] Instrucoes para deploy manual:
echo 1. Acesse https://netlify.com
echo 2. Faca login ou crie uma conta
echo 3. Arraste o arquivo 'youbai-orders-deploy.zip' para a area de deploy
echo 4. Aguarde o processamento
echo.
echo ✓ Deploy package pronto!
goto end

:git_setup
echo.
echo [3/4] Configurando Git...
git init
git add .
git commit -m "Initial commit: YOUBAI Order Management System"
echo.
echo [4/4] Instrucoes para GitHub:
echo 1. Crie um repositorio no GitHub
echo 2. Execute: git remote add origin https://github.com/SEU-USUARIO/youbai-orders.git
echo 3. Execute: git push -u origin main
echo 4. Conecte o repositorio ao Netlify
echo.
echo ✓ Git configurado!
goto end

:cli_install
echo.
echo [3/4] Para instalar Netlify CLI:
echo 1. Instale Node.js: https://nodejs.org
echo 2. Execute: npm install -g netlify-cli
echo 3. Execute: netlify login
echo 4. Execute: netlify deploy --prod --dir=.
echo.
echo [4/4] ✓ Instrucoes fornecidas!
goto end

:open_netlify
echo.
echo [3/4] Abrindo Netlify no navegador...
start https://netlify.com
echo.
echo [4/4] ✓ Netlify aberto no navegador!
goto end

:invalid_choice
echo.
echo ERRO: Opcao invalida!
goto end

:end
echo.
echo ========================================
echo Deploy configurado com sucesso!
echo ========================================
pause