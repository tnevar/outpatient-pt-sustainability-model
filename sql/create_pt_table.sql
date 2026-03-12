-- Creates a PT-only subset of the 2023 CMS dataser for faster queries
CREATE TABLE pt_data_2023 AS 
SELECT * 
FROM public.cms_data
WHERE cms_data.rndrng_prvdr_type = 'Physical Therapist in Private Practice'