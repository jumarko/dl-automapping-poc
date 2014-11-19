package com.gooddata.dataloading.automapping;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
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
    public void generateDdlForSimpleDatasetWithOneFactAndAttribute() throws IOException {

        final String personDdl = idStrategy.generateDdl(readModel("person_model.json"));

        assertThat(personDdl, not(isEmptyString()));
        assertThat(personDdl, is("CREATE TABLE person"));
    }



    @Test
    public void goodSalesProjectModel() throws IOException {
        idStrategy.generateDdl(readModel("goodsales_model.json"));

    }


    //--------------------------------------------------- HELPER METHODS -----------------------------------------------

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