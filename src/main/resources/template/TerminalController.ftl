package horse.pay.terminal.${terminalModuleName}.app.controller;

import horse.pay.md.auth.Auth;
import horse.pay.md.common.client.ResponseEntity;
import horse.pay.md.common.client.Status;
import horse.pay.service.${moduleName}.entity.api.${upperClassName}Api;
import horse.pay.service.${moduleName}.entity.front.${upperClassName}F;
import horse.pay.terminal.platform.service.${moduleName}.${upperClassName}Service;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(tags = "")
@RestController
@RequestMapping("terminal/${terminalModuleName}/${moduleName}/${upperClassName}")
public class ${upperClassName}Controller {

    @Autowired
    private ${upperClassName}Service ${lowerClassName}Service;

    @ApiOperation(value = "添加")
    @PostMapping("insert")
    @Auth(client = Auth.Client.WEB, authPrivilege = true, module = ${upperClassName}Api.Module)
    public ResponseEntity insert${upperClassName}(@RequestBody ${upperClassName}F ${lowerClassName}F) {
        ResponseEntity re = ${lowerClassName}F.inspect();
        if (re.isFail()) {
            return re;
        }
        return ${lowerClassName}Service.insert${upperClassName}(${lowerClassName}F);
    }

    @ApiOperation(value = "修改")
    @PostMapping("update")
    @Auth(client = Auth.Client.WEB, authPrivilege = true, module = ${upperClassName}Api.Module)
    public ResponseEntity update${upperClassName}(@RequestBody ${upperClassName}F ${lowerClassName}F) {
        ResponseEntity re = ${lowerClassName}F.inspect();
        if (re.isFail()) {
            return re;
        }
        return ${lowerClassName}Service.update${upperClassName}(${lowerClassName}F);
    }

    @ApiOperation(value = "根据条件查询")
    @GetMapping("list${upperClassName}ByCondition")
    @Auth(client = Auth.Client.WEB, authPrivilege = true, module = ${upperClassName}Api.Module)
    public ResponseEntity list${upperClassName}ByCondition(${upperClassName}F ${lowerClassName}F) {
        return ${lowerClassName}Service.list${upperClassName}ByCondition(${lowerClassName}F);
    }

    @ApiOperation(value = "根据编码查询")
    @GetMapping("getBy${upperNoFieldName}")
    @Auth(client = Auth.Client.WEB, authPrivilege = true, module = ${upperClassName}Api.Module)
    public ResponseEntity getBy${upperNoFieldName}(String ${lowerNoFieldName}) {
        return ${lowerClassName}Service.getBy${upperNoFieldName}(${lowerNoFieldName});
    }

    @ApiOperation(value = "删除")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "${lowerNoFieldName}", value = "编号", required = true)
    })
    @PostMapping("deleteBy${upperNoFieldName}")
    @Auth(client = Auth.Client.WEB, authPrivilege = true, module = ${upperClassName}Api.Module)
    public ResponseEntity deleteBy${upperNoFieldName}(String ${lowerNoFieldName}) {
        if (StringUtils.isEmpty(${lowerNoFieldName})) {
            return new ResponseEntity().setStatus(Status.FAIL).setMessage("${lowerNoFieldName} 不能为空");
        }
        return ${lowerClassName}Service.deleteBy${upperNoFieldName}(${lowerNoFieldName});
    }

}
