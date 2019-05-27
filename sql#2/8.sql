select *
from (select Movie.title 
        from Movie
        where (Movie.title , Movie.year) in (select StarsIn.movieTitle , StarsIn.movieYear
                                             from StarsIn
                                             where StarsIn.starName in (select MovieStar.name
                                                                        from MovieStar
                                                                        where MovieStar.birthDate = (select min(MovieStar.birthDate)
                                                                                                     from MovieStar)
                                                                        )
                                            )
        order by Movie.length desc
        )
where rownum = 1
                    