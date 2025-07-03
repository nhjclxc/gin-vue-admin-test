package mcpTool

import (
	"context"
	"errors"
	"fmt"
	"github.com/mark3labs/mcp-go/mcp"
	"go.uber.org/zap"
	"gorm.io/gorm"
	"server/global"
	"server/model/system"
)

func init() {
	RegisterTool(&GetNickname{})
}

type GetNickname struct{}

// 根据用户username获取nickname
func (t *GetNickname) New() mcp.Tool {
	return mcp.NewTool("getNickname",
		mcp.WithDescription("根据用户username获取nickname"),
		mcp.WithString("username",
			mcp.Required(),
			mcp.Description("用户的username"),
		))
}

// Handle 处理获取昵称的请求，注意：这是一个挂载在MCP上的SSE请求
func (t *GetNickname) Handle(ctx context.Context, request mcp.CallToolRequest) (*mcp.CallToolResult, error) {
	// 1. 参数验证
	argsMap, ok := request.Params.Arguments.(map[string]any)
	username, ok := argsMap["username"].(string)
	if !ok {
		return nil, errors.New("参数错误：username必须是字符串类型")
	}

	if username == "" {
		return nil, errors.New("参数错误：username不能为空")
	}

	// 2. 记录操作日志
	global.GVA_LOG.Info("getNickname工具被调用", zap.String("username", username))

	// 3. 优化查询，只选择需要的字段
	var user struct {
		NickName string
	}

	err := global.GVA_DB.Model(&system.SysUser{}).
		Select("nick_name").
		Where("username = ?", username).
		First(&user).Error

	// 4. 优化错误处理
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("用户不存在")
		}
		global.GVA_LOG.Error("数据库查询错误", zap.String("error", err.Error()))
		return nil, errors.New("系统错误，请稍后再试")
	}

	// 构造回复信息
	return &mcp.CallToolResult{
		Content: []mcp.Content{
			mcp.TextContent{
				Type: "text",
				Text: fmt.Sprintf("用户 %s 的昵称是 %s", username, user.NickName),
			},
		},
	}, nil
}
