package v1

import (
	"server/api/v1/business"
	"server/api/v1/example"
	"server/api/v1/system"
)

var ApiGroupApp = new(ApiGroup)

// 在这里注入不同的api组
// 也就是不同的业务模块的api分组
// 比如系统相关的、用户相关的、业务相关的、设备相关的、开放接口相关的
type ApiGroup struct {
	SystemApiGroup   system.ApiGroup
	ExampleApiGroup  example.ApiGroup
	BusinessApiGroup business.ApiGroup
}
