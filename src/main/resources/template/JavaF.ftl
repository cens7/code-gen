package horse.pay.service.${moduleName}.entity.front;

import horse.pay.md.common.client.QueryModel;
import horse.pay.md.common.client.ResponseEntity;
import horse.pay.md.common.client.Status;
import horse.pay.service.${moduleName}.entity.database.${upperClassName}D;
import io.swagger.annotations.ApiModelProperty;
<#if hasDate ==  true>
import horse.pay.md.common.date.DateTimeFormatterEnum;
import horse.pay.md.common.json.JsonTool;
import java.time.LocalDateTime;
</#if>
import org.apache.commons.lang3.StringUtils;

public class ${upperClassName}F extends QueryModel<${upperClassName}D> {

<#list columns as column>
    @ApiModelProperty(value = "${column.comment}",required = true)
    <#if column.fieldType == "LocalDateTime">
	private String ${column.fieldName};
    <#else>
	private ${column.fieldType} ${column.fieldName};
    </#if>

</#list>
<#list columns as column>
    <#assign type="${column.fieldType}">
    <#if column.fieldType == "LocalDateTime">
        <#assign type="String">
    </#if>
	public ${type} get${column.fieldName?cap_first}() {
 		return this.${column.fieldName};
	}

	public void set${column.fieldName?cap_first}(${type} ${column.fieldName}) {
 		this.${column.fieldName} = ${column.fieldName};
	}
</#list>

    @Override
    public ${upperClassName}D convert() {
        <#assign obj="${lowerClassName}D">
        ${upperClassName}D ${obj} = new ${upperClassName}D();
        <#list columns as column>
        <#if column.fieldType == "LocalDateTime">
        if (StringUtils.isNotEmpty(${column.fieldName})) {
            ${obj}.set${column.fieldName?cap_first}(LocalDateTime.parse(${column.fieldName},DateTimeFormatterEnum.yyyy_MM_dd_HH_mm_ss.getDateTimeFormatter()));
        }
        <#else>
        ${obj}.set${column.fieldName?cap_first}(${column.fieldName});
        </#if>
        </#list>
        super.copySuper(${obj});
        return ${obj};
    }

    @Override
    public ResponseEntity inspect() {
        return new ResponseEntity().setStatus(Status.SUCCESS);
    }

}