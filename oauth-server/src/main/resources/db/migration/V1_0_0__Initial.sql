-- oauth2 tables
CREATE TABLE oauth_client_details (
  client_id               VARCHAR(256) PRIMARY KEY,
  resource_ids            VARCHAR(256),
  client_secret           VARCHAR(256),
  scope                   VARCHAR(256),
  authorized_grant_types  VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities             VARCHAR(256),
  access_token_validity   INTEGER,
  refresh_token_validity  INTEGER,
  additional_information  VARCHAR(4096),
  autoapprove             VARCHAR(256)
);

CREATE TABLE oauth_client_token (
  token_id          VARCHAR(256),
  token             BLOB,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name         VARCHAR(256),
  client_id         VARCHAR(256)
);

CREATE TABLE oauth_access_token (
  token_id          VARCHAR(256),
  token             BLOB,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name         VARCHAR(256),
  client_id         VARCHAR(256),
  authentication    BLOB,
  refresh_token     VARCHAR(256)
);

CREATE TABLE oauth_refresh_token (
  token_id       VARCHAR(256),
  token          BLOB,
  authentication BLOB
);

CREATE TABLE oauth_code (
  code           VARCHAR(256),
  authentication BLOB
);

CREATE TABLE oauth_approvals (
  userId         VARCHAR(256),
  clientId       VARCHAR(256),
  scope          VARCHAR(256),
  status         VARCHAR(10),
  expiresAt      TIMESTAMP,
  lastModifiedAt TIMESTAMP
);

-- spring security tables
CREATE TABLE users (
  username VARCHAR(256),
  password VARCHAR(256),
  enabled  BOOLEAN
);

CREATE TABLE authorities (
  username  VARCHAR(256),
  authority VARCHAR(256)
);

-- add client
INSERT INTO oauth_client_details (
  client_id,
  client_secret,
  scope,
  authorized_grant_types,
  authorities,
  resource_ids,
  web_server_redirect_uri
) VALUES ('acme',
          'acmesecret',
          'openid',
          'authorization_code,refresh_token,implicit',
          'ROLE_CLIENT',
          'oauth2-resource',
          'http://localhost:8080/login');

-- add user
INSERT INTO users (
  username,
  password,
  enabled
) VALUES ('user', 'password', TRUE);

INSERT INTO authorities (
  username,
  authority
) VALUES ('user', 'ROLE_USER'),
  ('user', 'ROLE_ADMIN');
