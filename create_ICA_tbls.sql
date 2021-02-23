-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/zSP7MZ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "apartments" (
    "apartment_id" varchar   NOT NULL,
    "complex_id" integer   NOT NULL,
    "available" boolean   NOT NULL,
    "plan_name" varchar   NOT NULL,
    "apt_type" varchar   NOT NULL,
    "start_price" varchar   NOT NULL,
    "sq_ft" integer   NOT NULL,
    "curr_price" float   NOT NULL,
    "rented_price" float   NOT NULL,
    "list_start_date" date   NOT NULL,
    "available_date" date   NOT NULL,
    "rented_date" date   NOT NULL,
    "city_id" integer   NOT NULL,
    "curr_date" date   NOT NULL,
    CONSTRAINT "pk_apartments" PRIMARY KEY (
        "apartment_id"
     )
);

CREATE TABLE "complex" (
    "complex_id" integer   NOT NULL,
    "complex_name" varchar   NOT NULL,
    "complex_address" varchar   NOT NULL,
    "complex_url" varchar   NOT NULL,
    "city_id" integer   NOT NULL,
    CONSTRAINT "pk_complex" PRIMARY KEY (
        "complex_id"
     )
);

CREATE TABLE "cities" (
    "city_id" integer   NOT NULL,
    "city_name" varchar   NOT NULL,
    "avg_rent" float   NOT NULL,
    "cost_of_living" float   NOT NULL,
    "med_income" float   NOT NULL,
    CONSTRAINT "pk_cities" PRIMARY KEY (
        "city_id"
     )
);

CREATE TABLE "transit" (
    "transit_id" integer   NOT NULL,
    "transit_type" varchar   NOT NULL,
    CONSTRAINT "pk_transit" PRIMARY KEY (
        "transit_id"
     )
);

CREATE TABLE "transit_near_complex" (
    "complex_id" integer   NOT NULL,
    "transit_id" integer   NOT NULL,
    CONSTRAINT "pk_transit_near_complex" PRIMARY KEY (
        "complex_id","transit_id"
     )
);

ALTER TABLE "apartments" ADD CONSTRAINT "fk_apartments_complex_id" FOREIGN KEY("complex_id")
REFERENCES "complex" ("complex_id");

ALTER TABLE "apartments" ADD CONSTRAINT "fk_apartments_city_id" FOREIGN KEY("city_id")
REFERENCES "cities" ("city_id");

ALTER TABLE "complex" ADD CONSTRAINT "fk_complex_city_id" FOREIGN KEY("city_id")
REFERENCES "cities" ("city_id");

ALTER TABLE "transit_near_complex" ADD CONSTRAINT "fk_transit_near_complex_complex_id" FOREIGN KEY("complex_id")
REFERENCES "complex" ("complex_id");

ALTER TABLE "transit_near_complex" ADD CONSTRAINT "fk_transit_near_complex_transit_id" FOREIGN KEY("transit_id")
REFERENCES "transit" ("transit_id");

