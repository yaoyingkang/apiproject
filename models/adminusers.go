package models

import (
	"apiproject/common"
	"apiproject/jwtUtil"
	"fmt"
	_ "github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	"github.com/pkg/errors"
	"reflect"
	"strconv"
	"strings"
	"time"
)

type AdminUsers struct {
	Id            int64
	Username      string
	Password      string
	Name          string
	Avatar        string
	RememberToken string
	CreatedAt     time.Time `xorm:"created"`
	UpdatedAt     time.Time `xorm:"updated"`
}

func init() {
	orm.RegisterModel(new(AdminUsers))

}

// AddAdminUsers insert a new AdminUsers into database and returns
// last inserted Id on success.
func AddAdminUsers(m *AdminUsers) (id int64, err error) {

	id, err = common.Engine.Insert(m)
	return
}

// GetAdminUsersById retrieves AdminUsers by Id. Returns error if
// Id doesn't exist
func GetAdminUsersById(id int64) (v *AdminUsers, err error) {

	v = &AdminUsers{Id: id}
	_, errs := common.Engine.Get(v)
	if errs == nil {
		return v, nil
	}
	return nil, err
}

// GetAllAdminUsers retrieves all AdminUsers matches certain condition. Returns empty list if
// no records exist
func GetAllAdminUsers(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(AdminUsers))
	// query k=v
	for k, v := range query {
		// rewrite dot-notation to Object__Attribute
		k = strings.Replace(k, ".", "__", -1)
		qs = qs.Filter(k, v)
	}
	// order by:
	var sortFields []string
	if len(sortby) != 0 {
		if len(sortby) == len(order) {
			// 1) for each sort field, there is an associated order
			for i, v := range sortby {
				orderby := ""
				if order[i] == "desc" {
					orderby = "-" + v
				} else if order[i] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
			qs = qs.OrderBy(sortFields...)
		} else if len(sortby) != len(order) && len(order) == 1 {
			// 2) there is exactly one order, all the sorted fields will be sorted by this order
			for _, v := range sortby {
				orderby := ""
				if order[0] == "desc" {
					orderby = "-" + v
				} else if order[0] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
		} else if len(sortby) != len(order) && len(order) != 1 {
			return nil, errors.New("Error: 'sortby', 'order' sizes mismatch or 'order' size is not 1")
		}
	} else {
		if len(order) != 0 {
			return nil, errors.New("Error: unused 'order' fields")
		}
	}

	var l []AdminUsers
	qs = qs.OrderBy(sortFields...).RelatedSel()
	if _, err = qs.Limit(limit, offset).All(&l, fields...); err == nil {
		if len(fields) == 0 {
			for _, v := range l {
				ml = append(ml, v)
			}
		} else {
			// trim unused fields
			for _, v := range l {
				m := make(map[string]interface{})
				val := reflect.ValueOf(v)
				for _, fname := range fields {
					m[fname] = val.FieldByName(fname).Interface()
				}
				ml = append(ml, m)
			}
		}
		return ml, nil
	}
	return nil, err
}

// UpdateAdminUsers updates AdminUsers by Id and returns error if
// the record to be updated doesn't exist
func UpdateAdminUsersById(m *AdminUsers) (err error) {
	v := AdminUsers{Id: m.Id}
	var num int64
	_, err = common.Engine.Id(v.Id).Get(&v)
	if err == nil {
		if num, err = common.Engine.ID(m.Id).Update(&m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteAdminUsers deletes AdminUsers by Id and returns error if
// the record to be deleted doesn't exist
func DeleteAdminUsers(id int64) (err error) {

	v := AdminUsers{Id: id}
	// ascertain id exists in the database
	_, err = common.Engine.Id(v.Id).Get(&v)
	if err == nil {
		if _, err = common.Engine.ID(v.Id).Delete(&v); err == nil {
			fmt.Println("Number of records updated in database:", v)
		}
	}

	return
}

func AdminLogin(username, password string) (token string, err error) {

	v := new(AdminUsers)
	_, errs := common.Engine.Where("username=?", username).Get(v)
	if errs == nil {
		if v.Password == password {
			token = jwtUtil.GetHStoken("es", strconv.FormatInt(v.Id, 10), v.Username)
			v.RememberToken = token
			_, errs := common.Engine.Id(v.Id).Update(v)
			if errs == nil {
				return token, nil
			}
			return "", errors.WithMessage(errs, "更新token出错")
		}
		return "", errors.New("账号不存在")
	}
	return "", errs
}

func AdminLoginOut(id int64) (bool, error) {
	v := new(AdminUsers)
	v.RememberToken = "  "
	_, errs := common.Engine.Id(id).Update(v)
	if errs == nil {
		return true, nil
	}
	return false, errors.WithMessage(errs, "注销失败")
}

func AdminList(code string) (userList []AdminUsers, err error) {
	var v []AdminUsers
	if len(code) > 0 {
		err := common.Engine.Where("id>?", 0).Find(&v)
		if err == nil {
			return v, nil
		}
		return nil, err
	}
	return nil, errors.New("code必须存在")

}

func AdminListPage(fields []string, order []string,
	offset int, limit int) (ml []AdminUsers, err error) {
	var log []AdminUsers
	selectField := strings.Join(fields, ",")
	orderField := strings.Join(order, ",")
	err = common.Engine.Select(selectField).Limit(limit, offset).OrderBy(orderField).Find(&log)
	if err == nil {
		return log, nil
	}
	return nil, err
}
