$ErrorActionPreference = "Stop"

# 1. Buscar el archivo .yyp en la raíz
$yypFile = Get-ChildItem -Path . -Filter "*.yyp" | Select-Object -First 1

if (-not $yypFile) {
    Write-Error "No se encontró ningún archivo .yyp en la raíz del repositorio."
    exit 1
}

Write-Host "Analizando proyecto: $($yypFile.Name)" -ForegroundColor Cyan

# 2. Leer contenido y limpiar trailing commas (comas antes de } o ]) para que ConvertFrom-Json no falle
$rawContent = Get-Content -Path $yypFile.FullName -Raw -Encoding UTF8
$cleanJson = $rawContent -replace ',\s*(?=[\}\]])', ''

try {
    $project = $cleanJson | ConvertFrom-Json
} catch {
    Write-Error "El archivo $($yypFile.Name) tiene sintaxis JSON corrupta (posible conflicto de merge sin resolver)."
    exit 1
}

# 3. Verificar que cada recurso declarado en el .yyp exista realmente en disco
$missingResources = @()
$totalResources = 0

foreach ($res in $project.resources) {
    $totalResources++
    $relPath = $res.id.path
    if (-not (Test-Path -Path $relPath)) {
        $missingResources += "$($res.id.name) -> $relPath"
    }
}

Write-Host "Recursos verificados: $totalResources"

if ($missingResources.Count -gt 0) {
    Write-Host "`nERROR: Se encontraron referencias rotas en el .yyp:" -ForegroundColor Red
    $missingResources | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    exit 1
}

# 4. Verificar que no haya marcadores de conflictos de Git en archivos .gml o .yy
$conflictMatches = Select-String -Path "*.gml", "*.yy", "*.yyp" -Pattern "^(<<<<<<<|=======|>>>>>>>)" -ErrorAction SilentlyContinue
if ($conflictMatches) {
    Write-Host "`nERROR: Se detectaron marcadores de conflicto de Git sin resolver:" -ForegroundColor Red
    $conflictMatches | ForEach-Object { Write-Host "  - $($_.Path):$($_.LineNumber)" -ForegroundColor Red }
    exit 1
}

Write-Host "`nVALIDACION EXITOSA: Integridad del .yyp y recursos confirmada." -ForegroundColor Green
exit 0
