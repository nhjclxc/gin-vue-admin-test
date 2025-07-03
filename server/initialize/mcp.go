package initialize

import (
	"github.com/mark3labs/mcp-go/server"
	"server/global"
	mcpTool "server/mcp"
)

// 启动一个MCP的SSE服务实例对象
// MCP：在这个上下文中的 MCP 来自于开源库 github.com/mark3labs/mcp-go，MCP 是 Message Control Protocol（消息控制协议） 的缩写，来自 mark3labs 提供的一套用于“实时事件推送和任务控制”的 Go 语言中间件框架。
func McpRun() *server.SSEServer {
	config := global.GVA_CONFIG.MCP // 从全局配置中读取 MCP 的配置信息，包含名称、版本、路径等配置字段。

	// 创建一个 MCP Server 实例
	s := server.NewMCPServer(
		config.Name,
		config.Version,
	)

	// 将创建好的 MCP Server 实例保存到全局变量 GVA_MCP_SERVER 中，便于系统其他部分使用
	global.GVA_MCP_SERVER = s

	// 通过本地封装的 mcpTool 模块（也就是 server/mcp）向 MCP Server 注册所有支持的工具。RegisterAllTools 函数的作用是将自定义的服务工具或接口挂载到 MCP Server 中。
	mcpTool.RegisterAllTools(s)

	return server.NewSSEServer(s,
		server.WithSSEEndpoint(config.SSEPath),
		server.WithMessageEndpoint(config.MessagePath),
		server.WithBaseURL(config.UrlPrefix))
}

/*
MCP 是什么？
在这个上下文中的 MCP 来自于开源库 github.com/mark3labs/mcp-go，MCP 是 Message Control Protocol（消息控制协议） 的缩写，来自 mark3labs 提供的一套用于“实时事件推送和任务控制”的 Go 语言中间件框架。

它的主要特性包括：
	用统一的协议封装多种任务或指令处理逻辑（称为工具/Tools）
	支持通过 HTTP 或 SSE 等方式进行客户端通信
	提供基于服务注册和事件发布的架构，类似于微型服务控制器

MCP 适用于以下场景：
	后端服务需要向前端实时推送消息（如任务状态更新）
	前端提交任务给后端执行，并想收到任务完成通知
	实现基于命令的远程调用架构
*/
