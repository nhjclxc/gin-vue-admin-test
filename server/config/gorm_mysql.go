package config

type Mysql struct {
	GeneralDB `yaml:",inline" mapstructure:",squash"`
}

// 拼接数据库链接配置
func (m *Mysql) Dsn() string {
	// "root:root123@tcp(127.0.0.1:3306)/test?charset=utf8&parseTime=True"
	return m.Username + ":" + m.Password + "@tcp(" + m.Path + ":" + m.Port + ")/" + m.Dbname + "?" + m.Config
}
