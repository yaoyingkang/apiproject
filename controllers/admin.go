package controllers

import (
	"apiproject/models"
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego"
)

// AdminController operations for Admin
type AdminController struct {
	beego.Controller
}

// URLMapping ...
func (c *AdminController) URLMapping() {
	//c.Mapping("Post", c.Post)
	////c.Mapping("GetOne", c.GetOne)
	//c.Mapping("GetAll", c.GetAll)
	//c.Mapping("Put", c.Put)
	//c.Mapping("Delete", c.Delete)
}

// Post ...
// @Title Create
// @Description create Admin
// @Param	body		body 	models.Admin	true		"body for Admin content"
// @Success 201 {object} models.Admin
// @Failure 403 body is empty
// @router / [post]
func (u *AdminController) Post() {
	var ob struct {
		Password string
		Username string
	}
	var err error
	if err = json.Unmarshal(u.Ctx.Input.RequestBody, &ob); err == nil {
		fmt.Println(ob, ob.Username, ob.Password)
		var user models.AdminUsers
		user.Username = ob.Username
		user.Password = ob.Password
		token, errs := models.AddAdminUsers(&user)
		if errs == nil {
			u.Data["json"] = Data{token, 1, "success"}
		} else {
			u.Data["json"] = Data{"", 0, errs.Error()}
		}
	} else {
		u.Data["json"] = Data{"", 0, err.Error()}
	}

	u.ServeJSON()
}

func (c *AdminController) GetOne() {

	user := c.Ctx.Input.GetData("user")
	if bUser, ok := user.(*models.AdminUsers); ok {

		data := make(map[string]interface{})
		data["user_name"] = bUser.Username
		data["id"] = bUser.Id
		data["avatar"] = bUser.Avatar
		c.Data["json"] = Data{data, 1, "success"}
		c.ServeJSON()
	}
	c.Data["json"] = Data{"", 0, "error"}
	c.ServeJSON()

}

// GetAll ...
// @Title GetAll
// @Description get Admin
// @Param	query	query	string	false	"Filter. e.g. col1:v1,col2:v2 ..."
// @Param	fields	query	string	false	"Fields returned. e.g. col1,col2 ..."
// @Param	sortby	query	string	false	"Sorted-by fields. e.g. col1,col2 ..."
// @Param	order	query	string	false	"Order corresponding to each sortby field, if single value, apply to all sortby fields. e.g. desc,asc ..."
// @Param	limit	query	string	false	"Limit the size of result set. Must be an integer"
// @Param	offset	query	string	false	"Start position of result set. Must be an integer"
// @Success 200 {object} models.Admin
// @Failure 403
// @router / [get]
func (u *AdminController) GetAll() {
	var ob struct {
		Fields []string `json:"fields"`
		Order  []string `json:"order"`
		Offset int      `json:"offset"`
		Limit  int      `json:"limit"`
	}
	var err error
	fmt.Println(ob, ob.Fields, ob.Order)
	if err = json.Unmarshal(u.Ctx.Input.RequestBody, &ob); err == nil {
		fmt.Println(ob, ob.Fields, ob.Order)

		token, errs := models.AdminListPage(ob.Fields, ob.Order, ob.Offset, ob.Limit)
		if errs == nil {
			u.Data["json"] = Data{token, 1, "success"}
		} else {
			u.Data["json"] = Data{"", 0, errs.Error()}
		}
	} else {
		fmt.Println(ob, ob.Fields, ob.Order)
		u.Data["json"] = Data{"", 0, err.Error()}
	}

	u.ServeJSON()
}

// Put ...
// @Title Put
// @Description update the Admin
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.Admin	true		"body for Admin content"
// @Success 200 {object} models.Admin
// @Failure 403 :id is not int
// @router /:id [put]
func (u *AdminController) Put() {
	var ob struct {
		Password string
		Username string
		Id       int64
	}
	var err error
	if err = json.Unmarshal(u.Ctx.Input.RequestBody, &ob); err == nil {
		fmt.Println(ob, ob.Username, ob.Password)
		var user models.AdminUsers
		user.Username = ob.Username
		user.Password = ob.Password
		user.Id = ob.Id
		errs := models.UpdateAdminUsersById(&user)
		if errs == nil {
			u.Data["json"] = Data{user, 1, "success"}
		} else {
			u.Data["json"] = Data{"", 0, errs.Error()}
		}
	} else {
		u.Data["json"] = Data{"", 0, err.Error()}
	}

	u.ServeJSON()
}

// Delete ...
// @Title Delete
// @Description delete the Admin
// @Param	id		path 	string	true		"The id you want to delete"
// @Success 200 {string} delete success!
// @Failure 403 id is empty
// @router /:id [delete]
func (u *AdminController) Delete() {
	var ob struct {
		Id int64
	}
	var err error
	if err = json.Unmarshal(u.Ctx.Input.RequestBody, &ob); err == nil {
		var user models.AdminUsers
		user.Id = ob.Id
		errs := models.DeleteAdminUsers(user.Id)
		if errs == nil {
			u.Data["json"] = Data{ob.Id, 1, "success"}
		} else {
			u.Data["json"] = Data{"", 0, errs.Error()}
		}
	} else {
		u.Data["json"] = Data{"", 0, err.Error()}
	}

	u.ServeJSON()
}

type Data struct {
	Data    interface{} `json:"data"`
	Code    int         `json:"code"`
	Message string      `json:"message"`
}

func (u *AdminController) Login() {
	var ob struct {
		Username string
		Password string
	}
	var err error
	if err = json.Unmarshal(u.Ctx.Input.RequestBody, &ob); err == nil {
		fmt.Println(ob)
		token, errs := models.AdminLogin(ob.Username, ob.Password)
		if errs == nil {
			u.Data["json"] = Data{token, 1, "success"}
		} else {
			u.Data["json"] = Data{"", 0, errs.Error()}
		}
	} else {
		u.Data["json"] = Data{"", 0, err.Error()}
	}

	u.ServeJSON()
}

func (c *AdminController) LoginOut() {
	user := c.Ctx.Input.GetData("user")
	if bUser, ok := user.(*models.AdminUsers); ok {

		_, err := models.AdminLoginOut(bUser.Id)
		if err == nil {
			c.Data["json"] = Data{"", 1, "success"}
		} else {
			c.Data["json"] = Data{"", 0, err.Error()}
		}

		c.ServeJSON()
	}
	c.Data["json"] = Data{"", 0, "error"}
	c.ServeJSON()

}

func (u *AdminController) List() {

	user_list, errs := models.AdminList("1")
	if errs == nil {
		u.Data["json"] = Data{user_list, 1, "success"}
	} else {
		u.Data["json"] = Data{"", 0, errs.Error()}
	}

	u.ServeJSON()
}
