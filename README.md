# NOLA Tax Assessor Data

This is a postgres database containing tax data on ~160,000 properties in New Orleans. I heard the assessor's office was unwilling
to share the data with the city's open data initiative so I'm releasing it here.  I've scraped this data from the [tax assessor's web site](http://nolaassessor.com/).
Code is available on request.

[Here](http://qpublic9.qpublic.net/la_orleans_display.php?KEY=935-GRAVIERST) is an example page of a single property.

![Screenshot of Assessors Site](screen.png)

## Tables

There are 3 important tables here:

```
public | properties             | table    | ben
public | property_sales         | table    | ben
public | property_values        | table    | ben
```

These roughly correspond to the html tables on the site and the naming is pretty much the same except everything is snake-cased.
Also note that the properties have a `lng_lat_point` field that is a `geometry` type from postgis.

```
nola_assessor_scraper=# \d properties
 id                 | integer                     | not null default nextval('properties_id_seq'::regclass)
 assessor_id        | character varying(255)      |
 owner_name         | text                        |
 land_area_sq_ft    | integer                     |
 location_address   | text                        |
 mailing_address    | text                        |
 property_class     | character varying(255)      |
 municipal_district | character varying(255)      |
 assessment_area    | character varying(255)      |
 tax_bill_number    | character varying(255)      |
 inserted_at        | timestamp without time zone | not null
 updated_at         | timestamp without time zone | not null
 lng_lat_point      | geometry(Point,3452)        |
 parcel_no          | character varying(255)      |

nola_assessor_scraper=# \d property_sales
 id                      | integer                     | not null default nextval('property_sales_id_seq'::regclass)
 property_id             | integer                     |
 date                    | timestamp without time zone |
 price                   | integer                     |
 grantor                 | character varying(255)      |
 grantee                 | character varying(255)      |
 notarial_archive_number | character varying(255)      |
 instrument_number       | character varying(255)      |
 inserted_at             | timestamp without time zone | not null
 updated_at              | timestamp without time zone | not null

nola_assessor_scraper=# \d property_values
 id                        | integer                     | not null default nextval('property_values_id_seq'::regclass)
 property_id               | integer                     |
 year                      | integer                     |
 land_value                | integer                     |
 building_value            | integer                     |
 total_value               | integer                     |
 assessed_land_value       | integer                     |
 assessed_building_value   | integer                     |
 total_assessed_value      | integer                     |
 homestead_exemption_value | integer                     |
 taxable_assessment        | integer                     |
 inserted_at               | timestamp without time zone | not null
 updated_at                | timestamp without time zone | not null
```

## Using

Tip: you'll need postgres with postgis installed

1. Clone this repo.
2. Unzip the sql dump.
3. Restore the database with psql.

```
git clone https://github.com/bhelx/nola-assessor-data.git
cd nola-assessor-data
# You'll need gzip installed to run this
gunzip data.sql.gz
# You may need to change the username here
psql -U postgres nola_assessor_scraper < data.sql
```

You can find csv exports in the `csv_exports` archive.

```
tar xzvf csv_exports.tar.gz
```
