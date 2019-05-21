select Movie.title
from Movie , Movie Movie2
where (Movie.length > Movie2.length) and lower(Movie2.title) = 'gone with the wind'