package com.gooddata.dataloading.automapping;

import static org.apache.commons.collections.CollectionUtils.isNotEmpty;
import static org.apache.commons.lang.Validate.notNull;

import com.gooddata.service.model.project.model.PmAttribute;
import com.gooddata.service.model.project.model.PmDataset;
import com.gooddata.service.model.project.model.PmFact;
import com.gooddata.service.model.project.model.PmLabel;
import com.gooddata.service.model.project.model.ProjectModel;

public class IdDdlGenerationStrategy implements DdlGenerationStrategy {

    @Override
    public String generateDdl(ProjectModel projectModel) {
        notNull(projectModel, "projectModel cannot be null!");

        if (isNotEmpty(projectModel.getDatasets())) {
            final PmDataset dataset = projectModel.getDatasets().get(0);

            final String tableName = dataset.getIdentifier();

            final StringBuilder ddlBuilder = new StringBuilder();
            ddlBuilder.append("CREATE TABLE ").append(tableName).append("(");
            ddlBuilder.append("\n");

            // TODO: anchor
//            dataset.getAnchor().getLabels();

            generateFactsDdl(dataset, ddlBuilder);

            generateAttributesDdl(dataset, ddlBuilder);

            // TODO: references
//            dataset.getReferences();

            removeTrailingComma(ddlBuilder);
            ddlBuilder.append(");");

            return ddlBuilder.toString();
        }

        return "";
    }

    private void generateAttributesDdl(PmDataset dataset, StringBuilder ddlBuilder) {
        if (isNotEmpty(dataset.getAttributes())) {
            for (final PmAttribute attribute : dataset.getAttributes()) {
                // only attributes with labels should have a representation in OS because the data
                // are loaded into labels not attributes
                for (PmLabel label : attribute.getLabels()) {
                    ddlBuilder.append("  ")
                    .append(subsituteChars(label.getIdentifier()))
                            // TODO: different data types?
                    .append(" VARCHAR(128)")
                    .append(',')
                    .append('\n');
                }
            }
        }
    }

    private void generateFactsDdl(PmDataset dataset, StringBuilder ddlBuilder) {
        if (isNotEmpty(dataset.getFacts())) {
            for (final PmFact fact : dataset.getFacts()) {
                ddlBuilder.append("  ")
                        .append(subsituteChars(fact.getIdentifier()))
                        .append(" NUMERIC(10,2)")
                        .append(',')
                        .append('\n');
            }
        }
    }

    private String subsituteChars(String identifier) {
        return identifier.replace('.', '_');
    }

    private void removeTrailingComma(StringBuilder ddlBuilder) {
        if (ddlBuilder.toString().endsWith(",\n")) {
            final int lastCommaIndex = ddlBuilder.length() - 2;
            ddlBuilder.deleteCharAt(lastCommaIndex);
        }
    }

}
