/// 
Class shvarov.objectscript.errors.analytics.ErrorsCube Extends %DeepSee.CubeDefinition [ DependsOn = shvarov.objectscript.errors.analytics.errorlog, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="ErrorsCube" displayName="ErrorsCube" disabled="false" abstract="false" sourceClass="shvarov.objectscript.errors.analytics.errorlog" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="Day" disabled="false" hasAll="false" allCaption="All Day" allDisplayName="Day" sourceProperty="Day" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
      <level name="Month" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
      <level name="Day" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Type" disabled="false" hasAll="false" allCaption="All Type" allDisplayName="Type" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Type" disabled="false" sourceExpression="$tr(%source.Type,&quot;&lt;&gt;&quot;,&quot;&quot;)" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <listing name="New_listing1" disabled="false" listingType="table" fieldList="Day,Line,Seq,Type">
  </listing>
</cube>
}

Parameter DOMAIN;

}
