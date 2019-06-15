select StarsIn.starName , avg(StarsIn.gurantee)
from Studio , Movie , StarsIn
where lower(Studio.name) ='fox' and Movie.studioName = Studio.name and Movie.title = StarsIn.movieTitle and StarsIn.movieYear = Movie.year
group by StarsIn.starName

; -- 최소수확인