select Movie.title , Movie.year
from Movie
where Movie.producerNo = 
(select MovieExec.certNo
from MovieExec
where MovieExec.netWorth = (select max(MovieExec.netWorth)
                            from MovieExec 
                            where MovieExec.certNo in(select Movie.producerNo
                                                      from Movie
                                                      )
                            )
)

and Movie.studioName = 
(select Studio.name
from Studio
where Studio.presNo in (select MovieExec.certNo
                        from MovieExec
                        where MovieExec.netWorth = (select min(MovieExec.netWorth)
                                                    from MovieExec
                                                    )
                        )
)