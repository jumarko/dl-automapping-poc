CREATE TABLE dataset__timeline(
  dt__timeline__timeline NUMERIC(10,2),
  timeline VARCHAR(128)
);
CREATE TABLE dataset__activity(
  label__activity__id__subject VARCHAR(128),
  label__activity__id__url VARCHAR(128),
  label__activity__id VARCHAR(128),
  label__activity__status VARCHAR(128),
  label__activity__type VARCHAR(128)
);
CREATE TABLE dataset__opportunity(
  label__opportunity__id__name VARCHAR(128),
  label__opportunity__id__url VARCHAR(128),
  label__opportunity__id VARCHAR(128),
  dataset__states VARCHAR(128)
);
CREATE TABLE dataset__product(
  label__product__id__name VARCHAR(128),
  label__product__id VARCHAR(128),
  label__product__product_type VARCHAR(128)
);
CREATE TABLE dataset__account(
  label__account__id__name VARCHAR(128),
  label__account__id__url VARCHAR(128),
  label__account__id VARCHAR(128),
  label__account__region VARCHAR(128),
  label__account__accountstage VARCHAR(128),
  label__account__accountownername VARCHAR(128),
  label__account__accountindustry VARCHAR(128),
  label__account__accountemployeecount__employeecountsort VARCHAR(128),
  label__account__accountemployeecount VARCHAR(128),
  label__account__accountannualrevenue VARCHAR(128),
  label__account__accountownersjobrole VARCHAR(128),
  label__account__accountownersjobtitle VARCHAR(128)
);
CREATE TABLE dataset__opp_owner(
  label__opp_owner__id__name VARCHAR(128),
  label__opp_owner__id__url VARCHAR(128),
  label__opp_owner__id__oppownerpicture VARCHAR(128),
  label__opp_owner__id VARCHAR(128),
  label__opp_owner__region VARCHAR(128),
  label__opp_owner__department VARCHAR(128),
  oppownerstart VARCHAR(128)
);
CREATE TABLE dataset__activity_owner(
  label__activity_owner__id__name VARCHAR(128),
  label__activity_owner__id__url VARCHAR(128),
  label__activity_owner__id VARCHAR(128),
  label__activity_owner__region VARCHAR(128),
  label__activity_owner__department VARCHAR(128),
  label__activity_owner__is_sdr VARCHAR(128)
);
CREATE TABLE dataset__stage(
  label__stage__id__name VARCHAR(128),
  label__stage__id__order VARCHAR(128),
  label__stage__id VARCHAR(128),
  label__stage__is_won VARCHAR(128),
  label__stage__status VARCHAR(128),
  label__stage__is_active VARCHAR(128),
  label__stage__is_closed VARCHAR(128),
  label__stage__issao VARCHAR(128),
  label__stage__amconsolidatedstage VARCHAR(128),
  label__stage__amconsolidatedstage__amstageorder VARCHAR(128)
);
CREATE TABLE dataset__opp_snapshot(
  fact__opp_snapshot__amount NUMERIC(10,2),
  fact__opp_snapshot__probability NUMERIC(10,2),
  dt__opp_snapshot__created_date NUMERIC(10,2),
  dt__opp_snapshot__close_date NUMERIC(10,2),
  dt__opp_snapshot__snapshot_date NUMERIC(10,2),
  fact__opp_snapshot__mrr NUMERIC(10,2),
  fact__opp_snapshot__distributedmrr NUMERIC(10,2),
  dt__opp_snapshot__effectivecontractstart NUMERIC(10,2),
  dt__opp_snapshot__effectivecontractend NUMERIC(10,2),
  label__opp_snapshot__accountstagesnapshot VARCHAR(128),
  dataset__opportunity VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp_owner VARCHAR(128),
  dataset__stage VARCHAR(128),
  dataset__forecast VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  dataset__amounttype VARCHAR(128),
  dataset__leadsource VARCHAR(128),
  dataset__leadsourceoriginal VARCHAR(128),
  dataset__sdrowner VARCHAR(128),
  dataset__sourcingorigin VARCHAR(128),
  dataset__productline VARCHAR(128),
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
CREATE TABLE dataset__activity_monitoring(
  dt__activity_monitoring__opp_created_date NUMERIC(10,2),
  dt__activity_monitoring__opp_close_date NUMERIC(10,2),
  dt__activity_monitoring__activity_date NUMERIC(10,2),
  dataset__activity VARCHAR(128),
  dataset__opportunity VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp_owner VARCHAR(128),
  dataset__activity_owner VARCHAR(128),
  dataset__stage VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  oppclose VARCHAR(128),
  oppcreated VARCHAR(128),
  activity VARCHAR(128)
);
CREATE TABLE dataset__stage_history(
  fact__stage_history__stage_velocity NUMERIC(10,2),
  fact__stage_history__stage_duration NUMERIC(10,2),
  dt__stage_history__opp_created_date NUMERIC(10,2),
  dt__stage_history__opp_close_date NUMERIC(10,2),
  label__stage_history__currentstatus VARCHAR(128),
  dataset__opportunity VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp_owner VARCHAR(128),
  dataset__stage VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  oppclose VARCHAR(128),
  oppcreated VARCHAR(128)
);
CREATE TABLE dataset__opp_records(
  fact__opp_records__amount NUMERIC(10,2),
  fact__opp_records__probability NUMERIC(10,2),
  dt__opp_records__created_date NUMERIC(10,2),
  dt__opp_records__close_date NUMERIC(10,2),
  dt__opp_records__stage1plus NUMERIC(10,2),
  dt__opp_records__leadcreate NUMERIC(10,2),
  dt__opp_records__mqldate NUMERIC(10,2),
  dt__opp_records__firstcontactdate NUMERIC(10,2),
  dt__opp_records__laststage0plus NUMERIC(10,2),
  fact__opp_records__mrr NUMERIC(10,2),
  fact__opp_records__distributed_mrr NUMERIC(10,2),
  fact__opp_records__freemonths NUMERIC(10,2),
  dt__opp_records__effectivecontractstart NUMERIC(10,2),
  dt__opp_records__effectivecontractend NUMERIC(10,2),
  dt__opp_records__firstmeeting NUMERIC(10,2),
  dt__opp_records__s2o NUMERIC(10,2),
  dt__opp_records__opportunitylost NUMERIC(10,2),
  dt__opp_records__stage3opp NUMERIC(10,2),
  label__opp_records__opp_records_conctn_point VARCHAR(128),
  label__opp_records__factsof VARCHAR(128),
  dataset__opportunity VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp_owner VARCHAR(128),
  dataset__stage VARCHAR(128),
  dataset__forecast VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  dataset__amounttype VARCHAR(128),
  dataset__leadsource VARCHAR(128),
  dataset__leadsourceoriginal VARCHAR(128),
  dataset__sdrowner VARCHAR(128),
  dataset__sourcingorigin VARCHAR(128),
  dataset__leadchannel VARCHAR(128),
  dataset__renewalstatus VARCHAR(128),
  dataset__sdrperformancestatus VARCHAR(128),
  dataset__productline VARCHAR(128),
  dataset__winlossreason VARCHAR(128),
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
CREATE TABLE dataset__forecast(
  label__forecast__id__forecastcategoryordered VARCHAR(128),
  label__forecast__id VARCHAR(128)
);
CREATE TABLE dataset__bookingtype(
  label__bookingtype__booking_type_id VARCHAR(128),
  label__bookingtype__booking_type_id__booking_type_nm VARCHAR(128)
);
CREATE TABLE dataset__goals(
  fact__goals__amount NUMERIC(10,2),
  dt__goals__mqldate NUMERIC(10,2),
  dt__goals__stage1plus NUMERIC(10,2),
  dt__goals__oppcreated NUMERIC(10,2),
  dt__goals__oppclose NUMERIC(10,2),
  label__goals__quotatype VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__opp_owner VARCHAR(128),
  dataset__activity_owner VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  dataset__amounttype VARCHAR(128),
  dataset__sdrowner VARCHAR(128),
  dataset__sourcingorigin VARCHAR(128),
  oppclose VARCHAR(128),
  oppcreated VARCHAR(128),
  activity VARCHAR(128),
  snapshot VARCHAR(128),
  stage1plus VARCHAR(128),
  mqldate VARCHAR(128),
  s2o VARCHAR(128)
);
CREATE TABLE dataset__amounttype(
  label__amounttype__amounttype VARCHAR(128)
);
CREATE TABLE dataset__leadsource(
  label__leadsource__leadsource VARCHAR(128),
  label__leadsource__leadsourcecategory VARCHAR(128)
);
CREATE TABLE dataset__leadsourceoriginal(
  label__leadsourceoriginal__leadsourceoriginal VARCHAR(128),
  label__leadsourceoriginal__leadcategory VARCHAR(128)
);
CREATE TABLE dataset__sdrowner(
  label__sdrowner__sdrowner VARCHAR(128),
  label__sdrowner__sdrowner__sdrownername VARCHAR(128),
  label__sdrowner__sdrteam VARCHAR(128)
);
CREATE TABLE dataset__opp_changes(
  fact__opp_changes__amount_changed NUMERIC(10,2),
  fact__opp_changes__amount_changed_current_q NUMERIC(10,2),
  fact__opp_changes__previous_amount NUMERIC(10,2),
  fact__opp_changes__new_amount NUMERIC(10,2),
  fact__opp_changes__amount_changed_potential NUMERIC(10,2),
  fact__opp_changes__amount_changed_current_q_potential NUMERIC(10,2),
  label__opp_changes__interval_changes VARCHAR(128),
  label__opp_changes__previous_stage VARCHAR(128),
  dataset__opportunity VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp_owner VARCHAR(128),
  dataset__stage VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  dataset__amounttype VARCHAR(128),
  dataset__productline VARCHAR(128),
  oppclose VARCHAR(128),
  previous_close_date VARCHAR(128)
);
CREATE TABLE dataset__sourcingorigin(
  label__sourcingorigin__techsourcingtype VARCHAR(128),
  label__sourcingorigin__sourcingtype VARCHAR(128),
  label__sourcingorigin__sourcingtypechannel VARCHAR(128),
  label__sourcingorigin__sourcingtypeteam__sourcingtypeteamname VARCHAR(128),
  label__sourcingorigin__sourcingtypeteam VARCHAR(128)
);
CREATE TABLE dataset__leadchannel(
  label__leadchannel__leadchannel VARCHAR(128)
);
CREATE TABLE dataset__renewalstatus(
  label__renewalstatus__renewalstatus VARCHAR(128)
);
CREATE TABLE dataset__sdrperformancestatus(
  label__sdrperformancestatus__sdrperformancestatus VARCHAR(128)
);
CREATE TABLE dataset__productline(
  label__productline__productline VARCHAR(128),
  label__productline__productline1 VARCHAR(128),
  label__productline__prod VARCHAR(128),
  label__productline__productorspecificsolution VARCHAR(128)
);
CREATE TABLE dataset__opportunityanalysis(
  fact__opportunityanalysis__buckets_to_display NUMERIC(10,2),
  fact__opportunityanalysis__month_fact NUMERIC(10,2),
  label__opportunityanalysis__techoppanalysis VARCHAR(128),
  label__opportunityanalysis__month VARCHAR(128),
  label__opportunityanalysis__month__monthsortingnew VARCHAR(128),
  label__opportunityanalysis__cohorttype VARCHAR(128),
  dataset__opp_records VARCHAR(128),
  dataset__consolidatedmarketingstatus VARCHAR(128)
);
CREATE TABLE dataset__consolidatedmarketingstatus(
  label__consolidatedmarketingstatus__consolidatedmarketingstatus VARCHAR(128),
  label__consolidatedmarketingstatus__consolidatedmarketingstatus__mktgstatussorting VARCHAR(128),
  label__consolidatedmarketingstatus__detailedmarketingstatuslvl1 VARCHAR(128),
  label__consolidatedmarketingstatus__consolidatedmarketingstatus1__ordersort1 VARCHAR(128),
  label__consolidatedmarketingstatus__consolidatedmarketingstatus1 VARCHAR(128),
  label__consolidatedmarketingstatus__consolidatedmarketingstatus1__ordersort2 VARCHAR(128),
  label__consolidatedmarketingstatus__consolidatedsqltos2o VARCHAR(128),
  label__consolidatedmarketingstatus__consolidatedsqltos2o__ordersortsqltos2o VARCHAR(128)
);
CREATE TABLE dataset__winlossreason(
  label__winlossreason__winlossreason VARCHAR(128),
  label__winlossreason__winlossreason1 VARCHAR(128),
  label__winlossreason__secondarywinlossreason VARCHAR(128)
);
CREATE TABLE dataset__states(
  label__states__stateabbreviation VARCHAR(128),
  label__states__country VARCHAR(128),
  label__states__state VARCHAR(128)
);
CREATE TABLE dataset__mrranalysis(
  fact__mrranalysis__mrrendq NUMERIC(10,2),
  fact__mrranalysis__mrrbeginq NUMERIC(10,2),
  fact__mrranalysis__mrrupsell NUMERIC(10,2),
  fact__mrranalysis__mrrdownsell NUMERIC(10,2),
  fact__mrranalysis__mrrchurn NUMERIC(10,2),
  fact__mrranalysis__mrrtoberenewed NUMERIC(10,2),
  fact__mrranalysis__mrrnetnew NUMERIC(10,2),
  dt__mrranalysis__mrranalysis NUMERIC(10,2),
  label__mrranalysis__projecttoken__projecttokenname VARCHAR(128),
  label__mrranalysis__projecttoken VARCHAR(128),
  label__mrranalysis__quarter__quarterorder VARCHAR(128),
  label__mrranalysis__quarter VARCHAR(128),
  label__mrranalysis__projecttokenhash VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp_owner VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  dataset__renewalstatus VARCHAR(128),
  oppclose VARCHAR(128),
  mrranalysis VARCHAR(128)
);
CREATE TABLE dataset__campaignhierarchy(
  fact__campaignhierarchy__no_members NUMERIC(10,2),
  fact__campaignhierarchy__no_responses NUMERIC(10,2),
  fact__campaignhierarchy__no_opps NUMERIC(10,2),
  fact__campaignhierarchy__amount_opps NUMERIC(10,2),
  fact__campaignhierarchy__no_won_opps NUMERIC(10,2),
  fact__campaignhierarchy__amount_won_opps NUMERIC(10,2),
  fact__campaignhierarchy__actual_cost NUMERIC(10,2),
  fact__campaignhierarchy__no_mql NUMERIC(10,2),
  label__campaignhierarchy__leaf_id VARCHAR(128),
  label__campaignhierarchy__campaignlvl1__campaignlvl1name VARCHAR(128),
  label__campaignhierarchy__campaignlvl1__campaignlvl1url VARCHAR(128),
  label__campaignhierarchy__campaignlvl1 VARCHAR(128),
  label__campaignhierarchy__campaignlvl2__campaignlvl2name VARCHAR(128),
  label__campaignhierarchy__campaignlvl2__campaignlvl2url VARCHAR(128),
  label__campaignhierarchy__campaignlvl2 VARCHAR(128),
  label__campaignhierarchy__campaignlvl3__campaignlvl3name VARCHAR(128),
  label__campaignhierarchy__campaignlvl3__campaignlvl3url VARCHAR(128),
  label__campaignhierarchy__campaignlvl3 VARCHAR(128),
  label__campaignhierarchy__campaignlvl4__campaignlvl4name VARCHAR(128),
  label__campaignhierarchy__campaignlvl4__campaignlvl4url VARCHAR(128),
  label__campaignhierarchy__campaignlvl4 VARCHAR(128),
  label__campaignhierarchy__campaignlvl5__campaignlvl5name VARCHAR(128),
  label__campaignhierarchy__campaignlvl5__campaignlvl5url VARCHAR(128),
  label__campaignhierarchy__campaignlvl5 VARCHAR(128),
  label__campaignhierarchy__campaignstatus VARCHAR(128),
  label__campaignhierarchy__campaigntype VARCHAR(128),
  campaignstart VARCHAR(128),
  campaignend VARCHAR(128)
);
CREATE TABLE dataset__campaignresults(
  dt__campaignresults__campaignmember NUMERIC(10,2),
  dt__campaignresults__campaignmember1 NUMERIC(10,2),
  label__campaignresults__campaign_result_conctn_point VARCHAR(128),
  label__campaignresults__is_primary_campaign VARCHAR(128),
  label__campaignresults__campaign_touch_id VARCHAR(128),
  dataset__opp_records VARCHAR(128),
  dataset__campaignhierarchy VARCHAR(128),
  campaignmember VARCHAR(128),
  campaignmember1 VARCHAR(128)
);
CREATE TABLE dataset__campaigninfluence(
  fact__campaigninfluence__touch_score NUMERIC(10,2),
  fact__campaigninfluence__touch_score_normalized_opp NUMERIC(10,2),
  label__campaigninfluence__influencetype VARCHAR(128),
  label__campaigninfluence__touch VARCHAR(128),
  dataset__opp_records VARCHAR(128),
  dataset__campaignhierarchy VARCHAR(128),
  campaigninfluence VARCHAR(128)
);
