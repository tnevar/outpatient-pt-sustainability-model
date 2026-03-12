WITH productivity_assumptions AS (
    SELECT 3.6 AS units_per_hour
)

SELECT
    s.state_name,
    p.units_per_hour,

    -- Hourly reimbursement (nominal and COL-adjusted)
    s.reimbursement_nominal * p.units_per_hour AS hourly_reimbursement_nominal,
    s.col_adjusted_reimbursement * p.units_per_hour AS hourly_reimbursement_adjusted,

    -- Hourly margins (nominal and COL-adjusted)
    (s.reimbursement_nominal * p.units_per_hour) - s.hourly_pt_comp_benefits 
        AS margin_hourly_nominal,

    (s.col_adjusted_reimbursement * p.units_per_hour) - s.hourly_pt_comp_benefits_col_adjusted 
        AS margin_hourly_adjusted,

    -- Sustainability ratios (nominal and COL-adjusted)
    ((s.reimbursement_nominal * p.units_per_hour) - s.hourly_pt_comp_benefits)
        / (s.reimbursement_nominal * p.units_per_hour) 
        AS sustainability_ratio_nominal,

    ((s.col_adjusted_reimbursement * p.units_per_hour) - s.hourly_pt_comp_benefits_col_adjusted)
        / (s.col_adjusted_reimbursement * p.units_per_hour) 
        AS sustainability_ratio_adjusted,

    -- PT Wage Capture Ratio (wage only)
    s.hourly_outpatient_pt_wage
        / (s.reimbursement_nominal * p.units_per_hour)
        AS pt_wage_capture_ratio_nominal,

    s.hourly_outpatient_pt_wage_adjusted
        / (s.col_adjusted_reimbursement * p.units_per_hour)
        AS pt_wage_capture_ratio_adjusted,

    -- PT Compensation Capture Ratio (wage + benefits)
    s.hourly_pt_comp_benefits
        / (s.reimbursement_nominal * p.units_per_hour)
        AS pt_comp_capture_ratio_nominal,

    s.hourly_pt_comp_benefits_col_adjusted
        / (s.col_adjusted_reimbursement * p.units_per_hour)
        AS pt_comp_capture_ratio_adjusted

FROM state_financial_inputs s
CROSS JOIN productivity_assumptions p;