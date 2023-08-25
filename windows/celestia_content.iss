; Celestia Content installer build script

; Assumes that you have used cmake --install to put the destination files under the install directory
; Pass the version number on the command line via /DContentVersion=a.b.c.d

#define OrganizationName "Celestia Development Team"
#define OrganizationURL "https://celestiaproject.space/"

[Setup]
AppId=celestia-content
AppName=Celestia Content
UninstallDisplayName=Celestia Content
AppVersion={#ContentVersion}
AppPublisher=Celestia Development Team
AppPublisherURL={#OrganizationURL}
AppSupportURL={#OrganizationURL}
AppUpdatesURL={#OrganizationURL}
VersionInfoversion={#ContentVersion}
Compression=lzma2/Ultra
InternalCompressLevel=Ultra
SolidCompression=true
DefaultDirName={autoappdata}\{#OrganizationName}\Celestia Content
DefaultGroupName=Celestia
SourceDir=..\install
OutputDir=..
OutputBaseFilename=CelestiaContent-{#ContentVersion}
LicenseFile=..\COPYING
PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=dialog

[Components]
Name: "main"; Description: "Main data files"; Types: full compact custom; Flags: fixed
Name: "extras"; Description: "Default extras"; Types: full
Name: "locale"; Description: "Translations"; Types: full

[Files]
Source: "data\*"; DestDir: "{app}\data"; Components: main
Source: "extras-standard\*"; DestDir: "{app}\extras-standard"; Flags: recursesubdirs; Components: extras
Source: "locale\*"; DestDir: "{app}\locale"; Flags: recursesubdirs; Components: locale
Source: "models\*"; DestDir: "{app}\models"; Components: main
Source: "textures\*"; DestDir: "{app}\textures"; Flags: recursesubdirs; Components: main
Source: "warp\*"; DestDir: "{app}\warp"; Components: main

[Registry]
Root: HKA; Subkey: "Software\{#OrganizationName}"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\{#OrganizationName}\Celestia"; ValueName: "ContentDirectory"; ValueType: string; ValueData: "{app}"; Flags: uninsdeletevalue uninsdeletekeyifempty
