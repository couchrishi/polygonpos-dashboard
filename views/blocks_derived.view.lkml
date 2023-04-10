view: blocks_derived {
  derived_table: {
    sql:
      SELECT
        *,
        timestamp - LAG(timestamp) OVER (ORDER BY timestamp) as block_time
      FROM
         public-data-finance.crypto_polygon.blocks
      ;;
  }

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


  dimension: block_time {
    type: number
    sql: ${TABLE}.block_time;;
    label: "Block Time"
  }

  measure: block_count {
    type: count
    label: "Block Count"
  }

  measure: avg_block_time {
    type: average
    sql: ${block_time};;
    label: "Average Block Time"
  }
}
