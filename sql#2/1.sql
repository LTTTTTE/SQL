select studioName , avg(length) , min(year) , count(*)
from Movie
group by studioName
order by 4 desc

