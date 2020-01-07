package common

import (
	"fmt"
	"github.com/astaxie/beego"
	_ "github.com/go-sql-driver/mysql"
	"os"
	"xorm.io/xorm"
)

var Engine *xorm.Engine

func NewEngine() *xorm.Engine {
	var error error
	mysqluser := beego.AppConfig.String("mysqluser")
	mysqlpass := beego.AppConfig.String("mysqlpass")
	mysqlurls := beego.AppConfig.String("mysqlurls")
	mysqldb := beego.AppConfig.String("mysqldb")
	url := mysqluser + ":" + mysqlpass + "@tcp(" + mysqlurls + ":3306)/" + mysqldb + "?charset=utf8mb4"
	Engine, error = xorm.NewEngine("mysql", url)
	if error == nil {
		Engine.ShowSQL(true, true)
		return Engine
	}
	fmt.Println(error)
	return Engine
}

func init() {

	Engine = NewEngine()
	f, err := os.Create("sql.log")
	if err != nil {
		println(err.Error())
		return
	}
	defer f.Close()

}
