COPY (SELECT ST_AsText(ST_Transform(lng_lat_point, 4326)) AS wgs84_point, * FROM properties) TO '/Users/benjamin.eckel/code/nola-assessor-data/exports/properties.csv' DELIMITER ',' CSV HEADER;
COPY (SELECT * FROM property_values) TO '/Users/benjamin.eckel/code/nola-assessor-data/exports/sales.csv' DELIMITER ',' CSV HEADER;
COPY (SELECT * FROM property_sales) TO '/Users/benjamin.eckel/code/nola-assessor-data/exports/values.csv' DELIMITER ',' CSV HEADER;
