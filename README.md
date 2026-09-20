# Home Health Agency Medicare Utilization & Provider Analysis
## Background and Overview 
The Office of Enterprise and Data Analytics (OEDA), at the Centers for Medicare & Medicaid Services, is the main data source for health programs. OEDA released Post-Acute Care and Hospice Provider
Utilization and Payment Public Use Files (PAC PUF) from 2014 to 2024 reporting and summarizing trends on healthcare services provided by Home Health Agencies (HHAs).

CMS Office of Enterprise & Data Analytics releases data on types of population receiving care, services offered by providers, and beneficiary/provider/medicare costs. This project analyzes Medicare home health utilization and payment patterns across states and providers using CMS data from 2024. The analysis examines episode activity, beneficiary charges, standardized payments, and provider-level payment variation to identify patterns that may support Provider Operations and Care Management teams.

* The python codes used to retrieve the data through the open API can be found [here.](https://github.com/vanessadunu-lab/Home-Health-Agency-Medicare-Utilization/blob/main/01_data_retrieval/home_health_data_retrieval.ipynb)
  
## Data Structure Overview
The CMS Home Health Agency dataset is a flat, provider/geography-level dataset containing 33 variables spanning provider characteristics, admission characteristics, patient complexity, utilization, payment, and service measures.

<img width="1920" height="1080" alt="HHA_Data_Structure" src="https://github.com/user-attachments/assets/01e7c3c7-5835-4bee-83fa-2ab738bd456e" />


* The data cleaning log to document checks completed in Excel to prepare the data can be found [here.](https://github.com/vanessadunu-lab/Home-Health-Agency-Medicare-Utilization/blob/main/02_data_preparation/Data_Cleaning_Log.jpeg)

## Executive Summary
### Overview of Findings

This analysis examines Medicare home health utilization and payment patterns across states and providers, with a focus on admission source and timing, patient complexity, and episode activity. The data revealed variations in episode activity, beneficiary charges, and payment across these factors, with recurring differences observed within the community late admission grouping and higher comorbidity levels. The following sections will examine whether patterns remained consistent at the state and provider levels, providing a more detailed view of variation across the healthcare system. These findings can support Provider Operations and Care Management teams in identifying areas for further operational review.

The SQL queries conducted in PostgreSQL regarding various questions can be accessed [here.](https://github.com/vanessadunu-lab/Home-Health-Agency-Medicare-Utilization/blob/main/03_sql_analysis/home_health_analysis.sql)

Below is the the overview from the Tableau dashboard which will be discussed further in the report. The interactive tableau dashboard can be viewed [here.](https://public.tableau.com/app/profile/vanessa.dunu/viz/HHA_17898150729830/Dashboard1)


<img width="2838" height="2398" alt="Home_health_medicare_utilization_dashboard" src="https://github.com/user-attachments/assets/6ac5a52b-c124-42ed-b1c3-0ed21079b766" />


### Overall Pattern:

* At the national level, average charge per beneficiary generally increased across higher comorbidity levels. A similar pattern was observed in episode activity, with episodes per beneficiary also increasing across higher comorbidity levels.
  
* Average charge per beneficiary was highest among the community late grouping, followed by the institutional early grouping. These differences highlight variation in charges across admission source, timing, and comorbidity groupings.

<img width="1834" height="590" alt="01_charge_per_beneficiary" src="https://github.com/user-attachments/assets/8b2b697f-31d1-427c-a95e-f808a598598a" />

### Utilization:

* Similar to average charge per beneficiary, episode activity was highest in the community late grouping among the six states analyzed, including the three states with the highest and lowest episode activity. This indicates a consistent pattern of higher episode activity within the community late grouping across the selected states. 

* Within each selected state, episode activity generally increased from no comorbidity to high comorbidity. This pattern suggests that episode activity varies alongside patient complexity and may warrant further examination of utilization patterns across different patient complexity levels. 

<img width="1778" height="1306" alt="02_episodes_per_beneficiary" src="https://github.com/user-attachments/assets/2443bcf8-ed78-4ee7-ab6e-09d3f4b4b647" />

### Payment:

* Among the six states with the highest and lowest average standardized payment, the most notable increase occurred within the three highest-payment states in the community late grouping at the high comorbidity level. This pattern indicates variation in standardized payment across admission source, timing, comorbidity, and state.


<img width="2522" height="1476" alt="03_standardized_payment" src="https://github.com/user-attachments/assets/23d27150-aa68-4370-b818-864e0b2fa2c4" />

### Provider Variation: 

* Among the selected providers in PR, OK, and UT, average payment per beneficiary was highest in the community late grouping across all comorbidity levels compared with the other admission source and timing groupings. This provider-level pattern is consistent with the higher community late payment patterns observed in the national and state-level analyses.


<img width="2524" height="1468" alt="04_payment_per_beneficiary" src="https://github.com/user-attachments/assets/279d227a-a013-47e6-9ba5-a63c76e97905" />

## Recommendations: 

Based on these insights, the following recommendations are provided below:

* **Conduct targeted reviews of higher-utilization groupings.** Higher episode activity was observed within community late groupings at higher comorbidity levels compared with lower or no comorbidity levels. Provider Operations and Care Management teams could conduct targeted reviews of states and/or providers with higher episode activity within specific admission source, timing, and comorbidity groupings to better understand the factors contributing to differences in utilization.
  
* **Further evaluate the relationship between episode activity and case-mix distribution.** The analysis identified variation in episodes per beneficiary across states. Further analysis could examine how the distribution of admission source, timing, and comorbidity groupings contributes to differences in overall episode activity and whether these patterns correspond with differences in payment across providers.

