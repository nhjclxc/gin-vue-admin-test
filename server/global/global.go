package global

import (
	"fmt"
	"github.com/mark3labs/mcp-go/server"
	"sync"

	"github.com/gin-gonic/gin"
	"github.com/qiniu/qmgo"

	"github.com/songzhibin97/gkit/cache/local_cache"
	"server/utils/timer"

	"golang.org/x/sync/singleflight"

	"go.uber.org/zap"

	"server/config"

	"github.com/redis/go-redis/v9"
	"github.com/spf13/viper"
	"gorm.io/gorm"
)

// global 里面存储着全局变量，如数据库句柄，redis缓存句柄等等
// gav，GAV：Go Vue Admin —— 基于 Go（Gin）+ Vue3 的前后端分离后台管理系统。
var (
	GVA_DB        *gorm.DB
	GVA_DBList    map[string]*gorm.DB
	GVA_REDIS     redis.UniversalClient
	GVA_REDISList map[string]redis.UniversalClient
	GVA_MONGO     *qmgo.QmgoClient
	GVA_CONFIG    config.Server
	GVA_VP        *viper.Viper // 保存配置文件的数据Viper
	// GVA_LOG    *oplogging.Logger
	GVA_LOG                 *zap.Logger                        // zap 日志工具，用这个打日志
	GVA_Timer               timer.Timer = timer.NewTimerTask() // 定时任务
	GVA_Concurrency_Control             = &singleflight.Group{}
	GVA_ROUTERS             gin.RoutesInfo
	GVA_ACTIVE_DBNAME       *string // 当前链接的数据库名称
	GVA_MCP_SERVER          *server.MCPServer
	BlackCache              local_cache.Cache
	lock                    sync.RWMutex
)

// GetGlobalDBByDBName 通过名称获取db list中的db
func GetGlobalDBByDBName(dbname string) *gorm.DB {
	lock.RLock()
	defer lock.RUnlock()
	return GVA_DBList[dbname]
}

// MustGetGlobalDBByDBName 通过名称获取db 如果不存在则panic
func MustGetGlobalDBByDBName(dbname string) *gorm.DB {
	lock.RLock()
	defer lock.RUnlock()
	db, ok := GVA_DBList[dbname]
	if !ok || db == nil {
		panic("db no init")
	}
	return db
}

func GetRedis(name string) redis.UniversalClient {
	redis, ok := GVA_REDISList[name]
	if !ok || redis == nil {
		panic(fmt.Sprintf("redis `%s` no init", name))
	}
	return redis
}
