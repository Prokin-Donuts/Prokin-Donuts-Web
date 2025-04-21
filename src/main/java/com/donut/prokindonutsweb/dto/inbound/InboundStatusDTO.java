package com.donut.prokindonutsweb.dto.inbound;

import lombok.*;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class InboundStatusDTO {
    private String inboundCode;
    private String productCode;
    private String productName;
    private Integer productPrice;
    private LocalDate inboundDate;
    private String inboundStatus;
    private String warehouseCode;
    private Integer quantity;
}
