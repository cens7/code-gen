<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="horse.pay.service.${moduleName}.persistence.mapper.${upperClassName}Mapper">

    <insert id="insert${upperClassName}" parameterType="horse.pay.service.${moduleName}.entity.database.${upperClassName}D">
        insert into ${dbName}.${tableName}(
        <#list columns as column>
        ${column.fieldName}<#if column_has_next>,</#if>
        </#list>
        )
        values (
        <#list columns as column>
        <#noparse>#{</#noparse>${column.fieldName}<#noparse>}</#noparse><#if column_has_next>,</#if>
        </#list>
        )

    </insert>

    <update id="update${upperClassName}" parameterType="horse.pay.service.${moduleName}.entity.database.${upperClassName}D">
        update ${dbName}.${tableName}
        <set>
        <#list columns as column>
            <#if column.fieldType == "String">
            <if test="${column.fieldName} != null and ${column.fieldName} != ''">
                ,${column.fieldName} = <#noparse>#{</#noparse>${column.fieldName}<#noparse>}</#noparse>
            </if>
            <#else>
            <if test="${column.fieldName} != null">
                ,${column.fieldName} = <#noparse>#{</#noparse>${column.fieldName}<#noparse>}</#noparse>
            </if>
            </#if>
        </#list>
        </set>
        where ${lowerNoFieldName} = <#noparse>#{</#noparse>${lowerNoFieldName}<#noparse>}</#noparse>
    </update>

    <select id="list${upperClassName}ByCondition" resultType="horse.pay.service.${moduleName}.entity.database.${upperClassName}D">
        select
        <#list columns as column>
        ${column.fieldName}<#if column_has_next>,</#if>
        </#list>
        from ${dbName}.${tableName}
        <where>
            <#list columns as column>
            <#if column.fieldType == "String">
            <if test="${column.fieldName} != null and ${column.fieldName} != ''">
                and ${column.fieldName} = <#noparse>#{</#noparse>${column.fieldName}<#noparse>}</#noparse>
            </if>
            <#else>
            <if test="${column.fieldName} != null">
                and ${column.fieldName} = <#noparse>#{</#noparse>${column.fieldName}<#noparse>}</#noparse>
            </if>
            </#if>
            </#list>

        </where>
    </select>

    <select id="getBy${upperNoFieldName}" resultType="horse.pay.service.${moduleName}.entity.database.${upperClassName}D">
        select
         <#list columns as column>
         ${column.fieldName}<#if column_has_next>,</#if>
         </#list>
        from ${dbName}.${tableName} where ${lowerNoFieldName} = <#noparse>#{</#noparse>${lowerNoFieldName}<#noparse>}</#noparse>
    </select>

    <delete id="deleteBy${upperNoFieldName}">
        delete from ${dbName}.${tableName} where ${lowerNoFieldName} = <#noparse>#{</#noparse>${lowerNoFieldName}<#noparse>}</#noparse>
    </delete>

    <select id="listPageByCondition" resultType="horse.pay.service.${moduleName}.entity.database.${upperClassName}D">
        select
        <#list columns as column>
            ${column.fieldName}<#if column_has_next>,</#if>
        </#list>
        from ${dbName}.${tableName}
        <where>
            <#list columns as column>
            <#if column.fieldType == "String">
            <if test="${column.fieldName} != null and ${column.fieldName} != ''">
                and ${column.fieldName} = <#noparse>#{</#noparse>${column.fieldName}<#noparse>}</#noparse>
            </if>
            <#else>
            <if test="${column.fieldName} != null">
                and ${column.fieldName} = <#noparse>#{</#noparse>${column.fieldName}<#noparse>}</#noparse>
            </if>
            </#if>
            </#list>
        </where>
        order by id desc
        limit <#noparse>#{</#noparse>begin},<#noparse>#{</#noparse>rows}
    </select>

    <select id="listPageCountByCondition" resultType="java.lang.Integer">
        select
            count(1)
        from ${dbName}.${tableName}
        <where>
            <#list columns as column>
            <#if column.fieldType == "String">
            <if test="${column.fieldName} != null and ${column.fieldName} != ''">
                and ${column.fieldName} = <#noparse>#{</#noparse>${column.fieldName}<#noparse>}</#noparse>
            </if>
            <#else>
            <if test="${column.fieldName} != null">
                and ${column.fieldName} = <#noparse>#{</#noparse>${column.fieldName}<#noparse>}</#noparse>
            </if>
            </#if>
            </#list>
        </where>

    </select>

</mapper>