select MovieExec.name , MovieExec.networth
from MovieExec , Studio
where MovieExec.certNo = Studio.presNo and MovieExec.name in (select starName
                                                              from StarsIn
                                                              group by starName
                                                              having count(*) >=3
                                                              )