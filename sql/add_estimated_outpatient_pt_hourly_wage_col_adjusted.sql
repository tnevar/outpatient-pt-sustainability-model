ALTER TABLE state_financial_inputs
ADD COLUMN hourly_outpatient_pt_wage_adjusted NUMERIC;

UPDATE state_financial_inputs
SET hourly_outpatient_pt_wage_adjusted =
    col_adjusted_pt_salary / 2080;