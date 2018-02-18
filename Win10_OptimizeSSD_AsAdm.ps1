#D�sactiver date dernier acc�s
fsutil behavior set disablelastaccess 1

#D�sactiver indexation
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

#D�sactiver ou d�placer le fichier d'�change
#TODO

#D�sactiver fichiers temporaires
#TODO

#D�sactiver la protection système
Disable-ComputerRestore -drive "C:\", "D:\"

#D�sactiver Prefetch
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name EnablePrefetcher -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name EnableSuperfetcher -Value 0

#D�sactiver Superfetch
Set-Service SysMain -StartupType Disabled
Stop-Service SysMain

#D�sactive mise en veille prolong�e
powercfg -h off
