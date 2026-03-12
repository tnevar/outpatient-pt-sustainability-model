WITH state_summary AS (
    SELECT
        rndrng_prvdr_state_abrvtn AS state,
        SUM(CAST(tot_srvcs AS numeric)) AS total_services,
        SUM(CAST(tot_benes AS numeric)) AS total_beneficiaries,
        SUM(CAST(avg_mdcr_pymt_amt AS numeric) * CAST(tot_srvcs AS numeric)) AS total_revenue,
        SUM(CAST(avg_mdcr_pymt_amt AS numeric) * CAST(tot_srvcs AS numeric))
            / SUM(CAST(tot_srvcs AS numeric)) AS avg_payment_per_service,
        SUM(CAST(tot_srvcs AS numeric))
            / SUM(CAST(tot_benes AS numeric)) AS avg_services_per_beneficiary
    FROM pt_data_2023
    GROUP BY state
)
SELECT *
FROM state_summary
ORDER BY state;