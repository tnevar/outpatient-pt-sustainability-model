ALTER TABLE state_financial_inputs
ADD COLUMN hourly_reimbursement_adjusted NUMERIC;

UPDATE state_financial_inputs
SET hourly_reimbursement_adjusted =
    col_adjusted_reimbursement * units_per_hour;