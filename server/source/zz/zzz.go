package main

import (
	"fmt"
	"github.com/google/uuid"
	"server/utils"
)

func main() {

	password := utils.BcryptHash("123456")
	adminPassword := utils.BcryptHash("123456")

	fmt.Println(password)
	fmt.Println(adminPassword)
	fmt.Println(uuid.New())
	fmt.Println(uuid.New())

}
