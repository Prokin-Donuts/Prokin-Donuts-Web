package com.donut.prokindonutsweb.dto.inbound;

import lombok.Data;
import lombok.ToString;

import java.util.List;

@Data
@ToString
public class InboundForm {
    private List<InboundDetailDTO> productList;
}
