BEGIN;
-- Enable case-insensitive text extension
CREATE EXTENSION IF NOT EXISTS citext;

-- Create Users Table
CREATE TABLE IF NOT EXISTS s3server.users(
    id uuid PRIMARY KEY,
    first_name VARCHAR ( 255 ) NOT NULL,
    last_name VARCHAR ( 255 ) NOT NULL,
    email citext NOT NULL,
    phone VARCHAR ( 32 ) NOT NULL,
    tag VARCHAR ( 255 )
);

-- Create Files Table
CREATE TABLE IF NOT EXISTS s3server.files(
    id uuid PRIMARY KEY,
    owner_id uuid,
    status VARCHAR ( 20 ),
    creation_time timestamptz NOT NULL DEFAULT now(),
    upload_time timestamptz,
    deletion_time timestamptz,
    recover_time timestamptz,
    expiration_time timestamptz,
    share_url VARCHAR ( 2048 ),
    tags VARCHAR ( 255 )[]
);
COMMIT;
