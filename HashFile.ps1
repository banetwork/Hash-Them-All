$filePath = $args[0]
$filename = Split-Path $filePath -Leaf
Write-Host "File Name: $filename `nFile Path: $filePath "
Write-Host "`nMD5 Hash:"
Get-FileHash -Path $filePath -Algorithm MD5 | Select-Object -ExpandProperty Hash
Write-Host "`nSHA1 Hash:"
Get-FileHash -Path $filePath -Algorithm SHA1 | Select-Object -ExpandProperty Hash
Write-Host "`nSHA256 Hash:"
Get-FileHash -Path $filePath -Algorithm SHA256 | Select-Object -ExpandProperty Hash
Write-Host "`nSHA512 Hash:"
Get-FileHash -Path $filePath -Algorithm SHA512 | Select-Object -ExpandProperty Hash
Read-Host "`nPress Enter to continue..."