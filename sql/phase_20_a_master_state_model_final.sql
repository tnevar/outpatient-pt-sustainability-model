-- Phase 20.A: Master state model (finalized)
-- Purpose:
--   Merge continuous sustainability index with categorical
--   sustainability tiers into a single analysis-ready dataset.
--
-- Author: Tom Nevar
-- Created: 2026-02-15

CREATE OR REPLACE VIEW v_master_state_model_2023_final AS
SELECT
  i.*,

  CASE
    WHEN i.margin_per_hour < 0 THEN 'Unsustainable'
    WHEN i.wage_revenue_ratio > 0.60 THEN 'At Risk'
    ELSE 'Sustainable'
  END AS sustainability_tier

FROM v_master_state_model_2023_indexed i;
