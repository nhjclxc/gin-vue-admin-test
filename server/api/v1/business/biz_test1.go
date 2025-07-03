package business

import (
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
	"server/global"
	"server/model/business/request"
	"server/model/common/response"
)

type BusinessTest1Api struct{}

// GetCategoryList
// @Tags      GetCategoryList
// @Summary   媒体库分类列表
// @Security  AttachmentCategory
// @Produce   application/json
// @Success   200   {object}  response.Response{data=example.ExaAttachmentCategory,msg=string}  "媒体库分类列表"
// @Router    /attachmentCategory/getCategoryList [get]
func (a *BusinessTest1Api) Test1POST(c *gin.Context) {
	var req request.BizTest1Req
	err := c.ShouldBindJSON(&req)
	res, err := businessTest1Service.Test1POST(&req)
	if err != nil {
		global.GVA_LOG.Error("获取分类列表失败!", zap.Error(err))
		response.FailWithMessage("获取分类列表失败", c)
		return
	}
	response.OkWithData(res, c)
}
