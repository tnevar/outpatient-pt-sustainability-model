CREATE OR REPLACE VIEW v_tableau_state_model AS
SELECT
  state_abbrev,
  state_name,
  scenario_key,
  sustainability_index,
  sustainability_tier,
  margin_per_hour,
  wage_revenue_ratio,
  demand_pressure_norm,
  demand_per_100k,
  supply_per_100k
FROM v_master_state_model_2023_final;
