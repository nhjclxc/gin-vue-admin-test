package router

import (
	"server/router/business"
	"server/router/example"
	"server/router/system"
)

var RouterGroupApp = new(RouterGroup)

// 定义路由组
type RouterGroup struct {
	// 系统路由，
	System system.RouterGroup
	// 示例路由组
	Example example.RouterGroup
	//// 设备路由组
	//Device example.RouterGroup
	//// 业务路由组
	Business business.RouterGroup
}
