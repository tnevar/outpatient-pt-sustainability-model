CREATE TABLE state_pt_hrsa_supply_demand (
  	year INT NOT NULL,
	state_name VARCHAR(100) NOT NULL,
    supply INT,
    demand INT,
    PRIMARY KEY (state_name, year)
);