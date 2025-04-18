package com.donut.prokindonutsweb.mappers.inbound;

import com.donut.prokindonutsweb.dto.inbound.InboundDTO;
import com.donut.prokindonutsweb.dto.inbound.InboundDetailDTO;
import com.donut.prokindonutsweb.dto.inbound.ProductDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InboundMapper {
    List<ProductDTO> getProductList();

    // 입고 정보
    void insertInbound(InboundDTO inboundDTO);

    // 입고 상세 정보
    void insertInboundDetailList(@Param("list") List<InboundDetailDTO> list);
}
