add jar .\Rosas.DataProcessor.jar;
use rosas;

-----------------MR������---------------------
CREATE TEMPORARY FUNCTION ev1 as 'rosas.dataprocessor.MR_DistrictUserDistribution_UDAF';
insert overwrite table MR_INDEX_4
	select DEF_MO1 as MO , day as TTIME,
	ev1(MR_TADV_00,MR_TADV_01,MR_TADV_02,MR_TADV_03,MR_TADV_04,MR_TADV_05,MR_TADV_06,MR_TADV_07,MR_TADV_08,MR_TADV_09,MR_TADV_10,MR_TADV_11,MR_TADV_12,MR_TADV_13,MR_TADV_14,MR_TADV_15,MR_TADV_16,MR_TADV_17,MR_TADV_18,MR_TADV_19,MR_TADV_20,MR_TADV_21,MR_TADV_22,MR_TADV_23,MR_TADV_24,MR_TADV_25,MR_TADV_26,MR_TADV_27,MR_TADV_28,MR_TADV_29,MR_TADV_30,MR_TADV_31,MR_TADV_32,MR_TADV_33,MR_TADV_34,MR_TADV_35,MR_TADV_36,MR_TADV_37,MR_TADV_38,MR_TADV_39,MR_TADV_40,MR_TADV_41,MR_TADV_42,MR_TADV_43,MR_TADV_44) as MR_USER_DIS
	from( select *, concat(LPAD(FILEHEADER_REPORTTIME,11,''),'"') as day from MRS_MR_Tadv
) t1 group by DEF_MO1, day ;