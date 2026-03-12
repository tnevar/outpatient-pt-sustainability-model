ALTER TABLE state_financial_inputs
ADD COLUMN sustainability_tier_adjusted TEXT,
ADD COLUMN pt_capture_tier_adjusted TEXT;

UPDATE state_financial_inputs
SET 
    -- Sustainability tiers (based on sustainability_ratio_adjusted)
    sustainability_tier_adjusted =
        CASE
            WHEN sustainability_ratio_adjusted >= 2.3 THEN 'High Sustainability'
            WHEN sustainability_ratio_adjusted >= 2.1 THEN 'Moderate Sustainability'
            ELSE 'Low Sustainability'
        END,

    -- PT wage capture tiers (based on pt_wage_capture_ratio_adjusted)
    pt_capture_tier_adjusted =
        CASE
            WHEN pt_wage_capture_ratio_adjusted >= 0.50 THEN 'High PT Share'
            WHEN pt_wage_capture_ratio_adjusted >= 0.40 THEN 'Moderate PT Share'
            WHEN pt_wage_capture_ratio_adjusted >= 0.30 THEN 'Low PT Share'
            ELSE 'Very Low PT Share'
        END;