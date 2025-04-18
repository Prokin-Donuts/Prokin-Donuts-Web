package com.donut.prokindonutsweb.dto.inbound;

import lombok.*;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class InboundDetailDTO {
    private String productCode;
    private String productName;
    private Integer productPrice;
    private String storedType;
    private Integer quantity;

}
