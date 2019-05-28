package horse.pay.service.${moduleName}.entity.database;

import horse.pay.md.common.client.QueryModel;
import horse.pay.md.common.client.ResponseEntity;
import horse.pay.service.${moduleName}.entity.front.${upperClassName}F;
<#if hasDate ==  true>
import horse.pay.md.common.date.DateTimeFormatterEnum;
import horse.pay.md.common.json.JsonTool;
import java.time.LocalDateTime;
</#if>
import org.apache.commons.lang3.StringUtils;

public class ${upperClassName}D extends QueryModel<${upperClassName}F> {

<#list columns as column>
    <#if column.comment??>/**${column.comment}*/</#if>
	private ${column.fieldType} ${column.fieldName};

</#list>
<#list columns as column>
	public ${column.fieldType} get${column.fieldName?cap_first}() {
 		return this.${column.fieldName};
	}

	public void set${column.fieldName?cap_first}(${column.fieldType} ${column.fieldName}) {
 		this.${column.fieldName} = ${column.fieldName};
	}
</#list>

    @Override
    public ${upperClassName}F convert() {
        <#assign obj="${lowerClassName}F">
        ${upperClassName}F ${obj} = new ${upperClassName}F();
        <#list columns as column>
        <#if column.fieldType == "LocalDateTime">
        if (${column.fieldName} != null) {
            ${obj}.set${column.fieldName?cap_first}(${column.fieldName}.format(DateTimeFormatterEnum.yyyy_MM_dd_HH_mm_ss.getDateTimeFormatter()));
        }
        <#else>
        ${obj}.set${column.fieldName?cap_first}(${column.fieldName});
        </#if>
        </#list>

        return ${obj};
    }

    @Override
    public ResponseEntity inspect() {
        return null;
    }

}