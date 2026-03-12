-- Phase 18: HRSA Demand + Population Base View (2023)
-- Purpose:
--   Join HRSA state-level supply and demand with Census population data
--   to establish a population-aware base dataset for per-capita analysis.
--
-- Notes:
--   - Population is joined at the state-year level.
--   - This view is intentionally anchored to 2023.
--   - Per-capita metrics are derived in a subsequent phase.
--
-- Author: Thomas Nevar
-- Created: 2026-02-09

CREATE OR REPLACE VIEW v_hrsa_2023_base AS
SELECT
  h.state_name,
  h.year,
  h.demand,
  h.supply,
  p.population
FROM state_pt_hrsa_supply_demand h
JOIN state_population p
  ON p.state = h.state_name
 AND p.year  = h.year
WHERE h.year = 2023;
