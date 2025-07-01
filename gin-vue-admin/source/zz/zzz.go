package main

import (
	"fmt"
	"gin-vue-admin/utils"
	"github.com/google/uuid"
)

func main() {

	password := utils.BcryptHash("123456")
	adminPassword := utils.BcryptHash("123456")

	fmt.Println(password)
	fmt.Println(adminPassword)
	fmt.Println(uuid.New())
	fmt.Println(uuid.New())

}
