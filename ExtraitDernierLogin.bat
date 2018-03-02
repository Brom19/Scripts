@echo Off
:: Script d'affichage des derniers ouverture / fermeture de session utilisateur
:: LittleMonkey - 11/09/2013
::
:: Utilisation : Copier le script sur le bureau
::               Cliquer droit sur le script -> Exécuter en tant qu'administrateur
::               Saisir le nombre d'ouverture / fermeture de session à afficher
::               Résultat : à l'écran
::
:: Identifiant des évènements :
::    4647 : fermeture de session, redémarrage, ou arrêt du PC
::    4648 : ouverture de session et toute utilisation explicit de compte (incluant les "Execute en tant que", et les tâches planifiée)
::    4800 : verrouillage de session
::    4801 : déverrouillage de session

::Récupération du nombre d'alertes
SET nbSessionEvt=5
::SET /p nbSessionEvt=Afficher combien d'actions ? 

::
::@echo --- Fermeture Session --- 
::wevtutil qe Security /q:"*[System[EventID=4647]]" /rd:True /f:Text | findstr /C:"Date:" /C:"Nom du compte" | more
@echo --- Ouverture Session --- 
wevtutil qe Security /q:"*[System[EventID=4648]]" /rd:True /f:Text | findstr /C:"Date:" /C:%USERNAME% | more
@echo --- Verrouillage --- 
wevtutil qe Security /q:"*[System[EventID=4800]]" /rd:True /f:Text | findstr /C:"Date:" /C:"Nom du compte" | more
@echo --- Déverrouillage --- 
wevtutil qe Security /q:"*[System[EventID=4801]]" /rd:True /f:Text | findstr /C:"Date:" /C:"Nom du compte" | more
@echo ---
pause 
