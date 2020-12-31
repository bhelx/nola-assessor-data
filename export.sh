mkdir exports
psql nola_assessor_scraper -f export.sql
tar cvzf csv_exports.tar.gz exports/
rm -rf exports

yes | gzip data.sql
