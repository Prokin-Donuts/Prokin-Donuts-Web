package com.donut.prokindonutsweb.mappers.inbound;

import com.donut.prokindonutsweb.dto.inbound.*;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface InboundMapper {
    List<ProductVO> selectAllProductList();
    void insertInbound(InboundVO inboundVO);
    // 입고 상세 정보
    void insertInboundDetailList(@Param("list") List<InboundDetailVO> list);

    String selectInboundCode();


    //창고관리자 - 입고관리

    // 입고목록 반환
    List<InboundVO> selectAllInboundList();

    List<InboundDetailVO> selectAllInboundDetailList();

    String selectProductName(String productCode);

    Integer selectProductPrice(String productCode);

    void approveInbound(String inboundCode);

    void updateInventory(InventoryVO inventoryVO);

    List<InventoryDTO> selectInboundDetailList(String inboundCode);

    void deleteInbound(String inboundCode);

    List<InboundStatusVO> selectAllInboundStatusList();
}
