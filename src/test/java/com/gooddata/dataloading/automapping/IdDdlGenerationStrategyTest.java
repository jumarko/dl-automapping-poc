package com.gooddata.dataloading.automapping;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.isEmptyString;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

import com.gooddata.json.abstractobject.JsonObjectMapper;
import com.gooddata.service.model.project.ProjectModelView;
import com.gooddata.service.model.project.model.ProjectModel;
import org.codehaus.jackson.map.ObjectMapper;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;

public class IdDdlGenerationStrategyTest {

    private final ObjectMapper objectMapper = new JsonObjectMapper();

    private DdlGenerationStrategy idStrategy = new IdDdlGenerationStrategy();

    @Test
    public void ddlForEmptyModelShouldBeEmpty() {
        assertThat(idStrategy.generateDdl(new ProjectModel(null, null)), isEmptyString());
    }

    @Test
    public void generateDdlForDatasetWithOneFact() {
        checkGeneratedDdl("person-fact.json",
                "CREATE TABLE dataset__person(\n" +
                "  fact__person__age NUMERIC(10,2)\n" +
                ");\n");
    }

    @Test
    public void generateDdlForDatasetWithOneFactAndAttribute() {
        checkGeneratedDdl("person-fact-attribute.json",
                "CREATE TABLE dataset__person(\n" +
                "  fact__person__age NUMERIC(10,2),\n" +
                "  label__person__name VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void generateDdlForDatasetWithOneFactAndAttributeWithMultipleLabels() {
        checkGeneratedDdl("person-fact-attribute-labels.json",
                "CREATE TABLE dataset__person(\n" +
                "  fact__person__age NUMERIC(10,2),\n" +
                "  label__person__pid__name VARCHAR(128),\n" +
                "  label__person__pid__lastname VARCHAR(128),\n" +
                        // TODO: it would be nice to have default label generated first but for this POC it doesn't
                        // matter
                "  label__person__pid VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void generateDdlForDatasetWithConnectionPoint() {
        checkGeneratedDdl("person-connection-point.json",
                "CREATE TABLE dataset__person(\n" +
                "  fact__person__age NUMERIC(10,2),\n" +
                "  label__person__pid__name VARCHAR(128),\n" +
                "  label__person__pid__lastname VARCHAR(128),\n" +
                "  label__person__pid VARCHAR(128) PRIMARY KEY\n" +
                ");\n");
    }

    @Test
    public void generateDdlForTwoDisconnectedDatasets() {
        checkGeneratedDdl("person-car-disconnected.json",
                "CREATE TABLE dataset__person(\n" +
                "  fact__person__age NUMERIC(10,2),\n" +
                "  label__person__pid__name VARCHAR(128),\n" +
                "  label__person__pid__lastname VARCHAR(128),\n" +
                "  label__person__pid VARCHAR(128) PRIMARY KEY\n" +
                ");\n" +
                "CREATE TABLE dataset__car(\n" +
                "  fact__car__velocity NUMERIC(10,2),\n" +
                "  label__car__brand__name VARCHAR(128),\n" +
                "  label__car__brand VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void generateDdlForTwoConnectedDatasets() {
        checkGeneratedDdl("person-car-connected.json",
                "CREATE TABLE dataset__person(\n" +
                "  fact__person__age NUMERIC(10,2),\n" +
                "  label__person__pid__name VARCHAR(128),\n" +
                "  label__person__pid__lastname VARCHAR(128),\n" +
                "  label__person__pid VARCHAR(128) PRIMARY KEY\n" +
                ");\n" +
                "CREATE TABLE dataset__car(\n" +
                "  fact__car__velocity NUMERIC(10,2),\n" +
                "  label__car__brand__name VARCHAR(128),\n" +
                "  label__car__brand VARCHAR(128),\n" +
                "  ref__dataset__person VARCHAR(128)\n" +
                ");\n");
    }

    @Test
    public void goodSalesProjectModel() throws IOException {
        final String goodSalesDdl = idStrategy.generateDdl(readModel("goodsales.json"));
        System.out.println(goodSalesDdl);
    }


    //--------------------------------------------------- HELPER METHODS -----------------------------------------------

    private void checkGeneratedDdl(String modelJsonPath, String expectedDdl) {
        final String personDdl = idStrategy.generateDdl(readModel(modelJsonPath));
        assertThat(personDdl, is(
                expectedDdl
        ));
    }

    private ProjectModel readModel(String modelJsonPath) {
        final InputStream jsonStream = getClass().getClassLoader().getResourceAsStream(modelJsonPath);
        assertNotNull("resource should not be null!", jsonStream);
        try {
            return objectMapper.readValue(jsonStream, ProjectModelView.class).getModel();
        } catch (IOException e) {
            throw new IllegalStateException("Cannot read model json '" + modelJsonPath + "'", e);
        }
    }
}