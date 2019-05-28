package horse.pay.service.${moduleName}.servant.impl;

import horse.pay.md.common.client.ResponseEntity;
import horse.pay.md.common.client.Status;
import horse.pay.service.${moduleName}.entity.database.${upperClassName}D;
import horse.pay.service.${moduleName}.entity.front.${upperClassName}F;
import horse.pay.service.${moduleName}.invoker.service.${upperClassName}Service;
import horse.pay.service.${moduleName}.persistence.storage.${upperClassName}Storage;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class ${upperClassName}ServiceImpl implements ${upperClassName}Service {

    @Autowired
    private ${upperClassName}Storage ${lowerClassName}Storage;

    @Override
    public ResponseEntity insert${upperClassName}(${upperClassName}F ${lowerClassName}F) {
        ${upperClassName}D ${lowerClassName}D = ${lowerClassName}F.convert();
        ${lowerClassName}Storage.insert${upperClassName}(${lowerClassName}D);
        return new ResponseEntity().setStatus(Status.SUCCESS);
    }

    @Override
    public ResponseEntity update${upperClassName}(${upperClassName}F ${lowerClassName}F) {
        ${upperClassName}D ${lowerClassName}D = ${lowerClassName}F.convert();
        ${lowerClassName}Storage.update${upperClassName}(${lowerClassName}D);
        return new ResponseEntity().setStatus(Status.SUCCESS);
    }

    @Override
    public ResponseEntity deleteBy${upperNoFieldName}(String ${lowerNoFieldName}) {
        ${lowerClassName}Storage.deleteBy${upperNoFieldName}(${lowerNoFieldName});
        return new ResponseEntity().setStatus(Status.SUCCESS);
    }

    @Override
    public ResponseEntity<List<${upperClassName}F>> list${upperClassName}ByCondition(${upperClassName}F ${lowerClassName}F) {
        List<${upperClassName}D> ${lowerClassName}Ds = ${lowerClassName}Storage.list${upperClassName}ByCondition(${lowerClassName}F.convert());
        if(CollectionUtils.isEmpty(${lowerClassName}Ds)) {
            return new ResponseEntity<List<${upperClassName}F>>().setStatus(Status.SUCCESS);
        }
        List<${upperClassName}F> ${lowerClassName}Fs = ${lowerClassName}Ds.parallelStream().map(${upperClassName}D::convert).collect(Collectors.toList());
        return new ResponseEntity<List<${upperClassName}F>>().setStatus(Status.SUCCESS).setObject(${lowerClassName}Fs);
    }

    @Override
    public ResponseEntity<${upperClassName}F> getBy${upperNoFieldName}(String ${lowerNoFieldName}) {
        ${upperClassName}D ${lowerClassName}D = ${lowerClassName}Storage.getBy${upperNoFieldName}(${lowerNoFieldName});
        if(Objects.isNull(${lowerClassName}D)) {
            return new ResponseEntity<${upperClassName}F>().setStatus(Status.SUCCESS);
        }
        return new ResponseEntity<${upperClassName}F>().setStatus(Status.SUCCESS).setObject(${lowerClassName}D.convert());
    }

    @Override
    public ResponseEntity<List<${upperClassName}F>> pageByCondition(${upperClassName}F condition) {
        ${upperClassName}D ${lowerClassName}F = condition.convert();
        int count = ${lowerClassName}Storage.listPageCountByCondition(${lowerClassName}F);
        if (count == 0) {
            return new ResponseEntity<List<${upperClassName}F>>().setStatus(Status.FAIL).setMessage("根据条件查不到结果");
        }
        List<${upperClassName}D> list = ${lowerClassName}Storage.listPageByCondition(${lowerClassName}F);
        List<${upperClassName}F> collect = list.parallelStream().map(${upperClassName}D::convert).collect(Collectors.toList());
        return new ResponseEntity<List<${upperClassName}F>>().setStatus(Status.SUCCESS).setObject(collect).setCount(count);
    }

}
