# Dataloading POC for automapping strategies

## Strategies
Two main approaches are ID-based and title-based ID mapping strategies:

The good start is to check unit tests for this strategies:
 * [__ShortIdDdlGenerationStrategyTest__](src/test/java/com/gooddata/dataloading/automapping/ShortIdDdlGenerationStrategyTest.java)
 * [IdDdlGenerationStrategyTest](src/test/java/com/gooddata/dataloading/automapping/IdDdlGenerationStrategyTest.java)
 * [TitleDdlGenerationStrategyTest](src/test/java/com/gooddata/dataloading/automapping/TitleDdlGenerationStrategyTest.java)


 ## GoodSales 3.0
 The real world project [GoodSales 3.0 model](src/test/resources/goodsales.json) converted to the DDL statements (very imperfect but basic idea should be
 demonstrable):
  * [__Short ID based DDL__](src/test/resources/goodsales_short_id_strategy.sql) - short IDs
  * [ID based DDL](src/test/resources/goodsales_id_strategy.sql) - full IDs
  * [title based DDL](src/test/resources/goodsales_title_strategy.sql) - current approach used in code is definitely
   incorrect since we are not able to properly distinguish between attribute and label.

