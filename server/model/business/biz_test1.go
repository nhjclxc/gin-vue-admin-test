package business

import (
	"server/global"
	"time"
)

// 如果含有time.Time 请自行import time包
type BizTest1 struct {
	global.GVA_MODEL
	//Id           int       `orm:"column(user_id);auto" description:"Standard field for the primary key"`
	Name         string    `orm:"column(name);size(255)" description:"A regular string field"`
	Email        string    `orm:"column(email);size(255);null" description:"A pointer to a string, allowing for null values"`
	Age          int8      `orm:"column(age)" description:"An unsigned 8-bit integer"`
	Birthday     time.Time `orm:"column(birthday);type(datetime);null" description:"A pointer to time.Time, can be null"`
	MemberNumber string    `orm:"column(member_number);size(255);null" description:"Uses sql.NullString to handle nullable strings"`
	Remark       string    `orm:"column(remark);size(128);null" description:"备注"`
	ActivatedAt  time.Time `orm:"column(activated_at);type(datetime);null" description:"Uses sql.NullTime for nullable time fields"`
	CreatedAt    time.Time `orm:"column(created_at);type(datetime);auto_now_add" description:"Automatically managed by GORM for creation time"`
	UpdatedAt    time.Time `orm:"column(updated_at);type(datetime);auto_now_add" description:"Automatically managed by GORM for update time"`
}

func (t *BizTest1) TableName() string {
	return "biz_test1"
}

/*
-- auto-generated definition
create table biz_test1
(
    user_id       bigint unsigned auto_increment comment 'Standard field for the primary key'
        primary key,
    name          varchar(255)                       not null comment 'A regular string field',
    email         varchar(255)                       null comment 'A pointer to a string, allowing for null values',
    age           tinyint unsigned                   not null comment 'An unsigned 8-bit integer',
    birthday      datetime                           null comment 'A pointer to time.Time, can be null',
    member_number varchar(255)                       null comment 'Uses sql.NullString to handle nullable strings',
    remark        varchar(128)                       null comment '备注',
    activated_at  datetime                           null comment 'Uses sql.NullTime for nullable time fields',
    created_at    datetime default CURRENT_TIMESTAMP not null comment 'Automatically managed by GORM for creation time',
    updated_at    datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'Automatically managed by GORM for update time'
)
    comment 'tab_user' charset = utf8mb4;
*/
