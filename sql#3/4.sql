select MovieStar.name femaleStar , MovieExec.name maleExec
from MovieStar , MovieExec
where MovieStar.gender ='female' 
and MovieStar.spouseName = MovieExec.name 
and MovieExec.gender = 'male' 
and MovieExec.spouseName = MovieStar.name