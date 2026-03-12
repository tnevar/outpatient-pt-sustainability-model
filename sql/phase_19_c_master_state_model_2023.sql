-- Phase 19.02: Master state model (2023)
-- Purpose:
--   Combine population-normalized workforce pressure metrics (HRSA)
--   with Medicare-baseline economics per hour (scenario-based),
--   producing a single analysis-ready dataset for Tableau.
--
-- Inputs:
--   - v_hrsa_2023_demand_pressure (state_name-based)
--   - v_econ_per_hour_2023 (state_abbrev-based, scenario rows)
--   - state_lookup (state_name <-> state_abbrev bridge)
--
-- Notes:
--   - Anchored to 2023
--   - Output grain: (state × scenario_key)
--
-- Author: Tom Nevar
-- Created: 2026-02-12

CREATE OR REPLACE VIEW v_master_state_model_2023 AS
WITH hrsa AS (
  SELECT
    lu.state_abbrev,
    d.state_name,
    d.year,
    d.population,
    d.demand,
    d.supply,
    d.demand_per_100k,
    d.supply_per_100k,
    d.demand_pressure_norm
  FROM v_hrsa_2023_demand_pressure d
  JOIN state_lookup lu
    ON lu.state_name = d.state_name
)
SELECT
  -- Keys
  e.state_abbrev,
  e.state_name,
  h.year,

  -- Workforce pressure (normalized)
  h.population,
  h.demand,
  h.supply,
  h.demand_per_100k,
  h.supply_per_100k,
  h.demand_pressure_norm,

  -- Scenario controls
  e.scenario_key,
  e.units_per_hour,
  e.scenario_notes,

  -- Economics (per hour)
  e.avg_payment_per_service,
  e.hourly_pt_comp_benefits_col_adjusted,
  e.revenue_per_hour,
  e.labor_cost_per_hour,
  e.margin_per_hour,
  e.wage_revenue_ratio

FROM v_econ_per_hour_2023 e
JOIN hrsa h
  ON h.state_abbrev = e.state_abbrev;
