package com.donut.prokindonutsweb.dto.member;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class MemberAccountVO {
    private String memberCode;
    private String authorityCode;
    private String name;
    private String phoneNumber;
    private String email;
    private String address;
    private String id;
    private String password;
}
