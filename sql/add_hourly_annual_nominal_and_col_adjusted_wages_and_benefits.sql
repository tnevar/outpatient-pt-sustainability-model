-- add in total compensation package columns and compute values
ALTER TABLE state_financial_inputs
ADD COLUMN annual_pt_comp_benefits NUMERIC,
ADD COLUMN annual_pt_comp_benefits_col_adjusted NUMERIC,
ADD COLUMN hourly_pt_comp_benefits NUMERIC,
ADD COLUMN hourly_pt_comp_benefits_col_adjusted NUMERIC;
        END,
UPDATE state_financial_inputs
SET 
    annual_pt_comp_benefits = estimated_outpatient_pt_salary * 1.25,
    annual_pt_comp_benefits_col_adjusted = col_adjusted_pt_salary * 1.25,
    hourly_pt_comp_benefits = hourly_outpatient_pt_wage * 1.25
    hourly_pt_comp_benefits_adjusted = hourly_outpatient_pt_wage_col_adjusted * 1.25