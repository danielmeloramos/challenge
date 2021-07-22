require 'minitest/autorun'
require 'timeout'
class CustomerSuccessBalancing
  def initialize(customer_success, customers, customer_success_away)
    @customer_success = customer_success
    @customers = customers
    @customer_success_away = customer_success_away
  end

  # Returns the id of the CustomerSuccess with the most customers
  def execute
    # Write your solution here

    #1- Atualizar gerentes somente com os disponiveis
    availableCustomerSuccess = @customer_success.reject {|item| @customer_success_away.include?(item[:id])}

    #2- Ordenar os gerentes success pelo nível dele
    availableCustomerSuccess = availableCustomerSuccess.sort_by {|item| item[:score]}

    #3- Verifica se score do ultimo gerente é o mesmo do ultimo cliente
    customerSuccessVerify = availableCustomerSuccess[-1]
    customerLast  = @customers[-1]
    if customerSuccessVerify[:score] == customerLast[:score]
      return customerSuccessVerify[:id]
    end

    #4- Percorrer todos os clientes encontrar o primeiro com o maior ou igual score, adicionar contador
    maxCounter = 0
    sum = 1
    @customers.each_with_index {
      |valCustomer, indexCustomer|
      availableCustomerSuccess.each_with_index {
          |val, index|
          
          if val[:score] >= valCustomer[:score] 
            if val.key?(:'counter')
              availableCustomerSuccess[index][:counter] += sum
              if val[:score] > maxCounter
                maxCounter = val[:counter]
              end
            else
              availableCustomerSuccess[index] = hash_add(val, 'counter', sum)
            end

            break
          end
      }
    }

    #5- Retorna customer encontrado, caso for igual a 1, senão retorna 0
    customersFound = availableCustomerSuccess.select {|item| item[:counter] == maxCounter} 

    if customersFound.length() == 1
      return customersFound[0][:id]
    end

    return 0
  end
  
  def hash_add(hash, new_key, new_value)
    temp_hash = {}
  
    temp_hash[new_key.to_sym] = new_value
    temp_hash.merge!(hash)
    hash = temp_hash
    hash
  end

end

class CustomerSuccessBalancingTests < Minitest::Test
  def test_scenario_one
    css = [{ id: 1, score: 60 }, { id: 2, score: 20 }, { id: 3, score: 95 }, { id: 4, score: 75 }]
    customers = [{ id: 1, score: 90 }, { id: 2, score: 20 }, { id: 3, score: 70 }, { id: 4, score: 40 }, { id: 5, score: 60 }, { id: 6, score: 10}]

    balancer = CustomerSuccessBalancing.new(css, customers, [2, 4])
    assert_equal 1, balancer.execute
  end

  def test_scenario_two
    css = array_to_map([11, 21, 31, 3, 4, 5])
    customers = array_to_map( [10, 10, 10, 20, 20, 30, 30, 30, 20, 60])
    balancer = CustomerSuccessBalancing.new(css, customers, [])
    assert_equal 0, balancer.execute
  end

  def test_scenario_three
    customer_success = (1..999).to_a
    customers = Array.new(10000, 998)

    balancer = CustomerSuccessBalancing.new(array_to_map(customer_success), array_to_map(customers), [999])

    result = Timeout.timeout(1.0) { balancer.execute }
    assert_equal 998, result
  end

  def test_scenario_four
    balancer = CustomerSuccessBalancing.new(array_to_map([1, 2, 3, 4, 5, 6]), array_to_map([10, 10, 10, 20, 20, 30, 30, 30, 20, 60]), [])
    assert_equal 0, balancer.execute
  end

  def test_scenario_five
    balancer = CustomerSuccessBalancing.new(array_to_map([100, 2, 3, 3, 4, 5]), array_to_map([10, 10, 10, 20, 20, 30, 30, 30, 20, 60]), [])
    assert_equal 1, balancer.execute
  end

  def test_scenario_six
    balancer = CustomerSuccessBalancing.new(array_to_map([100, 99, 88, 3, 4, 5]), array_to_map([10, 10, 10, 20, 20, 30, 30, 30, 20, 60]), [1, 3, 2])
    assert_equal 0, balancer.execute
  end

  def test_scenario_seven
    balancer = CustomerSuccessBalancing.new(array_to_map([100, 99, 88, 3, 4, 5]), array_to_map([10, 10, 10, 20, 20, 30, 30, 30, 20, 60]), [4, 5, 6])
    assert_equal 3, balancer.execute
  end

  def array_to_map(arr)
    out = []
    arr.each_with_index { |score, index| out.push({ id: index + 1, score: score }) }
    out
  end
end

Minitest.run