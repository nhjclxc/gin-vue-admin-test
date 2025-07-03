package business

import (
	"fmt"
	"server/model/business/request"
	"server/model/business/response"
)

type BusinessTest1Service struct{}

// AddCategory 创建/更新的分类
func (a *BusinessTest1Service) Test1POST(req *request.BizTest1Req) (res response.BizTest1Res, err error) {

	fmt.Printf("接收到参数：%#v \n", req)

	return response.BizTest1Res{
		Name:         req.Name + ": Name",
		Email:        req.Email + ": Email",
		MemberNumber: req.MemberNumber + ": MemberNumber",
		Remark:       req.Remark + ": Remark",
	}, nil

	//// 检查是否已存在相同名称的分类
	//if (!errors.Is(global.GVA_DB.Take(&example.ExaAttachmentCategory{}, "name = ? and pid = ?", req.Name, req.Pid).Error, gorm.ErrRecordNotFound)) {
	//	return errors.New("分类名称已存在")
	//}
	//if req.ID > 0 {
	//	if err = global.GVA_DB.Model(&example.ExaAttachmentCategory{}).Where("id = ?", req.ID).Updates(&example.ExaAttachmentCategory{
	//		Name: req.Name,
	//		Pid:  req.Pid,
	//	}).Error; err != nil {
	//		return err
	//	}
	//} else {
	//	if err = global.GVA_DB.Create(&example.ExaAttachmentCategory{
	//		Name: req.Name,
	//		Pid:  req.Pid,
	//	}).Error; err != nil {
	//		return err
	//	}
	//}
	//return nil
}
