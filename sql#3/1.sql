select MovieExec.name
from Movie , MovieExec
where Movie.directorNo = MovieExec.certNo and lower(Movie.title) = 'star wars'