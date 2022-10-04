package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	raw := os.Environ()

	for _, r := range raw {
		splits := strings.SplitN(r, "=", 2)

		if len(splits) == 2 {
			key := splits[0]
			value := splits[1]

			if len(key) > 0 && len(value) > 0 {
				switch key {
				case "_":
				case "VSCODE_IPC_HOOK_CLI":
					continue

				default:
					value = strings.ReplaceAll(value, "\n", `\n`)
					fmt.Printf("%s=%s\n", key, value)
				}
			}
		}
	}
}
