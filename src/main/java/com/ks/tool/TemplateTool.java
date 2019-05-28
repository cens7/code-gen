package com.ks.tool;

import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.Writer;
import java.util.Map;

public class TemplateTool {

    private Configuration configuration;

    private String baseDir = "src/main/resources/template/";

    public TemplateTool() {
        configuration = new Configuration(Configuration.VERSION_2_3_0);
    }


    public void genTemplate(String templateName, Map<String, Object> data, Writer writer) {
        try {
            Template template = configuration.getTemplate(baseDir + templateName);
            template.process(data, writer);
            writer.flush();
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
