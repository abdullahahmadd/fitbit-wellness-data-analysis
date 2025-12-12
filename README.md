# 🏃Fitbit Wellness Case Study — Google Data Analytics Capstone  
**Ask → Prepare → Process → Analyze → Share → Act**

![Visitors](https://visitor-badge.laobi.icu/badge?page_id=abdullahahmadd.fitbit-wellness-case-study)
![SQL](https://img.shields.io/badge/Tool-MySQL-orange?logo=mysql)
![Excel](https://img.shields.io/badge/Tool-Excel-green?logo=microsoft-excel)
![R](https://img.shields.io/badge/Tool-R-blue?logo=r)
![License](https://img.shields.io/badge/License-CC0_1.0-lightgrey)

---

# Table of Contents

1. [Project Overview](#-project-overview)  
2. [Repository Contents](#-repository-contents)  
3. [Business Task](#-business-task)  
4. [Ask Phase](#-ask-phase)  
5. [Prepare Phase](#-prepare-phase)  
6. [Process Phase](#-process-phase)  
7. [Analyze Phase](#️-analyze-phase)    
8. [Share Phase](#-share-phase)  
9. [Act Phase](#-act-phase)  
10. [Acknowledgments](#-acknowledgments)     

---

# 📌 Project Overview  
This case study explores Fitbit-style smart-device usage to understand user behavior related to **activity, sleep, calories, intensity, and heart rate**.  
The goal is to uncover trends that can help **Bellabeat** optimize wellness product strategy and marketing.

Tools Used: **MS Excel**, **MySQL**, **RStudio**

---

# 📂 Repository Contents  

| Folder/File | Description |
|-------------|-------------|
| **Fitbit_analysis_results/** | SQL outputs + R visualizations |
| **fitbit_analysis_R/** | RStudio project files |
| **Tranformed_Fitbit_Dataset.xlsx** | Final cleaned dataset |
| **fitbit_analysis.sql** | MySQL script |
| **README.md** | Full case study |

---

# 🏁 Business Task  
Bellabeat wants insights into **how users interact with wearable devices** to improve product engagement and marketing.

### Key Questions
- What are the main behavioral trends in activity, sleep, and heart rate?  
- How do these trends reflect user habits?  
- What insights can guide Bellabeat’s marketing and product decisions?

---

# 🧭 Ask Phase  
- Identified problem  
- Defined stakeholders  
- Clarified analysis questions  
The output of this phase was a clear understanding of what insights needed to be extracted from the dataset.
---

# 📥 Prepare Phase  
## 1. Tools: MS Excel  
- Loaded 7 raw Fitbit CSV files  
- Cleaned messy fields  
- Standardized structures  
- Created **Tranformed_Fitbit_Dataset.xlsx** for SQL + R

## 2. Data Issues Found  
- Inconsistent datetime formats  
- Heart rate outliers  
- Missing sleep values  
- Large volume of high-frequency logs  

---

# 🧹 Process Phase  
## 1. Tools: MS Excel  
- Fixed inconsistencies  
- Created columns: `day_of_week`, `week_number`, `sleep_hours`  
- Rounded numerical data  
- Verified dataset integrity  

---

# 🗄️ Analyze Phase  
## 1. Tools: MySQL Workbench & RStudio  

---

## 2. SQL Analysis (MySQL)  
*All screenshots are stored in:*  📂 [`Fitbit_analysis_results`](./Fitbit_analysis_results)
📄 SQL Script: [`fitbit_analysis.sql`](./fitbit_analysis.sql)

### Highlights  
- Created structured tables  
- Built aggregated metrics (daily sleep, HR, steps, calories, intensity)  
- Constructed **daily_master** table  
- Computed trends & summary statistics  

| 1. Row Counts Per Table |
|-----------------------------------|
| ![Row Counts](./Fitbit_analysis_results/row_counts_per_table_sql.png) |
| Validates number of rows loaded for each dataset. |

---

| 2. Distinct Users |
|-----------------------------|
| ![Distinct Users](./Fitbit_analysis_results/daily_activity_distinct_users_sql.png) |
| Shows total unique Fitbit users in the dataset. |

---

| 3. Date Range Validation |
|------------------------------------|
| ![Date Range](./Fitbit_analysis_results/date_range_checks_sql.png) |
| Ensures consistent and complete date coverage across all tables. |

---

| 4. Invalid Heart Rate Records |
|-----------------------------------------|
| ![Invalid HR](./Fitbit_analysis_results/invalid_heartrate_records_sql.png) |
| Confirms filtering out of unrealistic heart rate values. |

---

| 5. Daily Sleep Summary |
|----------------------------------|
| ![Daily Sleep](./Fitbit_analysis_results/daily_sleep_sum_sql.png) |
| Aggregates sleep minutes per user per day. |

---

| 6. Daily Steps Summary |
|----------------------------------|
| ![Daily Steps](./Fitbit_analysis_results/daily_steps_sql.png) |
| Daily step totals derived from hourly logs. |

---

| 7. Daily Calories Summary |
|-------------------------------------|
| ![Calories](./Fitbit_analysis_results/daily_calories_sql.png) |
| Total calories burned per user per day. |

---

| 8. Daily Intensity Summary |
|--------------------------------------|
| ![Intensity](./Fitbit_analysis_results/daily_intensity_summary_sql.png) |
| Daily totals and averages of intensity metrics. |

---

| 9. Daily Heart Rate Summary |
|---------------------------------------|
| ![HR Summary](./Fitbit_analysis_results/daily_heartrate_summary_sql.png) |
| Mean, minimum, and maximum heart rate per day. |

---

| 10. Daily Master Table Validation |
|--------------------------------------------|
| ![Daily Master](./Fitbit_analysis_results/daily_master_table_validation_sql.png) |
| Combined dataset merging steps, sleep, HR, intensity, and calories. |

---

| 11. Total Users Check |
|--------------------------------|
| ![Total Users](./Fitbit_analysis_results/total_users_sql.png) |
| Ensures user presence across aggregated datasets. |

---

| 12. Summary Metrics Overview |
|---------------------------------------|
| ![Summary Metrics](./Fitbit_analysis_results/overall_summary_metrics_sql.png) |
| Key averages: steps, sleep hours, heart rate, calories. |

---

| 13. Average Steps by Day of Week |
|-------------------------------------------|
| ![Avg Steps Week](./Fitbit_analysis_results/avg_steps_by_day_of_week_sql.png) |
| Reveals which weekdays show the highest activity levels. |

---

| 14. Sleep vs Steps Relationship |
|------------------------------------------|
| ![Sleep vs Steps](./Fitbit_analysis_results/sleep_vs_steps_avg_sql.png) |
| Indicates whether longer sleep duration is linked with more steps. |

---

| 15. Sedentary Minutes vs Calories Burned |
|---------------------------------------------------|
| ![Sed vs Cal](./Fitbit_analysis_results/sedentary_vs_calories_avg_sql.png) |
| Shows that higher sedentary time corresponds with fewer calories burned. |

---

| 16. Daily Average Heart Rate Trend |
|---------------------------------------------|
| ![HR Trend](./Fitbit_analysis_results/daily_heartrate_trend_sql.png) |
| Displays day-to-day heart rate fluctuations. |

---

| 17. Top 10 Most Active Users |
|----------------------------------------|
| ![Top Users](./Fitbit_analysis_results/top_10_users_by_avg_steps_sql.png) |
| Ranks users based on average daily steps. |

---

| 18. Sorted Weekday Step Counts |
|-----------------------------------------|
| ![Weekday Sorted](./Fitbit_analysis_results/avgg_steps_by_day_of_week_sql.png) |
| Weekday ranking of activity levels. |

---

| 19. Average Steps by Hour |
|------------------------------------|
| ![Hourly Steps](./Fitbit_analysis_results/avg_steps_by_hour_sql.png) |
| Highlights peak activity hours (7 AM – 10 AM). |

---

## 3. R Analysis (RStudio)  
📂 Folder: **fitbit_analysis_R**

### Tasks  
- Imported all 7 sheets  
- Converted and cleaned date/time fields  
- Summarized daily HR, sleep, steps, calories, intensity  
- Merged datasets  
- Generated visualizations

---

# 📤 Share Phase  
### 1. Tools: **RStudio**  
Visualizations were created to communicate insights clearly and concisely.

---

## 2. R Visualizations (RStudio)

Below are **all final R visualizations**.

| 1. Average Daily Steps by Day of Week |
|------------------------------------------------------|
| ![Avg Steps Week](./Fitbit_analysis_results/avg_daily_steps_by_of_week_R.png) |
| Shows which weekdays have the highest activity levels (Wednesday peaks). |

---

| 2. Sleep Hours vs Daily Steps |
|----------------------------------------------|
| ![Sleep vs Steps](./Fitbit_analysis_results/relationship_btw_sleep_hrs_&_daily_steps_R.png) |
| Reveals whether higher sleep duration correlates with greater daily activity. |

---

| 3. Calories Burned vs Active Minutes |
|-----------------------------------------------------|
| ![Calories vs Active Minutes](./Fitbit_analysis_results/calories_burned_vs_active_mints_R.png) |
| Demonstrates how calorie burn increases as active minutes rise. |

---

| 4. Average Daily Heart Rate Trend |
|--------------------------------------------------|
| ![HR Trend](./Fitbit_analysis_results/daily_Avg_heartrate_trend_R.png) |
| Shows long-term fluctuations in daily average heart rate. |

---

| 5. Average Steps by Hour of Day |
|------------------------------------------------|
| ![Steps by Hour](./Fitbit_analysis_results/avg_steps_by_hour_of_day_R.png) |
| Highlights peak morning activity hours (7 AM–10 AM). |

---

# 🚀 Act Phase

### 1. **High-Level Insights**

- **Activity peaks** between 7 AM–10 AM  
- **Wednesday** shows maximum movement  
- Users sleep **5–7.5 hours on average**  
- **Very active minutes ↔ higher calories burned**  
- Sedentary minutes negatively affect calorie burn  
- Afternoon heart rate peaks are common  

### 2. **Recommendations for Bellabeat**

#### Marketing Strategy  
- Send morning “Get Moving” nudges  
- Mid-week engagement campaigns  
- Sedentary alerts during inactive hours  

#### Product Enhancements  
- Improve sleep tracking accuracy  
- Add stress scoring from HR patterns  
- Personalized intensity-based workouts  

#### User Engagement  
- Weekly progress summaries  
- Gamified step challenges  
- Sleep–activity balance suggestions  

---

# 🙌 Acknowledgments  
**Dataset:** Fitbit Fitness Tracker Data (Public Domain – Mobius / Kaggle)  
Completed as part of the **Google Data Analytics Professional Certificate**

---

