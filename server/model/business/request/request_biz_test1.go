package request

type BizTest1Req struct {
	ID       uint   `form:"id"` // 主键ID
	Name     string `form:"name"`
	Email    string `form:"email"`
	Age      int    `form:"age"`
	Page     int    `form:"page"`
	PageSize int    `form:"pageSize"`
	Version  uint   `form:"version"`
}
