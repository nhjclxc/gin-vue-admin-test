package middleware

import (
	"strconv"
	"strings"

	"github.com/gin-gonic/gin"
	"server/global"
	"server/model/common/response"
	"server/utils"
)

// 基于 Gin + Casbin 的权限拦截器中间件，用于实现 RBAC 权限控制（基于角色的访问控制）。
// CasbinHandler 拦截器
func CasbinHandler() gin.HandlerFunc {
	return func(c *gin.Context) {
		waitUse, _ := utils.GetClaims(c)
		//获取请求的PATH
		path := c.Request.URL.Path
		obj := strings.TrimPrefix(path, global.GVA_CONFIG.System.RouterPrefix)
		// 获取请求方法
		act := c.Request.Method
		// 获取用户的角色
		sub := strconv.Itoa(int(waitUse.AuthorityId))
		e := utils.GetCasbin() // 判断策略中是否存在

		// 判断当前用户的AuthorityId是否有权操作该接口，没权限则终止请求
		success, _ := e.Enforce(sub, obj, act)
		if !success {
			response.FailWithDetailed(gin.H{}, "权限不足", c)
			c.Abort()
			return
		}

		// 放行请求
		c.Next()
	}
}
