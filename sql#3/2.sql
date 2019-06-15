select Movie.title , Movie.year
from Movie
where studioName in (select Studio.name--거지 영화사이름
                    from MovieExec , Studio
                    where certNo = presNo and networth in ( select min(netWorth)
                                                            from MovieExec , Studio
                                                            where certNo = presNo))
and producerNo in (select MovieExec.certNo --거지 제작자
                    from MovieExec
                    where netWorth in(select min(netWorth)
                                     from MovieExec, Movie
                                     where Movie.producerNo = MovieExec.certNO))
and directorNo in (select distinct(certNo) --부자 감독번호
         
                    from MovieExec , Movie
                    where netWorth in (select max(netWorth)
                                        from MovieExec) and directorNo = certNo)
;