ALTER TABLE state_financial_inputs
ADD COLUMN hourly_outpatient_pt_wage NUMERIC;

UPDATE state_financial_inputs
SET hourly_outpatient_pt_wage = estimated_outpatient_pt_salary / 2080;