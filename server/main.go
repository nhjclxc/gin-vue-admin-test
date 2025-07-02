package main

import (
	_ "go.uber.org/automaxprocs"
	"go.uber.org/zap"
	"server/core"
	"server/global"
	"server/initialize"
)

//go:generate go env -w GO111MODULE=on
//go:generate go env -w GOPROXY=https://goproxy.cn,direct
//go:generate go mod tidy
//go:generate go mod download

// 这部分 @Tag 设置用于排序, 需要排序的接口请按照下面的格式添加
// swag init 对 @Tag 只会从入口文件解析, 默认 main.go
// 也可通过 --generalInfo flag 指定其他文件
// @Tag.Name        Base
// @Tag.Name        SysUser
// @Tag.Description 用户

// @title                       Gin-Vue-Admin Swagger API接口文档
// @version                     v2.8.2
// @description                 使用gin+vue进行极速开发的全栈开发基础平台
// @securityDefinitions.apikey  ApiKeyAuth
// @in                          header
// @name                        x-token
// @BasePath                    /
func main() {
	// 初始化系统
	initializeSystem()
	// 运行服务器
	core.RunServer()
}

// initializeSystem 初始化系统所有组件
// 提取为单独函数以便于系统重载时调用
func initializeSystem() {
	// Viper 用于从多种来源加载配置（如 YAML、JSON、ENV 等），并提供统一的读取方式，支持热更新、默认值、环境变量、远程配置等。
	global.GVA_VP = core.Viper() // 初始化Viper

	// 初始化一些其他配置
	initialize.OtherInit()

	// 初始化zap日志库
	global.GVA_LOG = core.Zap()
	zap.ReplaceGlobals(global.GVA_LOG) // 并将其设为全局默认的 zap 日志实例

	// gorm连接数据库，获取数据库链接句柄
	global.GVA_DB = initialize.Gorm()

	initialize.Timer()
	initialize.DBList()
	initialize.SetupHandlers() // 注册全局函数
	initialize.McpRun()
	if global.GVA_DB != nil {
		initialize.RegisterTables() // 初始化表
	}
}
