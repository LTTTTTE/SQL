select Movie.title , Movie.year
from Movie , StarsIn
where Movie.title = StarsIn.movieTitle and Movie.year = StarsIn.movieYear and (StarsIn.starName ,Movie.length) in
(select StarsIn.starName , max(Movie.length)
from StarsIn , Movie
where StarsIn.movieTitle = Movie.title and StarsIn.movieYear = Movie.year and StarsIn.starName in (select MovieStar.name
                                                                                                    from MovieStar
                                                                                                    where MovieStar.gender = 'female' and MovieStar.birthDate > (select MovieStar.birthDate
                                                                                                                                                                 from MovieStar
                                                                                                                                                                 where lower(MovieStar.name) = 'danny devito'
                                                                                                                                                                 )
                                                                                                   )
group by StarsIn.starName
)
order by 1;
