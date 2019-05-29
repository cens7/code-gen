package horse.pay.service.${moduleName}.entity.api;

public interface ${upperClassName}Api {

    String BaseUrl = "service/${moduleName}/${lowerClassName}/";

    String Insert = "insert";

    String Update = "update";

    String DeleteBy${upperNoFieldName} = "deleteBy${upperNoFieldName}";

    String List${upperClassName}ByCondition = "list${upperClassName}ByCondition";

    String GetBy${upperNoFieldName} = "getBy${upperNoFieldName}";

    String PageByCondition = "pageByCondition";

}