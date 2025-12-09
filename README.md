# 📊 Fitbit Wellness Case Study  
### Google Data Analytics Professional Certificate – Capstone Project  
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
- 📌 Project Overview  
- 🏁 Business Task  
- 🧭 1 Ask Phase  
- 📥 2 Prepare Phase  
- 🧹 3 Process Phase  
- 🗄️ 4 Analyze Phase  
  - A. SQL Analysis  
  - B. R Analysis  
- 📤 5 Share Phase  
- 🚀 6 Act Phase  
- 📂 Repository Contents  
- 🙌 Acknowledgments  
- 👤 Author  

---

# 📌 Project Overview  
This case study explores Fitbit-style smart-device usage to understand user behavior related to **activity, sleep, calories, intensity, and heart rate**.  
The goal is to uncover trends that can help **Bellabeat** optimize wellness product strategy and marketing.

Tools Used: **Excel**, **MySQL**, **RStudio**

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
👉 All screenshot results stored in: **Fitbit_analysis_results**

👉 Full SQL script: **fitbit_analysis.sql**

### ✔ Highlights  
- Created structured tables  
- Built aggregated metrics (daily sleep, HR, steps, calories, intensity)  
- Constructed **daily_master** table  
- Computed trends & summary statistics  

**(Screenshots not repeated here since they are already added earlier.)**

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
