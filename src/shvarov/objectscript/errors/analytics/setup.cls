Class shvarov.objectscript.errors.analytics.setup
{

ClassMethod Run() As %Status
{
    //d ..CreateTable()
    d ..LoadErrors()
    d ##class(%DeepSee.Utils).%BuildCube("ErrorsCube")
    q $$$OK
}

ClassMethod CreateTable() As %Status
{
    &sql(Create Table shvarov.objectscript.errorlog (
    Day Date,
    Seq Integer,
    Type Varchar(50),
    Line Varchar(250)))
}

ClassMethod LoadErrors() As %Status
{
    d ##class(shvarov.objectscript.errors.analytics.errorlog).%KillExtent()
    &sql(Insert into shvarov_objectscript_errors_analytics.errorlog (
    Day,
    Seq,
    Type,
    Line)
    select Day
        , Seq 
        , $PIECE($PIECE(p,'$ZE=',2),'>',1)||'>' Type
        , $PIECE($PIECE(p,'>',2),',$ZV',1)||'>' Line
    from (
    SELECT TOP ALL
       day, seq, LIST(item||'='||value) p
       FROM zrcc.ERRORStack 
       WHERE Stacklevel=0
       AND item IN ('$ZE','$ZV')
       GROUP BY day,seq
    )
)
}

ClassMethod GenerateErrors(n As %Integer = 10) As %Status
{
    for error="DIVIDE","UNDEFINED","SYNTAX","PARAMETER","SUBSCRIPT" {
        for i=1:1:$r(n) {
        x "do ##class(shvarov.objectscript.errors)."_error_"()"
        }
    }
}

}
