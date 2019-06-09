select distinct(Studio.name) 영화사이름, Studio.empNo 직원수, MovieExec.name 사장이름, MovieExec.address 사장주소
from Movie , Studio , MovieExec
where Movie.soundStudio = Studio.name and Studio.presNo = MovieExec.certNo
