package business

import (
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
	"server/global"
	"server/model/business"
	"server/model/business/request"
	"server/model/common/response"
)

type BusinessTest1Api struct{}

// Test1POST
// @Tags      Test1POST
// @Summary   Test1新增
// @Security  test1
// @Produce   application/json
// @Success   200   {object}  response.Response{data=business.BusinessTest1Api,msg=string}  "Test1新增"
// @Router    /test1/post [post]
func (a *BusinessTest1Api) Test1POST(c *gin.Context) {
	// http://localhost:8080/api/test1/pri/post
	/*
		{
		    "name": "namename58",
		    "email": "emailemail",
		    "memberNumber": "memberNumbermemberNumber",
		    "remark": "remarkremark"
		}
	*/
	var bizTest1 business.BizTest1
	err := c.ShouldBindJSON(&bizTest1)
	res, err := businessTest1Service.Test1POST(&bizTest1)
	if err != nil {
		global.GVA_LOG.Error("新增Test1失败！", zap.Error(err))
		response.FailWithMessage("新增Test1失败！"+err.Error(), c)
		return
	}
	response.OkWithData(res, c)
}

// Test1PUT
// @Tags      Test1PUT
// @Summary   Test1修改
// @Security  test1
// @Produce   application/json
// @Success   200   {object}  response.Response{data=business.BusinessTest1Api,msg=string}  "Test1修改"
// @Router    /test1/put [put]
func (a *BusinessTest1Api) Test1PUT(c *gin.Context) {
	// http://localhost:8080/api/test1/pri/put
	/*
		{
		        "ID": 7,
		        "CreatedAt": "2025-07-08T11:19:22.681+08:00",
		        "UpdatedAt": "2025-07-08T11:19:22.681+08:00",
		        "Name": "namename58",
		        "Email": "emailemail",
		        "Age": 0,
		        "Birthday": "2025-07-08T11:19:22.6804676+08:00",
		        "MemberNumber": "memberNumbermemberNumber",
		        "Remark": "remarkremark",
		        "aaa": "awertgfhjhgfrde"
		    }
	*/
	var bizTest1 business.BizTest1
	err := c.ShouldBindJSON(&bizTest1)
	res, err := businessTest1Service.Test1PUT(&bizTest1)
	if err != nil {
		global.GVA_LOG.Error("修改Test1失败！", zap.Error(err))
		response.FailWithMessage("修改Test1失败！", c)
		return
	}
	response.OkWithData(res, c)
}

// Test1POST
// @Tags      Test1POST
// @Summary   Test1分页查询
// @Security  test1
// @Produce   query
// @Success   200   {object}  response.Response{data=business.BusinessTest1Api,msg=string}  "Test1分页查询"
// @Router    /test1/getPageList [get]
func (a *BusinessTest1Api) Test1GetPageList(c *gin.Context) {

	var req request.BizTest1Req
	err := c.ShouldBindQuery(&req)
	list, total, err := businessTest1Service.Test1GetPageList(&req)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetailed(response.PageResult{
		List:     list,
		Total:    total,
		Page:     req.Page,
		PageSize: req.PageSize,
	}, "获取成功", c)

}

// Test1GetById
// @Tags      Test1GetById
// @Summary   Test1查询详细
// @Security  test1
// @Produce   query
// @Success   200   {object}  response.Response{data=business.BusinessTest1Api,msg=string}  "Test1查询详细"
// @Router    /test1/getById [get]
func (a *BusinessTest1Api) Test1GetById(c *gin.Context) {
	// http://localhost:8080/api/test1/pri/getById
	var req request.BizTest1Req
	err := c.ShouldBindQuery(&req)
	res, err := businessTest1Service.Test1GetById(&req)
	if err != nil {
		global.GVA_LOG.Error("新增Test1失败！", zap.Error(err))
		response.FailWithMessage("新增Test1失败！", c)
		return
	}
	response.OkWithData(res, c)
}

// Test1Delete
// @Tags      Test1Delete
// @Summary   Test1删除
// @Security  test1
// @Produce   query
// @Success   200   {object}  response.Response{data=business.BusinessTest1Api,msg=string}  "Test1查询详细"
// @Router    /test1/delete [delete]
func (a *BusinessTest1Api) Test1Delete(c *gin.Context) {
	// http://localhost:8080/api/test1/pri/delete
	var req request.BizTest1Req
	err := c.ShouldBindQuery(&req)
	res, err := businessTest1Service.Test1Delete(&req)
	if err != nil {
		global.GVA_LOG.Error("删除Test1失败！", zap.Error(err))
		response.FailWithMessage("删除Test1失败！", c)
		return
	}
	response.OkWithData(res, c)
}

func (a *BusinessTest1Api) Transaction(c *gin.Context) {
	var req request.BizTest1Req
	err := c.ShouldBindQuery(&req)
	res, err := businessTest1Service.Transaction(&req)
	if err != nil {
		global.GVA_LOG.Error("新增Test1失败！", zap.Error(err))
		response.FailWithMessage("新增Test1失败！", c)
		return
	}
	response.OkWithData(res, c)
}
func (a *BusinessTest1Api) BeginRollbackCommit(c *gin.Context) {
	var req request.BizTest1Req
	err := c.ShouldBindQuery(&req)
	res, err := businessTest1Service.BeginRollbackCommit(&req)
	if err != nil {
		global.GVA_LOG.Error("新增Test1失败！", zap.Error(err))
		response.FailWithMessage("新增Test1失败！", c)
		return
	}
	response.OkWithData(res, c)
}

func (a *BusinessTest1Api) RecursiveQuery(c *gin.Context) {
	// http://localhost:8080/api/test1/pub/recursiveQuery?id=1
	// http://localhost:8080/api/test1/pub/recursiveQuery?id=3
	// http://localhost:8080/api/test1/pub/recursiveQuery?id=11

	var req request.BizTest1Req
	err := c.ShouldBindQuery(&req)
	res, err := businessTest1Service.RecursiveQuery(&req)
	if err != nil {
		global.GVA_LOG.Error("新增Test1失败！", zap.Error(err))
		response.FailWithMessage("新增Test1失败！", c)
		return
	}
	response.OkWithData(res, c)
}

func (a *BusinessTest1Api) RecursiveQueryParent(c *gin.Context) {
	var req request.BizTest1Req
	err := c.ShouldBindQuery(&req)
	res, err := businessTest1Service.RecursiveQueryParent(&req)
	if err != nil {
		global.GVA_LOG.Error("新增Test1失败！", zap.Error(err))
		response.FailWithMessage("新增Test1失败！", c)
		return
	}
	response.OkWithData(res, c)
}

func (a *BusinessTest1Api) One2Many(c *gin.Context) {
	// http://localhost:8080/api/test1/pub/one2Many?id=11

	var req request.BizTest1Req
	err := c.ShouldBindQuery(&req)
	res, err := businessTest1Service.One2Many(&req)
	if err != nil {
		global.GVA_LOG.Error("新增Test1失败！", zap.Error(err))
		response.FailWithMessage("新增Test1失败！", c)
		return
	}
	response.OkWithData(res, c)
}
func (a *BusinessTest1Api) BatchOpt(c *gin.Context) {
	// http://localhost:8080/api/test1/pub/batchOpt?id=11

	var req request.BizTest1Req
	err := c.ShouldBindQuery(&req)
	res, err := businessTest1Service.BatchOpt(&req)
	if err != nil {
		global.GVA_LOG.Error("新增Test1失败！", zap.Error(err))
		response.FailWithMessage("新增Test1失败！", c)
		return
	}
	response.OkWithData(res, c)
}
func (a *BusinessTest1Api) VersionControl(c *gin.Context) {
	// http://localhost:8080/api/test1/pub/versionControl?id=11

	var req request.BizTest1Req
	err := c.ShouldBindQuery(&req)
	res, err := businessTest1Service.VersionControl(&req)
	if err != nil {
		global.GVA_LOG.Error("新增Test1失败！", zap.Error(err))
		response.FailWithMessage("新增Test1失败！", c)
		return
	}
	response.OkWithData(res, c)
}
