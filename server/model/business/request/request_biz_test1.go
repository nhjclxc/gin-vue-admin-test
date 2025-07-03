package request

type BizTest1Req struct {
	UserId       uint64 `json:"userId"`       // Standard field for the primary key
	Name         string `json:"name"`         // A regular string field
	Email        string `json:"email"`        // A pointer to a string, allowing for null values
	MemberNumber string `json:"memberNumber"` // Uses sql.NullString to handle nullable strings
	Remark       string `json:"remark"`       // 备注
}
