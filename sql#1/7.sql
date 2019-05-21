select starName
from StarsIn , Movie
where StarsIn.movieTitle = Movie.title and StarsIn.movieYear = 1995 and lower(Movie.studioName) = 'mgm'