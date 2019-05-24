select MovieStar.name
from MovieStar
where MovieStar.gender = 'female' and MovieStar.name not in (select starName
                                                             from StarsIn
                                                             where lower(MovieTitle) = 'sting'
                                                             )
order by MovieStar.birthDate desc;