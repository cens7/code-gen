package horse.pay.service.${moduleName}.invoker.service;

import horse.pay.md.common.client.ResponseEntity;
import horse.pay.service.${moduleName}.entity.front.${upperClassName}F;

import java.util.List;

public interface ${upperClassName}Service {

    ResponseEntity insert${upperClassName}(${upperClassName}F ${lowerClassName}F);

    ResponseEntity update${upperClassName}(${upperClassName}F ${lowerClassName}F);

    ResponseEntity deleteBy${upperNoFieldName}(String ${lowerNoFieldName});

    ResponseEntity<List<${upperClassName}F>> list${upperClassName}ByCondition(${upperClassName}F ${lowerClassName}F);

    ResponseEntity<${upperClassName}F> getBy${upperNoFieldName}(String ${lowerNoFieldName});

    ResponseEntity<List<${upperClassName}F>> pageByCondition(${upperClassName}F ${lowerClassName}F);

}
