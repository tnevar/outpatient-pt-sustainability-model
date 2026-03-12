-- Phase 20.e: Tableau export view (2023)
-- Purpose:
--   Provide a single, clean, analysis-ready view for Tableau
--   with all key metrics and interpretation layers included.
--
-- Author: Tom Nevar
-- Created: 2026-02-15

CREATE OR REPLACE VIEW v_tableau_state_model AS
SELECT
  state_abbrev,
  state_name,
  scenario_key,

  -- Core outcomes
  sustainability_index,
  sustainability_tier,
  sustainability_rank,
  sustainability_percentile,
  sustainability_band,

  -- Workforce dynamics
  demand_pressure_norm,
  demand_per_100k,
  supply_per_100k,

  -- Economics
  margin_per_hour,
  revenue_per_hour,
  labor_cost_per_hour,
  wage_revenue_ratio,

  -- Scenario inputs (nice to show in tooltips)
  units_per_hour,
  scenario_notes

FROM v_master_state_model_2023_banded;
