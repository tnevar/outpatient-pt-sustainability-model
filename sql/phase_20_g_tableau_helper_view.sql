CREATE VIEW v_tableau_state_model_helper AS
SELECT 
* ,
wage_revenue_ratio * 100  AS pt_comp_share_pct
(margin_per_hour / NULLIF(revenue_per_hour, 0)) * 100 AS non_pt_margin_share_pct
FROM v_tableau_state_model  