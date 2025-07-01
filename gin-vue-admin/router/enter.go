package router

import (
	"gin-vue-admin/router/example"
	"gin-vue-admin/router/system"
)

var RouterGroupApp = new(RouterGroup)

type RouterGroup struct {
	System  system.RouterGroup
	Example example.RouterGroup
}
