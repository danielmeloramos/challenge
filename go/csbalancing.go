package csbalancing

import (
	"sort"
)

// Entity ...
type Entity struct {
	ID      int
	Score   int
	Counter int
}

// CustomerSuccessBalancing ...
func CustomerSuccessBalancing(customerSuccess []Entity, customers []Entity, customerSuccessAway []int) int {
	// Write your solution here

	//1- Atualizar gerentes somente com os disponiveis
	availableCustomerSuccess := []Entity{}
	for i := len(customerSuccess) - 1; i >= 0; i-- {
		containsCustomerSuccess := ContainsCustomerSuccess(customerSuccessAway, customerSuccess[i])
		if !containsCustomerSuccess {
			availableCustomerSuccess = append(availableCustomerSuccess, customerSuccess[i])
		}
	}

	//2- Ordenar os gerentes success pelo nível dele
	sort.SliceStable(availableCustomerSuccess, func(i, j int) bool {
		return availableCustomerSuccess[i].Score < availableCustomerSuccess[j].Score
	})

	//3- Verifica se score do ultimo gerente é o mesmo do ultimo cliente
	var customerSuccessVerify = availableCustomerSuccess[len(availableCustomerSuccess)-1]
	var customerLast = customers[len(customers)-1]
	if customerSuccessVerify.Score == customerLast.Score {
		return customerSuccessVerify.ID
	}

	//4- Percorrer todos os clientes encontrar o primeiro com o maior ou igual score, adicionar contador
	var maxCounter int = 0
	var sum int = 1
	for _, customer := range customers {
		for i := 0; i < len(availableCustomerSuccess); i++ {
			if availableCustomerSuccess[i].Score >= customer.Score {
				availableCustomerSuccess[i].Counter += sum
				if availableCustomerSuccess[i].Counter > maxCounter {
					maxCounter = availableCustomerSuccess[i].Counter
				}

				break
			}
		}
	}

	//5- Retorna customer encontrado, caso for igual a 1, senão retorna 0
	var customerSuccessFoundByConter = FindCustomerSuccessByCounter(availableCustomerSuccess, maxCounter)
	var sizeCompare int = 1
	if len(customerSuccessFoundByConter) == sizeCompare {
		return customerSuccessFoundByConter[0].ID
	}

	return 0
}

func ContainsCustomerSuccess(customerSuccessAwayIds []int, css Entity) bool {
	for _, id := range customerSuccessAwayIds {
		if id == css.ID {
			return true
		}
	}
	return false
}

func FindCustomerSuccessByCounter(customerSuccess []Entity, maxCounter int) []Entity {
	customerSuccessFound := []Entity{}
	for _, css := range customerSuccess {
		if css.Counter == maxCounter {
			customerSuccessFound = append(customerSuccessFound, css)
		}
	}
	return customerSuccessFound
}
