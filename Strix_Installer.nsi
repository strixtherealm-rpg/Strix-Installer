; example1.nsi
;
; This script is perhaps one of the simplest NSIs you can make. All of the
; optional settings are left to their default settings. The installer simply
; prompts the user asking them where to install, and drops a copy of example1.nsi
; there.

;--------------------------------

; The name of the installer
Name "Strix Installer"

; The file to write
OutFile "strix_installer.exe"

; The default installation directory
InstallDir $APPDATA\.minecraft

; Request application privileges for Windows Vista
RequestExecutionLevel admin

;--------------------------------

; Pages

Page directory
Page instfiles

;--------------------------------

; The stuff to install
Section "" ;No components page, name is not important

  ; Removes directory mods from install dir
  RMDir /r $INSTDIR\mods
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR

  ; Put file in SetOutPath location
  File /r "c:\Project\File\Location\*" ;adds all the files and subfolders from file path to installer

  ; Execute file post installation
  Exec "$INSTDIR\forge.exe" 

SectionEnd ;end the section

;--------------------------------

;Function to append text at the end of a specified file
Function addLauncherSettings
  FileOpen $9 `<file\path\to\nameofminecraftlauncher.json>` a ;opens specified file
  FileSeek $9 0 END ;Seek to the end of the file
  FileWrite $9 "$\r$\n" ;carriage return + new line - writes a new line
  FileWrite $9 "this is a test" ;string to write to the file
  FileWrite $9 "$\r$\n" ;carriage return + new line - writes a new line
  FileWrite $9 "this is another test" ;string to write to the file
  FileClose $9 ;saves the edited file.
FunctionEnd
