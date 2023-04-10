# The name of this view in Looker is "Transactions"
view: transactions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `public-data-finance.crypto_polygon.transactions`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Block Hash" in Explore.

  dimension: block_hash {
    type: string
    description: "Hash of the block where this transaction was in"
    sql: ${TABLE}.block_hash ;;
  }

  dimension: block_number {
    type: number
    description: "Block number where this transaction was in"
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
    description: "Timestamp of the block where this transaction was in"
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

  dimension: gas {
    type: number
    description: "Gas provided by the sender"
    sql: ${TABLE}.gas ;;
  }

  dimension: gas_price {
    type: number
    description: "Gas price provided by the sender in Wei"
    sql: ${TABLE}.gas_price ;;
  }

  dimension: hash {
    type: string
    description: "Hash of the transaction"
    sql: ${TABLE}.`hash` ;;
  }

  dimension: input {
    type: string
    description: "The data sent along with the transaction"
    sql: ${TABLE}.input ;;
  }

  dimension: max_fee_per_gas {
    type: number
    description: "Total fee that covers both base and priority fees"
    sql: ${TABLE}.max_fee_per_gas ;;
  }

  dimension: max_priority_fee_per_gas {
    type: number
    description: "Fee given to miners to incentivize them to include the transaction"
    sql: ${TABLE}.max_priority_fee_per_gas ;;
  }

  dimension: nonce {
    type: number
    description: "The number of transactions made by the sender prior to this one"
    sql: ${TABLE}.nonce ;;
  }

  dimension: receipt_contract_address {
    type: string
    description: "The contract address created, if the transaction was a contract creation, otherwise null"
    sql: ${TABLE}.receipt_contract_address ;;
  }

  dimension: receipt_cumulative_gas_used {
    type: number
    description: "The total amount of gas used when this transaction was executed in the block"
    sql: ${TABLE}.receipt_cumulative_gas_used ;;
  }

  dimension: receipt_effective_gas_price {
    type: number
    description: "The actual value per gas deducted from the senders account. Replacement of gas_price after EIP-1559"
    sql: ${TABLE}.receipt_effective_gas_price ;;
  }

  dimension: receipt_gas_used {
    type: number
    description: "The amount of gas used by this specific transaction alone"
    sql: ${TABLE}.receipt_gas_used ;;
  }

  dimension: receipt_root {
    type: string
    description: "32 bytes of post-transaction stateroot (pre Byzantium)"
    sql: ${TABLE}.receipt_root ;;
  }

  dimension: receipt_status {
    type: number
    description: "Either 1 (success) or 0 (failure) (post Byzantium)"
    sql: ${TABLE}.receipt_status ;;
  }

  dimension: to_address {
    type: string
    description: "Address of the receiver. null when its a contract creation transaction"
    sql: ${TABLE}.to_address ;;
  }

  dimension: transaction_index {
    type: number
    description: "Integer of the transactions index position in the block"
    sql: ${TABLE}.transaction_index ;;
  }

  dimension: transaction_type {
    type: number
    description: "Transaction type. One of 0 (Legacy), 1 (Legacy), 2 (EIP-1559)"
    sql: ${TABLE}.transaction_type ;;
  }

  dimension: value {
    type: number
    description: "Value transferred in Wei"
    sql: ${TABLE}.value ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
  measure: avg_gas_used {
    type: average
    sql: ${TABLE}.gas_used ;;
  }


  measure: avg_gas_price {
    type: average
    sql: ${TABLE}.receipt_effective_gas_price ;;
  }

  measure: transaction_count {
    type: count
  }
}
