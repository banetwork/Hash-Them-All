# Hash-Them-All
Creates a right-click option to hash a selected file in Windows using the following algorithms:

- MD5
- SHA1
- SHA256
- SHA512

### Example output:

![image](https://user-images.githubusercontent.com/103339246/229255680-37a94b55-c7e6-4d75-bd1e-01e4f9bcbaa6.png)


# How To
1. Open your favourite text editor.
2. Copy across the following to your text editor.

~~~
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
Exit
~~~

3. Save your file as "HashFile.ps1", making a note of your directory path where you saved it.

![image](https://user-images.githubusercontent.com/103339246/229251998-790a9696-4766-4401-92de-9177b4adcdd8.png)

4. Select the windows key + r, type in "regedit.exe" and select "OK".

![windowsrun](https://user-images.githubusercontent.com/103339246/229251143-d1a891dd-0a99-4e4e-9ac0-7d0af78c338f.png)

5. Navigate to the following location in the Registry Editor: HKEY_CLASSES_ROOT\*\shell

![registrypath](https://user-images.githubusercontent.com/103339246/229251122-30bcc647-03f7-419f-b3f3-297b7cf5da4c.png)

6. Right-click on the "shell" key and select "New" > "Key". Name this key "HashFile".

![image](https://user-images.githubusercontent.com/103339246/229251112-ed251f4a-91b1-4e13-93dc-33d25cafdc42.png)
![image](https://user-images.githubusercontent.com/103339246/229251395-25267bbb-9767-4306-b8a9-f085b07fd692.png)

7. Double-click on the "(Default)" value in the "HashFile" key and enter the name of the command you want to display in the context menu (e.g., "Hash File").

![image](https://user-images.githubusercontent.com/103339246/229251462-1340123d-e6fa-436a-8047-5dfbda8178dc.png)

8. Right-click on the "HashFile" key and select "New" > "Key". Name this key "command".

![image](https://user-images.githubusercontent.com/103339246/229251508-6c10b6c9-ed39-4c2e-9913-c848e60f552c.png)

9. Double-click on the "(Default)" value in the "command" key and enter the following command:

~~~
powershell.exe -NoExit -ExecutionPolicy Bypass -File "C:\PathTo\File\HashFile.ps1" "%1"
~~~

![image](https://user-images.githubusercontent.com/103339246/229255104-78db25a7-f235-4a01-ba20-b88a85bb5a07.png)
![image](https://user-images.githubusercontent.com/103339246/229255113-1a81fbcc-87e2-4faa-a9a9-938f270b9912.png)

Make sure to replace "C:\PathTo\File" with the actual path to the directory where you saved the HashFile.ps1 script.

10. After completing these steps, you should see an option to "Hash File" (or whatever you named the command) in the context menu when you right-click on a file. Clicking on this option will run the PowerShell script, which will calculate and display the MD5, SHA1, SHA256 and SHA512 hash of the selected file.

![image](https://user-images.githubusercontent.com/103339246/229255196-9a7ded9f-5616-4039-9280-92b0f9406c5d.png)

# Troubleshooting

1. Make sure you double check the path to where you stored your "Hash File" script in the registry.
2. Make sure you saved your script file as ".ps1", not ".txt" or something else.
