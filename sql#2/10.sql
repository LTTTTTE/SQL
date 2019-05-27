select avg(distinct MovieExec.netWorth)
from MovieExec , Movie
where MovieExec.name in ( select distinct StarsIn.starName from StarsIn)
and Movie.producerNo = MovieExec.certNo
