package business

import (
	"github.com/gin-gonic/gin"
)

type BusinessTest1Router struct{}

func (r *BusinessTest1Router) InitBizTest1Router(RouterPrivate *gin.RouterGroup, RouterPublic *gin.RouterGroup) {
	routerPrivate := RouterPrivate.Group("test1/pri")
	{

		// 对于私有的路由，必须
		// 1、在后台的超级管理员->api管理下新增对应的api，注意新增api的时候不需要把"api"这个前缀加上去，只需要"/test1/pri/post"，注意：第一个/不能丢
		// 2、在后台的超级管理员->角色管理下找到对应的角色，设置权限->角色api，找到对应的api打勾点确定
		// 3、重启应用访问接口

		// http://localhost:8080/api/test1/pri/post
		// http://localhost:8080/api/test1/pri/put
		// http://localhost:8080/api/test1/pri/getById
		// http://localhost:8080/api/test1/pri/getPageList
		// http://localhost:8080/api/test1/pri/delete

		routerPrivate.POST("post", businessTest1Api.Test1POST)              // 添加/编辑分类
		routerPrivate.PUT("put", businessTest1Api.Test1PUT)                 // 删除分类
		routerPrivate.GET("getById", businessTest1Api.Test1GetById)         // 分类列表
		routerPrivate.GET("getPageList", businessTest1Api.Test1GetPageList) // 分类列表
		routerPrivate.DELETE("delete", businessTest1Api.Test1Delete)        // 删除分类
	}

	routerPublic := RouterPublic.Group("test1/pub")
	{
		// 对于 RouterPublic 路由下的接口，可以直接访问，无须经过授权操作
		// http://localhost:8080/api/test1/pub/post

		routerPublic.POST("post", businessTest1Api.Test1POST) // 添加/编辑分类

		// 测试事务回滚：使用 db.Transaction()（自动处理提交和回滚）
		routerPublic.GET("transaction", businessTest1Api.Transaction)

		// 测试事务回滚： 进阶方式：手动控制 Begin + Rollback + Commit
		routerPublic.GET("beginRollbackCommit", businessTest1Api.BeginRollbackCommit)

		// 实现递归查询，父查所有子
		routerPublic.GET("recursiveQuery", businessTest1Api.RecursiveQuery)

		// 实现递归查询，子查父
		routerPublic.GET("recursiveQueryParent", businessTest1Api.RecursiveQueryParent)

		// 一对多查询
		routerPublic.GET("one2Many", businessTest1Api.One2Many)

		// 批量操作
		routerPublic.GET("batchOpt", businessTest1Api.BatchOpt)

		// 乐观锁（版本控制）
		routerPublic.GET("versionControl", businessTest1Api.VersionControl)

	}
}
