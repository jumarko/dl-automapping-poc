package com.gooddata.dataloading.automapping;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.isEmptyString;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

import com.gooddata.json.abstractobject.JsonObjectMapper;
import com.gooddata.service.model.project.ProjectModelView;
import com.gooddata.service.model.project.model.ProjectModel;
import org.apache.commons.io.IOUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;

public class ShortIdDdlGenerationStrategyTest {

    private final ObjectMapper objectMapper = new JsonObjectMapper();

    private DdlGenerationStrategy idStrategy = new ShortIdDdlGenerationStrategy();

    @Test
    public void ddlForEmptyModelShouldBeEmpty() {
        assertThat(idStrategy.generateDdl(new ProjectModel(null, null)), isEmptyString());
    }

    @Test
    public void generateDdlForDatasetWithOneFact() {
        checkGeneratedDdl("person-fact.json",
                "CREATE TABLE person(\n" +
                "  f__age NUMERIC(10,2)\n" +
                ");\n");
    }

    @Test
    public void generateDdlForDatasetWithOneFactAndAttribute() {
        checkGeneratedDdl("person-fact-attribute.json",
                "CREATE TABLE person(\n" +
                "  f__age NUMERIC(10,2),\n" +
                "  a__name VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void generateDdlForDatasetWithOneFactAndAttributeWithMultipleLabels() {
        checkGeneratedDdl("person-fact-attribute-labels.json",
                "CREATE TABLE person(\n" +
                "  f__age NUMERIC(10,2),\n" +
                "  a__pid VARCHAR(128),\n" +
                "  l__pid__name VARCHAR(128),\n" +
                "  l__pid__lastname VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void generateDdlForDatasetWithConnectionPoint() {
        checkGeneratedDdl("person-connection-point.json",
                "CREATE TABLE person(\n" +
                "  f__age NUMERIC(10,2),\n" +
                "  cp__pid VARCHAR(128),\n" +
                "  l__pid__name VARCHAR(128),\n" +
                "  l__pid__lastname VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void generateDdlForLdmWithDateDimension() {
        checkGeneratedDdl("person-date.json",
                "CREATE TABLE person(\n" +
                "  f__age NUMERIC(10,2),\n" +
                "  f__car__velocity NUMERIC(10,2),\n" +
                "  cp__pid VARCHAR(128),\n" +
                "  l__pid__name VARCHAR(128),\n" +
                "  l__pid__lastname VARCHAR(128),\n" +
                "  d__birthdate DATE\n" +
                ");\n");
    }

    @Test
    public void generateDdlForTwoDisconnectedDatasets() {
        checkGeneratedDdl("person-car-disconnected.json",
                "CREATE TABLE person(\n" +
                "  f__age NUMERIC(10,2),\n" +
                "  cp__pid VARCHAR(128),\n" +
                "  l__pid__name VARCHAR(128),\n" +
                "  l__pid__lastname VARCHAR(128)\n" +
                ");\n" +
                "CREATE TABLE car(\n" +
                "  f__velocity NUMERIC(10,2),\n" +
                "  a__brand VARCHAR(128),\n" +
                "  l__brand__name VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void generateDdlForTwoConnectedDatasets() {
        checkGeneratedDdl("person-car-connected.json",
                "CREATE TABLE person(\n" +
                "  f__age NUMERIC(10,2),\n" +
                "  cp__pid VARCHAR(128),\n" +
                "  l__pid__name VARCHAR(128),\n" +
                "  l__pid__lastname VARCHAR(128)\n" +
                ");\n" +
                "CREATE TABLE car(\n" +
                "  f__velocity NUMERIC(10,2),\n" +
                "  a__brand VARCHAR(128),\n" +
                "  l__brand__name VARCHAR(128),\n" +
                "  r__person VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void moveFieldToAnotherDataset() {
        checkGeneratedDdl("person-fact-from-car.json",
                "CREATE TABLE person(\n" +
                "  f__age NUMERIC(10,2),\n" +
                "  f__car__velocity NUMERIC(10,2),\n" +
                "  cp__pid VARCHAR(128),\n" +
                "  l__pid__name VARCHAR(128),\n" +
                "  l__pid__lastname VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void moveMultipleFieldsToAnotherDataset() {
        checkGeneratedDdl("person-fields-from-car.json",
                "CREATE TABLE person(\n" +
                "  f__age NUMERIC(10,2),\n" +
                "  f__car__velocity NUMERIC(10,2),\n" +
                "  cp__pid VARCHAR(128),\n" +
                "  l__pid__name VARCHAR(128),\n" +
                "  l__pid__car__pid__name VARCHAR(128),\n" +
                "  l__pid__lastname VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void goodSalesProjectModel() throws IOException {
        final String goodSalesDdl = idStrategy.generateDdl(readModel("goodsales.json"));
        System.out.println(goodSalesDdl);
        assertThat(goodSalesDdl, is(IOUtils.toString(readResource("goodsales_short_id_strategy.sql"))));
    }


    //--------------------------------------------------- HELPER METHODS -----------------------------------------------

    private void checkGeneratedDdl(String modelJsonPath, String expectedDdl) {
        final String personDdl = idStrategy.generateDdl(readModel(modelJsonPath));
        assertThat(personDdl, is(
                expectedDdl
        ));
    }

    private ProjectModel readModel(String modelJsonPath) {
        final InputStream jsonStream = readResource(modelJsonPath);
        try {
            return objectMapper.readValue(jsonStream, ProjectModelView.class).getModel();
        } catch (IOException e) {
            throw new IllegalStateException("Cannot read model json '" + modelJsonPath + "'", e);
        }
    }

    private InputStream readResource(String modelJsonPath) {
        final InputStream jsonStream = getClass().getClassLoader().getResourceAsStream(modelJsonPath);
        assertNotNull("resource should not be null!", jsonStream);
        return jsonStream;
    }
}