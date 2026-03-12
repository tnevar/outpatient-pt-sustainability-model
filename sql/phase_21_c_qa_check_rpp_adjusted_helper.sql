-- Phase 21.c: Model QA Checks 
-- Purpose: 
-- Multiple checks completed to verify correct number of rows returned
-- along with acknowledging no null values present
-- Author: Tom Nevar
-- Created: 02-23-2026
-- QA check for duplicate values -- 
SELECT
  state_abbrev,
  scenario_key,
  COUNT(*) AS row_count
FROM v_tableau_state_model_rpp_adjusted_helper
GROUP BY state_abbrev, scenario_key
HAVING COUNT(*) > 1;
-- Row check amount - expected 153 for the 51 jurisdictions and the 3 productivity assumptions
SELECT COUNT(*) AS row_count
FROM v_tableau_state_model_rpp_adjusted_helper ; 
-- NULL check - make sure helper fields do not contain null values
SELECT pt_comp_share_pct_rpp, non_pt_margin_share_pct_rpp
FROM v_tableau_state_model_rpp_adjusted_helper
WHERE pt_comp_share_pct_rpp IS NULL 
OR non_pt_margin_share_pct_rpp IS NULL  ;
-- Spot Check all scenarios on CA, WY and MD -- 
SELECT state_name, state_abbrev, scenario_key, rpp_cost_of_living_index
revenue_per_hour, revenue_per_hour_rpp_adjusted, 
labor_cost_per_hour, margin_per_hour_rpp_adjusted,
pt_comp_share_pct_rpp, non_pt_margin_share_pct_rpp
FROM v_tableau_state_model_rpp_adjusted_helper
WHERE state_abbrev IN ('CA','WY','MD');