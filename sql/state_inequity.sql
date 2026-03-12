-- Create state-level PT metrics
CREATE TABLE state_pt_metrics AS
SELECT
    rndrng_prvdr_state_abrvtn AS state,
    SUM(tot_srvcs::numeric) AS total_services,
    SUM(tot_benes::numeric) AS total_beneficiaries,
    SUM((tot_srvcs::numeric) * (avg_mdcr_alowd_amt::numeric)) AS total_revenue,
    SUM((tot_srvcs::numeric) * (avg_mdcr_alowd_amt::numeric)) 
        / NULLIF(SUM(tot_srvcs::numeric), 0) AS avg_payment_per_service,
    SUM(tot_srvcs::numeric) 
        / NULLIF(SUM(tot_benes::numeric), 0) AS avg_services_per_beneficiary
FROM pt_data_2023
GROUP BY rndrng_prvdr_state_abrvtn
ORDER BY rndrng_prvdr_state_abrvtn;

-- Join PT metrics to state lookup and RPP
SELECT
    m.state AS state_abbrev,
    s.state_name,
    m.total_services,
    m.total_beneficiaries,
    m.total_revenue,
    m.avg_payment_per_service,
    m.avg_services_per_beneficiary,
    r.rpp_all_items,
    m.avg_payment_per_service / r.rpp_all_items AS inequity_ratio
FROM state_pt_metrics m
JOIN state_lookup s
    ON m.state = s.state_abbrev
JOIN rpp_state_2023 r
    ON r.state_name = s.state_name
ORDER BY inequity_ratio;