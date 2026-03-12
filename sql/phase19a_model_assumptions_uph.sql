-- Phase 19.00: Model assumptions - Units Per Hour (UPH)
-- Purpose:
--   Store throughput scenarios (units per hour) as explicit model inputs
--   for Medicare-baseline outpatient PT economics.
--
-- Author: Tom Nevar
-- Created: 2026-02-11

CREATE TABLE IF NOT EXISTS model_assumptions_uph (
  scenario_key TEXT PRIMARY KEY,
  units_per_hour NUMERIC NOT NULL,
  scenario_notes TEXT
);

INSERT INTO model_assumptions_uph (scenario_key, units_per_hour, scenario_notes) VALUES
('conservative', 3.75, 'Lower throughput: higher complexity/documentation, longer transitions'),
('baseline',     4.25, 'Typical OP PT clinic throughput baseline'),
('high',         4.75, 'High throughput: efficient ops, shorter transitions')
ON CONFLICT (scenario_key) DO UPDATE
SET units_per_hour   = EXCLUDED.units_per_hour,
    scenario_notes   = EXCLUDED.scenario_notes;
