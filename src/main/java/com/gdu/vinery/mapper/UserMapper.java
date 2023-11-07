package com.gdu.vinery.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.vinery.domain.LeaveUserDTO;
import com.gdu.vinery.domain.SleepUserDTO;
import com.gdu.vinery.domain.UserDTO;

@Mapper
public interface UserMapper {
	public UserDTO selectUserById(String userId);
	public SleepUserDTO selectSleepUserById(String userId);
	public LeaveUserDTO selectLeaveUserById(String userId);
	public UserDTO selectUserByEmail(String userEmail);
	public SleepUserDTO selectSleepUserByEmail(String userEmail);
	public LeaveUserDTO selectLeaveUserByEmail(String userEmail);
	public int insertUser(UserDTO userDTO);
	public UserDTO selectUserByUserDTO(UserDTO userDTO);
	public int insertUserAccess(String userId);
	public int updateUserAccess(String userId);
	public int insertAutologin(UserDTO userDTO);
	public int deleteAutologin(String userId);
	public UserDTO selectAutologin(String userAutologinId);
	public int insertLeaveUser(LeaveUserDTO leaveUserDTO);		// È¸¿øÅ»Åð
	public int deleteUser(String userId);						// È¸¿øÅ»Åð

}
