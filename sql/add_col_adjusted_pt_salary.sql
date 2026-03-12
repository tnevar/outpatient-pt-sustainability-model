ALTER TABLE state_financial_inputs
ADD COLUMN col_adjusted_pt_salary NUMERIC;

UPDATE state_financial_inputs
SET col_adjusted_pt_salary =
    estimated_outpatient_pt_salary / (rpp_cost_of_living_index / 100);