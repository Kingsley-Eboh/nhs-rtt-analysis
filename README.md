![Platform](https://img.shields.io/badge/Platform-Python_3.12-blue)
![Tool](https://img.shields.io/badge/Tool-Jupyter_Notebook-orange)
![Domain](https://img.shields.io/badge/Domain-Healthcare_Analytics-lightgrey)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

# NHS Referral to Treatment (RTT) Waiting Times
## Exploratory Data Analysis | Financial Year 2025/26

---

## Project Overview
This project examined NHS England Referral to Treatment (RTT) waiting times
across the 2025/26 financial year (April 2025 to February 2026). The analysis
covers all NHS trusts and providers submitting monthly RTT returns to NHS England,
producing 10 analytical outputs that track performance trends, identify specialties
and trusts with the greatest waiting time pressures and assess progress in clearing
the NHS backlog. March 2026 data had not been published at the time of this
analysis and was therefore excluded. Q4 figures reflect January and February 2026 only.

---

## Objectives
- Track national 18-week performance against the 92% NHS constitutional standard
- Assess quarterly performance trends across the 2025/26 financial year
- Quantify the total size of the NHS waiting list and monitor backlog reduction
- Examine the distribution of patients across waiting time bands
- Identify specialties with the greatest waiting time pressures
- Identify best and worst performing trusts by 18-week performance
- Analyse performance variation across Integrated Care Boards (ICBs)
- Track monthly trends in long waiters (52 plus and 104 plus weeks)

---

### Data Source
| | |
|---|---|
| **Publisher** | NHS England |
| **Dataset** | Consultant-led RTT Waiting Times 2025/26 |
| **Coverage** | Approximately 515 NHS trusts and providers per month across 23 treatment specialties |
| **Frequency** | Monthly |
| **Access** | [NHS England Statistics](https://www.england.nhs.uk/statistics/statistical-work-areas/rtt-waiting-times/) |

---

## Tools & Libraries
| Tool | Purpose |
|---|---|
| Python 3.12 | Core programming language |
| pandas | Data loading, cleaning and transformation |
| matplotlib | Chart production and formatting |
| seaborn | Chart styling and heatmap production |
| Jupyter Notebook | Interactive analysis environment |

---

## Key Findings
- The NHS missed the 92% 18-week standard in **every single reporting period**
- National performance ranged between **59.7% and 62.5%** across the year
- The overall waiting list reduced from **7.42 million** in April 2025 to
  **7.16 million** in February 2026 — a reduction of approximately 265,000 patients
- **62.6%** of all waiting time was within 18 weeks
- **37.1%** of patients were waiting between 18 and 52 weeks
- Performance improved steadily from **Q1 (60.7%)** to **Q4 (61.9%)**
- Significant variation was identified between the best and worst performing trusts
- Trauma, Orthopaedic and surgical specialties showed the greatest waiting time pressure

---

## Analyses
| Step | Description |
|---|---|
| 1. Load and Combine Data | 11 monthly CSV files loaded and concatenated |
| 2. Quarter Labels | NHS financial year quarters assigned |
| 3. Data Quality Assessment | Missing values, duplicates and data types checked |
| 4. Data Cleaning | Weekly band nulls filled and commissioner fields standardised |
| 5. National Performance Trend | Monthly 18-week performance vs 92% standard |
| 6. Quarterly Performance Trend | Quarterly aggregation and bar chart |
| 7. Total Waiting List Size | Monthly backlog size trend |
| 8. Waiting Time Distribution | Patients grouped into four waiting time bands |
| 9. Long Waiters Analysis | Monthly trend of 52 plus and 104 plus week waiters |
| 10. Specialty Level Breakdown | 10 worst performing specialties |
| 11. Trust Level Variation | 10 best and worst performing trusts |
| 12. Commissioner Level Analysis | 10 best and worst performing ICBs |
| 13. Heatmap | 18-week performance by specialty and quarter |
| 14. Summary Insights | Key findings and conclusions |

---

## How to Run
1. Clone the repository:
```bash
git clone https://github.com/Kingsley-Eboh/nhs-rtt-analysis.git
```
2. Navigate to the project folder:
```bash
cd nhs-rtt-analysis
```
3. Install required libraries:
```bash
pip install pandas matplotlib seaborn
```
4. Download the monthly RTT full extract CSV files from NHS England and
   place them in the `data/` folder:
   https://www.england.nhs.uk/statistics/statistical-work-areas/rtt-waiting-times/

5. Launch Jupyter Notebook:
```bash
jupyter notebook
```
6. Open `notebooks/nhs_rtt_analysis.ipynb` and run all cells:
**Kernel → Restart & Run All**

---

## Project Structure
```
nhs-rtt-analysis/
├── notebooks/
│   └── nhs_rtt_analysis.ipynb         # Main analysis notebook
├── figures/
│   ├── monthly_trend.png              # Monthly performance trend
│   ├── quarterly_trend.png            # Quarterly performance trend
│   ├── backlog_size.png               # Total waiting list size
│   ├── wait_distribution.png          # Waiting time distribution
│   ├── long_waiters.png               # Long waiters trend
│   ├── specialty_breakdown.png        # Specialty level breakdown
│   ├── trust_variation.png            # Trust level variation
│   ├── icb_variation.png              # ICB level variation
│   └── heatmap_specialty_quarter.png  # Heatmap by specialty and quarter
├── .gitignore                         # Excludes data files and checkpoints
└── README.md                          # Project documentation
```
---

## Evidence

### Step 5 — Monthly Performance Trend
[![monthly_trend](figures/monthly_trend.png)](figures/monthly_trend.png)

### Step 6 — Quarterly Performance Trend
[![quarterly_trend](figures/quarterly_trend.png)](figures/quarterly_trend.png)

### Step 7 — Total Waiting List Size
[![backlog_size](figures/backlog_size.png)](figures/backlog_size.png)

### Step 8 — Waiting Time Distribution
[![wait_distribution](figures/wait_distribution.png)](figures/wait_distribution.png)

### Step 9 — Long Waiters Analysis
[![long_waiters](figures/long_waiters.png)](figures/long_waiters.png)

### Step 10 — Specialty Level Breakdown
[![specialty_breakdown](figures/specialty_breakdown.png)](figures/specialty_breakdown.png)

### Step 11 — Trust Level Variation
[![trust_variation](figures/trust_variation.png)](figures/trust_variation.png)

### Step 12 — Commissioner Level Analysis
[![icb_variation](figures/icb_variation.png)](figures/icb_variation.png)

### Step 13 — Heatmap by Specialty and Quarter
[![heatmap_specialty_quarter](figures/heatmap_specialty_quarter.png)](figures/heatmap_specialty_quarter.png)

---

## Author
**Kingsley Eboh**
[GitHub](https://github.com/Kingsley-Eboh)

---

*Data sourced from NHS England. This project is intended for portfolio and
educational purposes.*
