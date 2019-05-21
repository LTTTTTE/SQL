select name , address
from movieStar
where gender = 'male' or lower(address) like '%malibu%';