package horse.pay.service.${moduleName}.app.controller;

import horse.pay.md.common.client.ResponseEntity;
import horse.pay.service.${moduleName}.entity.front.${upperClassName}F;
import horse.pay.service.${moduleName}.invoker.service.${upperClassName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("service/${moduleName}/${upperClassName}")
public class ${upperClassName}Controller {

    @Autowired
    private ${upperClassName}Service ${lowerClassName}Service;

    @PostMapping("insert")
    public ResponseEntity insert${upperClassName}(@RequestBody ${upperClassName}F ${lowerClassName}F) {
        ResponseEntity re = ${lowerClassName}F.inspect();
        if (re.isFail()) {
            return re;
        }
        return ${lowerClassName}Service.insert${upperClassName}(${lowerClassName}F);
    }

    @PostMapping("update")
    public ResponseEntity update${upperClassName}(@RequestBody ${upperClassName}F ${lowerClassName}F) {
        ResponseEntity re = ${lowerClassName}F.inspect();
        if (re.isFail()) {
            return re;
        }
        return ${lowerClassName}Service.update${upperClassName}(${lowerClassName}F);
    }
    
    @PostMapping("deleteBy${upperNoFieldName}")
    public ResponseEntity deleteBy${upperNoFieldName}(@RequestBody String ${lowerNoFieldName}) {
        return ${lowerClassName}Service.deleteBy${upperNoFieldName}(${lowerNoFieldName});
    }

    @GetMapping("list${upperClassName}ByCondition")
    public ResponseEntity list${upperClassName}ByCondition(${upperClassName}F ${lowerClassName}F) {
        return ${lowerClassName}Service.list${upperClassName}ByCondition(${lowerClassName}F);
    }

    @GetMapping("getBy${upperNoFieldName}")
    public ResponseEntity getBy${upperNoFieldName}(String ${lowerNoFieldName}) {
        return ${lowerClassName}Service.getBy${upperNoFieldName}(${lowerNoFieldName});
    }

    @GetMapping("pageByCondition")
    public ResponseEntity<List<${upperClassName}F>> pageByCondition(${upperClassName}F ${lowerClassName}F) {
        ResponseEntity re = ${lowerClassName}F.inspect();
        if (re.isFail()) {
            return re;
        }
        return ${lowerClassName}Service.pageByCondition(${lowerClassName}F);
    }

}