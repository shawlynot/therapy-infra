set -e

psql -v ON_ERROR_STOP=1 -v "zitadelpass=$ZITADEL_PG_PASS" -v "therapypass=$THERAPY_PG_PASS" -v "stalwart=$STALWART_PG_PASS" -U "$POSTGRES_USER" -d postgres   <<-EOSQL
    CREATE DATABASE zitadel;
    CREATE DATABASE therapy;
    CREATE DATABASE stalwart;

    CREATE ROLE zitadel_role;
    GRANT ALL ON DATABASE zitadel to zitadel_role;

    CREATE ROLE therapy_role;
    GRANT ALL ON DATABASE therapy to therapy_role;

    CREATE ROLE stalwart_role;
    GRANT ALL ON DATABASE stalwart to stalwart_role;    

    CREATE USER zitadel WITH PASSWORD :'zitadelpass';
    GRANT zitadel_role to zitadel;

    CREATE USER therapy WITH PASSWORD :'therapypass';
    GRANT therapy_role to therapy;

    CREATE USER stalwart WITH PASSWORD :'stalwart';
    GRANT stalwart_role to stalwart;
EOSQL

