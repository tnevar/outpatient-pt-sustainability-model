INSERT INTO state_financial_inputs (
    state_name,
    state_abbrev,
    hourly_mean_wage,
    estimated_outpatient_pt_salary,
    annual_mean_wage_all_industries,
    rpp_cost_of_living_index
)
SELECT
    sl.state_name,
    sl.state_abbrev,
    swm.hourly_mean_wage,
    swm.estimated_outpatient_pt_salary,
    swm.annual_mean_wage_all_industries,
    rpp.rpp_all_items AS rpp_cost_of_living_index
FROM state_pt_metrics pt
JOIN state_lookup sl
    ON pt.state = sl.state_abbrev
JOIN rpp_state_2023 rpp
    ON sl.state_name = rpp.state_name
JOIN state_wage_metrics swm
    ON sl.state_abbrev = swm.state_abbrev
ORDER BY sl.state_name;