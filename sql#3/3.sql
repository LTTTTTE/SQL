select MovieExec.certNo ,count(*), avg(Movie.length)
from Movie , MovieExec
where Movie.directorNo = MovieExec.certNo
group by MovieExec.certNo