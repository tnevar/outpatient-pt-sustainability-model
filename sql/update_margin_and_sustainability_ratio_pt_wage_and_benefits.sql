-- update margin and sustainability ratios to include wage + benefits
UPDATE state_financial_inputs
SET 
    margin_hourly_nominal =
        hourly_reimbursement_nominal - hourly_pt_comp_benefits,
    margin_hourly_adjusted =
        hourly_reimbursement_adjusted - hourly_pt_comp_benefits_col_adjusted,
	
    sustainability_ratio_nominal =
        hourly_reimbursement_nominal / hourly_pt_comp_benefits,
    sustainability_ratio_adjusted =
        hourly_reimbursement_adjusted / hourly_pt_comp_benefits_col_adjusted;