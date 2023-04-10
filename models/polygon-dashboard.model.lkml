# Define the database connection to be used for this model.
connection: "looker-private-demo"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: polygon-dashboard_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: polygon-dashboard_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Polygon-dashboard"

explore: contracts {
  join: contracts__function_sighashes {
    view_label: "Contracts: Function Sighashes"
    sql: LEFT JOIN UNNEST(${contracts.function_sighashes}) as contracts__function_sighashes ;;
    relationship: one_to_many
  }
}

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: traces {}

explore: logs {
  join: logs__topics {
    view_label: "Logs: Topics"
    sql: LEFT JOIN UNNEST(${logs.topics}) as logs__topics ;;
    relationship: one_to_many
  }
}

explore: transactions {
  label: "Polygon PoS Transactions N/w Activity - Tx"
}

explore: tokens {}

explore: token_transfers {}

explore: blocks {
  label: "Polygon PoS Transactions N/w Activity - Blocks"
}
