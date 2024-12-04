.employees[]
| { employee_name: (.given_name + " " + .family_name), store_name: .works_at.name }
