Dado('que o usuario consulte informaçoes de funcionario') do
    @get_url = 'http://dummy.restapiexample.com/api/v1/employees'
  end
  
Quando('ele realizar a pesquisa') do  
    @list_employee = HTTParty.get(@get_url)
  end
  
Entao('uma lista de funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
end

Dado('que o usuario cadastre um novo funcionario') do
    @post_url = 'http://dummy.restapiexample.com/api/v1/create'
  end

  Quando('ele enviar as informaçoes do funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
        "id": 27,
        "employee_name": "Jtevinho",
        "employee_salary": 10000,
        "employee_age": 31,
        "profile_image": ""
    }.to_json)
    puts @create_employee
  end
  
  Entao('esse funcionario sera cadastrado') do
    expect(@create_employee.code).to eql (200)
    expect(@create_employee.msg).to eql 'OK' 
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee['data']["employee_name"]).to eql 'Jtevinho'
    expect(@create_employee['data']["employee_salary"]).to eql (10000)
    expect(@create_employee['data']["employee_age"]).to eql (31)
  end
    
  Dado('que o usuario altere uma informaçao do funcionario') do
    @get_employee = HTTParty.get('http://dummy.restapiexample.com/api/v1/employees', :headers => {'Content-Type': 'application/json'})
    puts @get_employee['data'] [0] ['id']
    @put_url = 'http://dummy.restapiexample.com/api/v1/update/' + @get_employee['data'] [0] ['id'].to_s
  end
  
  Quando('ele enviar as novas informaçoes') do
    @update_employee = HTTParty.put(@put_url, :headers => {'Content-Type': 'application/json'}, body: {
        "employee_name": "Guto",
        "employee_salary": 1000,
        "employee_age": 33,
        "profile_image": ""
    }.to_json)
    puts(@update_employee)
  end
  
  Entao('as informaçoes serao alteradas') do
    expect(@update_employee.code).to eql (200)
    expect(@update_employee.msg).to eql 'OK' 
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee['data']["employee_name"]).to eql 'Guto'
    expect(@update_employee['data']["employee_salary"]).to eql (1000)
    expect(@update_employee['data']["employee_age"]).to eql (33)
  end

  Dado('que o usuario queira deletar um funcionario') do
    @get_employee = HTTParty.get('http://dummy.restapiexample.com/api/v1/employees', :headers => {'Content-Type': 'application/json'})
    @delete_url = 'http://dummy.restapiexample.com/api/v1/delete/' + @get_employee['data'][0]['id'].to_s 
  end
  
  Quando('ele enviar a identificação unica') do
    @delete_employee = HTTParty.delete(@delete_url, :headers => {'Content-Type': 'application/json'})
    puts @delete_employee 
  end
  
  Então('esse funcionario sera deletado do sistema') do
    expect(@delete_employee.code).to eql (200)
    expect(@delete_employee.msg).to eql 'OK' 
    expect(@delete_employee["status"]).to eql 'success'
    expect(@delete_employee["status"]).to eql '27'
    expect(@delete_employee["message"]).to eql 'Successfully! Record has been deleted.'
  end
  
  
  