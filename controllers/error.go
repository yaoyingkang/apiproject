package controllers

import (
	"github.com/astaxie/beego"
)

type ResponseData struct {
	Data    interface{}
	Code    int
	Message string
	tip     string
}

type ErrorController struct {
	beego.Controller
}

func (c *ErrorController) Error404() {
	c.Data["content"] = "page not found"
	c.TplName = "404.tpl"
}

func (c *ErrorController) Error501() {
	c.Data["content"] = "server error"
	c.TplName = "501.tpl"
}

func (c *ErrorController) Error401() {
	c.Data["json"] = ResponseData{401, 401, "error"}
	c.ServeJSON()
}

func (c *ErrorController) Error403() {
	c.Data["json"] = ResponseData{403, 403, "error"}
	c.ServeJSON()
}

func (c *ErrorController) Error405() {
	c.Data["json"] = ResponseData{405, 405, "error"}
	c.ServeJSON()
}

func (c *ErrorController) ErrorDb() {
	c.Data["content"] = "database is now down"
	c.TplName = "dberror.tpl"
}
