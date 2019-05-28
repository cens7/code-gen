package com.ks.model;

import cn.hutool.core.collection.CollectionUtil;

import java.util.LinkedList;
import java.util.List;

public class Entity {

    private String upperClassName;

    private String lowerClassName;

    private List<Column> columns;

    private String upperNoFieldName;

    private String lowerNoFieldName;

    private boolean hasDate;

    private String dbName;

    public List<Column> getColumns() {
        return columns;
    }

    public Entity setColumn(Column columns) {
        if(CollectionUtil.isEmpty(this.columns)){
            this.columns = new LinkedList<>();
        }
        this.columns.add(columns);
        return this;
    }

    public String getUpperClassName() {
        return upperClassName;
    }

    public void setUpperClassName(String upperClassName) {
        this.upperClassName = upperClassName;
    }

    public String getLowerClassName() {
        return lowerClassName;
    }

    public void setLowerClassName(String lowerClassName) {
        this.lowerClassName = lowerClassName;
    }

    public boolean isHasDate() {
        return hasDate;
    }

    public void setHasDate(boolean hasDate) {
        this.hasDate = hasDate;
    }

    public String getUpperNoFieldName() {
        return upperNoFieldName;
    }

    public void setUpperNoFieldName(String upperNoFieldName) {
        this.upperNoFieldName = upperNoFieldName;
    }

    public String getLowerNoFieldName() {
        return lowerNoFieldName;
    }

    public void setLowerNoFieldName(String lowerNoFieldName) {
        this.lowerNoFieldName = lowerNoFieldName;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    public static class Column {

        private String fieldType;

        private String fieldName;

        private String comment;

        public String getFieldType() {
            return fieldType;
        }

        public Column setFieldType(String fieldType) {
            this.fieldType = fieldType;
            return this;
        }

        public String getFieldName() {
            return fieldName;

        }

        public Column setFieldName(String fieldName) {
            this.fieldName = fieldName;
            return this;
        }

        public String getComment() {
            return comment;
        }

        public Column setComment(String comment) {
            this.comment = comment;
            return this;
        }
    }

}
