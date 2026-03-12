CREATE OR REPLACE VIEW v_tableau_state_model_rpp_adjusted AS
SELECT 
t.*,
sf.rpp_cost_of_living_index,
t.revenue_per_hour / NULLIF(sf.rpp_cost_of_living_index / 100.0,0) AS revenue_per_hour_rpp_adjusted,
t.labor_cost_per_hour AS labor_cost_per_hour_rpp_adjusted,
(t.revenue_per_hour / NULLIF(sf.rpp_cost_of_living_index / 100.0,0)) - t.labor_cost_per_hour AS margin_per_hour_rpp_adjusted,
t.labor_cost_per_hour / NULLIF((t.revenue_per_hour / NULLIF(sf.rpp_cost_of_living_index / 100.0, 0)), 0) AS wage_revenue_ratio_rpp_adjusted
FROM v_tableau_state_model t 
JOIN state_financial_inputs SF
ON sf.state_abbrev = t.state_abbrev