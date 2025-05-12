psql -v ON_ERROR_STOP=1 -v "therapypass=$THERAPY_PG_PASS" -U "$POSTGRES_USER" -d postgres   <<-EOSQL
    CREATE DATABASE therapy;

    CREATE ROLE therapy_role;
    ALTER DATABASE therapy OWNER TO therapy_role;

    CREATE USER therapy WITH PASSWORD :'therapypass';
    GRANT therapy_role to therapy;
EOSQL
