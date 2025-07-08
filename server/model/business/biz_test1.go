package business

import (
	"gorm.io/gorm"
	"server/global"
	"strings"
	"time"
)

// 如果含有time.Time 请自行import time包
type BizTest1 struct {
	global.GVA_MODEL
	//Id           int       `gorm:"column(user_id);auto" description:"Standard field for the primary key"`
	ParentId     uint      `gorm:"column(parent_id)" json:"parentId"` // 主键ID
	Name         string    `gorm:"column(name);size(255)" description:"A regular string field"`
	Email        string    `gorm:"column(email);size(255);null" description:"A pointer to a string, allowing for null values"`
	Age          int8      `gorm:"column(age)" description:"An unsigned 8-bit integer"`
	Birthday     time.Time `gorm:"column(birthday);type(datetime);null" description:"A pointer to time.Time, can be null"`
	MemberNumber string    `gorm:"column(member_number);size(255);null" description:"Uses sql.NullString to handle nullable strings"`
	Remark       string    `gorm:"column(remark);size(128);null" description:"备注"`
	Version      uint      `gorm:"column(version);default:1" description:"乐观锁（版本控制）"`

	// 用于递归的类型
	ChildrenList []*BizTest1 `json:"children,omitempty" gorm:"-"`

	// 一对多查询
	BizTest2List []BizTest2 `json:"bizTest2List,omitempty" gorm:"foreignKey:Test1Id"` // 一对多查询，指定关联表的id

}

func (t *BizTest1) TableName() string {
	return "biz_test1"
}

// 可用钩子包括：
// BeforeCreate / AfterCreate
// BeforeUpdate / AfterUpdate
// BeforeDelete / AfterDelete
func (u *BizTest1) BeforeCreate(tx *gorm.DB) (err error) {
	u.Name = strings.ToUpper(u.Name)
	return
}

/*
-- auto-generated definition
create table biz_test1
(
    ID       bigint unsigned auto_increment comment 'Standard field for the primary key'
        primary key,
    created_at datetime(3)      null,
    updated_at datetime(3)      null,
    deleted_at datetime(3)      null,
    parent_id  bigint unsigned not null default 0 comment 'biz_test1.id, 用于递归查询',
    name          varchar(255)                       not null comment 'A regular string field',
    email         varchar(255)                       null comment 'A pointer to a string, allowing for null values',
    age           tinyint unsigned                   null comment 'An unsigned 8-bit integer',
    birthday      datetime                           null comment 'A pointer to time.Time, can be null',
    member_number varchar(255)                       null comment 'Uses sql.NullString to handle nullable strings',
    remark        varchar(128)                       null comment '备注',
    version  bigint unsigned not null default 1 comment '乐观锁（版本控制）'
)
    comment 'biz_test1' charset = utf8mb4;
*/

type BizTest2 struct {
	global.GVA_MODEL
	Test1Id uint   `gorm:"column(test1_id)" json:"test1Id"` // 主键ID
	Name    string `gorm:"column(name);size(255)" description:"A regular string field"`
	Remark  string `gorm:"column(remark);size(128);null" description:"备注"`
}

func (t *BizTest2) TableName() string {
	return "biz_test2"
}

/*
create table biz_test2
(
    ID         bigint unsigned auto_increment comment 'Standard field for the primary key'
        primary key,
    created_at datetime(3)     null,
    updated_at datetime(3)     null,
    deleted_at datetime(3)     null,
    test1_id   bigint unsigned not null comment 'biz_test1.id, 用于1:n的关联',
    name       varchar(255)    not null comment 'A regular string field',
    remark     varchar(128)    null comment '备注'
)
    comment 'biz_test2, biz_test1:biz_test2=1:n' charset = utf8mb4;
*/
