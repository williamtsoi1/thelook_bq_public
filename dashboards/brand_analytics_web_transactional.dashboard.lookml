- dashboard: brand_analytics_web__transactional
  title: Brand Analytics, Web & Transactional
  layout: newspaper
  description: ''
  embed_style:
    background_color: "#f04141"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: "#556d7a"
  elements:
  - title: Total Orders
    name: Total Orders
    model: thelook_bq
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    sorts: [order_items.order_count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
    row: 0
    col: 16
    width: 8
    height: 3
  - title: Total Customers
    name: Total Customers
    model: thelook_bq
    explore: order_items
    type: single_value
    fields: [users.count]
    sorts: [users.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    note_state: expanded
    note_display: above
    note_text: ''
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
    row: 0
    col: 0
    width: 8
    height: 3
  - title: Average Order Value
    name: Average Order Value
    model: thelook_bq
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    sorts: [order_items.average_sale_price desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
    row: 0
    col: 8
    width: 8
    height: 3
  - title: Brand Traffic by Source, OS
    name: Brand Traffic by Source, OS
    model: thelook_bq
    explore: events
    type: looker_donut_multiples
    fields: [users.traffic_source, events.os, events.count]
    pivots: [users.traffic_source]
    filters:
      users.traffic_source: "-NULL"
    sorts: [events.count desc 1, users.traffic_source]
    limit: 20
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: true
    stacking: ''
    show_value_labels: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false
    font_size: 12
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      Brand Name: product_viewed.brand
      Date: events.event_date
    row: 3
    col: 0
    width: 11
    height: 8
  - title: Top Product Categories - Cart vs Conversion
    name: Top Product Categories - Cart vs Conversion
    model: thelook_bq
    explore: events
    type: looker_column
    fields: [product_viewed.category, sessions.overall_conversion, sessions.cart_to_checkout_conversion,
      sessions.count_cart_or_later]
    filters:
      product_viewed.category: "-NULL"
    sorts: [sessions.count_cart_or_later desc]
    limit: 8
    column_limit: 50
    query_timezone: America/Los_Angeles
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_combined: false
    y_axis_orientation: [right, left]
    show_value_labels: true
    show_view_names: false
    colors: ["#64518A", "#8D7FB9"]
    stacking: ''
    x_axis_gridlines: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label_rotation: -45
    show_x_axis_ticks: true
    x_axis_scale: auto
    series_types:
      sessions.cart_to_checkout_conversion: line
      sessions.overall_conversion: line
    label_density: 25
    legend_position: center
    y_axis_labels: [Cart to Checkout Conversion Percent, Total Added to Cart]
    show_null_labels: false
    label_rotation: 0
    ordering: none
    show_null_points: true
    point_style: circle_outline
    interpolation: linear
    hide_legend: false
    limit_displayed_rows: false
    y_axis_scale_mode: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total Added to Cart, maxValue: !!null '', minValue: !!null '',
        orientation: left, showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: !!null '',
        series: [{id: sessions.count_cart_or_later, name: "(4) Add to Cart or later"}]},
      {label: '', maxValue: !!null '', minValue: !!null '', orientation: right, showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false, valueFormat: !!null '', series: [{id: sessions.overall_conversion,
            name: Overall Conversion}, {id: sessions.cart_to_checkout_conversion,
            name: Cart to Checkout Conversion}]}]
    series_labels:
      sessions.cart_to_checkout_conversion: Cart to Checkout Conversion
      sessions.overall_conversion: Overall Conversion
    listen:
      Brand Name: product_viewed.brand
      Date: events.event_date
    row: 11
    col: 0
    width: 12
    height: 8
  - title: Top Visitors and Transaction History
    name: Top Visitors and Transaction History
    model: thelook_bq
    explore: events
    type: table
    fields: [users.name, users.history, users.state, users.traffic_source, sessions.count]
    filters:
      users.name: "-NULL"
    sorts: [sessions.count desc]
    limit: 50
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Brand Name: product_viewed.brand
      Date: events.event_date
    row: 37
    col: 0
    width: 12
    height: 10
  - title: Sales and Sale Price Trend
    name: Sales and Sale Price Trend
    model: thelook_bq
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.average_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    x_axis_datetime: true
    y_axis_orientation: [left, right]
    y_axis_combined: false
    y_axis_labels: [Total Sale Amount, Average Selling Price]
    hide_points: true
    hide_legend: true
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_points: true
    point_style: none
    interpolation: linear
    colors: ["#F2B431", "#57BEBE"]
    x_axis_label: Order Date
    limit_displayed_rows: false
    y_axis_scale_mode: linear
    color_palette: Custom
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
    row: 27
    col: 12
    width: 12
    height: 10
  - title: Sales by Department and Category
    name: Sales by Department and Category
    model: thelook_bq
    explore: order_items
    type: table
    fields: [products.category, products.department, order_items.count, order_items.total_sale_price]
    pivots: [products.department]
    sorts: [order_items.count desc 1, products.department]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
    row: 37
    col: 12
    width: 12
    height: 10
  - title: Top Purchasers of Brand
    name: Top Purchasers of Brand
    model: thelook_bq
    explore: order_items
    type: table
    fields: [users.name, users.email, users.history, order_items.count, order_items.total_sale_price]
    sorts: [order_items.count desc]
    limit: 15
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Brand Name: products.brand
      Date: order_items.created_date
    row: 11
    col: 12
    width: 12
    height: 8
  - title: Website Sessions by Hour of Day and User Lifetime Order Tier
    name: Website Sessions by Hour of Day and User Lifetime Order Tier
    model: thelook_bq
    explore: events
    type: looker_column
    fields: [user_order_facts.lifetime_orders_tier, sessions.count, events.event_hour_of_day]
    pivots: [user_order_facts.lifetime_orders_tier]
    fill_fields: [events.event_hour_of_day]
    sorts: [user_order_facts.lifetime_orders_tier 0, events.event_hour_of_day]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    stacking: normal
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    label_density: 25
    legend_position: center
    y_axis_combined: true
    colors: ["#2DA5DE", "#57BEBE", "#EA8A2F", "#F2B431", "#64518A", "#8D7FB9", "#7F7977",
      "#B2A898", "#494C52"]
    show_null_labels: false
    ordering: none
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    limit_displayed_rows: false
    y_axis_scale_mode: linear
    hidden_series: [Undefined]
    note_state: collapsed
    note_display: hover
    note_text: this is a note about orders
    listen:
      Brand Name: product_viewed.brand
      Date: events.event_date
    row: 3
    col: 11
    width: 13
    height: 8
  - title: Brand Share of Wallet over Customer Lifetime
    name: Brand Share of Wallet over Customer Lifetime
    model: thelook_bq
    explore: orders_with_share_of_wallet_application
    type: table
    fields: [order_items.months_since_signup, order_items_share_of_wallet.total_sale_price_brand_v2,
      order_facts.is_first_purchase]
    pivots: [order_facts.is_first_purchase]
    filters:
      order_items.months_since_signup: "<=18"
    sorts: [order_items.share_of_wallet_brand_within_company desc 0, order_items.item_comparison,
      order_items.months_since_signup, order_facts.is_first_purchase]
    limit: 2
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    show_value_labels: false
    font_size: 12
    value_labels: legend
    label_type: labPer
    stacking: percent
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    colors: ["#F2B431", "#8D7FB9", "#7F7977", "#B2A898", "#494C52#64518A"]
    y_axis_orientation: [left, right]
    series_types: {}
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Brand Name: order_items_share_of_wallet.brand
    row: 19
    col: 12
    width: 12
    height: 8
  - title: Most Correlated Brands
    name: Most Correlated Brands
    model: thelook_bq
    explore: affinity
    type: looker_line
    fields: [product_b.brand, affinity.avg_order_affinity, affinity.avg_user_affinity,
      affinity.combined_affinity]
    filters:
      affinity.product_b_id: "-NULL"
      affinity.avg_order_affinity: NOT NULL
    sorts: [affinity.combined_affinity desc]
    limit: 15
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    colors: ["#57BEBE", "#EA8A2F", "#F2B431", "#64518A", "#8D7FB9", "#7F7977", "#B2A898",
      "#494C52"]
    color_palette: Custom
    show_null_points: true
    point_style: circle_outline
    hidden_series: [product_a.count, product_b.count]
    interpolation: linear
    hidden_fields: [affinity.combined_affinity]
    listen:
      Brand Name: product_a.brand
    row: 27
    col: 0
    width: 12
    height: 10
  - title: Purchasers of This Brand Also Bought (Brand Affinity)
    name: Purchasers of This Brand Also Bought (Brand Affinity)
    model: thelook_bq
    explore: affinity
    type: table
    fields: [product_a.brand, product_b.brand, affinity.avg_order_affinity, affinity.avg_user_affinity,
      affinity.combined_affinity]
    filters:
      affinity.product_b_id: "-NULL"
      affinity.avg_order_affinity: NOT NULL
    sorts: [affinity.combined_affinity desc]
    limit: 15
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    hidden_fields: [affinity.combined_affinity]
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Brand Name: product_a.brand
    row: 19
    col: 0
    width: 12
    height: 8
  filters:
  - name: Brand Name
    title: Brand Name
    type: field_filter
    default_value: Calvin Klein
    allow_multiple_values: true
    required: false
    model: thelook_bq
    explore: order_items
    listens_to_filters: []
    field: products.brand
  - name: Date
    title: Date
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
