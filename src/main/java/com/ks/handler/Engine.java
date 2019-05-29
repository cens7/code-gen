package com.ks.handler;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.ks.model.Entity;
import com.ks.tool.DbTool;
import com.ks.tool.TemplateTool;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Engine {

    private DbTool dbTool;

    private TemplateTool templateTool;

    public Engine() {
        dbTool = new DbTool();
        templateTool = new TemplateTool();
    }


    /**
     * @param tableNames         表名集合
     * @param outputDir          输出目录
     * @param moduleName         模块名
     * @param terminalModuleName 终端模块名,可以为空
     */
    public void run(List<String> tableNames, String outputDir, String moduleName, String terminalModuleName) {
        try {
            File parentFile = new File(outputDir);
            parentFile.mkdir();
            String parentAbsPath = parentFile.getAbsolutePath();
            File terminalFile = new File(parentAbsPath + "/terminal");
            String terminalAbsPath = terminalFile.getAbsolutePath();
            terminalFile.mkdir();
            Map<String, Object> preMap = new HashMap<>();
            preMap.put("moduleName", moduleName);
            preMap.put("terminalModuleName", terminalModuleName);
            for (String tableName : tableNames) {
                Entity entity = dbTool.getEntity(tableName, moduleName);
                preMap.put("tableName", tableName);
                Map<String, Object> map = BeanUtil.beanToMap(entity);
                map.putAll(preMap);
                processNormal(entity, parentAbsPath, map);
                if (StrUtil.isNotEmpty(terminalModuleName)) {
                    processTerminal(entity, terminalAbsPath, map);
                }
                System.out.println("=======>success: " + entity.getUpperClassName());

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbTool.closeConn();
        }
    }

    private void processNormal(Entity entity, String absPath, Map<String, Object> preMap) throws Exception {

        for (Type value : Type.values()) {

            StringBuilder sb1 = new StringBuilder();
            StringBuilder sb2 = new StringBuilder();
            sb1.append(absPath).append("\\").append(entity.getUpperClassName()).append(value.suffix).append(".").append(value.java);
            File file = new File(sb1.toString());
            FileOutputStream fosD = new FileOutputStream(file);
            OutputStreamWriter writer = new OutputStreamWriter(fosD);
            sb2.append(value.prefix).append(value.suffix).append(".").append("ftl");
            templateTool.genTemplate(sb2.toString(), preMap, writer);
        }
    }

    private void processTerminal(Entity entity, String terminalAbsPath, Map<String, Object> preMap) throws Exception {
        for (TerminalType value : TerminalType.values()) {
            StringBuilder sb1 = new StringBuilder();
            sb1.append(terminalAbsPath).append("\\").append(entity.getUpperClassName()).append(value.suffix).append(".").append(value.java);
            File file = new File(sb1.toString());
            FileOutputStream fosD = new FileOutputStream(file);
            OutputStreamWriter writer = new OutputStreamWriter(fosD);
            StringBuilder sb2 = new StringBuilder();
            sb2.append(value.prefix).append(value.suffix).append(".").append("ftl");
            templateTool.genTemplate(sb2.toString(), preMap, writer);
        }
    }


    public enum Type {

        suffix_D("Java", "D", "java"),
        suffix_F("Java", "F", "java"),
        suffix_Api("Java", "Api", "java"),
        suffix_Mapper("", "Mapper", "java"),
        suffix_MapperXML("MapperXml", "", "xml"),
        suffix_Storage("", "Storage", "java"),
        suffix_Service("", "Service", "java"),
        suffix_ServiceImpl("", "ServiceImpl", "java"),
        suffix_Controller("", "Controller", "java");


        String suffix;

        String prefix;

        String java;

        Type(String prefix, String suffix, String java) {
            this.prefix = prefix;
            this.suffix = suffix;
            this.java = java;
        }
    }

    public enum TerminalType {

        suffix_TerminalController("Terminal", "Controller", "java"),
        suffix_TerminalService("Terminal", "Service", "java");

        String suffix;

        String prefix;

        String java;

        TerminalType(String prefix, String suffix, String java) {
            this.prefix = prefix;
            this.suffix = suffix;
            this.java = java;
        }
    }


}
