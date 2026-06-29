# ACL_reader
ACL_reader


Как всё-таки заставить работать rpcclient (если очень нужен полный список)?Если вам принципиально нужен весь список локальных групп Windows со всеми системными записями, вам придется изменить одну настройку на самой Windows-машине:Откройте Локальную политику безопасности (secpol.msc) на Windows.Перейдите в: Локальные политики -> Параметры безопасности.Найдите пункт: «Сетевой доступ: разрешать анонимное перечисление SAM-учетных записей и общих папок» (Network access: Allow anonymous enumeration of SAM accounts and shares).Установите в значение Включено (Enabled).Также убедитесь, что в Брандмауэре Windows разрешено правило «Удаленное управление SAM» (Remote SAM / RPC).После этого rpcclient сможет подключиться и выдать полный список групп.

```Bash
# Разрешаем сетевой доступ к перечислению аккаунтов (SAM)
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "RestrictAnonymousSAM" -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "RestrictAnonymous" -Value 0
# Включаем правила брандмауэра для удаленного SAM (Remote SAM)
Enable-NetFirewallRule -DisplayGroup "Удаленное управление SAM" -ErrorAction SilentlyContinue
Enable-NetFirewallRule -DisplayGroup "Remote SAM Management" -ErrorAction SilentlyContinue
# Отключаем Remote UAC ограничения для локальных учеток
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LocalAccountTokenFilterPolicy" -Value 1 -PropertyType DWORD -Force
```
