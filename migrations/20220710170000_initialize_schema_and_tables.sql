BEGIN;

CREATE SCHEMA IF NOT EXISTS s3server;

-- For initialization migrations
CREATE TABLE IF NOT EXISTS _initialization_migrations(
    version SERIAL PRIMARY KEY,
    filename TEXT NOT NULL,
    installed_on TIMESTAMPTZ NOT NULL DEFAULT now(),
    md5_hash UUID NOT NULL
);

COMMIT;
