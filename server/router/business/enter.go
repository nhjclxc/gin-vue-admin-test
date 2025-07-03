package business

import (
	api "server/api/v1"
)

type RouterGroup struct {
	BusinessTest1Router
}

var (
	businessTest1Api = api.ApiGroupApp.BusinessApiGroup.BusinessTest1Api
)
