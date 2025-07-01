package initialize

import (
	"server/global"
	"server/model/system"
)

func bizModel() error {
	db := global.GVA_DB
	err := db.AutoMigrate(system.TabUser{})
	if err != nil {
		return err
	}
	return nil
}
