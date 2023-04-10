# The name of this view in Looker is "Contracts"
view: contracts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `public-data-finance.crypto_polygon.contracts`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    description: "Address of the contract"
    sql: ${TABLE}.address ;;
  }

  dimension: block_hash {
    type: string
    description: "Hash of the block where this contract was created"
    sql: ${TABLE}.block_hash ;;
  }

  dimension: block_number {
    type: number
    description: "Block number where this contract was created"
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
    description: "Timestamp of the block where this contract was created"
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

  dimension: bytecode {
    type: string
    description: "Bytecode of the contract"
    sql: ${TABLE}.bytecode ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: function_sighashes {
    hidden: yes
    sql: ${TABLE}.function_sighashes ;;
  }

  dimension: is_erc20 {
    type: yesno
    description: "Whether this contract is an ERC20 contract"
    sql: ${TABLE}.is_erc20 ;;
  }

  dimension: is_erc721 {
    type: yesno
    description: "Whether this contract is an ERC721 contract"
    sql: ${TABLE}.is_erc721 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

}

# The name of this view in Looker is "Contracts Function Sighashes"
view: contracts__function_sighashes {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Contracts Function Sighashes" in Explore.

  dimension: contracts__function_sighashes {
    type: string
    description: "4-byte function signature hashes"
    sql: contracts__function_sighashes ;;
  }

  measure: function_call_count {
    type: count
  }
}
