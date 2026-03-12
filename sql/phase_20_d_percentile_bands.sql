-- Phase 20.d: Percentile bands (quartiles)
-- Purpose:
--   Convert continuous sustainability percentiles into interpretable
--   bands for clearer Tableau filters, color legends, and narratives.
--
-- Notes:
--   - Bands computed within each scenario_key
--
-- Author: Tom Nevar
-- Created: 2026-02-15

CREATE OR REPLACE VIEW v_master_state_model_2023_banded AS
SELECT
  r.*,

  CASE
    WHEN r.sustainability_percentile >= 0.75 THEN 'Top Quartile'
    WHEN r.sustainability_percentile >= 0.50 THEN 'Upper-Mid Quartile'
    WHEN r.sustainability_percentile >= 0.25 THEN 'Lower-Mid Quartile'
    ELSE 'Bottom Quartile'
  END AS sustainability_band

FROM v_master_state_model_2023_ranked r;
