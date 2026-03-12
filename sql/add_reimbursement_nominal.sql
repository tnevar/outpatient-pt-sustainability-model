ALTER TABLE state_financial_inputs
ADD COLUMN reimbursement_nominal NUMERIC;

UPDATE state_financial_inputs sfi
SET reimbursement_nominal = pt.avg_payment_per_service
FROM state_pt_metrics pt
WHERE sfi.state_abbrev = pt.state;