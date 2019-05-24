select distinct MovieExec.name
from Movie , MovieStar , MovieExec , Studio
where Movie.producerNo = MovieExec.certNo and MovieExec.certNo = Studio.presNo and  MovieExec.name = MovieStar.name
