package com.donut.prokindonutsweb.dto.inbound;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductDTO {
    private String productCode;
    private String productName;
    private Integer productPrice;
    private String storedType;
}
