package com.gooddata.dataloading.automapping;

import static org.apache.commons.collections.CollectionUtils.isNotEmpty;
import static org.apache.commons.lang.Validate.notNull;

import com.gooddata.service.model.project.model.HasIdentifier;
import com.gooddata.service.model.project.model.PmAttribute;
import com.gooddata.service.model.project.model.PmDataset;
import com.gooddata.service.model.project.model.PmFact;
import com.gooddata.service.model.project.model.PmLabel;
import com.gooddata.service.model.project.model.PmReference;
import com.gooddata.service.model.project.model.ProjectModel;
import org.apache.commons.lang.StringUtils;

public class ShortIdDdlGenerationStrategy implements DdlGenerationStrategy {

    public static final String SEPARATOR = "__";

    private static final String FACT_PREFIX = "f" + SEPARATOR;
    private static final String LABEL_PREFIX = "l" + SEPARATOR;
    private static final String DATE_PREFIX = "d" + SEPARATOR;
    private static final String REF_PREFIX = "r" + SEPARATOR;

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

                generateReferencesDdl(dataset, ddlBuilder);

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
                        .append(generateLabelColumnName(dataset.getAnchor(), anchorLabel))
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
                        .append(generateLabelColumnName(attribute, label))
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
                    .append(FACT_PREFIX).append(shortenId(fact))
                    .append(" NUMERIC(10,2)")
                    .append(',')
                    .append('\n');
        }
    }

    private String generateLabelColumnName(PmAttribute attribute, PmLabel label) {
        return TitleDdlGenerationStrategy.isReferenceKey(label)
                ? LABEL_PREFIX + shortenId(label)
                : LABEL_PREFIX + shortenId(attribute) + SEPARATOR + shortenId(label);
    }

    private String shortenId(HasIdentifier field) {
        notNull(field, "field cannot be null!");
        final String id = field.getIdentifier();
        return shortId(id);
    }

    private String shortId(String id) {
        if (id == null || id.length() == 0){
            return "";
        }
        return subsituteChars(StringUtils.substringAfterLast(id, "."));
    }

    private void generateReferencesDdl(PmDataset dataset, StringBuilder ddlBuilder) {
        for (final PmReference reference : dataset.getReferences()) {
            ddlBuilder.append("  ")
                    .append(REF_PREFIX).append(shortId(reference.getTarget()))
                    // TODO: how to ensure proper data type?
                    .append(" VARCHAR(128)")
                    .append(',')
                    .append('\n');
        }
    }

    private String subsituteChars(String identifier) {
        return identifier.replace(".", SEPARATOR);
    }

    private void removeTrailingComma(StringBuilder ddlBuilder) {
        if (ddlBuilder.toString().endsWith(",\n")) {
            final int lastCommaIndex = ddlBuilder.length() - 2;
            ddlBuilder.deleteCharAt(lastCommaIndex);
        }
    }


}