# Metric Dictionary — PT Sustainability Model (2023)

## 1) demand_per_100k
- Definition: demand count of PT per 100k residents 
- Unit: PT/per 100k residents
- Interpretation: demand for Pts per 100k residents, higher values indicate greater estimated need for PT services per 100k residents, suggesting more strain if supply does not keep up
- Caveat/Assumption: does not distinguish between regions of state, or rural / urban population of cities 

## 2) supply_per_100k
- Definition: supply count of PT per 100k residents
- Unit: number of PT in supply per 100k residents, 
- Interpretation: higher number may reduce access pressure
- Caveat/Assumption: does not distinguish between regions of state, or rural / urban population of cities

## 3) demand_pressure_norm
- Definition: demand per 100k PT / supply per 100k PT
- Unit: unitless (like divided by like) 
- Interpretation: normalizes demand and supply per 100k metrics for easier comparisons between state. if >1 = demand exceeds supply (per-capita) , and <1 = supply exceeds demand
- Caveat/Assumption: not adjusted for regions of urban / rural areas

## 4) revenue_per_hour
- Definition: avg_payment_per_service * units per hour. uses observed average payment levels, results can optionally be expressed in real (RPP-adjusted) terms as a sensitivity lens
- Unit: dollars/hour
- Interpretation: with increase in productivity, revenue_per_hour increases
- Caveat/Assumption: conservative, baseline and aggressive units per hour tiers part of model. results can optionally be expressed in real (rpp-adjusted) terms as sensitivity lens 

## 5) labor_cost_per_hour
- Definition: hourly compensation and benefits per PT by state (modeled as PT labor only, excludes overhead
- Unit: dollars/hour
- Interpretation: includes not just PT take home wage (pre tax) but also benefits such as 401k, health insurance, and PTO
- Caveat/Assumption: assumed flat 25% benefit premium added to hourly PT rates by state. Outpatient PT wages are not published by state in the BLS OEWS dataset. To estimate outpatient wages at the state level, the national ratio of outpatient PT wages to overall PT wages (0.922143) is applied to each state’s all‑industry PT wage. This produces a consistent, data‑driven estimate of outpatient PT wages across states.

## 6) margin_per_hour
- Definition: revenue - labor cost an hour
- Unit: dollars/hour
- Interpretation: as revenue increases per hour, greater margin, as labor costs increase, margin decreases
- Caveat/Assumption: productivity metric of 3.75 units per hour at baseline, conservative (4.25) and high assumption (4.75) as well 

## 7) wage_revenue_ratio
- Definition: labor cost per hour divided by revenue per hour aka labor burden 
- Unit: unitless
- Interpretation: higher ratio = labor takes a larger share of the revenue, less viable 
- Caveat/Assumption: does not consider wage of support staff or other roles associated with outpatient PT

## 8) sustainability_index
- Definition: average of margin score, and 1 - wage revenue ratio
- Unit: unitless
- Interpretation: A 0-1 composite score where higher indicates stronger modeled economic viability, combining normalized margin and inverted labor burden
- Caveat/Assumption: index is economics-only, workforce pressure is analyzed separately via demand_pressure_norm

