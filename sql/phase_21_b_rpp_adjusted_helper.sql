CREATE OR REPLACE VIEW v_tableau_state_model_rpp_adjusted_helper AS
SELECT
  *,
  -- 1) PT comp share (%) under RPP-adjusted revenue
wage_revenue_ratio_rpp_adjusted * 100.0  AS pt_comp_share_pct_rpp,

  -- 2) Remaining margin share (%) under RPP-adjusted revenue
(margin_per_hour_rpp_adjusted / NULLIF(revenue_per_hour_rpp_adjusted,0)) * 100.0 AS non_pt_margin_share_pct_rpp
FROM v_tableau_state_model_rpp_adjusted;