ALTER TABLE state_financial_inputs
ADD COLUMN col_adjusted_reimbursement NUMERIC;

UPDATE state_financial_inputs sfi
SET col_adjusted_reimbursement =
    pt.avg_payment_per_service / (sfi.rpp_cost_of_living_index / 100)
FROM state_pt_metrics pt
WHERE sfi.state_abbrev = pt.state;