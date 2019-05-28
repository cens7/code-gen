package com.ks.tool;

import cn.hutool.core.io.resource.ClassPathResource;
import cn.hutool.core.io.resource.Resource;
import cn.hutool.core.util.StrUtil;
import com.ks.model.Entity;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.util.Properties;

public class DbTool {

    private Connection conn;

    public DbTool() {
        getConn();
    }

    // 获取连接
    private void getConn() {
        try {
            Resource resource = new ClassPathResource("jdbc.properties");
            Properties properties = new Properties();
            FileInputStream in = new FileInputStream(((ClassPathResource) resource).getAbsolutePath());
            properties.load(in);
            HikariConfig hikariConfig = new HikariConfig();
            hikariConfig.setDriverClassName("com.mysql.cj.jdbc.Driver");
            hikariConfig.setJdbcUrl(properties.getProperty("jdbcUrl"));
            hikariConfig.setUsername(properties.getProperty("username"));
            hikariConfig.setPassword(properties.getProperty("password"));
            hikariConfig.addDataSourceProperty("readOnly", "true");
            HikariDataSource ds = new HikariDataSource(hikariConfig);
            this.conn = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void closeConn() {
        try {
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 通过表名获取列
    public Entity getEntity(String tableName, String moduleName) {
        Entity entity = new Entity();
        try {
            DatabaseMetaData metaData = conn.getMetaData();
            ResultSet rs = metaData.getColumns(null, null, tableName, null);
            int i = 0;
            while (rs.next()) {
                String column_name = rs.getString("COLUMN_NAME");
                String type_name = rs.getString("TYPE_NAME");
                String comment = rs.getString("REMARKS");
                String table_cat = rs.getString("TABLE_CAT");
                String field_type = "String";
                i++;
                if (column_name.equals("id")) {// 数据库主键跳过
                    continue;
                }
                if (i == 2) {
                    entity.setLowerNoFieldName(column_name);
                    entity.setUpperNoFieldName(StrUtil.upperFirst(column_name));
                }

                switch (type_name) {
                    case "CHAR":
                        break;
                    case "VARCHAR":
                        break;
                    case "DATE":
                        field_type = "LocalDateTime";
                        entity.setHasDate(true);
                        break;
                    case "DATETIME":
                        field_type = "LocalDateTime";
                        entity.setHasDate(true);
                        break;
                    case "BIGINT":
                        field_type = "Long";
                        break;
                    case "NUMBER":
                        field_type = "Double";
                        break;
                    case "DECIMAL":
                        field_type = "Double";
                        break;
                    case "DOUBLE":
                        field_type = "Double";
                        break;
                    case "FLOAT":
                        field_type = "Double";
                        break;
                    case "INT":
                        field_type = "Integer";
                        break;
                    default:
                        throw new Exception("表" + tableName + "存在未被处理的数据类型。");
                }

                Entity.Column column = new Entity.Column();
                column.setFieldType(field_type).setFieldName(column_name).setComment(comment);
                entity.setColumn(column);
                entity.setDbName(table_cat);
            }
            entity.setUpperClassName(StrUtil.upperFirst(StrUtil.toCamelCase(tableName)));
            entity.setLowerClassName(StrUtil.toCamelCase(tableName));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return entity;
    }

}
