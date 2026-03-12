-- Phase 18b: Per-capita normalization (2023)
-- Purpose:
--   Convert raw HRSA state-level demand and supply counts into
--   per-capita metrics (per 100,000 residents) using 2023 Census
--   population data from v_hrsa_2023_base.
--
-- Notes:
--   - Explicit numeric casting is required to avoid integer division,
--     which would otherwise return zero when dividing integer demand
--     by integer population values.
--   - This view remains anchored to 2023 to maintain consistency
--     with wage, reimbursement, and HRSA baseline inputs.
--
-- Author: Thomas Nevar
-- Created: 2026-02-09

CREATE OR REPLACE VIEW v_hrsa_2023_per_capita AS
SELECT
  b.*,

  -- Per-capita demand (per 100,000 residents)
  (b.demand::numeric / NULLIF(b.population, 0)) * 100000 AS demand_per_100k,

  -- Per-capita supply (per 100,000 residents)
  (b.supply::numeric / NULLIF(b.population, 0)) * 100000 AS supply_per_100k

FROM v_hrsa_2023_base b;
