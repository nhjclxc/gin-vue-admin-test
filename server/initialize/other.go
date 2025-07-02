package initialize

import (
	"bufio"
	"github.com/songzhibin97/gkit/cache/local_cache"
	"os"
	"strings"

	"server/global"
	"server/utils"
)

func OtherInit() {
	dr, err := utils.ParseDuration(global.GVA_CONFIG.JWT.ExpiresTime)
	if err != nil {
		panic(err)
	}
	_, err = utils.ParseDuration(global.GVA_CONFIG.JWT.BufferTime)
	if err != nil {
		panic(err)
	}

	// 加载黑名单
	global.BlackCache = local_cache.NewCache(
		local_cache.SetDefaultExpire(dr),
	)

	// 读取go.mod的模块名称，这个是用于代码生成的
	file, err := os.Open("go.mod")
	if err == nil && global.GVA_CONFIG.AutoCode.Module == "" {
		scanner := bufio.NewScanner(file)
		scanner.Scan()
		global.GVA_CONFIG.AutoCode.Module = strings.TrimPrefix(scanner.Text(), "module ")
	}
}
