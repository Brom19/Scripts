#Désactiver date dernier accès
fsutil behavior set disablelastaccess 1

#Désactiver indexation
function Disable-Indexing{
    Param($Drive)
    $obj = Get-WmiObject -Class Win32_Volume -Filter "DriveLetter='$Drive'"
    $indexing = $obj.IndexingEnabled
    if("$indexing" -eq $True){
        write-host "Disabling indexing of drive $Drive"
        $obj | Set-WmiInstance -Arguments @{IndexingEnabled=$False} | Out-Null
    }
}

disable-indexing "c:"
Set-Service WSearch -StartupType Disabled
Stop-Service WSearch

#Désactiver ou déplacer le fichier d'échange
#TODO

#Désactiver fichiers temporaires
#TODO

#Désactiver la protection systÃ¨me
Disable-ComputerRestore -drive "C:\", "D:\"

#Désactiver Prefetch
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name EnablePrefetcher -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name EnableSuperfetcher -Value 0

#Désactiver Superfetch
Set-Service SysMain -StartupType Disabled
Stop-Service SysMain

#Désactive mise en veille prolongée
powercfg -h off
