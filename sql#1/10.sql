select MovieExec.name
from MovieExec , MovieExec MovieExec2
where (MovieExec.netWorth > MovieExec2.netWorth) and lower(MovieExec2.name) = 'merv griffin';