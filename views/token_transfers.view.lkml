# The name of this view in Looker is "Token Transfers"
view: token_transfers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `public-data-finance.crypto_polygon.token_transfers`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Block Hash" in Explore.

  dimension: block_hash {
    type: string
    description: "Hash of the block where this transfer was in"
    sql: ${TABLE}.block_hash ;;
  }

  dimension: block_number {
    type: number
    description: "Block number where this transfer was in"
    sql: ${TABLE}.block_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_block_number {
    type: sum
    sql: ${block_number} ;;
  }

  measure: average_block_number {
    type: average
    sql: ${block_number} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: block_timestamp {
    type: time
    description: "Timestamp of the block where this transfer was in"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.block_timestamp ;;
  }

  dimension: from_address {
    type: string
    description: "Address of the sender"
    sql: ${TABLE}.from_address ;;
  }

  dimension: log_index {
    type: number
    description: "Log index in the transaction receipt"
    sql: ${TABLE}.log_index ;;
  }

  dimension: to_address {
    type: string
    description: "Address of the receiver"
    sql: ${TABLE}.to_address ;;
  }

  dimension: token_address {
    type: string
    description: "ERC20 token address"
    sql: ${TABLE}.token_address ;;
  }

  dimension: transaction_hash {
    type: string
    description: "Transaction hash"
    sql: ${TABLE}.transaction_hash ;;
  }

  dimension: value {
    type: string
    description: "Amount of tokens transferred (ERC20) / id of the token transferred (ERC721). Use safe_cast for casting to NUMERIC or FLOAT64"
    sql: ${TABLE}.value ;;
  }

  measure: total_value_transferred {
    type: sum
    sql: ${TABLE}.value;;
  }

  measure: transfer_count {
    type: count
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
