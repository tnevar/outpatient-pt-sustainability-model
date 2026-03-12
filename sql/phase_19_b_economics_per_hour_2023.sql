-- Phase 19.01: Medicare-baseline economics per hour (2023)
-- Purpose:
--   Compute revenue per hour, labor cost per hour, and margin per hour
--   using:
--     - avg_payment_per_service (state_pt_metrics) as $/unit proxy
--     - hourly_pt_comp_benefits_col_adjusted (state_financial_inputs) as $/hour labor cost
--     - units_per_hour scenarios (model_assumptions_uph)
--
-- Join strategy:
--   Standardize state keys using state_lookup:
--     - state_financial_inputs.state_name -> state_lookup.state_name
--     - state_pt_metrics.state (abbrev like 'CA') -> state_lookup.state_abbrev
--   Then join finance + payment on state_abbrev.
--
-- Notes:
--   - Explicit numeric casting used to avoid integer math issues.
--   - Add year predicates if your tables include a year field.
--
-- Author: Tom Nevar
-- Created: 2026-02-11

CREATE OR REPLACE VIEW v_econ_per_hour_2023 AS
WITH fin AS (
  SELECT
    lu.state_abbrev,
    lu.state_name,
    fi.hourly_pt_comp_benefits_col_adjusted
  FROM state_financial_inputs fi
  JOIN state_lookup lu
    ON lu.state_name = fi.state_name
),
pay AS (
  SELECT
    lu.state_abbrev,
    pm.avg_payment_per_service
  FROM state_pt_metrics pm
  JOIN state_lookup lu
    ON lu.state_abbrev = pm.state
)
SELECT
  fin.state_abbrev,
  fin.state_name,
  a.scenario_key,
  a.units_per_hour,
  a.scenario_notes,

  pay.avg_payment_per_service,
  fin.hourly_pt_comp_benefits_col_adjusted,

  -- Revenue per hour
  (pay.avg_payment_per_service::numeric * a.units_per_hour) AS revenue_per_hour,

  -- Labor cost per hour
  (fin.hourly_pt_comp_benefits_col_adjusted::numeric) AS labor_cost_per_hour,

  -- Margin per hour
  (pay.avg_payment_per_service::numeric * a.units_per_hour)
    - (fin.hourly_pt_comp_benefits_col_adjusted::numeric) AS margin_per_hour,

  -- Labor burden ratio (cost / revenue)
  (fin.hourly_pt_comp_benefits_col_adjusted::numeric)
    / NULLIF((pay.avg_payment_per_service::numeric * a.units_per_hour), 0) AS wage_revenue_ratio

FROM fin
JOIN pay
  ON pay.state_abbrev = fin.state_abbrev
CROSS JOIN model_assumptions_uph a;
