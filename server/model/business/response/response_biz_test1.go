package response

type BizTest1Res struct {
	Name         string `json:"name"`         // A regular string field
	Email        string `json:"email"`        // A pointer to a string, allowing for null values
	MemberNumber string `json:"memberNumber"` // Uses sql.NullString to handle nullable strings
	Remark       string `json:"remark"`       // 备注
}
