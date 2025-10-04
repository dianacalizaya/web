Param()

# Script para inicializar git y publicar en GitHub desde PowerShell.
# Uso: Ejecutar este script en la carpeta del proyecto.

Function Prompt-YesNo($msg){
  $r = Read-Host "$msg (s/n)"
  return $r -match '^[sS]'
}

Write-Host "== Publicar proyecto en GitHub ==" -ForegroundColor Cyan

$pwdPath = Get-Location
Write-Host "Carpeta actual: $pwdPath"

if (-not (Get-Command git -ErrorAction SilentlyContinue)){
  Write-Host "Git no está instalado o no está en PATH. Instala Git antes de continuar." -ForegroundColor Red
  exit 1
}

if (-not (git rev-parse --is-inside-work-tree 2>$null)){
  git init
  Write-Host "Repositorio git inicializado."
}

git add .
git commit -m "Initial commit: Portafolio Steve" 2>$null
if ($LASTEXITCODE -ne 0){
  Write-Host "Commit falló o no había cambios para commitear (es posible que ya exista un commit)." -ForegroundColor Yellow
} else {
  Write-Host "Commit realizado." -ForegroundColor Green
}

# Si gh (GitHub CLI) está disponible, se puede crear el repo automáticamente.
if (Get-Command gh -ErrorAction SilentlyContinue){
  $useGh = Prompt-YesNo "GitHub CLI detectado. ¿Deseas crear el repo remoto con gh y hacer push ahora?"
  if ($useGh){
    $owner = Read-Host "Introduce tu usuario de GitHub (o la organización). Ej: tu-usuario"
    if (-not $owner){ Write-Host "Usuario requerido."; exit 1 }
    $repoName = Read-Host "Nombre del repositorio (por defecto: web)"
    if (-not $repoName){ $repoName = 'web' }
    Write-Host "Creando repo $owner/$repoName con gh..."
    gh repo create "$owner/$repoName" --public --source=. --remote=origin --push
    if ($LASTEXITCODE -eq 0){ Write-Host "Repositorio creado y push completado." -ForegroundColor Green }
    else { Write-Host "gh falló al crear o pushear el repo. Revisa la salida de gh." -ForegroundColor Red }
    exit 0
  }
}

# Si no se usa gh, pedir URL remota
$useManual = Prompt-YesNo "¿Deseas añadir una URL remota manualmente y hacer push?"
if ($useManual){
  $remoteUrl = Read-Host "Introduce la URL remota (ej: https://github.com/tu-usuario/web.git)"
  if (-not $remoteUrl){ Write-Host "URL remota requerida."; exit 1 }
  git remote add origin $remoteUrl 2>$null
  git branch -M main
  git push -u origin main
  if ($LASTEXITCODE -eq 0){ Write-Host "Push completado." -ForegroundColor Green }
  else { Write-Host "Push falló. Revisa credenciales o la URL remota." -ForegroundColor Red }
} else {
  Write-Host "Operación cancelada. Puedes crear el repo manualmente en GitHub y luego ejecutar los comandos indicados en el README." -ForegroundColor Yellow
}
