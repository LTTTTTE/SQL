select name , address
from MovieExec
minus
select MovieExec.name , MovieExec.address
from MovieExec , MovieExec MovieExec2
where MovieExec.netWorth < MovieExec2.netWorth;