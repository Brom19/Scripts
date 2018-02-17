'*** Déclaration des variables
Dim ObjetRegedit

'*** Permet de continuer le script même s'il y a une erreur
'On Error Resume Next

'*** Definition du contenu de la variable
Set ObjetRegedit = CreateObject("WScript.Shell")

Set Registre = GetObject("winmgmts:\\.\root\default:StdRegProv")
Registre.EnumKey &H80000002,"SYSTEM\CurrentControlSet\Control\usbstor", SousCles

For Each Cles In SousCles
	'*** Definition du contenu de la variable "CleRegistre"
	CleRegistre = "HKLM\SYSTEM\CurrentControlSet\Control\usbstor\" & Cles & "\MaximumTransferLength"
	'CleRegistre = "HKLM\SYSTEM\CurrentControlSet\Control\usbstor\05AC12xx\MaximumTransferLength"
	'*** Ecriture de la clé de registre avec ces données et son type "REG_SZ".
	'ObjetRegedit.RegWrite CleRegistre, 1, "REG_DWORD"
	ObjetRegedit.RegWrite CleRegistre, 2097120, "REG_DWORD"

	'WScript.Echo CleRegistre
Next

'*** Destruction des objets
Set ObjetRegedit = Nothing

WScript.Quit
