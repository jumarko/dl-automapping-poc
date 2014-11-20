CREATE TABLE timeline(
  timeline_date_ NUMERIC(10,2),
  timeline VARCHAR(128)
);
CREATE TABLE activity(
  activity__activity_subject VARCHAR(128),
  activity__url VARCHAR(128),
  activity VARCHAR(128),
  activity_status VARCHAR(128),
  activity_type VARCHAR(128)
);
CREATE TABLE opportunity(
  opportunity__opp_name VARCHAR(128),
  opportunity__opp_url VARCHAR(128),
  opportunity VARCHAR(128),
  dataset_states VARCHAR(128)
);
CREATE TABLE product(
  product__product_name VARCHAR(128),
  product VARCHAR(128),
  product_type VARCHAR(128)
);
CREATE TABLE account(
  account__account_name VARCHAR(128),
  account__account_url VARCHAR(128),
  account VARCHAR(128),
  account_region VARCHAR(128),
  account_stage VARCHAR(128),
  account_owner_name VARCHAR(128),
  account_industry VARCHAR(128),
  account_employee_count__employee_count_sort VARCHAR(128),
  account_employee_count VARCHAR(128),
  account_annual_revenue VARCHAR(128),
  account_owner_s_job_role VARCHAR(128),
  account_owner_s_job_title VARCHAR(128)
);
CREATE TABLE opp_owner(
  opp_owner__opp_owner_name VARCHAR(128),
  opp_owner__opp_owner_url VARCHAR(128),
  opp_owner__opp_owner_picture VARCHAR(128),
  opp_owner VARCHAR(128),
  opp_owner_region VARCHAR(128),
  opp_owner_department VARCHAR(128),
  oppownerstart VARCHAR(128)
);
CREATE TABLE activity_owner(
  act_owner__act_owner_name VARCHAR(128),
  act_owner__act_owner_url VARCHAR(128),
  act_owner VARCHAR(128),
  act_owner_region VARCHAR(128),
  act_owner_department VARCHAR(128),
  is_sdr VARCHAR(128)
);
CREATE TABLE stage(
  stage__stage_name VARCHAR(128),
  stage__order VARCHAR(128),
  stage VARCHAR(128),
  is_won_ VARCHAR(128),
  status VARCHAR(128),
  is_active_ VARCHAR(128),
  is_closed_ VARCHAR(128),
  is_sao_ VARCHAR(128),
  am_consolidated_stage VARCHAR(128),
  am_consolidated_stage___am_stage_order VARCHAR(128)
);
CREATE TABLE opp_snapshot(
  amount_snapshot NUMERIC(10,2),
  probability_snapshot NUMERIC(10,2),
  opp_created_date_snapshot NUMERIC(10,2),
  opp_close_date_snapshot NUMERIC(10,2),
  opp_snapshot_date_ NUMERIC(10,2),
  straight_line_mrr_snapshot_ NUMERIC(10,2),
  ending_mrr_snapshot_ NUMERIC(10,2),
  opp_contract_start_date_snapshot NUMERIC(10,2),
  opp_contract_end_date_snapshot NUMERIC(10,2),
  account_stage_snapshot_ VARCHAR(128),
  dataset_opportunity VARCHAR(128),
  dataset_product VARCHAR(128),
  dataset_account VARCHAR(128),
  dataset_opp_owner VARCHAR(128),
  dataset_stage VARCHAR(128),
  dataset_forecast VARCHAR(128),
  dataset_bookingtype VARCHAR(128),
  dataset_amounttype VARCHAR(128),
  dataset_leadsource VARCHAR(128),
  dataset_leadsourceoriginal VARCHAR(128),
  dataset_sdrowner VARCHAR(128),
  dataset_sourcingorigin VARCHAR(128),
  dataset_productline VARCHAR(128),
  oppclose VARCHAR(128),
  oppcreated VARCHAR(128),
  snapshot VARCHAR(128),
  stage1plus VARCHAR(128),
  mqldate VARCHAR(128),
  leadcreate VARCHAR(128),
  effectivecontractstart VARCHAR(128),
  effectivecontractend VARCHAR(128),
  s2o VARCHAR(128),
  stage3opp VARCHAR(128)
);
CREATE TABLE activity_monitoring(
  opp_created_date_for_activity NUMERIC(10,2),
  opp_close_date_for_activity NUMERIC(10,2),
  activity_date_ NUMERIC(10,2),
  dataset_activity VARCHAR(128),
  dataset_opportunity VARCHAR(128),
  dataset_product VARCHAR(128),
  dataset_account VARCHAR(128),
  dataset_opp_owner VARCHAR(128),
  dataset_activity_owner VARCHAR(128),
  dataset_stage VARCHAR(128),
  dataset_bookingtype VARCHAR(128),
  oppclose VARCHAR(128),
  oppcreated VARCHAR(128),
  activity VARCHAR(128)
);
CREATE TABLE stage_history(
  stage_velocity NUMERIC(10,2),
  stage_duration NUMERIC(10,2),
  opp_created_date_for_stage_history NUMERIC(10,2),
  opp_close_date_for_stage_history NUMERIC(10,2),
  current_stage VARCHAR(128),
  dataset_opportunity VARCHAR(128),
  dataset_product VARCHAR(128),
  dataset_account VARCHAR(128),
  dataset_opp_owner VARCHAR(128),
  dataset_stage VARCHAR(128),
  dataset_bookingtype VARCHAR(128),
  oppclose VARCHAR(128),
  oppcreated VARCHAR(128)
);
CREATE TABLE opp_records(
  amount NUMERIC(10,2),
  probability NUMERIC(10,2),
  opp_created_date_ NUMERIC(10,2),
  opp_close_date_ NUMERIC(10,2),
  sao_date_ NUMERIC(10,2),
  lead_created_date_ NUMERIC(10,2),
  mql_date_ NUMERIC(10,2),
  contact_date_ NUMERIC(10,2),
  last_stage_0_plus NUMERIC(10,2),
  straight_line_mrr NUMERIC(10,2),
  ending_mrr NUMERIC(10,2),
  free_months NUMERIC(10,2),
  contract_start_date_ NUMERIC(10,2),
  contract_end_date_ NUMERIC(10,2),
  first_meeting_date_ NUMERIC(10,2),
  s2o_date_ NUMERIC(10,2),
  opp_lost_date_ NUMERIC(10,2),
  s3o_date_ NUMERIC(10,2),
  opp_records_conctn_point VARCHAR(128),
  records_of_opp_records VARCHAR(128),
  dataset_opportunity VARCHAR(128),
  dataset_product VARCHAR(128),
  dataset_account VARCHAR(128),
  dataset_opp_owner VARCHAR(128),
  dataset_stage VARCHAR(128),
  dataset_forecast VARCHAR(128),
  dataset_bookingtype VARCHAR(128),
  dataset_amounttype VARCHAR(128),
  dataset_leadsource VARCHAR(128),
  dataset_leadsourceoriginal VARCHAR(128),
  dataset_sdrowner VARCHAR(128),
  dataset_sourcingorigin VARCHAR(128),
  dataset_leadchannel VARCHAR(128),
  dataset_renewalstatus VARCHAR(128),
  dataset_sdrperformancestatus VARCHAR(128),
  dataset_productline VARCHAR(128),
  dataset_winlossreason VARCHAR(128),
  oppclose VARCHAR(128),
  oppcreated VARCHAR(128),
  stage1plus VARCHAR(128),
  mqldate VARCHAR(128),
  leadcreate VARCHAR(128),
  firstcontactdate VARCHAR(128),
  laststage0plus VARCHAR(128),
  effectivecontractstart VARCHAR(128),
  effectivecontractend VARCHAR(128),
  firstmeeting VARCHAR(128),
  s2o VARCHAR(128),
  opportunitylost VARCHAR(128),
  stage3opp VARCHAR(128),
  winlost VARCHAR(128)
);
CREATE TABLE forecast(
  forecast_category__forecast_category_ordered VARCHAR(128),
  forecast_category VARCHAR(128)
);
CREATE TABLE booking_type(
  booking_type VARCHAR(128),
  booking_type__booking_type_nm VARCHAR(128)
);
CREATE TABLE quota(
  quota_amount NUMERIC(10,2),
  mql_date_quota_ NUMERIC(10,2),
  sao_date_quota_ NUMERIC(10,2),
  opp_create_quota_ NUMERIC(10,2),
  opp_close_quota_ NUMERIC(10,2),
  quota_type VARCHAR(128),
  dataset_product VARCHAR(128),
  dataset_opp_owner VARCHAR(128),
  dataset_activity_owner VARCHAR(128),
  dataset_bookingtype VARCHAR(128),
  dataset_amounttype VARCHAR(128),
  dataset_sdrowner VARCHAR(128),
  dataset_sourcingorigin VARCHAR(128),
  oppclose VARCHAR(128),
  oppcreated VARCHAR(128),
  activity VARCHAR(128),
  snapshot VARCHAR(128),
  stage1plus VARCHAR(128),
  mqldate VARCHAR(128),
  s2o VARCHAR(128)
);
CREATE TABLE revenue_type(
  revenue_type VARCHAR(128)
);
CREATE TABLE lead_source(
  lead_source VARCHAR(128),
  lead_source_category VARCHAR(128)
);
CREATE TABLE lead_source_original(
  lead_source_original VARCHAR(128),
  lead_source_original_category VARCHAR(128)
);
CREATE TABLE sdr_owner(
  sdr_owner VARCHAR(128),
  sdr_owner__sdr_owner_name VARCHAR(128),
  sdr_team VARCHAR(128)
);
CREATE TABLE opp_changes(
  amount_changed_expected NUMERIC(10,2),
  amount_changed_current_q_expected NUMERIC(10,2),
  previous_amount NUMERIC(10,2),
  new_amount NUMERIC(10,2),
  amount_changed_potential NUMERIC(10,2),
  amount_changed_current_q_potential NUMERIC(10,2),
  interval_changes VARCHAR(128),
  previous_stage VARCHAR(128),
  dataset_opportunity VARCHAR(128),
  dataset_product VARCHAR(128),
  dataset_account VARCHAR(128),
  dataset_opp_owner VARCHAR(128),
  dataset_stage VARCHAR(128),
  dataset_bookingtype VARCHAR(128),
  dataset_amounttype VARCHAR(128),
  dataset_productline VARCHAR(128),
  oppclose VARCHAR(128),
  previous_close_date VARCHAR(128)
);
CREATE TABLE sourcing_type(
  _tech_sourcing_type VARCHAR(128),
  sourcing_type VARCHAR(128),
  sourcing_type_channel VARCHAR(128),
  sourcing_type_team__sourcing_type_team_name VARCHAR(128),
  sourcing_type_team VARCHAR(128)
);
CREATE TABLE lead_channel(
  lead_channel VARCHAR(128)
);
CREATE TABLE renewal_status(
  renewal_status VARCHAR(128)
);
CREATE TABLE sdr_performance_status(
  sdr_performance_status VARCHAR(128)
);
CREATE TABLE product_line(
  _product_line_id_ VARCHAR(128),
  product_line VARCHAR(128),
  primary_pl_solution VARCHAR(128),
  product_or_specific_solution VARCHAR(128)
);
CREATE TABLE opportunity_benchmark(
  buckets_to_display NUMERIC(10,2),
  month_fact NUMERIC(10,2),
  tech_opp_analysis VARCHAR(128),
  month VARCHAR(128),
  month__monthsortingnew VARCHAR(128),
  cohort_type VARCHAR(128),
  dataset_opp_records VARCHAR(128),
  dataset_consolidatedmarketingstatus VARCHAR(128)
);
CREATE TABLE consolidated_marketing_status(
  _tech_consolidated_marketing_status_conctn_point_ VARCHAR(128),
  _tech_consolidated_marketing_status_conctn_point____mktg_status_sorting VARCHAR(128),
  detailed_marketing_status_lvl1_ VARCHAR(128),
  detailed_marketing_status_lvl1____order_sort VARCHAR(128),
  consolidated_marketing_status VARCHAR(128),
  consolidated_marketing_status__order_sort_2 VARCHAR(128),
  consolidated_status_sql_to_s2o VARCHAR(128),
  consolidated_status_sql_to_s2o__order_sort_sql_to_s2o VARCHAR(128)
);
CREATE TABLE win_loss_reason(
  _tech_win_loss_reason VARCHAR(128),
  win_loss_reason VARCHAR(128),
  secondary_win_loss_reason VARCHAR(128)
);
CREATE TABLE states(
  state_code VARCHAR(128),
  country VARCHAR(128),
  state VARCHAR(128)
);
CREATE TABLE mrr_analysis(
  mrr_end_q NUMERIC(10,2),
  mrr_begin_q NUMERIC(10,2),
  mrr_upsell NUMERIC(10,2),
  mrr_downsell NUMERIC(10,2),
  mrr_churn NUMERIC(10,2),
  mrr_to_be_renewed NUMERIC(10,2),
  mrr_net_new NUMERIC(10,2),
  mrr_analysis_date_ NUMERIC(10,2),
  project_token__project_token_name VARCHAR(128),
  project_token VARCHAR(128),
  quarter__quarter_order VARCHAR(128),
  quarter VARCHAR(128),
  project_token_hash VARCHAR(128),
  dataset_account VARCHAR(128),
  dataset_opp_owner VARCHAR(128),
  dataset_bookingtype VARCHAR(128),
  dataset_renewalstatus VARCHAR(128),
  oppclose VARCHAR(128),
  mrranalysis VARCHAR(128)
);
CREATE TABLE campaign_hierarchy(
  no_members NUMERIC(10,2),
  no_responses NUMERIC(10,2),
  no_opps NUMERIC(10,2),
  amount_opps NUMERIC(10,2),
  no_won_opps NUMERIC(10,2),
  amount_won_opps NUMERIC(10,2),
  actual_cost NUMERIC(10,2),
  no_mql NUMERIC(10,2),
  leaf_id VARCHAR(128),
  campaign_lvl1__campaign_lvl1_name VARCHAR(128),
  campaign_lvl1__campaign_lvl1_url VARCHAR(128),
  campaign_lvl1 VARCHAR(128),
  campaign_lvl2__campaign_lvl2_name VARCHAR(128),
  campaign_lvl2__campaign_lvl2_url VARCHAR(128),
  campaign_lvl2 VARCHAR(128),
  campaign_lvl3__campaign_lvl3_name VARCHAR(128),
  campaign_lvl3__campaign_lvl3_url VARCHAR(128),
  campaign_lvl3 VARCHAR(128),
  campaign_lvl4__campaign_lvl4_name VARCHAR(128),
  campaign_lvl4__campaign_lvl4_url VARCHAR(128),
  campaign_lvl4 VARCHAR(128),
  campaign_lvl5__campaign_lvl5_name VARCHAR(128),
  campaign_lvl5__campaign_lvl5_url VARCHAR(128),
  campaign_lvl5 VARCHAR(128),
  campaign_status VARCHAR(128),
  campaign_type VARCHAR(128),
  campaignstart VARCHAR(128),
  campaignend VARCHAR(128)
);
CREATE TABLE campaign_results(
  campaign_member_date_ NUMERIC(10,2),
  campaign_response_date_ NUMERIC(10,2),
  _campaign_result_conctn_point VARCHAR(128),
  is_opp_primary_campaign_ VARCHAR(128),
  campaign_touch_id VARCHAR(128),
  dataset_opp_records VARCHAR(128),
  dataset_campaignhierarchy VARCHAR(128),
  campaignmember VARCHAR(128),
  campaignmember1 VARCHAR(128)
);
CREATE TABLE campaign_influence(
  touch_score NUMERIC(10,2),
  touch_score_normalized_opp NUMERIC(10,2),
  influence_type VARCHAR(128),
  touch_timeframe VARCHAR(128),
  dataset_opp_records VARCHAR(128),
  dataset_campaignhierarchy VARCHAR(128),
  campaigninfluence VARCHAR(128)
);
