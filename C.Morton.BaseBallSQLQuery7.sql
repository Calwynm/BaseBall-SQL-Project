create view People_Batting as
select distinct p.nameFirst +' '+ p.nameLast as "Full Name", 
p.weight, p.height, p.throws, p.bats, --p.finalGame, 
--p.debut,  
--p.birthMonth +'/'+p.birthDay+'/'+p.birthYear as DOB,
case when birthMonth > MONTH(getdate())
then DATEDIFF(year, birthYear, GETDATE())-1
else 
DATEDIFF(year, birthYear, GETDATE()) end Age,
--p.birthCity +', ' + p.birthstate+ ' '+ p.birthCountry  as 'Birth Place',  
b.teamID,b.yearID, b.hr, b.g, b.h, b.[2B], b.[3B], b.AB, b.BB, b.CS, b.GIDP, b.SB, b.RBI,b.SH, b.SO, stint
from People p 
join Batting b on p.playerID = b.playerID
where g>=50 and year(FinalGame) >= 2021 and deathYear is null


