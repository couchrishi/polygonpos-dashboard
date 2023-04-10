# The name of this view in Looker is "Blocks"
view: blocks {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `public-data-finance.crypto_polygon.blocks`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Base Fee per Gas" in Explore.

  dimension: base_fee_per_gas {
    type: number
    description: "Protocol base fee per gas, which can move up or down"
    sql: ${TABLE}.base_fee_per_gas ;;
  }

  dimension: difficulty {
    type: number
    description: "Integer of the difficulty for this block"
    sql: ${TABLE}.difficulty ;;
  }

  dimension: extra_data {
    type: string
    description: "The extra data field of this block"
    sql: ${TABLE}.extra_data ;;
  }

  dimension: gas_limit {
    type: number
    description: "The maximum gas allowed in this block"
    sql: ${TABLE}.gas_limit ;;
  }

  dimension: gas_used {
    type: number
    description: "The total used gas by all transactions in this block"
    sql: ${TABLE}.gas_used ;;
  }

  dimension: hash {
    type: string
    description: "Hash of the block"
    sql: ${TABLE}.`hash` ;;
  }

  dimension: logs_bloom {
    type: string
    description: "The bloom filter for the logs of the block"
    sql: ${TABLE}.logs_bloom ;;
  }

  dimension: miner {
    type: string
    description: "The address of the beneficiary to whom the mining rewards were given"
    sql: ${TABLE}.miner ;;
  }

  dimension: nonce {
    type: string
    description: "Hash of the generated proof-of-work"
    sql: ${TABLE}.nonce ;;
  }

  dimension: number {
    type: number
    description: "The block number"
    sql: ${TABLE}.number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number {
    type: sum
    sql: ${number} ;;
  }

  measure: average_number {
    type: average
    sql: ${number} ;;
  }

  dimension: parent_hash {
    type: string
    description: "Hash of the parent block"
    sql: ${TABLE}.parent_hash ;;
  }

  dimension: receipts_root {
    type: string
    description: "The root of the receipts trie of the block"
    sql: ${TABLE}.receipts_root ;;
  }

  dimension: sha3_uncles {
    type: string
    description: "SHA3 of the uncles data in the block"
    sql: ${TABLE}.sha3_uncles ;;
  }

  dimension: size {
    type: number
    description: "The size of this block in bytes"
    sql: ${TABLE}.size ;;
  }

  dimension: state_root {
    type: string
    description: "The root of the final state trie of the block"
    sql: ${TABLE}.state_root ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: timestamp {
    type: time
    description: "The timestamp for when the block was collated"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: total_difficulty {
    type: number
    description: "Integer of the total difficulty of the chain until this block"
    sql: ${TABLE}.total_difficulty ;;
  }

  dimension: transaction_count {
    type: number
    description: "The number of transactions in the block"
    sql: ${TABLE}.transaction_count ;;
  }

  dimension: transactions_root {
    type: string
    description: "The root of the transaction trie of the block"
    sql: ${TABLE}.transactions_root ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
