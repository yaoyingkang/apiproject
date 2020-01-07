package models

import (
	"apiproject/common"
	"fmt"
	"time"
)

type Category struct {
	Id          int64
	Name        string
	Shop_id     int
	Sort        int
	MeasureUnit string
	Status      int
	TouchIcon   string
	Number      int
	CreatedAt   time.Time `xorm:"created"`
	UpdatedAt   time.Time `xorm:"updated"`
}

func AddCategory(m *Category) (id int64, err error) {

	id, err = common.Engine.Insert(m)
	return
}

func UpdateCategoryById(m *Category) (err error) {
	v := Category{Id: m.Id}
	var num int64
	_, err = common.Engine.Id(v.Id).Get(&v)
	if err == nil {
		if num, err = common.Engine.ID(m.Id).Update(&m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

func DeleteCategory(id int64) (err error) {
	v := Category{Id: id}
	// ascertain id exists in the database
	_, err = common.Engine.Id(v.Id).Get(&v)
	if err == nil {
		if _, err = common.Engine.ID(v.Id).Delete(&v); err == nil {
			fmt.Println("Number of records updated in database:", v)
		}
	}

	return
}

func CategoryList() (userList []Category, err error) {
	var v []Category
	err = common.Engine.Where("id>?", 0).Find(&v)
	if err == nil {
		return v, nil
	}

	return nil, err
}
