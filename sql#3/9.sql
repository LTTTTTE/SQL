select Movie.title , Movie.year , Movie.length
from StarsIn , Movie
where StarsIn.starName = (
                            select StarsIn.starName
                            from StarsIn
                            where gurantee in (select max(gurantee)
                                                from StarsIn)
                            )
and StarsIn.movieTitle = Movie.title and StarsIn.movieYear = Movie.year
and (Movie.year = 
(
select min(Movie.year)
from StarsIn , Movie
where StarsIn.starName = (
                            select StarsIn.starName
                            from StarsIn
                            where gurantee in (select max(gurantee)
                                                from StarsIn)
                            )
and StarsIn.movieTitle = Movie.title and StarsIn.movieYear = Movie.year
)
or Movie.length = (
select max(Movie.length)
from StarsIn , Movie
where StarsIn.starName = (
                            select StarsIn.starName
                            from StarsIn
                            where gurantee in (select max(gurantee)
                                                from StarsIn)
                            )
and StarsIn.movieTitle = Movie.title and StarsIn.movieYear = Movie.year
)
)
;
--특정row 튜플 뽑아내기 사용 가능여부..