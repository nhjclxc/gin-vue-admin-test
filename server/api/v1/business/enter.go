package business

import "server/service"

type ApiGroup struct {
	BusinessTest1Api
}

// 在这里注入业务相关的所有service层类型
// 这个是用来给api层调用业务service处理层使用的
var (
	businessTest1Service = service.ServiceGroupApp.BusinessServiceGroup.BusinessTest1Service
)
