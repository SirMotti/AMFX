# Ruta base del directorio 'recs'
$basePath = "D:\recs10_11_07_2025"

# Recorre cada una de las 10 carpetas principales dentro de 'recs'
Get-ChildItem -Path $basePath -Directory | ForEach-Object {
    $mainFolder = $_.FullName

    # Busca todos los archivos en las subcarpetas (recursivamente)
    Get-ChildItem -Path $mainFolder -Recurse -File | ForEach-Object {
        $file = $_
        $destination = Join-Path -Path $mainFolder -ChildPath $file.Name

        # Mover el archivo al folder principal
        Move-Item -Path $file.FullName -Destination $destination
    }

    # Elimina subcarpetas vacías
    Get-ChildItem -Path $mainFolder -Recurse -Directory | Where-Object {
        (Get-ChildItem -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue).Count -eq 0
    } | Remove-Item -Force -Recurse
}
