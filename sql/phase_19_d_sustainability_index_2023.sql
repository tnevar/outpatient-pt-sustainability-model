-- Phase 19.D: Sustainability Index (2023)
-- Purpose:
--   Create a continuous 0–1 sustainability score combining
--   margin viability and labor burden signals.
--
-- Method:
--   - Normalize margin_per_hour using min-max scaling
--   - Invert wage_revenue_ratio (lower burden = better)
--   - Combine components with equal weighting
--
-- Notes:
--   - Index reflects modeled Medicare-baseline economics
--   - Designed for comparative interpretation, not prediction
--
-- Author: Tom Nevar
-- Created: 2026-02-14

CREATE OR REPLACE VIEW v_master_state_model_2023_indexed AS
WITH bounds AS (
  SELECT
    MIN(margin_per_hour) AS min_margin,
    MAX(margin_per_hour) AS max_margin
  FROM v_master_state_model_2023
)
SELECT
  m.*,

  -- Normalize margin (higher = better)
  (m.margin_per_hour - b.min_margin)
    / NULLIF((b.max_margin - b.min_margin), 0) AS margin_score,

  -- Normalize labor burden (lower = better)
  (1 - m.wage_revenue_ratio) AS labor_score,

  -- Combined sustainability index
  (
    ((m.margin_per_hour - b.min_margin)
      / NULLIF((b.max_margin - b.min_margin), 0))
    +
    (1 - m.wage_revenue_ratio)
  ) / 2.0 AS sustainability_index

FROM v_master_state_model_2023 m
CROSS JOIN bounds b;
