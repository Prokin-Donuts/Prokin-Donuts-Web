package com.donut.prokindonutsweb.dto.inbound;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InboundDetailDTO {
    private String inboundDetailCode;
    private Integer quantity;
    private String inboundCode;
    private String productCode;
    private String sectionCode;
}
