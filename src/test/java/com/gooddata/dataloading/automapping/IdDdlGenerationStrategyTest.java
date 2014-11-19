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
    public void generateDdlForDatasetWithOneFact() throws IOException {
        checkGeneratedDdl("person_fact.json",
                "CREATE TABLE dataset.person(\n" +
                "  fact_person_age NUMERIC(10,2)\n" +
                ");");
    }

    @Test
    public void generateDdlForDatasetWithOneFactAndAttribute() throws IOException {
        checkGeneratedDdl("person_fact_attribute.json",
                "CREATE TABLE dataset.person(\n" +
                "  fact_person_age NUMERIC(10,2),\n" +
                "  label_person_name VARCHAR(128)\n" +
                ");");
    }



    @Test
    public void goodSalesProjectModel() throws IOException {
        idStrategy.generateDdl(readModel("goodsales.json"));
        // TODO:
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