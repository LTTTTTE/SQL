select count(cnt) , SLM.lng 
from (select count(*) cnt , avg(Movie.length) lng
        from Movie , Movie Movie2
        where Movie.length = Movie2.length and
        (Movie.year != Movie2.year or Movie.title != Movie2.title)
        group by (Movie.title,Movie.year)
        )SLM
group by SLM.lng
order by 2 desc
