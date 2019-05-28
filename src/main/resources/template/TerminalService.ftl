package horse.pay.terminal.${terminalModuleName}.service;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.http.HttpUtil;
import horse.pay.md.common.client.ResponseEntity;
import horse.pay.md.config.application.ServiceApplication;
import horse.pay.service.${moduleName}.entity.front.${upperClassName}F;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@Service
public class ${upperClassName}Service {

    @Autowired
    private RestTemplate restTemplate;

    public ResponseEntity insert${upperClassName}(${upperClassName}F platformNewsF) {
        String address = ServiceApplication.${moduleName}.buildHttp("service/${moduleName}/${lowerClassName}/insert");
        return restTemplate.postForObject(address, platformNewsF, ResponseEntity.class);
    }

    public ResponseEntity update${upperClassName}(${upperClassName}F platformNewsF) {
        String address = ServiceApplication.${moduleName}.buildHttp("service/${moduleName}/${lowerClassName}/update");
        return restTemplate.postForObject(address, platformNewsF, ResponseEntity.class);
    }

    public ResponseEntity<List<${upperClassName}F>> list${upperClassName}ByCondition(${upperClassName}F ${lowerClassName}F) {
        String address = ServiceApplication.${moduleName}.buildHttp("service/${moduleName}/${lowerClassName}/list${lowerClassName}ByCondition");
        Map<String, Object> map = BeanUtil.beanToMap(${lowerClassName}F, false, true);
        address = HttpUtil.urlWithForm(address, map, CharsetUtil.CHARSET_UTF_8, false);
        return restTemplate.getForObject(address, ResponseEntity.class);
    }

    public ResponseEntity<List<${upperClassName}F>> getBy${upperNoFieldName}(String ${lowerNoFieldName}) {
        String address = ServiceApplication.${moduleName}.buildHttp("service/${moduleName}/${lowerClassName}/getBy${upperNoFieldName}?${lowerNoFieldName}={${lowerNoFieldName}}");
        return restTemplate.getForObject(address, ResponseEntity.class, ${lowerNoFieldName});
    }

    public ResponseEntity deleteBy${upperNoFieldName}(String ${lowerNoFieldName}) {
        String address = ServiceApplication.${moduleName}.buildHttp("service/${moduleName}/${lowerClassName}/deleteBy${lowerNoFieldName}");
        return restTemplate.postForObject(address, ${lowerNoFieldName}, ResponseEntity.class);
    }

}