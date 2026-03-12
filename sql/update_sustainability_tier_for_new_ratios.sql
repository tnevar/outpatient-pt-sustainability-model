UPDATE state_financial_inputs
SET sustainability_tier_adjusted =
    CASE
        WHEN sustainability_ratio_adjusted >= 1.95 THEN 'High Sustainability'
        WHEN sustainability_ratio_adjusted >= 1.75 THEN 'Moderate Sustainability'
        ELSE 'Low Sustainability'
    END;