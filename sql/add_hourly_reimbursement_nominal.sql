ALTER TABLE state_financial_inputs
ADD COLUMN hourly_reimbursement_nominal NUMERIC;

UPDATE state_financial_inputs sfi
SET hourly_reimbursement_nominal =
    pt.avg_payment_per_service * sfi.units_per_hour
FROM state_pt_metrics pt
WHERE sfi.state_abbrev = pt.state;