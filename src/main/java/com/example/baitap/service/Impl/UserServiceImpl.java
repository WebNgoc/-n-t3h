package com.example.baitap.service.Impl;

import com.example.baitap.common.PagingAndSortObject;
import com.example.baitap.converter.UserCoverter;
import com.example.baitap.dto.UserDto;
import com.example.baitap.entity.UserTestEntity;
import com.example.baitap.repository.UserRepository;
import com.example.baitap.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.Optional;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    UserCoverter userCoverter;
    @Override
    public UserDto saveOrEditUser(UserDto userDto) {
        UserTestEntity userEntity = new UserTestEntity();
        if (userDto.getId() != null) {
            UserTestEntity oldUserEntity = userRepository.findById(userDto.getId()).get();
            userEntity = userCoverter.convertEntity(userDto, oldUserEntity);
        } else {
            userEntity = userCoverter.convertEntity(userDto);
        }
        userEntity.setPassword(passwordEncoder.encode(userDto.getPassWord()));
        userRepository.save(userEntity);
        return userCoverter.convertDto(userEntity);
    }

    public Optional<UserTestEntity> findById(long id) {
        return userRepository.findById(id);
    }

    public void deleteById(Long id) throws SQLException {
        userRepository.deleteById(id);
    }

    public void listUser(PagingAndSortObject pagingAndSortObject) {
        pagingAndSortObject.findAll(userRepository);
    }

    public void updateResetPassWord(String token, String email) {
        UserTestEntity userEntity = userRepository.findByEmail(email);
        if (userEntity != null) {
            userEntity.setToken(token);
            userRepository.save(userEntity);
        } else {
            throw new UsernameNotFoundException("không tìm thấy emali :" + email);
        }
    }

    public UserTestEntity get(String resetToken) {
        return userRepository.findByToken(resetToken);
    }

    public void updatePassWord(UserTestEntity userEntity, String newPassWord) {

        userEntity.setPassword(passwordEncoder.encode(newPassWord));
        userEntity.setToken(null);
        userRepository.save(userEntity);
    }
    public UserTestEntity getLogInUser(Authentication authentication){
        if(authentication == null) return null;
        UserTestEntity userEntity = null;
//        Object principal = authentication.getPrincipal();
//
//        if(principal instanceof User){
//
//        }
        return userEntity;
    }

    @Override
    public Boolean existsByUserName(String userName) {
        return userRepository.existsByUserName(userName);
    }

    @Override
    public Boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }
}
