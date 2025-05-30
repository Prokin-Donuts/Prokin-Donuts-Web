package com.donut.prokindonutsweb.inbound.mapper;

import com.donut.prokindonutsweb.inbound.dto.*;
import com.donut.prokindonutsweb.inbound.vo.InboundStatusVO;
import com.donut.prokindonutsweb.inbound.vo.InboundVO;
import com.donut.prokindonutsweb.inbound.vo.InventoryVO;
import com.donut.prokindonutsweb.inbound.vo.ProductVO;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;

public interface InboundMapper {
    List<ProductVO> selectAllProductList();
    void insertInbound(InboundVO inboundVO);
    // 입고 상세 정보
    void insertInboundDetailList(@Param("list") List<InboundDetailVO> list);

    String selectWarehouseCode(String memberCode);

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

    void updateInboundDate(@Param("inboundDate") LocalDate inboundDate, @Param("inboundCode") String inboundCode);

    // Java
    void updateInbound(InboundUpdateDTO inboundUpdateDTO);



    void deleteInbound(String inboundCode);

    List<InboundStatusVO> selectAllInboundStatusList();

    void updateQhInboundStatus(String inboundCode);
}
