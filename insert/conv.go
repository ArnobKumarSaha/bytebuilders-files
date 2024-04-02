package main

import (
	"fmt"
	"regexp"
)

func removeLastNonDigit(str string) string {
	re := regexp.MustCompile(`\D$`)
	return re.ReplaceAllString(str, "")
}

func main() {
	// Example string
	str := "29785598197760m"

	// Remove the last non-digit character
	result := removeLastNonDigit(str)

	fmt.Println("Result:", result)
}