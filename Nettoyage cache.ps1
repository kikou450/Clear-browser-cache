####### Variables
$version = (Get-WmiObject -class Win32_OperatingSystem).Caption
$users = (Get-ChildItem -path C:\Users | select Name).name

####### Version de Windows
Write-Host -ForegroundColor Yellow "Version de Windows : " -NoNewline
Write-Host -ForegroundColor green (Get-WmiObject -class Win32_OperatingSystem).Caption

If($version -match "Windows 7" -or $version -match "Windows 8" -or $version -or $version -match "Windows 10") {
####### Début du Programme
If($users) {

####### Nettoyage des fichiers Temporaires
Write-Host -ForegroundColor Yellow "Suppression des fichiers temporaires : " -NoNewline
Remove-Item –path "C:\Windows\Temp\" -Recurse –force -ErrorAction SilentlyContinue
 foreach($user in $users){
        Remove-Item –path "C:\Users\$user\AppData\Local\Temp" -Recurse –force -ErrorAction SilentlyContinue
    }
Write-Host -ForegroundColor Green "OK"

####### Corbeille
#$ret=Read-Host "Souhaitez-vous vider la Corbeille ? [Y/n]"
#Write-Host -ForegroundColor Yellow "Vidage de la Corbeille : " -NoNewline
#If($ret -match "y|Y"){
#Remove-Item –path "C:\`$recycle.bin\" -Recurse -Force 
#Write-Host -ForegroundColor Green "OK"
#} else {
#Write-Host -ForegroundColor red "Non"
#}

####### Téléchargements
#$ret=Read-Host "Souhaitez-vous supprimer les Téléchargements ? [Y/n]"
#Write-Host -ForegroundColor Yellow "Suppression des Téléchargements : " -NoNewline
#If($ret -match "y|Y"){
# foreach($user in $users){
#       Remove-Item –path C:\Users\$user\Downloads\* -Recurse -Force -EA SilentlyContinue
#}
#Write-Host -ForegroundColor Green "OK"
#} else {
#Write-Host -ForegroundColor red "Non"
#}

####### Internet Explorer
Write-Host -ForegroundColor Yellow "Suppression des fichiers temporaires de Internet Explorer : " -NoNewline
 foreach($user in $users){
         Remove-Item -path "C:\Users\$user\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -EA SilentlyContinue
	     Remove-Item -path "C:\Users\$user\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -EA SilentlyContinue
    }
Write-Host -ForegroundColor Green "OK"

####### Microsoft Edge
If($version -match "Windows 10") {
Write-Host -ForegroundColor Yellow "Suppression des fichiers temporaires de Microsoft Edge : " -NoNewline
 foreach($user in $users){
         Remove-Item –path C:\Users\$user\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\Cache -Recurse –force -ErrorAction SilentlyContinue
     }
Write-Host -ForegroundColor Green "OK"
     }

####### Mozilla Firefox
Write-Host -ForegroundColor Yellow "Suppression des fichiers temporaires de Mozilla Firefox : " -NoNewline
 foreach($user in $users){
            Remove-Item -path C:\Users\$user\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\* -Recurse -Force -EA SilentlyContinue
            Remove-Item -path C:\Users\$user\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*.* -Recurse -Force -EA SilentlyContinue
	        Remove-Item -path C:\Users\$user\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.* -Recurse -Force -EA SilentlyContinue
            Remove-Item -path C:\Users\$user\AppData\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\* -Recurse -Force -EA SilentlyContinue
            Remove-Item -path C:\Users\$user\AppData\Local\Mozilla\Firefox\Profiles\*.default\cookies.sqlite -Recurse -Force -EA SilentlyContinue
            Remove-Item -path C:\Users\$user\AppData\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite -Recurse -Force -EA SilentlyContinue
            Remove-Item -path C:\Users\$user\AppData\Local\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite -Recurse -Force -EA SilentlyContinue
    }
Write-Host -ForegroundColor Green "OK"

####### Google Chrome
Write-Host -ForegroundColor Yellow "Suppression des fichiers temporaires de Google Chrome : " -NoNewline
 foreach($user in $users){
            Remove-Item -path "C:\Users\$user\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -EA SilentlyContinue
            Remove-Item -path "C:\Users\$user\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*" -Recurse -Force -EA SilentlyContinue
            Remove-Item -path "C:\Users\$user\AppData\Local\Google\Chrome\User Data\Default\Cookies" -Recurse -Force -EA SilentlyContinue
            Remove-Item -path "C:\Users\$user\AppData\Local\Google\Chrome\User Data\Default\Media Cache" -Recurse -Force -EA SilentlyContinue
            Remove-Item -path "C:\Users\$user\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal" -Recurse -Force -EA SilentlyContinue
    }
Write-Host -ForegroundColor Green "OK"

####### Opera
Write-Host -ForegroundColor Yellow "Suppression des fichiers temporaires de Opera : " -NoNewline
 foreach($user in $users){
            Remove-Item –path "C:\Users\$user\AppData\Local\Opera Software\Opera Stable\Cache" -Recurse –force -ErrorAction SilentlyContinue
    }
Write-Host -ForegroundColor Green "OK"

####### Safari
Write-Host -ForegroundColor Yellow "Suppression des fichiers temporaires de Safari : " -NoNewline
 foreach($user in $users){
            Remove-Item –path "C:\Users\$user\AppData\Local\Apple Computer\Safari" -Recurse –force -ErrorAction SilentlyContinue
    }
Write-Host -ForegroundColor Green "OK"

####### Finalisation
Write-Host -ForegroundColor Green "Nettoyage Terminé"
} 

####### Erreur
 else {
Write-Host -ForegroundColor red "Erreur"
}
} else {
Write-Host -ForegroundColor red "Version de Windows non prise en charge"
}