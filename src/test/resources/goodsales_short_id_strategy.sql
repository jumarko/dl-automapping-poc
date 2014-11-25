CREATE TABLE timeline(
  f__timeline NUMERIC(10,2),
  d__timeline DATE
);
CREATE TABLE activity(
  cp__id VARCHAR(128),
  l__id__subject VARCHAR(128),
  l__id__url VARCHAR(128),
  a__status VARCHAR(128),
  a__type VARCHAR(128)
);
CREATE TABLE opportunity(
  cp__id VARCHAR(128),
  l__id__name VARCHAR(128),
  l__id__url VARCHAR(128),
  r__states VARCHAR(128)
);
CREATE TABLE product(
  cp__id VARCHAR(128),
  l__id__name VARCHAR(128),
  a__product_type VARCHAR(128)
);
CREATE TABLE account(
  cp__id VARCHAR(128),
  l__id__name VARCHAR(128),
  l__id__url VARCHAR(128),
  a__region VARCHAR(128),
  a__accountstage VARCHAR(128),
  a__accountownername VARCHAR(128),
  a__accountindustry VARCHAR(128),
  a__accountemployeecount VARCHAR(128),
  l__accountemployeecount__employeecountsort VARCHAR(128),
  a__accountannualrevenue VARCHAR(128),
  a__accountownersjobrole VARCHAR(128),
  a__accountownersjobtitle VARCHAR(128)
);
CREATE TABLE opp_owner(
  cp__id VARCHAR(128),
  l__id__name VARCHAR(128),
  l__id__url VARCHAR(128),
  l__id__oppownerpicture VARCHAR(128),
  a__region VARCHAR(128),
  a__department VARCHAR(128),
  d__oppownerstart DATE
);
CREATE TABLE activity_owner(
  cp__id VARCHAR(128),
  l__id__name VARCHAR(128),
  l__id__url VARCHAR(128),
  a__region VARCHAR(128),
  a__department VARCHAR(128),
  a__is_sdr VARCHAR(128)
);
CREATE TABLE stage(
  cp__id VARCHAR(128),
  l__id__name VARCHAR(128),
  l__id__order VARCHAR(128),
  a__is_won VARCHAR(128),
  a__status VARCHAR(128),
  a__is_active VARCHAR(128),
  a__is_closed VARCHAR(128),
  a__issao VARCHAR(128),
  a__amconsolidatedstage VARCHAR(128),
  l__amconsolidatedstage__amstageorder VARCHAR(128)
);
CREATE TABLE opp_snapshot(
  f__amount NUMERIC(10,2),
  f__probability NUMERIC(10,2),
  f__created_date NUMERIC(10,2),
  f__close_date NUMERIC(10,2),
  f__snapshot_date NUMERIC(10,2),
  f__mrr NUMERIC(10,2),
  f__distributedmrr NUMERIC(10,2),
  f__effectivecontractstart NUMERIC(10,2),
  f__effectivecontractend NUMERIC(10,2),
  a__accountstagesnapshot VARCHAR(128),
  r__opportunity VARCHAR(128),
  r__product VARCHAR(128),
  r__account VARCHAR(128),
  r__opp_owner VARCHAR(128),
  r__stage VARCHAR(128),
  r__forecast VARCHAR(128),
  r__bookingtype VARCHAR(128),
  r__amounttype VARCHAR(128),
  r__leadsource VARCHAR(128),
  r__leadsourceoriginal VARCHAR(128),
  r__sdrowner VARCHAR(128),
  r__sourcingorigin VARCHAR(128),
  r__productline VARCHAR(128),
  d__oppclose DATE,
  d__oppcreated DATE,
  d__snapshot DATE,
  d__stage1plus DATE,
  d__mqldate DATE,
  d__leadcreate DATE,
  d__effectivecontractstart DATE,
  d__effectivecontractend DATE,
  d__s2o DATE,
  d__stage3opp DATE
);
CREATE TABLE activity_monitoring(
  f__opp_created_date NUMERIC(10,2),
  f__opp_close_date NUMERIC(10,2),
  f__activity_date NUMERIC(10,2),
  r__activity VARCHAR(128),
  r__opportunity VARCHAR(128),
  r__product VARCHAR(128),
  r__account VARCHAR(128),
  r__opp_owner VARCHAR(128),
  r__activity_owner VARCHAR(128),
  r__stage VARCHAR(128),
  r__bookingtype VARCHAR(128),
  d__oppclose DATE,
  d__oppcreated DATE,
  d__activity DATE
);
CREATE TABLE stage_history(
  f__stage_velocity NUMERIC(10,2),
  f__stage_duration NUMERIC(10,2),
  f__opp_created_date NUMERIC(10,2),
  f__opp_close_date NUMERIC(10,2),
  a__currentstatus VARCHAR(128),
  r__opportunity VARCHAR(128),
  r__product VARCHAR(128),
  r__account VARCHAR(128),
  r__opp_owner VARCHAR(128),
  r__stage VARCHAR(128),
  r__bookingtype VARCHAR(128),
  d__oppclose DATE,
  d__oppcreated DATE
);
CREATE TABLE opp_records(
  f__amount NUMERIC(10,2),
  f__probability NUMERIC(10,2),
  f__created_date NUMERIC(10,2),
  f__close_date NUMERIC(10,2),
  f__stage1plus NUMERIC(10,2),
  f__leadcreate NUMERIC(10,2),
  f__mqldate NUMERIC(10,2),
  f__firstcontactdate NUMERIC(10,2),
  f__laststage0plus NUMERIC(10,2),
  f__mrr NUMERIC(10,2),
  f__distributed_mrr NUMERIC(10,2),
  f__freemonths NUMERIC(10,2),
  f__effectivecontractstart NUMERIC(10,2),
  f__effectivecontractend NUMERIC(10,2),
  f__firstmeeting NUMERIC(10,2),
  f__s2o NUMERIC(10,2),
  f__opportunitylost NUMERIC(10,2),
  f__stage3opp NUMERIC(10,2),
  cp__factsof VARCHAR(128),
  l__opp_records_conctn_point VARCHAR(128),
  r__opportunity VARCHAR(128),
  r__product VARCHAR(128),
  r__account VARCHAR(128),
  r__opp_owner VARCHAR(128),
  r__stage VARCHAR(128),
  r__forecast VARCHAR(128),
  r__bookingtype VARCHAR(128),
  r__amounttype VARCHAR(128),
  r__leadsource VARCHAR(128),
  r__leadsourceoriginal VARCHAR(128),
  r__sdrowner VARCHAR(128),
  r__sourcingorigin VARCHAR(128),
  r__leadchannel VARCHAR(128),
  r__renewalstatus VARCHAR(128),
  r__sdrperformancestatus VARCHAR(128),
  r__productline VARCHAR(128),
  r__winlossreason VARCHAR(128),
  d__oppclose DATE,
  d__oppcreated DATE,
  d__stage1plus DATE,
  d__mqldate DATE,
  d__leadcreate DATE,
  d__firstcontactdate DATE,
  d__laststage0plus DATE,
  d__effectivecontractstart DATE,
  d__effectivecontractend DATE,
  d__firstmeeting DATE,
  d__s2o DATE,
  d__opportunitylost DATE,
  d__stage3opp DATE,
  d__winlost DATE
);
CREATE TABLE forecast(
  cp__id VARCHAR(128),
  l__id__forecastcategoryordered VARCHAR(128)
);
CREATE TABLE bookingtype(
  cp__booking_type_id VARCHAR(128),
  l__booking_type_id__booking_type_nm VARCHAR(128)
);
CREATE TABLE goals(
  f__amount NUMERIC(10,2),
  f__mqldate NUMERIC(10,2),
  f__stage1plus NUMERIC(10,2),
  f__oppcreated NUMERIC(10,2),
  f__oppclose NUMERIC(10,2),
  a__quotatype VARCHAR(128),
  r__product VARCHAR(128),
  r__opp_owner VARCHAR(128),
  r__activity_owner VARCHAR(128),
  r__bookingtype VARCHAR(128),
  r__amounttype VARCHAR(128),
  r__sdrowner VARCHAR(128),
  r__sourcingorigin VARCHAR(128),
  d__oppclose DATE,
  d__oppcreated DATE,
  d__activity DATE,
  d__snapshot DATE,
  d__stage1plus DATE,
  d__mqldate DATE,
  d__s2o DATE
);
CREATE TABLE amounttype(
  cp__amounttype VARCHAR(128)
);
CREATE TABLE leadsource(
  cp__leadsource VARCHAR(128),
  a__leadsourcecategory VARCHAR(128)
);
CREATE TABLE leadsourceoriginal(
  cp__leadsourceoriginal VARCHAR(128),
  a__leadcategory VARCHAR(128)
);
CREATE TABLE sdrowner(
  cp__sdrowner VARCHAR(128),
  l__sdrowner__sdrownername VARCHAR(128),
  a__sdrteam VARCHAR(128)
);
CREATE TABLE opp_changes(
  f__amount_changed NUMERIC(10,2),
  f__amount_changed_current_q NUMERIC(10,2),
  f__previous_amount NUMERIC(10,2),
  f__new_amount NUMERIC(10,2),
  f__amount_changed_potential NUMERIC(10,2),
  f__amount_changed_current_q_potential NUMERIC(10,2),
  a__interval_changes VARCHAR(128),
  a__previous_stage VARCHAR(128),
  r__opportunity VARCHAR(128),
  r__product VARCHAR(128),
  r__account VARCHAR(128),
  r__opp_owner VARCHAR(128),
  r__stage VARCHAR(128),
  r__bookingtype VARCHAR(128),
  r__amounttype VARCHAR(128),
  r__productline VARCHAR(128),
  d__oppclose DATE,
  d__previous_close_date DATE
);
CREATE TABLE sourcingorigin(
  cp__techsourcingtype VARCHAR(128),
  a__sourcingtype VARCHAR(128),
  a__sourcingtypechannel VARCHAR(128),
  a__sourcingtypeteam VARCHAR(128),
  l__sourcingtypeteam__sourcingtypeteamname VARCHAR(128)
);
CREATE TABLE leadchannel(
  cp__leadchannel VARCHAR(128)
);
CREATE TABLE renewalstatus(
  cp__renewalstatus VARCHAR(128)
);
CREATE TABLE sdrperformancestatus(
  cp__sdrperformancestatus VARCHAR(128)
);
CREATE TABLE productline(
  cp__productline VARCHAR(128),
  a__productline1 VARCHAR(128),
  a__prod VARCHAR(128),
  a__productorspecificsolution VARCHAR(128)
);
CREATE TABLE opportunityanalysis(
  f__buckets_to_display NUMERIC(10,2),
  f__month_fact NUMERIC(10,2),
  cp__techoppanalysis VARCHAR(128),
  a__month VARCHAR(128),
  l__month__monthsortingnew VARCHAR(128),
  a__cohorttype VARCHAR(128),
  r__opp_records VARCHAR(128),
  r__consolidatedmarketingstatus VARCHAR(128)
);
CREATE TABLE consolidatedmarketingstatus(
  cp__consolidatedmarketingstatus VARCHAR(128),
  l__consolidatedmarketingstatus__mktgstatussorting VARCHAR(128),
  a__detailedmarketingstatuslvl1 VARCHAR(128),
  l__detailedmarketingstatuslvl1__ordersort1 VARCHAR(128),
  a__consolidatedmarketingstatus1 VARCHAR(128),
  l__consolidatedmarketingstatus1__ordersort2 VARCHAR(128),
  a__consolidatedsqltos2o VARCHAR(128),
  l__consolidatedsqltos2o__ordersortsqltos2o VARCHAR(128)
);
CREATE TABLE winlossreason(
  cp__winlossreason VARCHAR(128),
  a__winlossreason1 VARCHAR(128),
  a__secondarywinlossreason VARCHAR(128)
);
CREATE TABLE states(
  cp__stateabbreviation VARCHAR(128),
  a__country VARCHAR(128),
  a__state VARCHAR(128)
);
CREATE TABLE mrranalysis(
  f__mrrendq NUMERIC(10,2),
  f__mrrbeginq NUMERIC(10,2),
  f__mrrupsell NUMERIC(10,2),
  f__mrrdownsell NUMERIC(10,2),
  f__mrrchurn NUMERIC(10,2),
  f__mrrtoberenewed NUMERIC(10,2),
  f__mrrnetnew NUMERIC(10,2),
  f__mrranalysis NUMERIC(10,2),
  a__projecttoken VARCHAR(128),
  l__projecttoken__projecttokenname VARCHAR(128),
  a__quarter VARCHAR(128),
  l__quarter__quarterorder VARCHAR(128),
  a__projecttokenhash VARCHAR(128),
  r__account VARCHAR(128),
  r__opp_owner VARCHAR(128),
  r__bookingtype VARCHAR(128),
  r__renewalstatus VARCHAR(128),
  d__oppclose DATE,
  d__mrranalysis DATE
);
CREATE TABLE campaignhierarchy(
  f__no_members NUMERIC(10,2),
  f__no_responses NUMERIC(10,2),
  f__no_opps NUMERIC(10,2),
  f__amount_opps NUMERIC(10,2),
  f__no_won_opps NUMERIC(10,2),
  f__amount_won_opps NUMERIC(10,2),
  f__actual_cost NUMERIC(10,2),
  f__no_mql NUMERIC(10,2),
  cp__leaf_id VARCHAR(128),
  a__campaignlvl1 VARCHAR(128),
  l__campaignlvl1__campaignlvl1name VARCHAR(128),
  l__campaignlvl1__campaignlvl1url VARCHAR(128),
  a__campaignlvl2 VARCHAR(128),
  l__campaignlvl2__campaignlvl2name VARCHAR(128),
  l__campaignlvl2__campaignlvl2url VARCHAR(128),
  a__campaignlvl3 VARCHAR(128),
  l__campaignlvl3__campaignlvl3name VARCHAR(128),
  l__campaignlvl3__campaignlvl3url VARCHAR(128),
  a__campaignlvl4 VARCHAR(128),
  l__campaignlvl4__campaignlvl4name VARCHAR(128),
  l__campaignlvl4__campaignlvl4url VARCHAR(128),
  a__campaignlvl5 VARCHAR(128),
  l__campaignlvl5__campaignlvl5name VARCHAR(128),
  l__campaignlvl5__campaignlvl5url VARCHAR(128),
  a__campaignstatus VARCHAR(128),
  a__campaigntype VARCHAR(128),
  d__campaignstart DATE,
  d__campaignend DATE
);
CREATE TABLE campaignresults(
  f__campaignmember NUMERIC(10,2),
  f__campaignmember1 NUMERIC(10,2),
  cp__campaign_result_conctn_point VARCHAR(128),
  a__is_primary_campaign VARCHAR(128),
  a__campaign_touch_id VARCHAR(128),
  r__opp_records VARCHAR(128),
  r__campaignhierarchy VARCHAR(128),
  d__campaignmember DATE,
  d__campaignmember1 DATE
);
CREATE TABLE campaigninfluence(
  f__touch_score NUMERIC(10,2),
  f__touch_score_normalized_opp NUMERIC(10,2),
  a__influencetype VARCHAR(128),
  a__touch VARCHAR(128),
  r__opp_records VARCHAR(128),
  r__campaignhierarchy VARCHAR(128),
  d__campaigninfluence DATE
);
