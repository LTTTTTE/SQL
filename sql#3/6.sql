select distinct MovieStar.name , MovieExec.name , MovieStar.birthDate
from MovieStar , MovieExec
where MovieStar.birthDate = MovieExec.birthDate
;