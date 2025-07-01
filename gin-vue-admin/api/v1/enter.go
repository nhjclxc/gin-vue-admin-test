package v1

import (
	"gin-vue-admin/api/v1/example"
	"gin-vue-admin/api/v1/system"
)

var ApiGroupApp = new(ApiGroup)

type ApiGroup struct {
	SystemApiGroup  system.ApiGroup
	ExampleApiGroup example.ApiGroup
}
