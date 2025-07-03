package business

import "server/service"

type ApiGroup struct {
	BusinessTest1Api
}

var (
	businessTest1Service = service.ServiceGroupApp.BusinessServiceGroup.BusinessTest1Service
)
