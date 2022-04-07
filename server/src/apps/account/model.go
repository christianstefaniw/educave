package account

import "fmt"

type AccountModel struct {
	firstName string
	lastName  string
	email     string
}

func (a *AccountModel) getFirstName() string {
	return a.firstName
}

func (a *AccountModel) getLastName() string {
	return a.lastName
}

func (a *AccountModel) getFullName() string {
	return fmt.Sprintf("%s %s", a.firstName, a.lastName)
}

func (a *AccountModel) getEmail() string {
	return a.email
}
