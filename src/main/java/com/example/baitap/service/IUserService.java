package com.example.baitap.service;

import com.example.baitap.dto.UserDto;

public interface IUserService {
    Boolean existsByUserName(String userName);
    Boolean existsByEmail(String email);
    UserDto saveOrEditUser(UserDto userDto);
}
