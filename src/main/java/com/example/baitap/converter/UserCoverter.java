package com.example.baitap.converter;

import com.example.baitap.dto.UserDto;
import com.example.baitap.entity.UserTestEntity;
import org.springframework.stereotype.Component;

@Component
public class UserCoverter {
    public UserTestEntity convertEntity(UserDto userDto) {
        UserTestEntity userEntity = new UserTestEntity();
        userEntity.setUserName(userDto.getUserName());
        userEntity.setFullName(userDto.getFullName());
        userEntity.setGender(userDto.getGender());
        userEntity.setStatus(userDto.getStatus());
        userEntity.setEmail(userDto.getEmail());
        userEntity.setPhone(userDto.getPhone());
        userEntity.setRole(userDto.getRole());
        return userEntity;
    }

    public UserDto convertDto(UserTestEntity userEntity) {
        UserDto userDto = new UserDto();
        if (userEntity.getId() != 0L) {
            userDto.setId(userEntity.getId());
        }
        userDto.setUserName(userEntity.getUsername());
        userDto.setFullName(userEntity.getFullName());
        userDto.setGender(userEntity.getGender());
        userDto.setEmail(userEntity.getEmail());
        userDto.setPhone(userEntity.getPhone());
        userDto.setRole(userEntity.getRole());
        userDto.setStatus(userEntity.getStatus());
        return userDto;
    }

    public UserTestEntity convertEntity(UserDto userDto, UserTestEntity userEntity) {
        userEntity.setId(userDto.getId());
        userEntity.setUserName(userDto.getUserName());
        userEntity.setFullName(userDto.getFullName());
        userEntity.setGender(userDto.getGender());
        userEntity.setStatus(userDto.getStatus());
        userEntity.setEmail(userDto.getEmail());
        userEntity.setPhone(userDto.getPhone());
        userEntity.setRole(userDto.getRole());
        return userEntity;
    }
}
