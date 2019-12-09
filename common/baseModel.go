package common

import (
	"github.com/astaxie/beego"
	"xorm.io/xorm"
)

var Engine *xorm.Engine
func NewEngine() *xorm.Engine {
	mysqluser:=beego.AppConfig.String("mysqluser")
	mysqlpass:=beego.AppConfig.String("mysqlpass")
	mysqlurls:=beego.AppConfig.String("mysqlurls")
	mysqldb:=beego.AppConfig.String("mysqldb")
	url:=mysqluser+":"+mysqlpass+"@tcp("+mysqlurls+":3306)/"+mysqldb+"?charset=utf8mb4"
	Engine, _ = xorm.NewEngine("mysql", url)
	Engine.ShowSQL(true)
	return Engine
}