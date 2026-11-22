# CMS Home Health Operations and Medicare Utilization Analytics
## Background and Overview 
The Office of Enterprise and Data Analytics (OEDA), at the Centers for Medicare & Medicaid Services, is the main data source for health programs. OEDA released Post-Acute Care and Hospice Provider
Utilization and Payment Public Use Files (PAC PUF) from 2014 to 2024 reporting and summarizing trends on healthcare services provided by Home Health Agencies (HHAs).

CMS Office of Enterprise & Data Analytics releases data on types of population receiving care, services offered by providers, and beneficiary/provider/medicare costs. This project analyzes Medicare home health utilization and payment patterns across states and providers using CMS data from 2024. The analysis examines episode activity, beneficiary charges, standardized payments, and provider-level payment variation to identify patterns that may support Provider Operations and Care Management teams.

## Key Findings

* Charges: Nationally, average charges per beneficiary increased from no to high comorbidity across all four admission source/timing categories. Community Late showed the largest increase, $984.42 (28.8%), and the highest average charge in the high-comorbidity category, at $4,399.31.
* Episode Activity: Average 30-day periods per reported beneficiary varied by admission source and timing. Comparing no and high comorbidity within the same case-mix category, the average increased by 12.9% in Community Late and 4.6% in Institutional Late, decreased by 1.6% in Community Early, and remained nearly unchanged in Institutional Early (-0.1%).
* Standardized Payments: Within the Community Late grouping, reported standardized payment per beneficiary varied between the selected higher- and lower-payment states across comorbidity categories. The dollar difference ranged from $1,125 to $1,974 per beneficiary, with the largest dollar gap occurring in the high-comorbidity category. The largest percentage difference was observed in the low-comorbidity category (79.5%).
  
## Executive Summary
This project examines Medicare home health utilization and payment patterns across states and providers, focusing on admission source and timing, comorbidity, episode activity, and reported payment variation.

The Tableau dashboard provides an overview of the analysis, allowing readers to explore differences across these categories and compare reported measures at the national, state, and provider levels. The detailed findings below explain the patterns identified in the analysis and the calculations used to evaluate them.

* Below is the the overview from the Tableau dashboard which will be discussed further in the report. The interactive tableau dashboard can be viewed [here.](https://public.tableau.com/app/profile/vanessa.dunu/viz/MedicareHomeHealthUtilizationAnalysis/Dashboard1?publish=yes)


<img width="1892" height="1599" alt="image" src="https://github.com/user-attachments/assets/aa2851cc-e3bc-4eee-8075-72c663bcb4c8" />


## Detailed Findings

### Finding 1: Beneficiary Charges by Admission Group and Comorbidity

At the national level, average charges per beneficiary increased from no to high comorbidity across all four admission source and timing categories. Community Late showed the largest increase, rising by $984.42 (28.8%), and had the highest average charge in the high-comorbidity category at $4,399.31. Institutional Early had the second-highest average charge in the high-comorbidity category, reaching $3,917. These results highlight variation in reported charges across admission source, timing, and comorbidity groupings.

<img width="1572" height="528" alt="image" src="https://github.com/user-attachments/assets/3abe3e98-f3fe-465f-9c3e-6baa9a03e291" />

---

### Finding 2: 30 Day Periods Per Reported Beneficiary

Average 30-day periods per reported beneficiary showed a different pattern from charges across admission source and timing categories. When no and high comorbidity were compared within the same case-mix category, the average increased by 12.9% in Community Late and 4.6% in Institutional Late, decreased by 1.6% in Community Early, and remained nearly unchanged in Institutional Early (-0.1%). While average charges increased across all four categories, episode activity did not show a consistent increase with higher comorbidity.

<img width="1776" height="1070" alt="image" src="https://github.com/user-attachments/assets/ff67d9ac-1fbf-42f4-b9e1-e608864ad649" />

**Calculation Note:**

Percentage change was calculated by comparing the average 30-day periods per reported beneficiary in the high-comorbidity category with the no-comorbidity category within each admission source and timing grouping.

**Limitation:**

The measure represents reported 30-day periods relative to reported beneficiary counts within the selected state and case-mix groupings. Beneficiary counts may not represent unique individuals across all groupings, so the results should be interpreted as descriptive utilization measures rather than a direct measure of individual-level service use.

---

### Finding 3: Standardized Payment Variation Across Selected States

Within the Community Late grouping, reported standardized payment per beneficiary varied between the selected higher- and lower-payment states across comorbidity categories. The dollar difference ranged from $1,125 to $1,974 per beneficiary. The largest dollar gap occurred in the high-comorbidity category, while the largest percentage difference occurred in the low-comorbidity category (79.5%).


<img width="2142" height="1458" alt="image" src="https://github.com/user-attachments/assets/7b713d9a-fa48-46ad-96f2-970256626833" />

**Calculation note:**

For each comorbidity category within Community Late, the reported standardized payment averages for the selected higher- and lower-payment states were compared. The dollar difference was calculated by subtracting the lower-state average from the higher-state average. The percentage difference was calculated by dividing that dollar difference by the lower-state average and multiplying by 100.

**Limitation:**

The comparison uses unweighted averages of reported provider-level standardized payment averages, with equal weighting across the three states in each group. These are not pooled beneficiary-weighted averages. The state groups were initially selected using state-level standardized payment averages, so this follow-up comparison is descriptive and does not independently validate the original state ranking. Differences do not establish that geography or case mix alone caused the observed payment variation.

Some Institutional Early and Institutional Late categories do not have all six states represented. Therefore, those categories should not be included in a direct three-state-versus-three-state percentage comparison without addressing the missing states.

## Recommendations: 

Based on these insights, the following recommendations are provided below:

* **Conduct targeted reviews of higher-utilization admission groupings.** Community Late showed the largest increase in average 30-day periods per reported beneficiary between no and high comorbidity (12.9%). Provider Operations and Care Management teams could review selected states and providers within this grouping to better understand factors associated with higher reported utilization, including patient complexity, admission patterns, and service needs.

* **Investigate variation in reported beneficiary charges.** National average charges per beneficiary increased from no to high comorbidity across all four admission source and timing categories, with Community Late showing the largest increase ($984.42, or 28.8%). Further review could examine whether differences in service needs, admission patterns, or other characteristics contribute to variation in reported charges.

* **Review standardized payment variation across selected states.** The comparison identified differences in reported standardized payment per beneficiary between selected higher- and lower-payment states within matched case-mix and comorbidity categories. Provider Operations and reimbursement teams could examine the underlying payment patterns and state-level characteristics to better understand the sources of variation. These differences should not be interpreted as evidence of provider efficiency or quality without additional analysis.


## Data Structure Overview
The CMS Home Health Agency dataset is a flat, provider/geography-level dataset containing 33 variables spanning provider characteristics, admission characteristics, patient complexity, utilization, payment, and service measures.

<img width="1920" height="1080" alt="HHA_Data_Structure" src="https://github.com/user-attachments/assets/01e7c3c7-5835-4bee-83fa-2ab738bd456e" />


* Limitations:

  
* The Python notebook documenting the dataset retrieval process through the CMS Open Data API is available [here.](https://github.com/vanessadunu-lab/Home-Health-Agency-Medicare-Utilization/blob/main/01_data_retrieval/home_health_data_retrieval.ipynb)
* The data cleaning log to document checks completed in Excel to prepare the data can be found [here.](https://github.com/vanessadunu-lab/Home-Health-Agency-Medicare-Utilization/blob/main/02_data_preparation/Data_Cleaning_Log.jpeg)
* The SQL queries conducted in PostgreSQL regarding various questions can be accessed [here.](https://github.com/vanessadunu-lab/Home-Health-Agency-Medicare-Utilization/blob/main/03_sql_analysis/home_health_analysis.sql)

