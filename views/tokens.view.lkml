# The name of this view in Looker is "Tokens"
view: tokens {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `public-data-finance.crypto_polygon.tokens`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    description: "The address of the ERC20 token"
    sql: ${TABLE}.address ;;
  }

  dimension: block_hash {
    type: string
    description: "Hash of the block where this token was created"
    sql: ${TABLE}.block_hash ;;
  }

  dimension: block_number {
    type: number
    description: "Block number where this token was created"
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
    description: "Timestamp of the block where this token was created"
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

  dimension: decimals {
    type: string
    description: "The number of decimals the token uses. Use safe_cast for casting to NUMERIC or FLOAT64"
    sql: ${TABLE}.decimals ;;
  }

  dimension: name {
    type: string
    description: "The name of the ERC20 token"
    sql: ${TABLE}.name ;;
  }

  dimension: symbol {
    type: string
    description: "The symbol of the ERC20 token"
    sql: ${TABLE}.symbol ;;
  }

  dimension: total_supply {
    type: string
    description: "The total token supply. Use safe_cast for casting to NUMERIC or FLOAT64"
    sql: ${TABLE}.total_supply ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
