-- Phase 20.f: Model QA Checks 
-- Purpose: 
-- Multiple checks completed to verify correct number of rows returned
-- along with acknowledging no null values present, and do results seem plausible
-- Author: Tom Nevar
-- Created: 02-18-2026

-- Row check amount - expecting around 150 for the 51 territories and the 3 productivity assumptions
SELECT COUNT(*) FROM v_tableau_state_model ; 
-- NULL check - make sure all numbers are as expected for derived metrics
SELECT sustainability_index, demand_per_100k, margin_per_hour, revenue_per_hour
FROM v_tableau_state_model WHERE sustainability_index IS NULL 
OR demand_per_100k IS NULL 
OR margin_per_hour IS NULL 
OR revenue_per_hour IS NULL ;
-- Ratio Range check - ratios should not be negative, most should be about 0-1
SELECT sustainability_index, demand_pressure_norm, wage_revenue_ratio
FROM v_tableau_state_model WHERE sustainability_index < 0 
OR demand_pressure_norm < 0
OR wage_revenue_ratio < 0; 
-- Top and bottom state check - should make intuitive sense with numbers
SELECT state_name, sustainability_index FROM v_tableau_state_model
ORDER BY sustainability_index ASC LIMIT 10 ; 
SELECT state_name, sustainability_index FROM v_tableau_state_model
ORDER BY sustainability_index DESC LIMIT 10;
-- scenario consistency - maintaining wage per hour consistent across scenarios (different states and productivity scenario)
SELECT state_name, 
MIN(labor_cost_per_hour) AS min_labor_cost_per_hour,
MAX(labor_cost_per_hour) AS max_labor_cost_per_hour
FROM v_tableau_state_model
GROUP BY state_name
HAVING MAX(labor_cost_per_hour) <> MIN(labor_cost_per_hour);
-- Outlier offender check (returns rows only if values fall outside expected bounds)
SELECT
  state_name,
  state_abbrev,
  scenario_key,
  wage_revenue_ratio,
  sustainability_index,
  demand_pressure_norm
FROM v_tableau_state_model
WHERE (sustainability_index < 0 OR sustainability_index > 1)
   OR wage_revenue_ratio > 2
   OR demand_pressure_norm > 10
-- juridiction count in the view 
SELECT COUNT(DISTINCT state_abbrev) AS jurisdictions
FROM v_tableau_state_model;
-- how many states per scenario
SELECT scenario_key, COUNT(*) AS rows_in_scenario
FROM v_tableau_state_model
GROUP BY scenario_key
ORDER BY scenario_key;


