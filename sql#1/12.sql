select Movie.title , Movie.length , MovieExec.name
from Movie , MovieExec , StarsIn , MovieStar
where (Movie.title = StarsIn.movieTitle and Movie.year = StarsIn.movieYear) and StarsIn.starName = MovieStar.name and MovieStar.birthDate < '1970-01-01' and lower(MovieStar.address) like '%california%' and MovieStar.gender = 'female' and Movie.producerNo = MovieExec.certNo
order by length desc , title;