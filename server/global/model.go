package global

import (
	"time"

	"gorm.io/gorm"
)

// 这个是每一个表的基类型，类似于Java的BaseObject.java
type GVA_MODEL struct {
	ID        uint           `gorm:"primarykey" json:"ID"` // 主键ID
	CreatedAt time.Time      // 创建时间
	UpdatedAt time.Time      // 更新时间
	DeletedAt gorm.DeletedAt `gorm:"index" json:"-"` // 删除时间 GORM 默认启用了“软删除（Soft Delete）”只要存在这个字段，GORM 默认启用软删除。
}
