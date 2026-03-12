ALTER TABLE state_financial_inputs
ADD COLUMN sustainability_ratio_nominal NUMERIC,
ADD COLUMN sustainability_ratio_adjusted NUMERIC,
ADD COLUMN pt_wage_capture_ratio_nominal NUMERIC,
ADD COLUMN pt_wage_capture_ratio_adjusted NUMERIC;

UPDATE state_financial_inputs
SET sustainability_ratio_nominal =
        hourly_reimbursement_nominal / hourly_outpatient_pt_wage,
    sustainability_ratio_adjusted =
        hourly_reimbursement_adjusted / hourly_outpatient_pt_wage_adjusted,
    pt_wage_capture_ratio_nominal =
        hourly_outpatient_pt_wage / hourly_reimbursement_nominal,
    pt_wage_capture_ratio_adjusted =
        hourly_outpatient_pt_wage_adjusted / hourly_reimbursement_adjusted;