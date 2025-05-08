set -e

psql -v ON_ERROR_STOP=1 -v "authpass=$AUTH_PG_PASS" -v "therapypass=$THERAPY_PG_PASS" -U "$POSTGRES_USER" -d postgres   <<-EOSQL
    CREATE DATABASE auth;
    CREATE DATABASE therapy;

    CREATE ROLE auth_role;
    GRANT ALL ON DATABASE auth to auth_role;

    CREATE ROLE therapy_role;
    GRANT ALL ON DATABASE therapy to therapy_role;

    CREATE USER auth WITH PASSWORD :'authpass';
    GRANT auth_role to auth;

    CREATE USER therapy WITH PASSWORD :'therapypass';
    GRANT therapy_role to therapy;
EOSQL

