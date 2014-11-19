package com.gooddata.dataloading.automapping;

import com.gooddata.service.model.project.model.ProjectModel;

public interface DdlGenerationStrategy {
    String generateDdl(ProjectModel projectModel);
}
