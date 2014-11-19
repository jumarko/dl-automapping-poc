CREATE TABLE timeline(
  timeline__date__ NUMERIC(10,2),
  timeline VARCHAR(128)
);
CREATE TABLE activity(
  activity__activity__subject VARCHAR(128),
  activity__url VARCHAR(128),
  activity VARCHAR(128),
  activity__status VARCHAR(128),
  activity__type VARCHAR(128)
);
CREATE TABLE opportunity(
  opportunity__opp__name VARCHAR(128),
  opportunity__opp__url VARCHAR(128),
  opportunity VARCHAR(128),
  dataset__states VARCHAR(128)
);
CREATE TABLE product(
  product__product__name VARCHAR(128),
  product VARCHAR(128),
  product__type VARCHAR(128)
);
CREATE TABLE account(
  account__account__name VARCHAR(128),
  account__account__url VARCHAR(128),
  account VARCHAR(128),
  account__region VARCHAR(128),
  account__stage VARCHAR(128),
  account__owner__name VARCHAR(128),
  account__industry VARCHAR(128),
  account__employee__count__employee__count__sort VARCHAR(128),
  account__employee__count VARCHAR(128),
  account__annual__revenue VARCHAR(128),
  account__owner__s__job__role VARCHAR(128),
  account__owner__s__job__title VARCHAR(128)
);
CREATE TABLE opp__owner(
  opp__owner__opp__owner__name VARCHAR(128),
  opp__owner__opp__owner__url VARCHAR(128),
  opp__owner__opp__owner__picture VARCHAR(128),
  opp__owner VARCHAR(128),
  opp__owner__region VARCHAR(128),
  opp__owner__department VARCHAR(128),
  oppownerstart VARCHAR(128)
);
CREATE TABLE activity__owner(
  act__owner__act__owner__name VARCHAR(128),
  act__owner__act__owner__url VARCHAR(128),
  act__owner VARCHAR(128),
  act__owner__region VARCHAR(128),
  act__owner__department VARCHAR(128),
  is__sdr VARCHAR(128)
);
CREATE TABLE stage(
  stage__stage__name VARCHAR(128),
  stage__order VARCHAR(128),
  stage VARCHAR(128),
  is__won__ VARCHAR(128),
  status VARCHAR(128),
  is__active__ VARCHAR(128),
  is__closed__ VARCHAR(128),
  is__sao__ VARCHAR(128),
  am__consolidated__stage VARCHAR(128),
  am__consolidated__stage__am__stage__order VARCHAR(128)
);
CREATE TABLE opp__snapshot(
  amount__snapshot NUMERIC(10,2),
  probability__snapshot NUMERIC(10,2),
  opp__created__date__snapshot NUMERIC(10,2),
  opp__close__date__snapshot NUMERIC(10,2),
  opp__snapshot__date__ NUMERIC(10,2),
  straight__line__mrr__snapshot__ NUMERIC(10,2),
  ending__mrr__snapshot__ NUMERIC(10,2),
  opp__contract__start__date__snapshot NUMERIC(10,2),
  opp__contract__end__date__snapshot NUMERIC(10,2),
  account__stage__snapshot__ VARCHAR(128),
  dataset__opportunity VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp__owner VARCHAR(128),
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
CREATE TABLE activity__monitoring(
  opp__created__date__for__activity NUMERIC(10,2),
  opp__close__date__for__activity NUMERIC(10,2),
  activity__date__ NUMERIC(10,2),
  dataset__activity VARCHAR(128),
  dataset__opportunity VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp__owner VARCHAR(128),
  dataset__activity__owner VARCHAR(128),
  dataset__stage VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  oppclose VARCHAR(128),
  oppcreated VARCHAR(128),
  activity VARCHAR(128)
);
CREATE TABLE stage__history(
  stage__velocity NUMERIC(10,2),
  stage__duration NUMERIC(10,2),
  opp__created__date__for__stage__history NUMERIC(10,2),
  opp__close__date__for__stage__history NUMERIC(10,2),
  current__stage VARCHAR(128),
  dataset__opportunity VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp__owner VARCHAR(128),
  dataset__stage VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  oppclose VARCHAR(128),
  oppcreated VARCHAR(128)
);
CREATE TABLE opp__records(
  amount NUMERIC(10,2),
  probability NUMERIC(10,2),
  opp__created__date__ NUMERIC(10,2),
  opp__close__date__ NUMERIC(10,2),
  sao__date__ NUMERIC(10,2),
  lead__created__date__ NUMERIC(10,2),
  mql__date__ NUMERIC(10,2),
  contact__date__ NUMERIC(10,2),
  last__stage__0__plus NUMERIC(10,2),
  straight__line__mrr NUMERIC(10,2),
  ending__mrr NUMERIC(10,2),
  free__months NUMERIC(10,2),
  contract__start__date__ NUMERIC(10,2),
  contract__end__date__ NUMERIC(10,2),
  first__meeting__date__ NUMERIC(10,2),
  s2o__date__ NUMERIC(10,2),
  opp__lost__date__ NUMERIC(10,2),
  s3o__date__ NUMERIC(10,2),
  opp__records__conctn__point VARCHAR(128),
  records__of__opp__records VARCHAR(128),
  dataset__opportunity VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp__owner VARCHAR(128),
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
CREATE TABLE forecast(
  forecast__category__forecast__category__ordered VARCHAR(128),
  forecast__category VARCHAR(128)
);
CREATE TABLE booking__type(
  booking__type VARCHAR(128),
  booking__type__booking__type__nm VARCHAR(128)
);
CREATE TABLE quota(
  quota__amount NUMERIC(10,2),
  mql__date__quota__ NUMERIC(10,2),
  sao__date__quota__ NUMERIC(10,2),
  opp__create__quota__ NUMERIC(10,2),
  opp__close__quota__ NUMERIC(10,2),
  quota__type VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__opp__owner VARCHAR(128),
  dataset__activity__owner VARCHAR(128),
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
CREATE TABLE revenue__type(
  revenue__type VARCHAR(128)
);
CREATE TABLE lead__source(
  lead__source VARCHAR(128),
  lead__source__category VARCHAR(128)
);
CREATE TABLE lead__source__original(
  lead__source__original VARCHAR(128),
  lead__source__original__category VARCHAR(128)
);
CREATE TABLE sdr__owner(
  sdr__owner VARCHAR(128),
  sdr__owner__sdr__owner__name VARCHAR(128),
  sdr__team VARCHAR(128)
);
CREATE TABLE opp__changes(
  amount__changed__expected NUMERIC(10,2),
  amount__changed__current__q__expected NUMERIC(10,2),
  previous__amount NUMERIC(10,2),
  new__amount NUMERIC(10,2),
  amount__changed__potential NUMERIC(10,2),
  amount__changed__current__q__potential NUMERIC(10,2),
  interval__changes VARCHAR(128),
  previous__stage VARCHAR(128),
  dataset__opportunity VARCHAR(128),
  dataset__product VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp__owner VARCHAR(128),
  dataset__stage VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  dataset__amounttype VARCHAR(128),
  dataset__productline VARCHAR(128),
  oppclose VARCHAR(128),
  previous__close__date VARCHAR(128)
);
CREATE TABLE sourcing__type(
  __tech__sourcing__type VARCHAR(128),
  sourcing__type VARCHAR(128),
  sourcing__type__channel VARCHAR(128),
  sourcing__type__team__sourcing__type__team__name VARCHAR(128),
  sourcing__type__team VARCHAR(128)
);
CREATE TABLE lead__channel(
  lead__channel VARCHAR(128)
);
CREATE TABLE renewal__status(
  renewal__status VARCHAR(128)
);
CREATE TABLE sdr__performance__status(
  sdr__performance__status VARCHAR(128)
);
CREATE TABLE product__line(
  __product__line__id__ VARCHAR(128),
  product__line VARCHAR(128),
  primary__pl__solution VARCHAR(128),
  product__or__specific__solution VARCHAR(128)
);
CREATE TABLE opportunity__benchmark(
  buckets__to__display NUMERIC(10,2),
  month__fact NUMERIC(10,2),
  tech__opp__analysis VARCHAR(128),
  month VARCHAR(128),
  month__monthsortingnew VARCHAR(128),
  cohort__type VARCHAR(128),
  dataset__opp__records VARCHAR(128),
  dataset__consolidatedmarketingstatus VARCHAR(128)
);
CREATE TABLE consolidated__marketing__status(
  __tech__consolidated__marketing__status__conctn__point__ VARCHAR(128),
  __tech__consolidated__marketing__status__conctn__point__mktg__status__sorting VARCHAR(128),
  detailed__marketing__status__lvl1__ VARCHAR(128),
  detailed__marketing__status__lvl1__order__sort VARCHAR(128),
  consolidated__marketing__status VARCHAR(128),
  consolidated__marketing__status__order__sort__2 VARCHAR(128),
  consolidated__status__sql__to__s2o VARCHAR(128),
  consolidated__status__sql__to__s2o__order__sort__sql__to__s2o VARCHAR(128)
);
CREATE TABLE win__loss__reason(
  __tech__win__loss__reason VARCHAR(128),
  win__loss__reason VARCHAR(128),
  secondary__win__loss__reason VARCHAR(128)
);
CREATE TABLE states(
  state__code VARCHAR(128),
  country VARCHAR(128),
  state VARCHAR(128)
);
CREATE TABLE mrr__analysis(
  mrr__end__q NUMERIC(10,2),
  mrr__begin__q NUMERIC(10,2),
  mrr__upsell NUMERIC(10,2),
  mrr__downsell NUMERIC(10,2),
  mrr__churn NUMERIC(10,2),
  mrr__to__be__renewed NUMERIC(10,2),
  mrr__net__new NUMERIC(10,2),
  mrr__analysis__date__ NUMERIC(10,2),
  project__token__project__token__name VARCHAR(128),
  project__token VARCHAR(128),
  quarter__quarter__order VARCHAR(128),
  quarter VARCHAR(128),
  project__token__hash VARCHAR(128),
  dataset__account VARCHAR(128),
  dataset__opp__owner VARCHAR(128),
  dataset__bookingtype VARCHAR(128),
  dataset__renewalstatus VARCHAR(128),
  oppclose VARCHAR(128),
  mrranalysis VARCHAR(128)
);
CREATE TABLE campaign__hierarchy(
  no__members NUMERIC(10,2),
  no__responses NUMERIC(10,2),
  no__opps NUMERIC(10,2),
  amount__opps NUMERIC(10,2),
  no__won__opps NUMERIC(10,2),
  amount__won__opps NUMERIC(10,2),
  actual__cost NUMERIC(10,2),
  no__mql NUMERIC(10,2),
  leaf__id VARCHAR(128),
  campaign__lvl1__campaign__lvl1__name VARCHAR(128),
  campaign__lvl1__campaign__lvl1__url VARCHAR(128),
  campaign__lvl1 VARCHAR(128),
  campaign__lvl2__campaign__lvl2__name VARCHAR(128),
  campaign__lvl2__campaign__lvl2__url VARCHAR(128),
  campaign__lvl2 VARCHAR(128),
  campaign__lvl3__campaign__lvl3__name VARCHAR(128),
  campaign__lvl3__campaign__lvl3__url VARCHAR(128),
  campaign__lvl3 VARCHAR(128),
  campaign__lvl4__campaign__lvl4__name VARCHAR(128),
  campaign__lvl4__campaign__lvl4__url VARCHAR(128),
  campaign__lvl4 VARCHAR(128),
  campaign__lvl5__campaign__lvl5__name VARCHAR(128),
  campaign__lvl5__campaign__lvl5__url VARCHAR(128),
  campaign__lvl5 VARCHAR(128),
  campaign__status VARCHAR(128),
  campaign__type VARCHAR(128),
  campaignstart VARCHAR(128),
  campaignend VARCHAR(128)
);
CREATE TABLE campaign__results(
  campaign__member__date__ NUMERIC(10,2),
  campaign__response__date__ NUMERIC(10,2),
  __campaign__result__conctn__point VARCHAR(128),
  is__opp__primary__campaign__ VARCHAR(128),
  campaign__touch__id VARCHAR(128),
  dataset__opp__records VARCHAR(128),
  dataset__campaignhierarchy VARCHAR(128),
  campaignmember VARCHAR(128),
  campaignmember1 VARCHAR(128)
);
CREATE TABLE campaign__influence(
  touch__score NUMERIC(10,2),
  touch__score__normalized__opp NUMERIC(10,2),
  influence__type VARCHAR(128),
  touch__timeframe VARCHAR(128),
  dataset__opp__records VARCHAR(128),
  dataset__campaignhierarchy VARCHAR(128),
  campaigninfluence VARCHAR(128)
);
