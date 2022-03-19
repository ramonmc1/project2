-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Weather" (
    "City" string   NOT NULL,
    "maximum_temp" float   NOT NULL,
    "minimum_temp" float   NOT NULL,
    "humidity" int   NOT NULL,
    CONSTRAINT "pk_Weather" PRIMARY KEY (
        "City"
     )
);

CREATE TABLE "Cost_of_living" (
    "City" string   NOT NULL,
    "living_index" float   NOT NULL,
    "rent_index" float   NOT NULL,
    "groceries_index" float   NOT NULL,
    "state" string   NOT NULL,
    CONSTRAINT "pk_Cost_of_living" PRIMARY KEY (
        "City","state"
     )
);

CREATE TABLE "Average_Income" (
    "City" string   NOT NULL,
    "State" string   NOT NULL,
    "family_income" double   NOT NULL,
    "nonfamily_income" double   NOT NULL,
    CONSTRAINT "pk_Average_Income" PRIMARY KEY (
        "City","State"
     )
);

ALTER TABLE "Weather" ADD CONSTRAINT "fk_Weather_City" FOREIGN KEY("City")
REFERENCES "Cost_of_living" ("City");

ALTER TABLE "Cost_of_living" ADD CONSTRAINT "fk_Cost_of_living_City_state" FOREIGN KEY("City", "state")
REFERENCES "Average_Income" ("City", "State");

