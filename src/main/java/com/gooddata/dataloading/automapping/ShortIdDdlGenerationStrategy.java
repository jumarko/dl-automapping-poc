package com.gooddata.dataloading.automapping;

import static org.apache.commons.collections.CollectionUtils.isNotEmpty;
import static org.apache.commons.lang.StringUtils.substringAfter;
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
    // escaped version to be used in regex
    public static final String LDM_SEPARATOR_ESCAPED = "\\.";

    private static final String FACT_PREFIX = "f" + OS_SEPARATOR;
    private static final String ATTRIBUTE_PREFIX = "a" + OS_SEPARATOR;
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
            generateAttributeDdl(dataset, ddlBuilder, dataset.getAnchor());
        }
    }

    private void generateAttributesDdl(PmDataset dataset, StringBuilder ddlBuilder) {
        for (final PmAttribute attribute : dataset.getAttributes()) {
            // only attributes with labels should have a representation in OS because the data
            // are loaded into labels not attributes
            generateAttributeDdl(dataset, ddlBuilder, attribute);
        }
    }

    private void generateAttributeDdl(PmDataset dataset, StringBuilder ddlBuilder, PmAttribute attribute) {
        // first iteration to find attribute' label such as "label.person.pid"
        for (final PmLabel label : attribute.getLabels()) {
            if (isLabelRepresentingTheAttributeItself(attribute, label)) {
                generateFieldDdl(ddlBuilder,
                        ATTRIBUTE_PREFIX + shortenId(dataset, attribute),
                        "VARCHAR(128)");
            }
        }

        // generate DDL for all other labels
        for (PmLabel label : attribute.getLabels()) {
            if (!isLabelRepresentingTheAttributeItself(attribute, label)) {
                generateFieldDdl(ddlBuilder,
                        generateLabelColumnName(dataset, attribute, label),
                        "VARCHAR(128)");
            }
        }
    }

    private void generateFieldDdl(StringBuilder ddlBuilder, String fieldName, String fieldType) {
        ddlBuilder.append("  ");
        ddlBuilder.append(fieldName);
        ddlBuilder.append(" ").append(fieldType)
                .append(',')
                .append('\n');
    }

    private boolean isLabelRepresentingTheAttributeItself(PmAttribute attribute, PmLabel label) {
        return substringAfter(attribute.getIdentifier(), LDM_SEPARATOR)
                .equals(substringAfter(label.getIdentifier(), LDM_SEPARATOR));
    }

    private void generateFactsDdl(PmDataset dataset, StringBuilder ddlBuilder) {
        for (final PmFact fact : dataset.getFacts()) {
            generateFieldDdl(ddlBuilder,
                    FACT_PREFIX + shortenId(dataset, fact),
                    "NUMERIC(10,2)");
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
                final String[] ldmIdParts = fieldId.split(LDM_SEPARATOR_ESCAPED);
                if (shortenId(parentDataset).equals(ldmIdParts[1])) {
                    shortId = substringAfterLast(fieldId, LDM_SEPARATOR);
                } else {
                    // field has been moved from other dataset (e.g. field "fact.bus.velocity" in "dataset.car"
                    // -> the dataset prefix must be used to distinguish from "fact.car.velocity"
                    shortId = substringAfter(fieldId, LDM_SEPARATOR);
                }
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
                generateFieldDdl(ddlBuilder,
                        DATE_PREFIX + shortId(dataset, reference.getTarget()),
                        "DATE");

            } else {
                generateFieldDdl(ddlBuilder,
                        REF_PREFIX + shortId(dataset, reference.getTarget()),
                        "VARCHAR(128)");
            }
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
