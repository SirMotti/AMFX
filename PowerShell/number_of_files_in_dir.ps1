# Ruta del directorio a revisar
$basePath = "D:\recs1_08_03_2025"

# Obtener las carpetas y contar los archivos dentro de cada una
Get-ChildItem -Path $basePath -Directory | ForEach-Object {
    $folderPath = $_.FullName
    $fileCount = (Get-ChildItem -Path $folderPath -File).Count
    [PSCustomObject]@{
        Folder = $_.Name
        Files = $fileCount
    }
} | Format-Table -AutoSize