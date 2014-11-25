package com.gooddata.dataloading.automapping;

import static org.apache.commons.collections.CollectionUtils.isNotEmpty;
import static org.apache.commons.lang.StringUtils.substringAfterLast;
import static org.apache.commons.lang.Validate.notNull;

import com.gooddata.service.model.project.model.HasIdentifier;
import com.gooddata.service.model.project.model.PmAttribute;
import com.gooddata.service.model.project.model.PmDataset;
import com.gooddata.service.model.project.model.PmDateDimension;
import com.gooddata.service.model.project.model.PmFact;
import com.gooddata.service.model.project.model.PmLabel;
import com.gooddata.service.model.project.model.PmReference;
import com.gooddata.service.model.project.model.ProjectModel;

public class ShortIdDdlGenerationStrategy implements DdlGenerationStrategy {

    public static final String OS_SEPARATOR = "__";
    public static final String LDM_SEPARATOR = ".";

    private static final String FACT_PREFIX = "f" + OS_SEPARATOR;
    private static final String LABEL_PREFIX = "l" + OS_SEPARATOR;
    private static final String DATE_PREFIX = "d" + OS_SEPARATOR;
    private static final String REF_PREFIX = "r" + OS_SEPARATOR;

    @Override
    public String generateDdl(ProjectModel projectModel) {
        notNull(projectModel, "projectModel cannot be null!");

        final StringBuilder ddlBuilder = new StringBuilder();

        if (isNotEmpty(projectModel.getDatasets())) {
            for (final PmDataset dataset : projectModel.getDatasets()) {
                final String tableName = shortenId(dataset);

                ddlBuilder.append("CREATE TABLE ").append(tableName).append("(");
                ddlBuilder.append("\n");

                generateFactsDdl(dataset, ddlBuilder);

                generateAnchorDdl(dataset, ddlBuilder);

                generateAttributesDdl(dataset, ddlBuilder);

                generateReferencesDdl(projectModel, dataset, ddlBuilder);

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
                        .append(generateLabelColumnName(dataset, dataset.getAnchor(), anchorLabel))
                        .append(" VARCHAR(128)")
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
                        .append(generateLabelColumnName(dataset, attribute, label))
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
                    .append(FACT_PREFIX).append(shortenId(dataset, fact))
                    .append(" NUMERIC(10,2)")
                    .append(',')
                    .append('\n');
        }
    }

    private String generateLabelColumnName(PmDataset dataset, PmAttribute attribute, PmLabel label) {
        return TitleDdlGenerationStrategy.isReferenceKey(label)
                ? LABEL_PREFIX + shortenId(dataset, label)
                : LABEL_PREFIX + shortenId(dataset, attribute) + OS_SEPARATOR + shortenId(dataset, label);
    }

    private String shortenId(HasIdentifier field) {
        notNull(field, "field cannot be null!");
        final String id = field.getIdentifier();
        return shortId(null, id);
    }

    private String shortenId(PmDataset dataset, HasIdentifier field) {
        notNull(field, "field cannot be null!");
        final String id = field.getIdentifier();
        return shortId(dataset, id);
    }

    private String shortId(PmDataset parentDataset, String fieldId) {
        if (fieldId == null || fieldId.length() == 0){
            return "";
        }

        final String shortId;
        if (fieldId.contains(LDM_SEPARATOR)) {
            if (parentDataset != null) {
                // check if field id conforms to the dataset to which the field belongs
                shortId = substringAfterLast(fieldId, LDM_SEPARATOR);
            } else {
                shortId = substringAfterLast(fieldId, LDM_SEPARATOR);

            }
        } else {
            shortId = fieldId;
        }

        return subsituteChars(shortId);
    }


    private void generateReferencesDdl(ProjectModel projectModel, PmDataset dataset, StringBuilder ddlBuilder) {
        for (final PmReference reference : dataset.getReferences()) {
            if (isDateDimensionReference(projectModel, reference)) {
                ddlBuilder.append("  ")
                        .append(DATE_PREFIX).append(shortId(dataset, reference.getTarget()))
                        .append(" DATE");

            } else {
                ddlBuilder.append("  ")
                        .append(REF_PREFIX).append(shortId(dataset, reference.getTarget()))
                        // TODO: how to ensure proper data type?
                        .append(" VARCHAR(128)");
            }
            ddlBuilder.append(',').append('\n');
        }
    }

    private boolean isDateDimensionReference(ProjectModel projectModel, PmReference reference) {
        notNull(projectModel, "projectModel cannot be null!");
        notNull(reference, "reference cannot be null!");

        for (final PmDateDimension dateDimension : projectModel.getDateDimensions()) {
            if (reference.getTarget().equals(dateDimension.getName())) {
                return true;
            }
        }

        return false;
    }

    private String subsituteChars(String identifier) {
        return identifier.replace(LDM_SEPARATOR, OS_SEPARATOR);
    }

    private void removeTrailingComma(StringBuilder ddlBuilder) {
        if (ddlBuilder.toString().endsWith(",\n")) {
            final int lastCommaIndex = ddlBuilder.length() - 2;
            ddlBuilder.deleteCharAt(lastCommaIndex);
        }
    }


}
