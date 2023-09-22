function attack1()
{
(Get-WinEvent *Sysmon* | where message -like "*T1057*" | select -first 1).message
}

function attack2()
{

}

function attack3()
{

}

function attack4()
{

}

