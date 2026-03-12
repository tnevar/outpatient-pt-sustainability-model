ALTER TABLE state_financial_inputs
ADD COLUMN margin_hourly_nominal NUMERIC,
ADD COLUMN margin_hourly_adjusted NUMERIC;

UPDATE state_financial_inputs
SET margin_hourly_nominal =
        hourly_reimbursement_nominal - hourly_outpatient_pt_wage,
    margin_hourly_adjusted =
        hourly_reimbursement_adjusted - hourly_outpatient_pt_wage_adjusted;