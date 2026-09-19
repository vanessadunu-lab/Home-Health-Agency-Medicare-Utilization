-- Q1: Does source and timing impact average costs overall based on the national level? (Finance Team and care management)

SELECT "SMRY_CTGRY", 
"CASEMIX_SRC_TMNG",
"CASEMIX_CMRBDTY", 
AVG ("AVG_CHRG_PER_BENE") AS "TOT_AVG_CHRG_PER_BENE", 
AVG ("AVG_CHRG_PER_EPSD") AS "TOT_AVG_CHRG_PER_EPSD",
AVG ("AVG_CHRG_PER_DAY") AS "TOT_AVG_CHRG_PER_DAY"
FROM home_health_sql_clean
WHERE "SMRY_CTGRY" = 'NATION'
GROUP BY "SMRY_CTGRY","CASEMIX_SRC_TMNG", "CASEMIX_CMRBDTY"
ORDER BY "SMRY_CTGRY","CASEMIX_SRC_TMNG", "CASEMIX_CMRBDTY","TOT_AVG_CHRG_PER_BENE" DESC;

-- Q2A: Does source and timing impact the average service days allotted to a patient (State level)? (Provider Operations)

SELECT "SMRY_CTGRY", 
"STATE",
"CASEMIX_SRC_TMNG",
"CASEMIX_CMRBDTY",
AVG ("TOT_SRVC_DAYS") AS "AVG_OF_TOT_SRVC_DAYS"
FROM home_health_sql_clean
WHERE "SMRY_CTGRY" = 'STATE'
GROUP BY "SMRY_CTGRY", "STATE", "CASEMIX_SRC_TMNG", "CASEMIX_CMRBDTY"
ORDER BY "SMRY_CTGRY", "STATE", "CASEMIX_SRC_TMNG", "AVG_OF_TOT_SRVC_DAYS" DESC;

-- Q2B: How do visits provided at HHA's differ across states? Visits do not changes across source and timing so comparing across states the visits provided.

SELECT "SMRY_CTGRY", 
"STATE",
AVG ("PT_VISITS_CNT") AS "AVG_PT_VISITS",
AVG ("OT_VISITS_CNT") AS "AVG_OT_VISITS",
AVG ("SLP_VISITS_CNT") AS "AVG_SLP_VISITS",
AVG ("PT_VISITS_CNT") + AVG ("OT_VISITS_CNT") + AVG ("SLP_VISITS_CNT") AS "TOTAL_AVG_VISITS_OFFRD"
FROM home_health_sql_clean
WHERE "SMRY_CTGRY" = 'STATE'
GROUP BY "SMRY_CTGRY", "STATE"
ORDER BY "TOTAL_AVG_VISITS_OFFRD" DESC;

-- Q3A: Which states and providers have the highest and lowest metrics on episodes per beneficiary? Which clinical groupings account for the highest and lowest value?

SELECT "SMRY_CTGRY", 
"STATE",
SUM ("BENE_DSTNCT_CNT") AS "BENE_DSTNCT_CNT_BY_STATE",
SUM ("TOT_EPSD_STAY_CNT") AS "TOT_EPSD_STAY_CNT_BY_STATE",
SUM ("TOT_EPSD_STAY_CNT")::numeric
/
SUM ("BENE_DSTNCT_CNT") AS "AVG_EPSD_PER_BENE"
FROM home_health_sql_clean
WHERE "SMRY_CTGRY" = 'STATE'
GROUP BY "SMRY_CTGRY", "STATE"
ORDER BY "AVG_EPSD_PER_BENE" DESC;

-- Q3B: Which states have the highest and lowest volume or population reach?
SELECT "SMRY_CTGRY", 
"STATE",
SUM ("BENE_DSTNCT_CNT") AS "BENE_DSTNCT_CNT_BY_STATE",
SUM ("TOT_EPSD_STAY_CNT") AS "TOT_EPSD_STAY_CNT_BY_STATE"
FROM home_health_sql_clean
WHERE "SMRY_CTGRY" = 'STATE'
GROUP BY "SMRY_CTGRY", "STATE"
ORDER BY "BENE_DSTNCT_CNT_BY_STATE" DESC;

-- Q3C: Does the metric for episode per beneficiary differ compared to source and timing based on the state level? 
SELECT "SMRY_CTGRY", 
"STATE",
"CASEMIX_SRC_TMNG",
"CASEMIX_CMRBDTY",
SUM ("BENE_DSTNCT_CNT") AS "BENE_DSTNCT_CNT_BY_STATE",
SUM ("TOT_EPSD_STAY_CNT") AS "TOT_EPSD_STAY_CNT_BY_STATE",
SUM ("TOT_EPSD_STAY_CNT")::numeric
/
SUM ("BENE_DSTNCT_CNT") AS "AVG_EPSD_PER_BENE"
FROM home_health_sql_clean
WHERE "SMRY_CTGRY" = 'STATE' AND "STATE" IN ('OK','TX','LA','NJ','NH','DE')
GROUP BY "SMRY_CTGRY", "STATE","CASEMIX_SRC_TMNG","CASEMIX_CMRBDTY"
ORDER BY "SMRY_CTGRY",
CASE "STATE"
WHEN 'OK' THEN 1
WHEN 'TX' THEN 2
WHEN 'LA' THEN 3
WHEN 'NJ' THEN 4
WHEN 'NH' THEN 5
WHEN 'DE' THEN 6
END,
"CASEMIX_SRC_TMNG", "AVG_EPSD_PER_BENE" DESC;

-- Q4: Which states have the highest average cost for provider? (Finance Team)
SELECT "SMRY_CTGRY", 
"STATE", 
AVG("AVG_STDZD_PYMT_AMT_PER_BENE") AS "TOT_AVG_STDZD_PYMT_PER_BENE"
FROM home_health_sql_clean
WHERE "SMRY_CTGRY" = 'STATE'
GROUP BY "SMRY_CTGRY", "STATE"
ORDER BY "TOT_AVG_STDZD_PYMT_PER_BENE" DESC;

-- Q4B: Using the three highest and lowest cost states, what source and timing groupings of patient contribute the most or least to provider cost? (state level)
SELECT "SMRY_CTGRY", 
"STATE",
"CASEMIX_SRC_TMNG",
"CASEMIX_CMRBDTY",
AVG("AVG_PYMT_AMT_PER_BENE") AS "TOT_AVG_PYMT_PER_BENE",
AVG("AVG_STDZD_PYMT_AMT_PER_BENE") AS "TOT_AVG_STDZD_PYMT_PER_BENE"
FROM home_health_sql_clean
WHERE "SMRY_CTGRY" = 'PROVIDER' AND "STATE" IN ('PR','OK', 'UT', 'MD', 'NJ', 'DE')
GROUP BY "SMRY_CTGRY", "STATE","CASEMIX_SRC_TMNG","CASEMIX_CMRBDTY"
ORDER BY "SMRY_CTGRY", 
CASE "STATE"
	WHEN 'PR' THEN 1
	WHEN 'OK' THEN 2
	WHEN 'UT' THEN 3
	WHEN 'MD' THEN 4
	WHEN 'NJ' THEN 5
	WHEN 'DE' THEN 6
END,
"CASEMIX_SRC_TMNG", "TOT_AVG_PYMT_PER_BENE" DESC;

-- Q4C: Which providers contribute the most to the provider costs in the three higher costs states? (Provider level)

SELECT "SMRY_CTGRY", 
"STATE",
"PRVDR_NAME",
"CASEMIX_SRC_TMNG",
"CASEMIX_CMRBDTY",
AVG("AVG_PYMT_AMT_PER_BENE") AS "TOT_AVG_PYMT_PER_BENE",
AVG("AVG_STDZD_PYMT_AMT_PER_BENE") AS "TOT_AVG_STDZD_PYMT_PER_BENE"
FROM home_health_sql_clean
WHERE "SMRY_CTGRY" = 'PROVIDER' AND "STATE" IN ('PR','OK', 'UT')
GROUP BY "SMRY_CTGRY", "STATE","PRVDR_NAME", "CASEMIX_SRC_TMNG","CASEMIX_CMRBDTY"
ORDER BY "SMRY_CTGRY", 
CASE "STATE"
WHEN 'PR' THEN 1
WHEN 'OK' THEN 2
WHEN 'UT' THEN 3
END,
"PRVDR_NAME", "CASEMIX_SRC_TMNG","CASEMIX_CMRBDTY", "TOT_AVG_PYMT_PER_BENE" DESC;