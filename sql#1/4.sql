select name , birthDate
from MovieStar , StarsIn
where MovieStar.name = starsIn.starName and (StarsIn.movieYear = 1980 or movietitle like ('% and %') or movietitle like ('% of %'))
order by birthDate desc;