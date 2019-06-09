select distinct Movie.title 영화감독의배우자가배우로출연한영화, Movie.year , MovieExec.name 영화감독, MovieExec.spouseName 감독배우자
from Movie , StarsIn , MovieExec
where Movie.title  = StarsIn.movieTitle and Movie.year = StarsIn.movieYear
and StarsIn.starName in(
                        select distinct(MovieExec.spouseName)
                        from Movie , MovieExec
                        where Movie.directorNo = MovieExec.certNo
                        )
and Movie.directorNo = MovieExec.certNo
;