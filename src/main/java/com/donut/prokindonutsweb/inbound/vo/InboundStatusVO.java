package com.donut.prokindonutsweb.inbound.vo;

import lombok.*;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class InboundStatusVO {
    private String inboundCode;
    private String productCode;
    private String productName;
    private Integer productPrice;
    private LocalDate inboundDate;
    private String inboundStatus;
    private String sectionCode;
    private Integer quantity;
}
