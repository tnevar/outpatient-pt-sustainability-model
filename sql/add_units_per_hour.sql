ALTER TABLE state_financial_inputs
ADD COLUMN units_per_hour NUMERIC;

UPDATE state_financial_inputs
SET units_per_hour = 3.6;