# Load libraries
library(httr)

# Assign Crypto51 Endpoint to an object
endpoint = 
  "https://www.crypto51.app/coins.json"

# Get a response from the REST API
response = 
  GET(endpoint)

# Halt program and display error warnings
stop_for_status(response)

# Use HTTP default parser for JSON to parse message
body = 
  content(response)

#### Fetch data by coin and create a dataset ####
# Initialize 'i' to 1
i = 1

# Subset nested list corresponding to cryptocurrency
for (i in 1:88) {
  ifelse(TRUE, i > 88)
  
  df = 
    body[[2]][i]
  
  # Flatten list, transform into matrx, and finally transform into dataframe
  df = 
    data.frame(
      matrix(
        unlist(btc),
        byrow = F),
      stringsAsFactors = FALSE)
  
  # Rename the one column of returned dataframe
  colnames(df) = "variable.names"
  
  # Convert long dataframe into short dataframe and append date as a variable
  df = 
    data.frame(
      date = body[[1]],
      symbol = df$variable.names[1],
      name = df$variable.names[2],
      minethecoin_link = df$variable.names[3],
      algorithm = df$variable.names[4],
      market_cap = df$variable.names[5], 
      market_cap_pretty = df$variable.names[6],
      coinmarketcap_rank = df$variable.names[7],
      coinmarketcap_link  = df$variable.names[888],
      hash_rate = df$variable.names[9],
      hash_rate_pretty = df$variable.names[10],
      rentable_capacity = df$variable.names[11], 
      rentable_capacity_pretty = df$variable.names[12],
      nicehash_market_link = df$variable.names[13],
      attack_hourly_cost = df$variable.names[14],
      attack_hourly_cost_pretty = df$variable.names[15],
      network_vs_rentable_ratio = df$variable.names[16],
      rentable_price_btc  = df$variable.names[17],
      rentable_price_units = df$variable.names[18], 
      rentable_price_usd_hour = df$variable.names[19], 
      stringsAsFactors = FALSE)
  
  file = 
    paste0("coin_", "i")
  
  write.csv(df, paste0("~/Crypto51/coin_", i, ".csv"))
  
  i = i + 1
}
