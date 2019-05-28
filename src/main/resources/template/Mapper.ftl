package horse.pay.service.${moduleName}.persistence.mapper;

import horse.pay.service.${moduleName}.entity.database.${upperClassName}D;
import java.util.List;

public interface ${upperClassName}Mapper {

    int insert${upperClassName}(${upperClassName}D ${lowerClassName}D);

    int update${upperClassName}(${upperClassName}D ${lowerClassName}D);

    int deleteBy${upperNoFieldName}(String ${lowerNoFieldName});

    List<${upperClassName}D> list${upperClassName}ByCondition(${upperClassName}D condition);

    ${upperClassName}D getBy${upperNoFieldName}(String ${lowerNoFieldName});

    List<${upperClassName}D> listPageByCondition(${upperClassName}D ${lowerNoFieldName}D);

    int listPageCountByCondition(${upperClassName}D ${lowerNoFieldName}D);
    
}
