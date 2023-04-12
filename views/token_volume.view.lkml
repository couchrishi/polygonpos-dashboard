view: token_volume {
  derived_table: {
    sql:
      SELECT
        tokens.symbol AS token_symbol,
        SUM(transactions.value) AS transaction_volume,
        AVG(transactions.gas_used * transactions.gas_price) AS transaction_value
      FROM
        `public-data-finance.crypto_polygon.transactions` AS transactions
      LEFT JOIN
        `public-data-finance.crypto_polygon.tokens` AS tokens
      ON
        transactions.to_address = tokens.contract_address
      WHERE
        tokens.symbol IS NOT NULL
      GROUP BY
        token_symbol
      ORDER BY
        transaction_volume DESC ;
    ;;
  }

  dimension: token_symbol {
    type: string
    sql: ${TABLE}.token_symbol ;;
    primary_key: yes
    label: "Token Symbol"
  }

  measure: transaction_volume {
    type: number
    sql: ${TABLE}.transaction_volume ;;
    label: "Transaction Volume"
    value_format_name: "usd"
  }

  measure: transaction_value {
    type: number
    sql: ${TABLE}.transaction_value ;;
    label: "Transaction Value"
    value_format_name: "usd"
  }
}
