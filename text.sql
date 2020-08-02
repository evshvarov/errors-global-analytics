Create Table objectscript.errors (
Day Date,
Seq Integer,
Type Varchar(50),
Line Varchar(250))

Insert into objectscript.errors (
Day,
Seq,
Type,
Line)
select Day
    , Seq 
    , $PIECE($PIECE(p,'$ZE=',2),'>',1)||'>' Type
    , $PIECE($PIECE(p,'>',2),',$ZV',1)||'>' Line
 from (
    SELECT day,seq, list(item||'='||value) p
       FROM zrcc.ERRORStack 
     where Stacklevel=0
     and item in ('$ZE')
)