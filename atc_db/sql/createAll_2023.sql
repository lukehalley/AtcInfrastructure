DROP DATABASE IF EXISTS atc;

CREATE DATABASE IF NOT EXISTS atc;

USE atc;

# Networks Table
CREATE TABLE IF NOT EXISTS networks (
  # Keys
  network_id int NOT NULL AUTO_INCREMENT,
  # Fields
  name VARCHAR(64) NOT NULL UNIQUE,
  chain_number int,
  chain_rpc_1 VARCHAR(255),
  chain_rpc_2 VARCHAR(255),
  chain_rpc_3 VARCHAR(255),
  chain_rpc_4 VARCHAR(255),
  chain_rpc_5 VARCHAR(255),
  explorer_api_prefix VARCHAR(255),
  explorer_api_key VARCHAR(255),
  explorer_tx_url VARCHAR(255),
  explorer_type VARCHAR(64),
  gas_symbol VARCHAR(64),
  gas_address VARCHAR(64),
  max_gas DECIMAL,
  min_gas DECIMAL,
  # Timestamp
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  # Key Assignments
  PRIMARY KEY (network_id),
  UNIQUE (name)
);

# Blacklist Networks Table
CREATE TABLE IF NOT EXISTS blacklist_networks (
  # Keys
  blacklist_network_id int NOT NULL AUTO_INCREMENT,
  # Fields
  name VARCHAR(64) NOT NULL UNIQUE,
  chain_number int NOT NULL,
  # Timestamp
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  # Key Assignments
  PRIMARY KEY (blacklist_network_id),
  UNIQUE (name)
);

# Dexs Table
CREATE TABLE IF NOT EXISTS dexs (
  # Keys
  dex_id int NOT NULL AUTO_INCREMENT,
  network_id int NOT NULL,
  # Fields
  name VARCHAR(64),
  router_address VARCHAR(64),
  factory_address VARCHAR(64),
  is_valid BIT,
  # Timestamp
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  # Key Assignments
  PRIMARY KEY (dex_id),
  FOREIGN KEY (network_id) REFERENCES networks(network_id) ON DELETE CASCADE
);

# Tokens Table
CREATE TABLE IF NOT EXISTS tokens (
  # Keys
  token_id int NOT NULL AUTO_INCREMENT,
  network_id int NOT NULL,
  # Fields
  decimals INT NOT NULL,
  symbol VARCHAR(64),
  address VARCHAR(64),
  # Timestamp
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  # Key Assignments
  PRIMARY KEY (token_id),
  FOREIGN KEY (network_id) REFERENCES networks(network_id) ON DELETE CASCADE
);

# Stablecoins Table
CREATE TABLE IF NOT EXISTS stablecoins (
  # Keys
  stablecoin_id int NOT NULL AUTO_INCREMENT,
  network_id int NOT NULL,
  network_name int NOT NULL,
  # Fields
  symbol VARCHAR(64),
  address VARCHAR(64),
  decimals INT NOT NULL,
  # Timestamp
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  # Key Assignments
  PRIMARY KEY (stablecoin_id)
);

# Pairs Table
CREATE TABLE IF NOT EXISTS pairs (
  # Keys
  pair_id int NOT NULL AUTO_INCREMENT,
  token_id int NOT NULL,
  stablecoin_id int NOT NULL,
  network_id int NOT NULL,
  dex_id int NOT NULL,
  # Fields
  name VARCHAR(64) NOT NULL,
  address VARCHAR(640) NOT NULL,
  # Timestamp
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  # Key Assignments
  PRIMARY KEY (pair_id),
  FOREIGN KEY (network_id) REFERENCES networks(network_id) ON DELETE CASCADE,
  FOREIGN KEY (dex_id) REFERENCES dexs(dex_id) ON DELETE CASCADE,
  FOREIGN KEY (token_id) REFERENCES tokens(token_id) ON DELETE CASCADE,
  FOREIGN KEY (stablecoin_id) REFERENCES stablecoins(stablecoin_id) ON DELETE CASCADE,
  UNIQUE KEY unique_network_pair (network_id, address)
);

# Blacklist Pairs Table
CREATE TABLE IF NOT EXISTS blacklist_pairs (
  # Keys
  blacklistpair_id int NOT NULL AUTO_INCREMENT,
  network_id int NOT NULL,
  # Fields
  name VARCHAR(64) NOT NULL,
  address VARCHAR(640) NOT NULL,
  # Timestamp
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  # Key Assignments
  PRIMARY KEY (blacklistpair_id),
  FOREIGN KEY (network_id) REFERENCES networks(network_id) ON DELETE CASCADE,
  UNIQUE KEY unique_network_blacklistpair (network_id, address)
);

# Routes Table
CREATE TABLE IF NOT EXISTS routes (
  # Keys
  route_id int NOT NULL AUTO_INCREMENT,
  network_id int NOT NULL,
  dex_id int NOT NULL,
  pair_id int,
  # Fields
  route VARCHAR(640) NOT NULL,
  method VARCHAR(64),
  transaction_hash VARCHAR(255) NOT NULL,
  amount_in DECIMAL(38, 0),
  amount_out DECIMAL(38, 0),
  # Timestamp
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  # Key Assignments
  PRIMARY KEY (route_id),
  FOREIGN KEY (network_id) REFERENCES networks(network_id) ON DELETE CASCADE,
  FOREIGN KEY (dex_id) REFERENCES dexs(dex_id) ON DELETE CASCADE,
  FOREIGN KEY (pair_id) REFERENCES pairs(pair_id) ON DELETE CASCADE
);