@echo off
echo Adding QWERTY layout...

powershell -Command ^
"$list = Get-WinUserLanguageList; ^
foreach ($lang in $list) { if ($lang.LanguageTag -eq 'en-US' -and -not $lang.InputMethodTips.Contains('0409:00000409')) { $lang.InputMethodTips.Add('0409:00000409') } }; ^
Set-WinUserLanguageList $list -Force"

echo Removing QWERTY layout...

powershell -Command ^
"$list = Get-WinUserLanguageList; ^
foreach ($lang in $list) { $lang.InputMethodTips.Remove('0409:00000409') }; ^
Set-WinUserLanguageList $list -Force"

echo Done.
