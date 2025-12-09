# 📊 Fitbit Wellness Case Study — Google Data Analytics Capstone  
**Ask → Prepare → Process → Analyze → Share → Act**

![Visitors](https://visitor-badge.laobi.icu/badge?page_id=abdullahahmadd.fitbit-wellness-case-study)
![R](https://img.shields.io/badge/Tool-R-blue?logo=r)
![SQL](https://img.shields.io/badge/Tool-MySQL-orange?logo=mysql)
![Excel](https://img.shields.io/badge/Tool-Excel-green?logo=microsoft-excel)
![License](https://img.shields.io/badge/License-CC0_1.0-lightgrey)
![Repo Size](https://img.shields.io/github/repo-size/abdullahahmadd/fitbit-wellness-case-study)
![Stars](https://img.shields.io/github/stars/abdullahahmadd/fitbit-wellness-case-study?style=social)

---

# 📑 Table of Contents  
- [📌 Project Overview](#-project-overview)  
- [🏁 Business Task](#-business-task)  
- [🧭 1 Ask Phase](#-1-ask-phase)  
- [📥 2 Prepare Phase](#-2-prepare-phase)  
- [🧹 3 Process Phase](#-3-process-phase)  
- [🗄️ 4 Analyze Phase](#️-4-analyze-phase)  
  - [🔷 A. SQL Analysis](#-a-sql-analysis-mysql)  
  - [🔷 B. R Analysis](#-b-r-analysis-rstudio)  
- [📤 5 Share Phase](#-5-share-phase)  
- [🚀 6 Act Phase](#-6-act-phase)  
- [📂 Repository Contents](#-repository-contents)  
- [🙌 Acknowledgments](#-acknowledgments)  
- [👤 Author](#-author)   

---

# 📌 Project Overview  
This case study explores Fitbit-style smart-device usage to understand user behavior related to **activity, sleep, calories, intensity, and heart rate**.  
The goal is to uncover trends that can help **Bellabeat** optimize wellness product strategy and marketing.

Tools Used: **MS Excel**, **MySQL**, **RStudio**

---

# 🏁 Business Task  
Bellabeat wants insights into **how users interact with wearable devices** to improve product engagement and marketing.

### Key Questions
- What are the main behavioral trends in activity, sleep, and heart rate?  
- How do these trends reflect user habits?  
- What insights can guide Bellabeat’s marketing and product decisions?

---

# 🧭 1. Ask Phase  
- Identified problem  
- Defined stakeholders  
- Clarified analysis questions  

---

# 📥 2. Prepare Phase  
### Tools: Excel  
- Loaded 7 raw Fitbit CSV files  
- Cleaned messy fields  
- Standardized structures  
- Created **Tranformed_Fitbit_Dataset.xlsx** for SQL + R

### Data Issues Found  
- Inconsistent datetime formats  
- HR outliers  
- Missing sleep values  
- Large volume of high-frequency logs  

---

# 🧹 3. Process Phase  
### Tools: Excel  
- Fixed inconsistencies  
- Created columns: `day_of_week`, `week_number`, `sleep_hours`  
- Rounded numerical data  
- Verified dataset integrity  

---

# 🗄️ 4. Analyze Phase  
### Tools: MySQL Workbench & RStudio  

---

# 🔷 A. SQL Analysis (MySQL)  
👉 *All screenshots are stored in:*  
📂 [`Fitbit_analysis_results`](./Fitbit_analysis_results)
📄 SQL Script: [`fitbit_analysis.sql`](./fitbit_analysis.sql)

### ✔ Highlights  
- Created structured tables  
- Built aggregated metrics (daily sleep, HR, steps, calories, intensity)  
- Constructed **daily_master** table  
- Computed trends & summary statistics  

### 📘 1. Row Counts Per Table  
![Row Counts](./Fitbit_analysis_results/row_counts_per_table_sql.png)  
*Validates number of rows loaded for each dataset.*

### 📘 2. Distinct Users  
![Distinct Users](./Fitbit_analysis_results/daily_activity_distinct_users_sql.png)  
*Shows total unique Fitbit users.*

### 📘 3. Date Range Validation  
![Date Range](./Fitbit_analysis_results/date_range_checks_sql.png)  
*Ensures consistent date ranges across datasets.*

### 📘 4. Invalid Heart Rate Check  
![Invalid HR](./Fitbit_analysis_results/invalid_heartrate_records_sql.png)  
*Confirms filtering of unrealistic HR values.*

### 📘 5. Daily Sleep Summary  
![Daily Sleep](./Fitbit_analysis_results/daily_sleep_summary_sql.png)  
*Aggregates sleep minutes per user per day.*

### 📘 6. Daily Steps Summary  
![Daily Steps](./Fitbit_analysis_results/daily_steps_sql.png)  
*Daily step totals derived from hourly logs.*

### 📘 7. Daily Calories Summary  
![Calories](./Fitbit_analysis_results/daily_calories_sql.png)  
*Total daily calories burned.*

### 📘 8. Daily Intensity Summary  
![Intensity](./Fitbit_analysis_results/daily_intensity_summary_sql.png)  
*Daily totals and averages of intensity.*

### 📘 9. Daily Heart Rate Summary  
![HR Summary](./Fitbit_analysis_results/daily_heartrate_summary_sql.png)  
*Mean, min, and max HR per day.*

### 📘 10. Daily Master Table  
![Daily Master](./Fitbit_analysis_results/daily_master_table_validation_sql.png)  
*Merged dataset combining all metrics.*

### 📘 11. Total Users Check  
![Total Users](./Fitbit_analysis_results/total_users_sql.png)  
*Ensures user tracking across tables.*

### 📘 12. Summary Metrics  
![Summary Metrics](./Fitbit_analysis_results/overall_summary_metrics_sql.png)  
*Key daily averages: steps, sleep, HR, calories.*

### 📘 13. Average Steps by Day of Week  
![Avg Steps Week](./Fitbit_analysis_results/avg_steps_by_day_of_week_sql.png)  
*Reveals highest activity mid-week.*

### 📘 14. Sleep vs Steps  
![Sleep vs Steps](./Fitbit_analysis_results/sleep_vs_steps_avg_sql.png)  
*Shows relationship between sleep duration and steps.*

### 📘 15. Sedentary vs Calories  
![Sed vs Cal](./Fitbit_analysis_results/sedentary_vs_calories_avg_sql.png)  
*Higher sedentary time reduces daily calorie burn.*

### 📘 16. Heart Rate Trend  
![HR Trend](./Fitbit_analysis_results/daily_heartrate_trend_sql.png)  
*Displays daily HR fluctuations.*

### 📘 17. Top 10 Active Users  
![Top Users](./Fitbit_analysis_results/top_10_users_by_avg_steps_sql.png)  
*Ranks users by average steps.*

### 📘 18. Sorted Weekday Steps  
![Weekday Sorted](./Fitbit_analysis_results/avgg_steps_by_day_of_week_sql.png)  
*Weekday ranking of step totals.*

### 📘 19. Average Steps by Hour  
![Hourly Steps](./Fitbit_analysis_results/avg_steps_by_hour_sql.png)  
*Shows morning peak activity (7–10 AM).*

### 📘 20. Daily Steps — R Comparison  
![Daily Steps R](./Fitbit_analysis_results/avg_daily_steps_by_day_of_week_R.png)  
*R visualization confirming weekday activity trends.*
---

# 🔷 B. R Analysis (RStudio)  
👉 Folder: **fitbit_analysis_R**  
Using `tidyverse`, `lubridate`, `ggplot2`

### ✔ Tasks  
- Imported all 7 sheets  
- Converted and cleaned date/time fields  
- Summarized daily HR, sleep, steps, calories, intensity  
- Merged datasets  
- Generated visualizations

---

# 📤 5. Share Phase  
### Tools Used: **RStudio (ggplot2)**  
Visualizations were created to communicate insights clearly and concisely.

Below are **all final R visualizations** with filenames and one-line descriptions.

---

## 📊 **1. Average Daily Steps by Day of Week**
![Avg Steps Week](./Fitbit_analysis_results/avg_daily_steps_by_day_of_week_R.png)  
*Shows which weekdays have the highest activity levels (Wednesday peaks).*

---

## 📊 **2. Sleep Hours vs Daily Steps**
![Sleep vs Steps](./Fitbit_analysis_results/sleep_hours_vs_daily_steps_R.png)  
*Reveals whether more sleep correlates with higher activity.*

---

## 📊 **3. Calories Burned vs Active Minutes**
![Calories vs Active Minutes](./Fitbit_analysis_results/calories_vs_active_minutes_R.png)  
*Shows how calories burned increase as active minutes rise.*

---

## 📊 **4. Average Daily Heart Rate Trend**
![HR Trend](./Fitbit_analysis_results/avg_daily_heartrate_trend_R.png)  
*Displays long-term changes in daily average heart rate.*

---

## 📊 **5. Average Steps by Hour of Day**
![Steps by Hour](./Fitbit_analysis_results/avg_steps_by_hour_R.png)  
*Identifies morning peak activity (7 AM–10 AM).*

---

## 📊 **6. Average Steps by Day of Week — Bar Chart**
![Steps Week Bar](./Fitbit_analysis_results/steps_by_day_of_week_bar_R.png)  
*Reinforces weekday vs weekend movement differences.*

---

## 📊 **7. Intensity vs Calories Burned**
![Intensity vs Calories](./Fitbit_analysis_results/intensity_vs_calories_R.png)  
*Shows a strong relationship between high intensity and increased calorie burn.*

---

# 🚀 6. Act Phase  
### ✔ **High-Level Insights**
- **Activity peaks** between 7 AM–10 AM  
- **Wednesday** shows maximum movement  
- Users sleep **5–7.5 hours on average**  
- **Very active minutes ↔ higher calories burned**  
- Sedentary minutes negatively affect calorie burn  
- Afternoon heart rate peaks are common  

---

### ✔ **Recommendations for Bellabeat**

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

# 📂 Repository Contents  

| Folder/File | Description |
|-------------|-------------|
| **Fitbit_analysis_results/** | SQL outputs + R visualizations |
| **fitbit_analysis_R/** | RStudio project files |
| **Tranformed_Fitbit_Dataset.xlsx** | Final cleaned dataset |
| **fitbit_analysis.sql** | MySQL script |
| **README.md** | Full case study |

---

# 🙌 Acknowledgments  
Dataset: **Fitbit Fitness Tracker Data (Public Domain – Mobius / Kaggle)**  
Completed as part of the **Google Data Analytics Professional Certificate**

---

# 👤 Author  
**Abdullah Ahmad**  
Data Analyst | SQL • R • Excel • BI  

🔗 GitHub: https://github.com/abdullahahmadd  
🔗 LinkedIn: *(Add your link)*  

---
