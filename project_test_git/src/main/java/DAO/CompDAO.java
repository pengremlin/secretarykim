package DAO;

import DTO.Auth;
import Emp.DTO.EMP;
import Emp.DTO.Job;

public interface CompDAO {

	int jobComp(Job job);
	int empComp(EMP emp);
	int authComp(Auth auth);
}
