# The name of this view in Looker is "Traces"
view: traces {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `public-data-finance.crypto_polygon.traces`
    ;;
  drill_fields: [trace_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: trace_id {
    primary_key: yes
    type: string
    description: "Unique string that identifies the trace. For transaction-scoped traces it is {trace_type}_{transaction_hash}_{trace_address}. For block-scoped traces it is {trace_type}_{block_number}_{index_within_block}"
    sql: ${TABLE}.trace_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Block Hash" in Explore.

  dimension: block_hash {
    type: string
    description: "Hash of the block where this trace was in"
    sql: ${TABLE}.block_hash ;;
  }

  dimension: block_number {
    type: number
    description: "Block number where this trace was in"
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
    description: "Timestamp of the block where this trace was in"
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

  dimension: call_type {
    type: string
    description: "One of call, callcode, delegatecall, staticcall"
    sql: ${TABLE}.call_type ;;
  }

  dimension: error {
    type: string
    description: "Error if message call failed. This field doesn't contain top-level trace errors."
    sql: ${TABLE}.error ;;
  }

  dimension: from_address {
    type: string
    description: "Address of the sender, null when trace_type is genesis or reward"
    sql: ${TABLE}.from_address ;;
  }

  dimension: gas {
    type: number
    description: "Gas provided with the message call"
    sql: ${TABLE}.gas ;;
  }

  dimension: gas_used {
    type: number
    description: "Gas used by the message call"
    sql: ${TABLE}.gas_used ;;
  }

  dimension: input {
    type: string
    description: "The data sent along with the message call"
    sql: ${TABLE}.input ;;
  }

  dimension: output {
    type: string
    description: "The output of the message call, bytecode of contract when trace_type is create"
    sql: ${TABLE}.output ;;
  }

  dimension: reward_type {
    type: string
    description: "One of block, uncle"
    sql: ${TABLE}.reward_type ;;
  }

  dimension: status {
    type: number
    description: "Either 1 (success) or 0 (failure, due to any operation that can cause the call itself or any top-level call to revert)"
    sql: ${TABLE}.status ;;
  }

  dimension: subtraces {
    type: number
    description: "Number of subtraces"
    sql: ${TABLE}.subtraces ;;
  }

  dimension: to_address {
    type: string
    description: "Address of the receiver if trace_type is call, address of new contract or null if trace_type is create, beneficiary address if trace_type is suicide, miner address if trace_type is reward, shareholder address if trace_type is genesis, WithdrawDAO address if trace_type is daofork"
    sql: ${TABLE}.to_address ;;
  }

  dimension: trace_address {
    type: string
    description: "Comma separated list of trace address in call tree"
    sql: ${TABLE}.trace_address ;;
  }

  dimension: trace_type {
    type: string
    description: "One of call, create, suicide, reward, genesis, daofork"
    sql: ${TABLE}.trace_type ;;
  }

  dimension: transaction_hash {
    type: string
    description: "Transaction hash where this trace was in"
    sql: ${TABLE}.transaction_hash ;;
  }

  dimension: transaction_index {
    type: number
    description: "Integer of the transactions index position in the block"
    sql: ${TABLE}.transaction_index ;;
  }

  dimension: value {
    type: string
    description: "Value transferred in Wei"
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [trace_id]
  }
}
