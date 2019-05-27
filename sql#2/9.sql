select Movie.studioName , count(Distinct Movie.producerNo)
from Movie , Studio , MovieExec
where Movie.studioName = Studio.name and
      Movie.producerNO = MovieExec.certNo
group by Movie.studioName
having avg(MovieExec.netWorth) >= 1000000