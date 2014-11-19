package com.gooddata.dataloading.automapping;

import static org.apache.commons.collections.CollectionUtils.isNotEmpty;
import static org.apache.commons.lang.Validate.notEmpty;
import static org.apache.commons.lang.Validate.notNull;

import com.gooddata.service.model.project.model.PmAttribute;
import com.gooddata.service.model.project.model.PmDataset;
import com.gooddata.service.model.project.model.PmFact;
import com.gooddata.service.model.project.model.PmLabel;
import com.gooddata.service.model.project.model.PmReference;
import com.gooddata.service.model.project.model.ProjectModel;

public class IdDdlGenerationStrategy implements DdlGenerationStrategy {

    @Override
    public String generateDdl(ProjectModel projectModel) {
        notNull(projectModel, "projectModel cannot be null!");

        final StringBuilder ddlBuilder = new StringBuilder();

        if (isNotEmpty(projectModel.getDatasets())) {
            for (final PmDataset dataset : projectModel.getDatasets()) {
                final String tableName = dataset.getIdentifier();

                ddlBuilder.append("CREATE TABLE ").append(tableName).append("(");
                ddlBuilder.append("\n");

                generateFactsDdl(dataset, ddlBuilder);

                generateAnchorDdl(dataset, ddlBuilder);

                generateAttributesDdl(dataset, ddlBuilder);

                generateReferencesDdl(dataset, ddlBuilder);
                dataset.getReferences();

                removeTrailingComma(ddlBuilder);
                ddlBuilder.append(");\n");
            }
        }

        return ddlBuilder.toString();
    }


    private void generateAnchorDdl(PmDataset dataset, StringBuilder ddlBuilder) {
        if (dataset.getAnchor() != null) {
            for (PmLabel anchorLabel : dataset.getAnchor().getLabels()) {
                ddlBuilder.append("  ")
                        .append(subsituteChars(anchorLabel.getIdentifier()))
                        .append(" VARCHAR(128)")
                        .append(isReferenceKey(anchorLabel) ? " PRIMARY KEY" : "")
                        .append(',')
                        .append('\n');
            }
        }
    }

    private void generateAttributesDdl(PmDataset dataset, StringBuilder ddlBuilder) {
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

    private void generateFactsDdl(PmDataset dataset, StringBuilder ddlBuilder) {
        for (final PmFact fact : dataset.getFacts()) {
            ddlBuilder.append("  ")
                    .append(subsituteChars(fact.getIdentifier()))
                    .append(" NUMERIC(10,2)")
                    .append(',')
                    .append('\n');
        }
    }

    private void generateReferencesDdl(PmDataset dataset, StringBuilder ddlBuilder) {
        for (final PmReference reference : dataset.getReferences()) {
            ddlBuilder.append("  ")
                    .append(subsituteChars(reference.getTarget()))
                    // TODO: how to ensure proper data type?
                    .append(" VARCHAR(128)")
                    .append(',')
                    .append('\n');
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

    /**
     * Simple heuristic to find out, if the LDM field is a reference key. Currently it works
     * only if the "dot" naming convention is used. LDM field is considered as reference key
     * if its name starts with 'label' and consists of three names separated by dots,
     * eg. "label.opportunity.name".
     *
     * @param ldmField LDM field
     * @return whether LDM field is a reference key
     */
    private static boolean isReferenceKey(final PmLabel ldmField) {
        notNull(ldmField, "ldmField cannot be null!");
        final String ldmFieldId = ldmField.getIdentifier();
        notEmpty(ldmFieldId, "ldmField cannot be empty");
        // return true for ldm fields starting with 'label' and having 3 sections separated by dots
        return ldmFieldId.startsWith("label") && ldmFieldId.split("\\.").length == 3;
    }

}
