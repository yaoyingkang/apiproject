// @APIVersion 1.0.0
// @Title beego Test API
// @Description beego has a very cool tools to autogenerate documents for your API
// @Contact astaxie@gmail.com
// @TermsOfServiceUrl http://beego.me/
// @License Apache 2.0
// @LicenseUrl http://www.apache.org/licenses/LICENSE-2.0.html
package routers

import (
	"apiproject/controllers"
	"apiproject/jwtUtil"
	"apiproject/models"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context"
	"reflect"
	"strconv"
	"time"
)

func init() {
	ns := beego.NewNamespace("/v1",
		beego.NSNamespace("/admin",
			beego.NSRouter("/login", &controllers.AdminController{}, "post:Login"),
			beego.NSCond(func(ctx *context.Context) bool {
				if ctx.Input.URL() == "/v1/admin/login" {
					return true
				}
				token := ctx.Input.Query("token")
				fmt.Println(token)
				if token == "" {
					return false
				}
				arr := jwtUtil.ParseHStoken(token)
				fmt.Println(arr)
				if arr == nil {
					return false
				}
				fmt.Println(arr)
				id, err := arr["uid"].(string)
				fmt.Println(id, err)
				if !err {
					return false
				}
				times, timeErr := arr["expire_time"].(string)
				fmt.Println(times, timeErr, reflect.TypeOf(times))
				time64, errors := strconv.ParseInt(times, 10, 64)
				if errors != nil {
					return false
				}
				if !timeErr {
					return false
				}
				now := time.Now().Unix()
				if now-time64 > 0 {
					return false
				}
				j, b := strconv.ParseInt(id, 10, 64)
				fmt.Println(j, b)
				if b == nil {
					info, errs := models.GetAdminUsersById(j)
					if errs == nil {
						if info.RememberToken == token {
							ctx.Input.SetData("user", info)
							fmt.Println(info)
							return true
						}
					}

				}

				return false
			}),
			beego.NSRouter("/loginout", &controllers.AdminController{}, "get:LoginOut"),
			beego.NSRouter("/user", &controllers.AdminController{}, "get:GetOne"),
			beego.NSInclude(
				&controllers.AdminController{},
			),
		),
	)
	beego.AddNamespace(ns)
}
