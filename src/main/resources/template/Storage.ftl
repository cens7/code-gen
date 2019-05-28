package horse.pay.service.${moduleName}.persistence.storage;

import horse.pay.md.common.key.GenerateKeyTool;
import horse.pay.service.${moduleName}.entity.database.${upperClassName}D;
import horse.pay.service.${moduleName}.persistence.mapper.${upperClassName}Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ${upperClassName}Storage {

    @Autowired
    private ${upperClassName}Mapper ${lowerClassName}Mapper;


    public int insert${upperClassName}(${upperClassName}D ${lowerClassName}D) {
        ${lowerClassName}D.set${upperNoFieldName}(GenerateKeyTool.generateUUIDKey());
        return ${lowerClassName}Mapper.insert${upperClassName}(${lowerClassName}D);
    }

    public int update${upperClassName}(${upperClassName}D ${lowerClassName}D) {
        return ${lowerClassName}Mapper.update${upperClassName}(${lowerClassName}D);
    }

    public int deleteBy${upperNoFieldName}(String ${lowerNoFieldName}) {
        return ${lowerClassName}Mapper.deleteBy${upperNoFieldName}(${lowerNoFieldName});
    }

    public List<${upperClassName}D> list${upperClassName}ByCondition(${upperClassName}D condition) {
        return ${lowerClassName}Mapper.list${upperClassName}ByCondition(condition);
    }

    public ${upperClassName}D getBy${upperNoFieldName}(String ${lowerNoFieldName}) {
        return ${lowerClassName}Mapper.getBy${upperNoFieldName}(${lowerNoFieldName});
    }

    public List<${upperClassName}D> listPageByCondition(${upperClassName}D ${lowerNoFieldName}D) {
        return ${lowerClassName}Mapper.listPageByCondition(${lowerNoFieldName}D);
    }

    public int listPageCountByCondition(${upperClassName}D ${lowerNoFieldName}D) {
        return ${lowerClassName}Mapper.listPageCountByCondition(${lowerNoFieldName}D);
    }

}
