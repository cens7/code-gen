package com.ks;


import com.google.common.collect.Lists;
import com.ks.handler.Engine;

import java.util.List;

public class App {
    public static void main(String[] args) throws Exception {
        Engine engine = new Engine();
        // 需要生成的表名
        List<String> listTable = Lists.newArrayList("platform_customer_sign");
        // 生成文件输出的目录
        String outputDir = "d:/a";
        // 模块名
        String moduleName = "contract";
        // 终端模块名
        String terminalModuleName = "platform";

        engine.run(listTable, outputDir, moduleName, terminalModuleName);
    }
}
