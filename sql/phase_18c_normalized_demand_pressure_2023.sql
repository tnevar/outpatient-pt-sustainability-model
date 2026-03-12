-- Phase 18c: Normalized demand pressure (2023)
-- Purpose:
--   Calculate population-adjusted demand pressure by comparing
--   per-capita demand and per-capita supply metrics.
--
-- Notes:
--   - Uses per-100k metrics from v_hrsa_2023_per_capita.
--   - Anchored to 2023 baseline inputs.
--
-- Author: Tom Nevar
-- Created: 2026-02-10

CREATE OR REPLACE VIEW v_hrsa_2023_demand_pressure AS
SELECT
  p.*,

  -- Normalized demand pressure (population-adjusted)
  (p.demand_per_100k / NULLIF(p.supply_per_100k, 0)) AS demand_pressure_norm

FROM v_hrsa_2023_per_capita p;
