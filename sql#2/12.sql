select count(*) , avg(Movie.length)
from Movie
where (Movie.title,Movie.year) in ( select StarsIn.movieTitle , StarsIn.movieYear
                                    from StarsIn
                                    where lower(StarsIn.starName) = 'harrison ford'
                                  )
