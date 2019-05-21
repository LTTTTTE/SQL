select MovieExec.name
from MovieExec , Studio
where lower(Studio.name) = 'fox' and Studio.presNo = MovieExec.certNo