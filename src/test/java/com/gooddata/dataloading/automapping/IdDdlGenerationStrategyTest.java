package com.gooddata.dataloading.automapping;

import static java.util.Arrays.asList;
import static org.junit.Assert.assertNotNull;

import com.gooddata.json.abstractobject.JsonObjectMapper;
import com.gooddata.service.model.project.ProjectModelView;
import com.gooddata.service.model.project.model.PmDataset;
import com.gooddata.service.model.project.model.PmDateDimension;
import com.gooddata.service.model.project.model.ProjectModel;
import org.codehaus.jackson.map.ObjectMapper;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;

public class IdDdlGenerationStrategyTest {

    private final ObjectMapper objectMapper = new JsonObjectMapper();

    private DdlGenerationStrategy idStrategy = new IdDdlGenerationStrategy();

    @Test
    public void dummyProjectModel() throws IOException {

        final ProjectModel dummyModel = new ProjectModel(
                asList(
                        new PmDataset("person", "Person", null, null, null, null, null)),
                Collections.<PmDateDimension>emptyList());
        final String dummyDdl = idStrategy.generateDdl(dummyModel);
        assertNotNull("dummyDdl should not be null!", dummyDdl);
    }

    @Test
    public void goodSalesProjectModel() throws IOException {
        final ProjectModelView goodSalesModel = objectMapper.readValue(readResource("goodsales_model.json"), ProjectModelView.class);
        assertNotNull("goodSalesModel should not be null!", goodSalesModel);

        idStrategy.generateDdl(goodSalesModel.getModel());

    }

    private InputStream readResource(String resource) {
        return getClass().getClassLoader().getResourceAsStream(resource);
    }
}