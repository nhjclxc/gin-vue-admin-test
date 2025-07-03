package business

import (
	"github.com/gin-gonic/gin"
)

type BusinessTest1Router struct{}

func (r *BusinessTest1Router) InitBizTest1Router(RouterPrivate *gin.RouterGroup, RouterPublic *gin.RouterGroup) {
	routerPrivate := RouterPrivate.Group("test1/pri")
	{

		// 对于私有的路由，必须
		// 1、在后台的超级管理员->api管理下新增对应的api，注意新增api的时候不需要把"api"这个前缀加上去，只需要"/test1/pri/post"
		// 2、在后台的超级管理员->角色管理下找到对应的角色，设置权限->角色api，找到对应的api打勾点确定
		// 3、重启应用访问接口

		// http://localhost:8080/api/test1/pri/post

		//router.GET("get", businessTest1Api.Test1Get) // 分类列表
		routerPrivate.POST("post", businessTest1Api.Test1POST) // 添加/编辑分类
		//router.PUT("put", businessTest1Api.Test1PUT)       // 删除分类
		//router.DELETE("delete", businessTest1Api.Test1DELETE) // 删除分类
	}

	routerPublic := RouterPublic.Group("test1/pub")
	{
		// 对于 RouterPublic 路由下的接口，可以直接访问，无须经过授权操作
		// http://localhost:8080/api/test1/pub/post

		//router.GET("get", businessTest1Api.Test1Get) // 分类列表
		routerPublic.POST("post", businessTest1Api.Test1POST) // 添加/编辑分类
		//router.PUT("put", businessTest1Api.Test1PUT)       // 删除分类
		//router.DELETE("delete", businessTest1Api.Test1DELETE) // 删除分类
	}
}
