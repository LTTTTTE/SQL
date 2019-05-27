select FMAS.addr , avg(length) , max(year)
from Movie , (select SAS.addr addr, StarsIn.movieTitle mTitle, StarsIn.movieYear mYear
                from StarsIn ,(select MovieStar.name , MovieStar2.name name2, MovieStar.address addr
                                from MovieStar , MovieStar MovieStar2
                                where MovieStar.address = MovieStar2.address and MovieStar.name < MovieStar2.name
                                )SAS
                where StarsIn.starName = SAS.name or StarsIn.starName = SAS.name2
                )FMAS
where Movie.title = FMAS.mTitle and Movie.year = FMAS.mYear
group by FMAS.addr
