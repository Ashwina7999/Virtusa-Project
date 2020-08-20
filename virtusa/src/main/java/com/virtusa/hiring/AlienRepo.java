package com.virtusa.hiring;
import org.springframework.data.repository.CrudRepository;

import com.virtusa.hiring.model.Reg;

public interface AlienRepo extends CrudRepository<Reg, String>{
	
	public Reg findByEmailAndPassword(String email, String Passowrd);

}
