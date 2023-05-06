
insert into ticket values (1,20)
select*from ticket
select*from match
select*from fan

go;
CREATE PROCEDURE createAllTables
AS

Create table SystemUser
(
username varchar(20) PRIMARY KEY , 
password varchar(20)
);

 Create table Stadium
 (
 ID int PRIMARY KEY IDENTITY,
 name varchar (20),
 location varchar (20),
 capacity int,
 status bit DEFAULT 1
 );

 CREATE TABLE StadiumManager
( ID INT PRIMARY KEY IDENTITY,
Name VARCHAR(20),
stadium_ID int ,
username varchar(20) ,
foreign key(stadium_ID) references Stadium(ID),
foreign key(username) references SystemUser(username)
);


  Create table Club(
 club_ID int PRIMARY KEY IDENTITY,
 name varchar(20),
 location varchar(20)

 );
 Create table Fan 
 (
 national_id int primary key,
 name varchar(20),
 birth_date date,
 address varchar(20),
 phone_no integer,
 status BIT DEFAULT 1,
 username varchar(20),
 foreign key(username) references SystemUser(username) on delete cascade on update cascade
 );

 Create table Match
(
match_ID INT PRIMARY KEY IDENTITY ,
start_time  datetime,
end_time  datetime,
host_club_ID INT FOREIGN KEY(host_club_ID) references Club(club_ID) ON delete cascade on update cascade,
guest_club_ID INT FOREIGN KEY(guest_club_ID) references Club(club_ID)ON delete cascade on update cascade,
stadium_ID INT FOREIGN KEY(stadium_ID) references Stadium(ID) ON delete cascade on update cascade
);
 Create table Ticket
 (
 id integer primary key IDENTITY,
 status bit DEFAULT 1,
 match_ID int,
 foreign key(match_ID) references Match(match_ID) on delete cascade on update cascade
 );

 create table TicketBuyingTransactions
 (
 fan_national_ID int ,
 ticket_ID int,
 foreign key(fan_national_ID) references Fan(national_id)  on delete cascade on update cascade,
 foreign key(ticket_ID) references Ticket(ID)  on delete cascade on update cascade,
 primary key(fan_national_ID, ticket_ID)
 );

CREATE TABLE ClubRepresentative
( ID INT PRIMARY KEY IDENTITY,
Name VARCHAR(20),
club_ID INT foreign key(club_ID) references Club(club_ID) on delete cascade on update cascade,
username VARCHAR(20) foreign key(username) references SystemUser(username) on delete cascade on update cascade
);

CREATE TABLE SportsAssociationManager
( ID INT PRIMARY KEY IDENTITY,
Name VARCHAR(20),
username VARCHAR(20) foreign key(username) references SystemUser(username) on delete cascade on update cascade);

CREATE TABLE SystemAdmin
( ID INT PRIMARY KEY IDENTITY,
Name VARCHAR(20),
username VARCHAR(20) foreign key(username) references SystemUser(username) on delete cascade on update cascade);

 Create table HostRequest 
 (
 ID int PRIMARY KEY IDENTITY,
 representative_ID int FOREIGN KEY(representative_ID) references ClubRepresentative(ID) ON update CASCADE,
 manager_ID int FOREIGN KEY(manager_ID) references StadiumManager (ID) ON update CASCADE,
 match_ID int FOREIGN KEY(match_ID) references Match(match_ID),
 status varchar(20) DEFAULT 'unhandled'
 );
 

 

 GO;
 

CREATE PROCEDURE dropAllTables
AS
DROP TABLE SportsAssociationManager

DROP TABLE SystemAdmin

DROP TABLE TicketBuyingTransactions

DROP TABLE Ticket

DROP TABLE Fan

DROP TABLE HostRequest

DROP TABLE Match

DROP TABLE ClubRepresentative

DROP TABLE Club

DROP TABLE StadiumManager

DROP TABLE Stadium

DROP TABLE SystemUser


GO;


CREATE PROCEDURE clearAllTables   
AS
DELETE FROM SportsAssociationManager

DELETE FROM SystemAdmin

DELETE FROM TicketBuyingTransactions

DELETE FROM Ticket

DELETE FROM Fan

 DELETE FROM HostRequest

DELETE FROM Match

DELETE FROM ClubRepresentative

DELETE FROM Club

DELETE FROM StadiumManager

DELETE FROM Stadium

DELETE FROM SystemUser
GO;



CREATE PROCEDURE dropAllProceduresFunctionsViews
AS
DROP procedure createAllTables

DROP procedure dropAllTables

DROP procedure clearAllTables

DROP view allAssocManagers

DROP view  allClubRepresentatives

DROP view      allStadiumManagers

DROP view  allFans

DROP view  allMatches


DROP view   allTickets

DROP view   allCLubs

DROP view   allStaduims

DROP view   allRequests

DROP procedure   addAssociationManager

DROP procedure    addNewMatch

DROP view   clubsWithNoMatches

 DROP procedure  deleteMatch
 DROP procedure  deleteMatchesOnStadium
  DROP procedure  addClub
   DROP procedure  addTickect
DROP procedure  deleteClub

DROP procedure addStadium
DROP procedure deleteStadium
DROP procedure     blockFan
DROP procedure     unblockFan
DROP procedure    addRepresentative
DROP FUNCTION     viewAvailableStadiumsOn
DROP procedure addHostRequest
DROP FUNCTION allUnassignedMatches
DROP procedure addStadiumManager
DROP FUNCTION allPendingRequests
DROP procedure acceptRequest
DROP procedure rejectRequest
DROP procedure addFan
DROP FUNCTION upcomingMatchesOfClub
DROP FUNCTION availableMatchesToAttend
 DROP procedure purchaseTicket
DROP procedure updateMatchHost
DROP view matchesPerTeam
DROP view clubsNeverMatched
DROP FUNCTION clubsNeverPlayed
DROP FUNCTION matchWithHighestAttendance
DROP FUNCTION matchesRankedByAttendance
DROP FUNCTION requestsFromClub

GO;

--DINA

--a
CREATE VIEW allAssocManagers AS
select sam.username , su.password,  sam.name 
From SportsAssociationManager sam, SystemUser su
WHERE sam.username = su.username
GO;

--b
CREATE VIEW allClubRepresentatives AS
select R.username , su.password, R.name representative_name , C.name club_name
From ClubRepresentative R , SystemUser su, Club c
WHERE R.club_ID = C.club_ID AND r.username = su.username;
GO;




--ana

--c
CREATE VIEW allStadiumManagers AS
SELECT sm.username,su.password, sm.Name, s.name AS stadium_name
FROM StadiumManager sm , Stadium s, SystemUser su
WHERE sm.stadium_ID = s.ID AND sm.username = su.username;

GO;

--d
CREATE VIEW allFans AS
SELECT f.username , su.password, name, national_id, birth_date, status
FROM Fan f ,SystemUser su
WHERE f.username = su.username

GO;

--dany

--e
CREATE VIEW allMatches AS
SELECT c1.name host_club , c2.name guest_club ,M.start_time,M.end_time
From Club c1, Club c2 , Match M
Where c1.club_ID =M.host_club_ID AND 
c2.club_ID =M.guest_club_ID AND 
c1.club_ID<> c2.club_ID;                                 
GO;



--f
CREATE VIEW allTickets AS
SELECT c1.name host_club ,c2.name guest_club ,s.name stadium_name, M.start_time
From Club c1, Club c2 , Match M, Stadium s, Ticket t
WHERE t.match_ID= M.match_ID AND   c1.club_ID =M.host_club_ID AND 
c2.club_ID =M.guest_club_ID AND S.ID = M.stadium_ID AND C1.club_ID<>C2.club_ID ;
GO;

--g
CREATE VIEW allClubs AS
SELECT name,location
From Club
GO;



--h
CREATE VIEW allStadiums AS
SELECT name,location,capacity,status
FROM Stadium
GO;

--i
CREATE VIEW allRequests AS
SELECT cr.username club_representative_username, cr.name cr_name , sm.username stadium_manager_username, sm.name sm_name, hr.status,m.match_ID, m.start_time , m.end_time, host.name host_name, guest.name guest_name
FROM   ClubRepresentative cr ,HostRequest hr, StadiumManager sm  , match m, Stadium s ,club host,  club guest
where hr.representative_ID = CR.ID AND hr.manager_ID= sm.ID and m.match_ID= s.ID and sm.stadium_ID= s.ID  and m.match_ID=hr.match_ID and 
m.host_club_ID= cr.club_ID and m.host_club_ID = host.club_ID and m.guest_club_ID = guest.club_ID



GO;


CREATE VIEW receivedRequests AS
SELECT cr.Name AS representative_name, c1.name AS host_club_name, c2.name AS guest_club_name, m.start_time, m.end_time, hr.status, sm.username sm_username
FROM HostRequest hr
JOIN ClubRepresentative cr ON hr.representative_ID = cr.ID
JOIN Match m ON hr.match_ID = m.match_ID
JOIN Club c1 ON m.host_club_ID = c1.club_ID
JOIN Club c2 ON m.guest_club_ID = c2.club_ID
JOIN StadiumManager sm ON hr.manager_ID = sm.ID




go;

--2.3



--i
CREATE PROCEDURE addAssociationManager  @name VARCHAR(20) ,
@userName VARCHAR(20), @password VARCHAR(20) AS 
INSERT INTO SystemUser (username, password)  VALUES (@userName , @password);
INSERT INTO SportsAssociationManager (name, username)
VALUES (@name , @userName) 
 
GO;

--exec addAssociationManager @name= 'associationname', @username = 'associationusername' , @password = 'associationpassword'





--ii new
CREATE PROCEDURE addNewMatch
@hname  VARCHAR(20)  , @gname  VARCHAR(20)  , @start datetime
, @end datetime AS 

DECLARE @tmphost int
DECLARE @tmpguest int

SELECT @tmphost=C.club_ID From Club C
WHERE C.name=@hname

SELECT @tmpguest=C.club_ID From Club C
WHERE C.name=@gname

insert into match (start_time, end_time, host_club_ID, guest_club_ID)
VALUES (@start, @end, @tmphost, @tmpguest)

go;

--exec addNewMatch @hname = 'argentina', @gname = 'france' , @start = '2022-12-18 10:34:09', @end = '2022-12-18 11:34:09'
--select*from match


--iii
CREATE VIEW clubsWithNoMatches AS 
SELECT C.name 
From club c 
WHERE NOT EXISTS
(
SELECT M.host_club_ID, M.guest_club_ID
FROM Match  M 
Where M.host_club_ID= C.club_ID OR 
M.guest_club_ID = C.club_ID
);
go;



--iv  
CREATE PROCEDURE deleteMatch @hname  VARCHAR(20)  , @gname  VARCHAR(20) , @start datetime, @end datetime
AS 

DECLARE @tmphost int
DECLARE @tmpguest int

SELECT @tmphost=C.club_ID From Club C
WHERE C.name=@hname

SELECT @tmpguest=C.club_ID From Club C
WHERE C.name=@gname

DELETE from MATCH 
WHERE host_club_id = @tmphost 
AND guest_club_id = @tmpguest
AND start_time = @start
AND end_time = @end

--gdeed


go;

--exec deleteMatch @hname = 'argentina', @gname = 'france' 





--v
CREATE PROCEDURE deleteMatchesOnStadium @name nvarchar(20)
AS
DECLARE @temp int
SELECT @temp =S.ID From Stadium S
WHERE S.name=@name

DELETE FROM Match  
WHERE Match.stadium_ID=@temp AND Match.start_time > CURRENT_TIMESTAMP
GO;



--vi
CREATE PROCEDURE addClub @name VARCHAR(20) , @location VARCHAR(20) AS 
INSERT INTO club (name, location)
VALUES(@name, @location);
go;




--vii --ana
CREATE PROCEDURE addTicket @hname VARCHAR(20) , @gname VARCHAR(20) , 
@time datetime AS
INSERT INTO Ticket (m.match_ID)
SELECT m.match_ID
FROM Match m, Club h , Club g
WHERE m.host_club_ID = h.club_ID AND m.guest_club_ID = g.club_ID
AND m.start_time = @time AND h.name = @hname AND g.name = @gname
go;

--exec addTicket @hname = 'argentina', @gname = 'france', @time = '2022-12-18 10:34:09'
--select*from ticket

--viii
CREATE PROCEDURE deleteClub @sname VARCHAR(20) AS 
DELETE FROM club 
WHERE name = @sname;
go;

--exec deleteClub @sname = 'france'
--select* from club


--ix
CREATE PROCEDURE addStadium @name nvarchar(20),@location nvarchar(20),
@capacity int
AS
INSERT INTO Stadium (name , location, capacity)
VALUES(@name,@location,@capacity)
GO;

--exec addStadium @name = 'camp nou' , @location = 'barcelona', @capacity = 40000


--x
CREATE PROCEDURE deleteStadium @name nvarchar(20)
AS
DELETE FROM Stadium 
WHERE name=@name
go;


--xi
CREATE PROCEDURE blockFan @nationalID VARCHAR(20) AS 
Update fan
Set STATUS = 0
Where national_ID=@nationalID;
go;


--xii
CREATE PROCEDURE unblockFan @nationalID VARCHAR(20) AS 
Update fan
Set STATUS = 1
Where national_ID=@nationalID;
go;

--xiii --ana
CREATE PROCEDURE addRepresentative @rname VARCHAR(20), @cname VARCHAR(20),
@uname VARCHAR(20), @pass VARCHAR(20) AS 
INSERT INTO SystemUser values (@uname , @pass)
DECLARE @tmpid int
SELECT @tmpid=C.club_ID From Club C
WHERE C.name=@cname

INSERT INTO ClubRepresentative (name , club_ID , username)
VALUES (@rname, @tmpid , @uname)

go;


--exec addRepresentative @rname= 'representative', @cname = 'dina' ,@uname = 'alo1', @pass = 'alo2'


--xiv
CREATE FUNCTION [viewAvailableStadiumsOn]
(@time datetime) 
Returns table
AS
Return 
SELECT s.name , s.capacity , s.location
FROM Stadium s 
WHERE NOT EXISTS (SELECT m.start_time , m.stadium_ID
					FROM Match m
					WHERE s.ID = m.stadium_ID AND @time = m.start_time)
                    AND s.status = 1 
go;


--xv 
 CREATE PROCEDURE addHostRequest @clubName varchar(20), 
 @stadiumName varchar(20) , @time DATETIME AS 

 --SELECT @tmpid=C.club_ID From Club C
DECLARE @x int
DECLARE @y int
DECLARE @z int
DECLARE @tmpclubid int

select @tmpclubid = club_ID
FROM Club
WHERE name = @clubName

select @x =r.id 
    from ClubRepresentative r 
    INNER JOIN Club C ON C.club_ID = r.club_ID
    where c.name = @clubName

select @y = sm.id 
    from StadiumManager sm 
    INNER JOIN Stadium s ON s.id = sm.stadium_ID
    WHERE s.name = @stadiumName 

select @z =m.match_ID
    from Match m
    WHERE m.start_time =@time AND m.host_club_ID = @tmpclubid
    
 INSERT INTO HostRequest (representative_ID , manager_ID, match_ID)
 VALUES (@x,@y,@z)
GO;

--EXEC addHostRequest @clubname = 'Club A', @stadiumName = 'Stadium X',@time= '2022-12-18';


--xvi g
CREATE FUNCTION allUnassignedMatches(@clubName VARCHAR(20))
RETURNS TABLE
AS
RETURN
    (SELECT c2.name AS guestClub, m.start_time
     FROM Club c1
     INNER JOIN Match m ON c1.club_ID = m.host_club_ID
     INNER JOIN Club c2 ON m.guest_club_ID = c2.club_ID
     WHERE c1.name = @clubName AND m.stadium_ID IS NULL);

go;



--xvii
CREATE PROCEDURE addStadiumManager @name varchar(20),
@stadiumName varchar(20), @username varchar(20), @password varchar(20)
AS

DECLARE @x int
SELECT @x= s.id
from stadium s 
where s.name= @stadiumName

INSERT INTO SystemUser VALUES (@username, @password)
INSERT INTO StadiumManager (name , stadium_ID, username)
VALUES (@name , @x, @username);

go;



--xviii
CREATE Function [allPendingRequests] (@name varchar(20))
RETURNS table
AS
Return  
SELECT  cr.name representative_name, c2.name guest_club, m.start_time
FROM Club c1 , Club c2 , ClubRepresentative cr, 
Match m  , HostRequest h , StadiumManager s

WHERE c1.club_ID = cr.club_ID 
AND h.status = 'unhandled' AND h.match_ID = m.match_ID
AND m.host_club_id = c1.club_id
AND m.guest_club_id = c2.club_id AND s.ID = h.manager_ID
AND s.username = @name
go;


--xix 
/*CREATE PROCEDURE acceptRequest
@smName varchar(20) , @hcName varchar(20), @ccName varchar(20), @time datetime 
AS 
UPDATE HostRequest
SET STATUS = 'accepted'
WHERE  match_ID= (
    SELECT m.match_ID
    from MATCH m , Club c1 , Club c2 
    where c1.club_ID = m.host_club_ID AND c2.club_ID = m.guest_club_ID 
    AND c1.name = @hcName AND c2.name = @ccName AND m.start_time = @time 

) AND manager_ID= (
    SELECT ID 
    FROM StadiumManager
    WHERE username = @smName
)
AND representative_ID =(
    SELECT cr.ID
    FROM ClubRepresentative cr INNER JOIN CLUB c ON c.club_ID = cr.club_ID
    WHERE c.name = @hcName
    );

GO;
*/
CREATE PROCEDURE acceptRequest
(
    @username VARCHAR(20),
    @hostClubName VARCHAR(20),
    @guestClubName VARCHAR(20),
    @startTime DATETIME
)
AS
BEGIN
    DECLARE @hostClubID INT, @guestClubID INT, @stadiumID INT, @requestID INT, @matchID INT

    SELECT @hostClubID = club_ID FROM Club WHERE name = @hostClubName
    SELECT @guestClubID = club_ID FROM Club WHERE name = @guestClubName

    SELECT @stadiumID = sm.stadium_ID, @requestID = hr.ID
    FROM HostRequest hr
    JOIN ClubRepresentative cr ON hr.representative_ID = cr.ID
    JOIN Club c ON cr.club_ID = c.club_ID
    JOIN StadiumManager sm ON hr.manager_ID = sm.ID
    WHERE c.name = @hostClubName AND hr.status = 'unhandled'
    
    SELECT @matchID = match_ID FROM Match WHERE host_club_ID = @hostClubID AND guest_club_ID = @guestClubID AND start_time = @startTime

    UPDATE Match
    SET stadium_ID = @stadiumID
    WHERE match_ID = @matchID

    UPDATE HostRequest
    SET status = 'accepted'
    WHERE ID = @requestID
END

go;



--xx 
/*CREATE PROCEDURE rejectRequest
@smName varchar(20) , @hcName varchar(20), @ccName varchar(20), @time datetime 
AS 
UPDATE HostRequest
SET STATUS = 'rejected'
WHERE  match_ID= (
    SELECT m.match_ID
    from MATCH m , Club c1 , Club c2 
    where c1.club_ID = m.host_club_ID AND c2.club_ID = m.guest_club_ID 
    AND c1.name = @hcName AND c2.name = @ccName AND m.start_time = @time 

) AND manager_ID= (
    SELECT ID 
    FROM StadiumManager
    WHERE username = @smName
)
AND representative_ID =(
    SELECT cr.ID
    FROM ClubRepresentative cr INNER JOIN CLUB c ON c.club_ID = cr.club_ID
    WHERE c.name = @hcName
    );
    */


    CREATE PROCEDURE rejectRequest
(
    @username VARCHAR(20),
    @hostClubName VARCHAR(20),
    @guestClubName VARCHAR(20),
    @startTime DATETIME
)
AS
BEGIN
    UPDATE HostRequest
SET status = 'rejected'
WHERE status = 'unhandled'
AND ID IN (
    SELECT hr.ID
    FROM HostRequest hr
    JOIN ClubRepresentative cr ON hr.representative_ID = cr.ID
    JOIN Club c ON cr.club_ID = c.club_ID
    JOIN StadiumManager sm ON hr.manager_ID = sm.ID
    WHERE c.name = @hostClubName AND sm.username = @username AND hr.match_ID IN (
        SELECT m.match_ID
        FROM Match m
        WHERE m.start_time = @startTime
    )
)

END


GO;


--xxi
CREATE PROCEDURE addFan @fname VARCHAR(20), @uname VARCHAR(20),
@pass VARCHAR(20),
@nid VARCHAR(20), @birth datetime,
@address VARCHAR(20), @phoneno INT AS

INSERT INTO SystemUser VALUES (@uname, @pass)
INSERT INTO Fan (name, national_id, birth_date, address, phone_no , username)
VALUES (@fname, @nid, @birth, @address, @phoneno, @uname)

go;


--xxii
/*CREATE FUNCTION [upcomingMatchesOfClub]
(@name VARCHAR(20)) 
Returns table
AS
Return
SELECT c1.name host_club_name, c2.name guest_club_name 
, m.start_time ,m.end_time,  s.name stadium_name

FROM Club c1 , Club c2 , Match m , Stadium s
WHERE c1.name = @name AND c1.club_ID = m.host_club_ID 
AND 
c2.club_ID = m.guest_club_ID
AND c1.club_ID<>c2.club_ID AND m.start_time >CURRENT_TIMESTAMP
AND m.stadium_ID = s.ID
go;*/


CREATE FUNCTION upcomingMatchesOfClub(@clubName VARCHAR(20))
RETURNS TABLE
AS
RETURN
SELECT c1.name AS host_club_name, c2.name AS guest_club_name, m.start_time, m.end_time, s.name AS stadium_name
FROM Club c1
JOIN Match m ON m.host_club_ID = c1.club_ID
JOIN Club c2 ON m.guest_club_ID = c2.club_ID
LEFT JOIN Stadium s ON m.stadium_ID = s.ID
WHERE c1.name = @clubName OR c2.name = @clubName AND m.start_time > GETDATE()

go;

--xxiii
/*CREATE FUNCTION [availableMatchesToAttend] (@d datetime )
Returns Table
AS
RETURN
SELECT c1.name host_club_name,c2.name guest_club_name,m.start_time,
s.name stadium_name
FROM  Ticket t ,Match m ,Club c1,Club c2,Stadium s       --ON t.match_ID=m.match_ID
WHERE m.start_time>=@d AND t.status= 1
AND t.match_ID=m.match_ID AND m.host_club_ID=c1.club_ID 
AND m.guest_club_ID=c2.club_ID AND c1.club_ID<>c2.club_ID
AND m.stadium_ID=s.ID
*/

CREATE FUNCTION availableMatchesToAttend(@date DATETIME)
RETURNS TABLE
AS
RETURN (
    SELECT c1.name AS host_club_name, c2.name AS guest_club_name, s.name AS stadium_name, s.location
    FROM Match m
    JOIN Club c1 ON m.host_club_ID = c1.club_ID
    JOIN Club c2 ON m.guest_club_ID = c2.club_ID
    JOIN Stadium s ON m.stadium_ID = s.ID
    WHERE m.start_time >= @date AND m.match_ID IN (
        SELECT match_ID
        FROM Ticket
        WHERE status = 1
    )
)




GO;

--xxiv
CREATE PROCEDURE purchaseTicket @national_id int,@hname varchar(20),
@gname varchar(20),@date datetime
AS

DECLARE @tmpmid int
DECLARE @tmptid int
DECLARE @tmphost int
DECLARE @tmpguest int

SELECT @tmphost=c1.club_ID From Club c1
WHERE c1.name=@hname

SELECT @tmpguest=C.club_ID From Club C
WHERE C.name=@gname


SELECT @tmpmid = m.match_ID
FROM Match m
WHERE m.host_club_ID = @tmphost
AND m.guest_club_ID = @tmpguest
AND m.start_time = @date

SELECT @tmptid = t.ID
FROM Ticket t
WHERE t.match_ID = @tmpmid AND status =1


--IF ( SELECT FROM Fan WHERE national_id = @national_id AND status = 1)
UPDATE Ticket
SET status = 0
WHERE id = @tmptid


INSERT INTO TicketBuyingTransactions VALUES (@national_id, @tmptid)


GO;


--xxv
CREATE PROCEDURE updateMatchHost @hname VARCHAR(20), @gname VARCHAR(20),
@time datetime AS

DECLARE @tmphost int
DECLARE @tmpguest int

SELECT @tmphost=C.club_ID From Club C
WHERE C.name=@hname

SELECT @tmpguest=C.club_ID From Club C
WHERE C.name=@gname

UPDATE Match
SET host_club_ID = @tmpguest , guest_club_ID = @tmphost
WHERE host_club_ID = @tmphost AND guest_club_ID = @tmpguest
AND start_time = @time

go;


--xxvi
CREATE VIEW matchesPerTeam AS
SELECT c1.name , count(m.match_ID) number_of_matches_played
FROM Club c1 , Match m 
WHERE  (Current_timestamp >= m.end_time) AND (c1.club_ID = m.host_club_ID ) 
OR (c1.club_ID = m.guest_club_ID ) 
GROUP BY c1.name
go;


--xxvii
/*CREATE VIEW clubsNeverMatched
AS
SELECT c1.name first_club_name , c2.name second_club_name
FROM Club c1, Club c2 , Match M
WHERE NOT EXISTS 
(SELECT * 
FROM Club c1, Club c2 , Match M
WHERE ( (m.host_club_ID = c1.club_ID AND m.guest_club_id = c2.club_ID) 
OR (m.host_club_ID = c2.club_ID AND m.guest_club_id = c1.club_ID))  
				  )
go;
*/

CREATE VIEW clubsNeverMatched AS
SELECT c1.name AS first_club_name, c2.name AS second_club_name
FROM Club c1
JOIN Club c2 ON c1.club_ID < c2.club_ID
WHERE NOT EXISTS (
    SELECT * FROM Match m
    WHERE (m.host_club_ID = c1.club_ID AND m.guest_club_ID = c2.club_ID)
    OR (m.host_club_ID = c2.club_ID AND m.guest_club_ID = c1.club_ID)
)
go; 
--xxviii --unsure
CREATE FUNCTION clubsNeverPlayed(@club_name varchar(20)) 
RETURNS TABLE AS
RETURN 
( SELECT c.name FROM Club c 
WHERE c.name != @club_name AND NOT EXISTS 
( SELECT * FROM Match m 
WHERE(m.host_club_ID = c.club_ID AND m.guest_club_ID = (SELECT club_ID FROM Club WHERE name = @club_name)) 
OR (m.guest_club_ID = c.club_ID AND m.host_club_ID = (SELECT club_ID FROM Club WHERE name = @club_name)) ) 

);

go;


--xxix 
CREATE FUNCTION matchWithHighestAttendance()
RETURNS TABLE
AS
RETURN (
    SELECT top 1 m.match_ID, h.name AS host_club, g.name AS guest_club, COUNT(t.ID) AS ticket_count
    FROM Match m
    INNER JOIN Club h ON m.host_club_ID = h.club_ID
    INNER JOIN Club g ON m.guest_club_ID = g.club_ID
    INNER JOIN Ticket t ON m.match_ID = t.match_ID AND t.status = 0 --ana
    GROUP BY m.match_ID, h.name, g.name
    ORDER BY ticket_count DESC
);

--select * from TicketBuyingTransactions

go;




 --xxx 
 CREATE FUNCTION matchesRankedByAttendance()
RETURNS TABLE
AS
RETURN (
    SELECT TOP 100 PERCENT m.match_ID, h.name AS host_club, g.name AS guest_club, COUNT(t.id) AS ticket_count
    FROM Match m
    INNER JOIN Club h ON m.host_club_ID = h.club_ID
    INNER JOIN Club g ON m.guest_club_ID = g.club_ID
    INNER JOIN Ticket t ON m.match_ID = t.match_ID AND t.status = 0
    GROUP BY m.match_ID, h.name, g.name
    ORDER BY ticket_count DESC
);

go;



--xxxi
CREATE Function [requestsFromClub]
(@Stadium_name varchar(20) , 
@club_name varchar(20))
Returns TABLE
AS
RETURN
SELECT c1.name host_name , c2.name guest_name
FROM  Club c1 , Club c2 , Match m  , Stadium s ,ClubRepresentative cr 
,HostRequest h, StadiumManager sm

WHERE  m.host_club_id = c1.club_id
AND c1.name = @club_name
AND m.guest_club_id = c2.club_id 
AND m.stadium_id = s.ID
AND c1.club_ID = cr.club_ID
AND h.match_ID = m.match_ID
AND sm.stadium_ID = s.ID
AND s.name = @Stadium_name
AND h.manager_ID = sm.ID
AND h.representative_ID = cr.ID
go;





