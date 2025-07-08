package response

import (
	"server/model/business"
)

type BizTest1Res struct {
	business.BizTest1
	AAA string `json:"aaa"` // A regular string field
}
