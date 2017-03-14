COPY (SELECT ST_AsText(ST_Transform(lng_lat_point, 4326)) AS wgs84_point, * FROM properties) TO '/Users/ben/code/nola_assessor_data/exports/properties.csv' DELIMITER ',' CSV HEADER;
COPY (SELECT * FROM property_values) TO '/Users/ben/code/nola_assessor_data/exports/values.csv' DELIMITER ',' CSV HEADER;
COPY (SELECT * FROM property_sales) TO '/Users/ben/code/nola_assessor_data/exports/sales.csv' DELIMITER ',' CSV HEADER;
