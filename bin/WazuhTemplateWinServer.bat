REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /t REG_SZ /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "CachedLogonsCount" /t REG_SZ /d 3 /f								
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "DisablePasswordChange" /t REG_DWORD /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ForceUnlockLogon" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ScRemoveOption" /t REG_SZ /d 2 /f																						
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutorun" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 255 /f												
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 2 /f												
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableAutomaticRestartSignOn" /t REG_DWORD /d 1 /f																								
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableCAD" /t REG_DWORD /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ShutdownWithoutLogon" /t REG_DWORD /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" /v "fMinimizeConnections" /t REG_DWORD /d 2 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "CrashOnAuditFail" /t REG_DWORD /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "DisableDomainCreds" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "EveryoneIncludesAnonymous" /t REG_DWORD /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "ForceGuest" /t REG_DWORD /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" /t REG_DWORD /d 5 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "NoLMHash" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymousSAM" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0" /v "NTLMMinClientSec" /t REG_DWORD /d 537395200 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0" /v "NTLMMinServerSec" /t REG_DWORD /d 537395200 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v "AddPrinterDrivers" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths" /v "Machine" /t REG_MULTI_SZ /d "System\CurrentControlSet\Control\ProductOptions System\CurrentControlSet\Control\Server Applications Software\Microsoft\Windows NT\CurrentVersion" /f										
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths" /v "Machine" /t REG_MULTI_SZ /d "System\CurrentControlSet\Control\Print\Printers System\CurrentControlSet\Services\Eventlog Software\Microsoft\OLAP Server Software\Microsoft\Windows NT\CurrentVersion\Print Software\Microsoft\Windows NT\CurrentVersion\Windows System\CurrentControlSet\Control\ContentIndex System\CurrentControlSet\Control\Terminal Server System\CurrentControlSet\Control\Terminal Server\UserConfig System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration Software\Microsoft\Windows NT\CurrentVersion\Perflib System\CurrentControlSet\Services\SysmonLog" /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel" /v "ObCaseInsensitive" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters" /v "EnableForcedLogOff" /t REG_DWORD /d 1 /f																							
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters" /v "EnableSecuritySignature" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters" /v "NullSessionPipes" /t REG_MULTI_SZ /d "LSARPC NETLOGON SAMR" /f										
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters" /v "RestrictNullSessAccess" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AutoDisconnect" /t REG_DWORD /d 15 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "EnablePlainTextPassword" /t REG_DWORD /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "EnableSecuritySignature" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "RequireSecuritySignature" /t REG_DWORD /d 1 /f																						
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LDAP" /v "LDAPClientIntegrity" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "DisablePasswordChange" /t REG_DWORD /d 0 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "DontDisplayLastUserName" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "MaximumPasswordAge" /t REG_DWORD /d 30 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "RequireSignOrSeal" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "RequireStrongKey" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "SealSecureChannel" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters" /v "SignSecureChannel" /t REG_DWORD /d 1 /f												
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters" /v "LDAPServerIntegrity" /t REG_DWORD /d 2 /f												
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect " /t REG_DWORD /d 0 /f			