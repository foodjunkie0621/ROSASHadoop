use rosas;
drop table IF_INDEX_3;
CREATE TABLE IF_INDEX_3 AS
SELECT 
DEF_VENDORNAME,DEF_CELLNAME,DEF_CELLNAME_CHINESE,
substring(FILEHEADER_DATETIME,0,10) as TTIME,substring(FILEHEADER_DATETIME,12,2) as THOUR,
CASE 
WHEN BANDINDICATOR=38 THEN 'D' 
WHEN BANDINDICATOR=39 THEN 'F' 
WHEN BANDINDICATOR=40 THEN 'E' 
ELSE BANDINDICATOR
END AS BAND 
FROM 
NRM_EutranCellTdd;