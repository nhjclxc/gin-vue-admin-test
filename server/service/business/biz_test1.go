package business

import (
	"errors"
	"fmt"
	"gorm.io/gorm"
	"log"
	"server/global"
	"server/model/business"
	"server/model/business/request"
	"server/model/business/response"
	"server/utils/model_utils"
	"strconv"
	"strings"
	"time"
)

type BusinessTest1Service struct{}

// Test1新增
func (a *BusinessTest1Service) Test1POST(bizTest1 *business.BizTest1) (res *response.BizTest1Res, err error) {

	fmt.Printf("接收到参数：%#v \n", bizTest1)

	// 先查询是否有相同name的人存在
	temp := &business.BizTest1{}
	tx := global.GVA_DB.Where("name = ?", bizTest1.Name).First(temp)
	fmt.Printf("查询到的数据：%#v \n", temp)
	if !errors.Is(tx.Error, gorm.ErrRecordNotFound) {
		return nil, errors.New("存在相同name: " + temp.Name)
	}
	//if !errors.Is(global.GVA_DB.Where("name = ?", bizTest1.Name).First(&business.BizTest1{}).Error, gorm.ErrRecordNotFound) {
	//	return nil, errors.New("存在相同name")
	//}

	bizTest1.Birthday = time.Now()
	err = global.GVA_DB.Create(&bizTest1).Error

	res = &response.BizTest1Res{}
	model_utils.CopyStructFields[business.BizTest1, response.BizTest1Res](*bizTest1, res)

	res.AAA = "awertgfhjhgfrde"
	return res, err

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

// Test1修改
func (a *BusinessTest1Service) Test1PUT(bizTest1 *business.BizTest1) (res *response.BizTest1Res, err error) {

	fmt.Printf("Test1PUT 接收到参数：%#v \n", bizTest1)

	// 2、查询改id是否存在
	if bizTest1.ID == 0 {
		return nil, errors.New("ID 不能为空！！！: " + strconv.FormatUint(uint64(bizTest1.ID), 10))
	}

	// 1、再看看name是否重复
	temp := &business.BizTest1{}
	tx := global.GVA_DB.Where("name = ?", bizTest1.Name).First(temp)
	fmt.Printf("查询到的数据：%#v \n", temp)
	if !errors.Is(tx.Error, gorm.ErrRecordNotFound) && temp.ID != bizTest1.ID {
		return nil, errors.New("存在相同name: " + temp.Name)
	}

	// 3、执行修改
	//保存整个结构体（全字段更新）
	saveErr := global.GVA_DB.Save(&bizTest1).Error
	if saveErr != nil {
		return nil, errors.New("Save修改失败: " + saveErr.Error())
	}
	fmt.Printf("bizTest1 = %#v \n", bizTest1)

	// db.Model().Updates()：只更新指定字段
	//errUpdates := global.GVA_DB.Debug().Model(&business.BizTest1{}).
	errUpdates := global.GVA_DB.Model(&business.BizTest1{}).
		Select("email", "age", "remark").
		Where("id=?", bizTest1.ID).
		Updates(map[string]interface{}{
			"email":  "Updates.email",
			"age":    18,
			"remark": "Updates备注",
		}).Error
	if errUpdates != nil {
		return nil, errors.New("Updates修改失败: " + errUpdates.Error())
	}

	res = &response.BizTest1Res{}
	model_utils.CopyStructFields[business.BizTest1, response.BizTest1Res](*bizTest1, res)

	res.AAA = "update"
	return res, err
}

// Test1 分页查询
func (a *BusinessTest1Service) Test1GetPageList(req *request.BizTest1Req) (list interface{}, total int64, err error) {

	fmt.Printf("Test1GetPageList 接收到参数：%#v \n", req)

	limit := req.PageSize
	offset := req.PageSize * (req.Page - 1)
	db := global.GVA_DB.Model(&business.BizTest1{})
	var bizTest1List []business.BizTest1

	if req.Name != "" {
		db = db.Where("name LIKE ?", "%"+strings.ToLower(req.Name)+"%")
	}
	if req.Age != 0 {
		db = db.Where("age = ?", "%"+strconv.Itoa(req.Age)+"%")
	}
	if req.Email != "" {
		db = db.Where("email LIKE ?", "%"+strings.ToLower(req.Email)+"%")
	}

	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&bizTest1List).Error

	// 使用通用的分页函数
	//db.Model(&business.BizTest1{}).Count(&total)
	//db.Scopes(Paginate(req.PageSize, req.PageSize)).Find(&bizTest1List)

	return bizTest1List, total, err
}

// 分页函数
func Paginate(page, pageSize int) func(db *gorm.DB) *gorm.DB {
	return func(db *gorm.DB) *gorm.DB {
		if page == 0 {
			page = 1
		}
		switch {
		case pageSize > 100:
			pageSize = 100
		case pageSize <= 0:
			pageSize = 10
		}
		offset := (page - 1) * pageSize
		return db.Offset(offset).Limit(pageSize)
	}
}

// Test1 通过id查询
func (a *BusinessTest1Service) Test1GetById(req *request.BizTest1Req) (res response.BizTest1Res, err error) {

	fmt.Printf("Test1GetById 接收到参数：%#v \n", req)
	temp := &business.BizTest1{}
	global.GVA_DB.Debug().Find(temp, "id = ?", req.ID)

	res = response.BizTest1Res{}
	model_utils.CopyStructFields[business.BizTest1, response.BizTest1Res](*temp, &res)

	res.AAA = "Test1GetById"
	return res, err

}

// Test1 删除
func (a *BusinessTest1Service) Test1Delete(req *request.BizTest1Req) (res response.BizTest1Res, err error) {

	fmt.Printf("接收到参数：%#v \n", req)

	// 以下使用的是软删除
	global.GVA_DB.Debug().Delete(&business.BizTest1{}, "id = ?", req.ID)

	// 以下使用的是物理删除
	global.GVA_DB.Debug().Unscoped().Delete(&business.BizTest1{}, "id = ?", req.ID+1)

	return response.BizTest1Res{}, nil
}

// ✅ 推荐方式：使用 db.Transaction()（自动处理提交和回滚）
func (a *BusinessTest1Service) Transaction(req *request.BizTest1Req) (res response.BizTest1Res, err error) {

	fmt.Printf("Test1GetById 接收到参数：%#v \n", req)

	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		// 如果返回了error则，执行事务回滚
		// 如果返回nil则提交事务

		// 【【【注意：以下的所有事务操作必须使用这个回调函数的tx句柄来实现，否则事务不生效】】】

		// 写操作1
		errUpdates := tx.Debug().Model(&business.BizTest1{}).
			Select("email", "age", "remark").
			Where("id=?", req.ID).
			Updates(map[string]interface{}{
				"email":  "Updates.email",
				"age":    18,
				"remark": "Updates备注",
			}).Error
		if errUpdates != nil {
			return errUpdates // 自动回滚
		}

		fmt.Printf("111")
		if req.ID == 3 {
			return errors.New("id不能为3")
		}

		errUpdates2 := tx.Debug().Model(&business.BizTest1{}).
			Select("email", "remark").
			Where("id=?", req.ID+1).
			Updates(map[string]interface{}{
				"email":  "errUpdates2.email",
				"remark": "errUpdates2errUpdates2备注",
			}).Error
		if errUpdates2 != nil {
			return errUpdates2 // 自动回滚
		}

		// 所有操作成功，没有错误返回，则自动提交
		return nil
	})

	res = response.BizTest1Res{}
	res.AAA = "Test1GetById"
	return res, err

}

// ✅ 进阶方式：手动控制 Begin + Rollback + Commit
func (a *BusinessTest1Service) BeginRollbackCommit(req *request.BizTest1Req) (res response.BizTest1Res, err error) {

	fmt.Printf("Test1GetById 接收到参数：%#v \n", req)

	res = response.BizTest1Res{}

	res.AAA = "Test1GetById"

	// 1、开启事务
	tx := global.GVA_DB.Begin()
	// 【【【注意：以下的所有事务操作必须使用这个回调函数的tx句柄来实现，否则事务不生效】】】

	// 写操作1
	errUpdates := tx.Debug().Model(&business.BizTest1{}).
		Select("email", "age", "remark").
		Where("id=?", req.ID).
		Updates(map[string]interface{}{
			"email":  "Updates.email",
			"age":    18,
			"remark": "Updates备注",
		}).Error
	if errUpdates != nil {
		tx.Rollback() // 回滚事务
		return res, errUpdates
	}

	fmt.Printf("111")
	if req.ID == 3 {
		tx.Rollback() // 回滚事务
		return res, errors.New("id不能为3")
	}

	errUpdates2 := tx.Debug().Model(&business.BizTest1{}).
		Select("email", "remark").
		Where("id=?", req.ID+1).
		Updates(map[string]interface{}{
			"email":  "errUpdates2.email",
			"remark": "errUpdates2errUpdates2备注",
		}).Error
	if errUpdates2 != nil {
		tx.Rollback() // 回滚事务
		return res, err
	}

	// 提交事务
	if err := tx.Commit().Error; err != nil {
		return res, err
	}

	// 其他不需要开启事务的操作
	// ...

	return res, err

}

func (a *BusinessTest1Service) RecursiveQuery(req *request.BizTest1Req) (res business.BizTest1, err error) {

	//bizTest1 *business.BizTest1

	var allNodes []business.BizTest1
	err = global.GVA_DB.Raw(`
		with recursive temp as
	   (
		   select bt.* from biz_test1 bt where bt.ID = ?
		   union all
		   select bt2.* from biz_test1 bt2
				  inner join temp on temp.id = bt2.parent_id
	   )
		select temp.* from temp`, req.ID).Scan(&allNodes).Error

	if err != nil {
		log.Fatal("查询失败：", err)
	}

	tree := BuildSubTree(allNodes, req.ID)

	return *tree, nil
}

// 构建以某个节点为根的子树
func BuildSubTree(allNodes []business.BizTest1, rootID uint) *business.BizTest1 {
	var root *business.BizTest1

	// 将节点映射为 map[id]node
	nodeMap := make(map[uint]*business.BizTest1)
	for i := range allNodes {
		nodeCopy := allNodes[i] // 必须拷贝避免引用错乱
		nodeCopy.ChildrenList = []*business.BizTest1{}
		nodeMap[nodeCopy.ID] = &nodeCopy
	}

	// 构造树结构
	for _, node := range nodeMap {
		if node.ParentId == rootID {
			// 顶层挂载点
			if root == nil {
				root = nodeMap[rootID]
				if root == nil {
					// 如果数据里没有 root 本身（只传了子节点），构造一个空的根
					root = &business.BizTest1{GVA_MODEL: global.GVA_MODEL{
						ID: rootID,
					}}
				}
			}
			root.ChildrenList = append(root.ChildrenList, node)
		} else if parent, ok := nodeMap[node.ParentId]; ok {
			parent.ChildrenList = append(parent.ChildrenList, node)
		}
	}

	return root
}

func (a *BusinessTest1Service) RecursiveQueryParent(req *request.BizTest1Req) (res business.BizTest1, err error) {

	var allNodes []business.BizTest1
	err = global.GVA_DB.Raw(`
		with recursive temp as
		(
			select bt.* from biz_test1 bt where bt.ID = 11
			union all
			select bt2.* from biz_test1 bt2
				inner join temp where bt2.id = temp.parent_id
		) select temp.* from temp`, req.ID).Scan(&allNodes).Error

	if err != nil {
		log.Fatal("查询失败：", err)
	}

	tree := BuildSubTree(allNodes, req.ID)

	return *tree, nil
}

func (a *BusinessTest1Service) One2Many(req *request.BizTest1Req) (res business.BizTest1, err error) {

	// Preload("Orders") 表示预加载 Orders 字段，也就是一对多的关联数据
	// 如果不加 Preload，默认不会自动加载关联。

	global.GVA_DB.Debug().Preload("BizTest2List").First(&res, req.ID)
	fmt.Println(res.Name)
	for _, order := range res.BizTest2List {
		fmt.Println(order)
	}

	return
}

// 批量操作，
func (a *BusinessTest1Service) BatchOpt(req *request.BizTest1Req) (res business.BizTest1, err error) {
	users := []business.BizTest1{{Name: "Tom", Birthday: time.Now()}, {Name: "Jerry", Birthday: time.Now()}, {Name: "duom", Birthday: time.Now()}}
	global.GVA_DB.Debug().Create(&users)

	global.GVA_DB.Debug().Model(&business.BizTest1{}).Where("age > ?", 18).Update("remark", "嘿嘿嘿")

	return
}

// 乐观锁（版本控制），
func (a *BusinessTest1Service) VersionControl(req *request.BizTest1Req) (res business.BizTest1, err error) {

	global.GVA_DB.Debug().Model(&business.BizTest1{}).Where("ID = ? and version = ?", req.ID, req.Version).Updates(map[string]interface{}{
		"Name":    "Updated" + req.Name + time.Now().String(),
		"Version": req.Version + 1,
	})
	return
}
