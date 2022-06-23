package com.example.baitap.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "user_test", schema = "2202", catalog = "")
public class UserTestEntity  implements UserDetails{
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Basic
    @Column
    private String userName;
    @Basic
    @Column
    private String password;
    @Basic
    @Column
    private String fullName;
    @Basic
    @Column
    private String email;
    @Basic
    @Column
    private String phone;
    @Basic
    @Column
    private Integer gender;
    @Basic
    @Column
    private Integer status;
    @Basic
    @Column
    private String role;
    @Basic
    @Column
    private String token;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Set<GrantedAuthority> authoritySet = new HashSet<>();
        authoritySet.add(new SimpleGrantedAuthority("ROLE_" + this.role));
        return authoritySet;
    }

    @Override
    public String getUsername() {
        return this.userName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return status <= 0 ? false : true;
    }
}
