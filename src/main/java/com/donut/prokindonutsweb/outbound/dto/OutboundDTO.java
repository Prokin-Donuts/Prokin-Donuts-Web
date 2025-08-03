package com.donut.prokindonutsweb.outbound.dto;

import lombok.*;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class OutboundDTO {
    private String outboundCode;
    private String productCode;
    private String productName;
    private LocalDate outboundDate;
    private String vehicleCode;
    private String franchiseCode;
    private String outboundStatus;
    private String quantity;
}
