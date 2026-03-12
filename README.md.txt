# State-Level Outpatient PT Sustainability Model

## Project Summary
This project models whether outpatient physical therapy appears economically sustainable at the state level in 2023 by combining Medicare-based revenue assumptions with adjusted PT compensation, workforce supply-demand dynamics, and scenario-based throughput assumptions.

The analysis is built around two related questions:

- **Primary question:** Which states appear most and least sustainable for outpatient PT under modeled 2023 reimbursement, labor cost, and workforce conditions?
- **Secondary question:** How much of modeled PT-generated revenue appears to flow to PT compensation, and how does that differ across states?

A secondary purchasing-power lens is also used to compare PT compensation after cost-of-living adjustment.

---

## Why This Matters
Outpatient PT clinics operate within a reimbursement environment that does not fully reflect the wide variation in labor cost, workforce pressure, and local economic conditions across states. States differ in therapist compensation, cost of living, workforce availability, and patient demand pressure. If reimbursement and operating conditions are misaligned, clinics may face weaker margins, greater difficulty attracting therapists, and lower long-term sustainability.

This project attempts to move beyond a simple reimbursement comparison by modeling how payment, labor cost, and workforce pressure interact at the state level.

---

## Data Sources
This analysis combines multiple state-level inputs for 2023, including:

- CMS Physician & Other Supplier Public Use File for Medicare-based PT payment patterns
- State-level PT compensation inputs
- Workforce supply-demand inputs
- Cost-of-living / Regional Price Parity-style adjustments
- State population inputs for per-capita normalization

---

## Modeling Approach
The project was built as a state-level analytic framework in SQL and visualized in Tableau.

### Revenue Lens
Modeled revenue per hour is estimated using:
- average Medicare payment per service
- scenario-based units-per-hour assumptions

### Labor Cost Lens
Labor cost per hour is estimated using:
- state-level PT compensation inputs
- benefits-inclusive compensation assumptions
- cost-of-living-adjusted compensation values

### Workforce Pressure Lens
Workforce pressure is normalized using:
- `demand_per_100k`
- `supply_per_100k`
- `demand_pressure_norm`

### Scenario Design
The model includes multiple throughput scenarios (`scenario_key`) to test how state-level sustainability changes under different outpatient productivity assumptions.

---

## Core Metrics
Key derived metrics include:

- **`revenue_per_hour`** — modeled hourly revenue based on payment-per-service and throughput assumptions
- **`labor_cost_per_hour`** — state-level PT compensation cost per hour
- **`margin_per_hour`** — modeled difference between hourly revenue and hourly labor cost
- **`wage_revenue_ratio`** — share of modeled revenue consumed by PT compensation
- **`demand_pressure_norm`** — normalized demand relative to supply
- **`sustainability_index`** — composite indicator used to compare modeled outpatient PT sustainability across states
- **`sustainability_rank` / `sustainability_percentile` / `sustainability_band`** — ranking and interpretation fields used in analysis and visualization

---

## Dashboards
### Dashboard 1 — Sustainability Overview
This dashboard shows modeled outpatient PT sustainability across states under baseline assumptions, combining geographic variation, workforce pressure, margin per hour, and PT compensation share of revenue. In general, states where PT compensation consumes a larger share of modeled revenue tend to appear less sustainable, although workforce pressure and modeled margin do not move in perfect lockstep.

### Dashboard 2 — State Rankings
This dashboard isolates the top and bottom states by sustainability index under baseline assumptions, making it easier to compare the strongest and weakest modeled outpatient PT environments directly. It serves as a supporting ranking view to the main dashboard and highlights the spread between leading, middle, and trailing states.

### RPP-Adjusted Compensation View
This chart ranks states by **RPP-adjusted PT compensation per hour**, giving a purchasing-power lens on therapist compensation rather than a revenue-share lens. States with RPP above 100 generally appear lower in the ranking, with Alaska standing out as a notable exception to that broader pattern and California not appearing until roughly the middle of the table.

---

## Key Takeaways
- State-level outpatient PT sustainability appears to vary meaningfully under the same national Medicare payment environment.
- PT compensation share of modeled revenue is an important part of the sustainability story, but not the only one.
- Workforce pressure and modeled margin do not always move together, which suggests that labor market strain and financial sustainability can diverge.
- A purchasing-power lens can materially change how therapist compensation value is interpreted across states.

---

## Tools Used
- **SQL / PostgreSQL**
- **pgAdmin 4**
- **Tableau**
- **Excel / CSV workflows** for supporting data preparation

---

## Repository Structure
```text
README.md
sql/
docs/
images/
tableau/

# State-Level Outpatient PT Sustainability Model

## Project Summary
This project models whether outpatient physical therapy appears economically sustainable at the state level in 2023 by combining Medicare-based revenue assumptions with adjusted PT compensation, workforce supply-demand dynamics, and scenario-based throughput assumptions.

The analysis is built around two related questions:

- **Primary question:** Which states appear most and least sustainable for outpatient PT under modeled 2023 reimbursement, labor cost, and workforce conditions?
- **Secondary question:** How much of modeled PT-generated revenue appears to flow to PT compensation, and how does that differ across states?

A secondary purchasing-power lens is also used to compare PT compensation after cost-of-living adjustment.

---

## Why This Matters
Outpatient PT clinics operate within a reimbursement environment that does not fully reflect the wide variation in labor cost, workforce pressure, and local economic conditions across states. States differ in therapist compensation, cost of living, workforce availability, and patient demand pressure. If reimbursement and operating conditions are misaligned, clinics may face weaker margins, greater difficulty attracting therapists, and lower long-term sustainability.

This project attempts to move beyond a simple reimbursement comparison by modeling how payment, labor cost, and workforce pressure interact at the state level.

---

## Data Sources
This analysis combines multiple state-level inputs for 2023, including:

- CMS Physician & Other Supplier Public Use File for Medicare-based PT payment patterns
- State-level PT compensation inputs
- Workforce supply-demand inputs
- Cost-of-living / Regional Price Parity-style adjustments
- State population inputs for per-capita normalization

---

## Modeling Approach
The project was built as a state-level analytic framework in SQL and visualized in Tableau.

### Revenue Lens
Modeled revenue per hour is estimated using:
- average Medicare payment per service
- scenario-based units-per-hour assumptions

### Labor Cost Lens
Labor cost per hour is estimated using:
- state-level PT compensation inputs
- benefits-inclusive compensation assumptions
- cost-of-living-adjusted compensation values

### Workforce Pressure Lens
Workforce pressure is normalized using:
- `demand_per_100k`
- `supply_per_100k`
- `demand_pressure_norm`

### Scenario Design
The model includes multiple throughput scenarios (`scenario_key`) to test how state-level sustainability changes under different outpatient productivity assumptions.

---

## Core Metrics
Key derived metrics include:

- **`revenue_per_hour`** — modeled hourly revenue based on payment-per-service and throughput assumptions
- **`labor_cost_per_hour`** — state-level PT compensation cost per hour
- **`margin_per_hour`** — modeled difference between hourly revenue and hourly labor cost
- **`wage_revenue_ratio`** — share of modeled revenue consumed by PT compensation
- **`demand_pressure_norm`** — normalized demand relative to supply
- **`sustainability_index`** — composite indicator used to compare modeled outpatient PT sustainability across states
- **`sustainability_rank` / `sustainability_percentile` / `sustainability_band`** — ranking and interpretation fields used in analysis and visualization

---

## Dashboards
### Dashboard 1 — Sustainability Overview
This dashboard shows modeled outpatient PT sustainability across states under baseline assumptions, combining geographic variation, workforce pressure, margin per hour, and PT compensation share of revenue. In general, states where PT compensation consumes a larger share of modeled revenue tend to appear less sustainable, although workforce pressure and modeled margin do not move in perfect lockstep.

### Dashboard 2 — State Rankings
This dashboard isolates the top and bottom states by sustainability index under baseline assumptions, making it easier to compare the strongest and weakest modeled outpatient PT environments directly. It serves as a supporting ranking view to the main dashboard and highlights the spread between leading, middle, and trailing states.

### RPP-Adjusted Compensation View
This chart ranks states by **RPP-adjusted PT compensation per hour**, giving a purchasing-power lens on therapist compensation rather than a revenue-share lens. States with RPP above 100 generally appear lower in the ranking, with Alaska standing out as a notable exception to that broader pattern and California not appearing until roughly the middle of the table.

---

## Key Takeaways
- State-level outpatient PT sustainability appears to vary meaningfully under the same national Medicare payment environment.
- PT compensation share of modeled revenue is an important part of the sustainability story, but not the only one.
- Workforce pressure and modeled margin do not always move together, which suggests that labor market strain and financial sustainability can diverge.
- A purchasing-power lens can materially change how therapist compensation value is interpreted across states.

---

## Tools Used
- **SQL / PostgreSQL**
- **pgAdmin 4**
- **Tableau**
- **Excel / CSV workflows** for supporting data preparation

---

## Repository Structure
```text
README.md
sql/
docs/
images/
tableau/

Assumptions and Limitations

This model is a state-level analytical framework, not a direct measure of any one clinic’s profitability.

Revenue is modeled using Medicare-based payment assumptions rather than full payer-mix data.

PT compensation includes modeled compensation inputs and benefits assumptions rather than direct observed clinic payroll data.

Results depend on scenario assumptions such as units_per_hour and should be interpreted as modeled comparisons rather than exact forecasts.



