package generator

import (
	"fmt"

	"android/soong/android"
)

func eveExpandVariables(ctx android.ModuleContext, in string) string {
	eveVars := ctx.Config().VendorConfig("eveVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if eveVars.IsSet(name) {
			return eveVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
