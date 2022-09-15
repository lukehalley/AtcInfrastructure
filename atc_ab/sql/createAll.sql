DROP DATABASE IF EXISTS atc;
CREATE DATABASE IF NOT EXISTS atc;
USE atc;

CREATE TABLE IF NOT EXISTS networks (
  network_id int NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  PRIMARY KEY (network_id)
);

CREATE TABLE IF NOT EXISTS dexs (
  dex_id int NOT NULL AUTO_INCREMENT,
  network_id int NOT NULL,
  name varchar(100) NOT NULL,
  PRIMARY KEY (dex_id),
  FOREIGN KEY (network_id)
      REFERENCES networks(network_id)
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tokens (
  token_id int NOT NULL AUTO_INCREMENT,
  network_id int NOT NULL,
  name varchar(100) NOT NULL,
  address varchar(255),
  PRIMARY KEY (token_id),
  FOREIGN KEY (network_id)
      REFERENCES networks(network_id)
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS pairs (
  pair_id int NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  primary_token_id int NOT NULL,
  secondary_token_id int NOT NULL,
  ranking int NOT NULL,
  price decimal(10,2) NOT NULL,
  liquidity decimal(10,2) NOT NULL,
  volume decimal(10,2) NOT NULL,
  fdv decimal(10,2) NOT NULL,
  PRIMARY KEY (pair_id),
  FOREIGN KEY (primary_token_id)
      REFERENCES tokens(token_id)
      ON DELETE CASCADE,
  FOREIGN KEY (secondary_token_id)
      REFERENCES tokens(token_id)
      ON DELETE CASCADE
);