# The name of this view in Looker is "Logs"
view: logs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `public-data-finance.crypto_polygon.logs`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    description: "Address from which this log originated"
    sql: ${TABLE}.address ;;
  }

  dimension: block_hash {
    type: string
    description: "Hash of the block where this log was in"
    sql: ${TABLE}.block_hash ;;
  }

  dimension: block_number {
    type: number
    description: "The block number where this log was in"
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
    description: "Timestamp of the block where this log was in"
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

  dimension: data {
    type: string
    description: "Contains one or more 32 Bytes non-indexed arguments of the log"
    sql: ${TABLE}.data ;;
  }

  dimension: log_index {
    type: number
    description: "Integer of the log index position in the block"
    sql: ${TABLE}.log_index ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: topics {
    hidden: yes
    sql: ${TABLE}.topics ;;
  }

  dimension: transaction_hash {
    type: string
    description: "Hash of the transactions this log was created from"
    sql: ${TABLE}.transaction_hash ;;
  }

  dimension: transaction_index {
    type: number
    description: "Integer of the transactions index position log was created from"
    sql: ${TABLE}.transaction_index ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

# The name of this view in Looker is "Logs Topics"
view: logs__topics {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Logs Topics" in Explore.

  dimension: logs__topics {
    type: string
    description: "Indexed log arguments (0 to 4 32-byte hex strings). (In solidity: The first topic is the hash of the signature of the event (e.g. Deposit(address,bytes32,uint256)), except you declared the event with the anonymous specifier.)"
    sql: logs__topics ;;
  }
}
