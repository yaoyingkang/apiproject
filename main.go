package main

import (
	"apiproject/controllers"
	_ "apiproject/routers"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/plugins/cors"
	_ "github.com/go-sql-driver/mysql"
	"xorm.io/xorm"
)

var engine *xorm.Engine

func init() {
	//orm.RegisterDriver("mysql", orm.DRMySQL)

	mysqluser := beego.AppConfig.String("mysqluser")
	mysqlpass := beego.AppConfig.String("mysqlpass")
	mysqlurls := beego.AppConfig.String("mysqlurls")
	mysqldb := beego.AppConfig.String("mysqldb")
	url := mysqluser + ":" + mysqlpass + "@tcp(" + mysqlurls + ":3306)/" + mysqldb + "?charset=utf8mb4"
	engine, _ = xorm.NewEngine("mysql", url)
	orm.RegisterDataBase("default", "mysql", url)
	//engine, _ = xorm.NewEngine("mysql", url)
}

func main() {
	if beego.BConfig.RunMode == "dev" {
		beego.BConfig.WebConfig.DirectoryIndex = true
		beego.BConfig.WebConfig.StaticDir["/swagger"] = "swagger"
	}
	fmt.Println(111)
	beego.InsertFilter("*", beego.BeforeRouter, cors.Allow(&cors.Options{
		AllowAllOrigins:  true,
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Authorization", "Access-Control-Allow-Origin", "Access-Control-Allow-Headers", "Content-Type", "application/json"},
		ExposeHeaders:    []string{"Content-Length", "Access-Control-Allow-Origin", "Access-Control-Allow-Headers", "Content-Type", "application/json"},
		AllowCredentials: true,
	}))
	fmt.Println(222)
	beego.ErrorController(&controllers.ErrorController{})
	beego.Run()
}
