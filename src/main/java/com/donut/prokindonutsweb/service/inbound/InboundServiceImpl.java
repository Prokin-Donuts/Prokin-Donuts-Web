package com.donut.prokindonutsweb.service.inbound;

import com.donut.prokindonutsweb.dto.inbound.*;
import com.donut.prokindonutsweb.mappers.inbound.InboundMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class InboundServiceImpl implements InboundService {

    private final InboundMapper inboundMapper;

    @Override
    public Optional<List<ProductDTO>> findAllProductList() {

        // VO -> DTO 변환작업
        List<ProductDTO> list = inboundMapper.selectAllProductList()
                .stream()
                .map(vo -> ProductDTO.builder()
                        .productCode(vo.getProductCode())
                        .productName(vo.getProductName())
                        .productPrice(vo.getProductPrice())
                        .storedType(vo.getStoredType())
                        .build())
                .toList();// 또는 collect(Collectors.toList());
        return list.isEmpty() ? Optional.empty() : Optional.of(list);
    }

    @Override
    public void saveInbound(InboundDTO inboundDTO) {
        InboundVO vo = InboundVO.builder()
                .inboundCode(inboundDTO.getInboundCode())
                .inboundDate(inboundDTO.getInboundDate())
                .inboundStatus(inboundDTO.getInboundStatus())
                .warehouseCode(inboundDTO.getWarehouseCode())
                .build();
        inboundMapper.insertInbound(vo);
    }

    @Override
    public void saveInboundDetail(List<InboundDetailDTO> list) {
        String inboundCode = inboundMapper.selectInboundCode();

        AtomicInteger i = new AtomicInteger(1);

        List<InboundDetailVO> inboundDetailVOList = list.stream().map(
                dto -> {
                    InboundDetailVO vo = InboundDetailVO.builder()
                            .inboundDetailCode(inboundCode + "-" + i.getAndIncrement())
                            .quantity(dto.getQuantity())
                            .inboundCode(inboundCode)
                            .productCode(dto.getProductCode())
                            .sectionCode(getSection(dto.getStoredType()))
                            .build();
                    return vo;
                }
        ).toList();

        inboundMapper.insertInboundDetailList(inboundDetailVOList);

    }

    private String getSection(String storedType) {
        // 창코코드 알게 되면 변경 예정
        if (storedType.equals("냉장")) return "R";
        else if (storedType.equals("냉동")) return "F";
        else return "A";
    }


    @Override
    public String findNextInboundCode() {
        String inboundCode = inboundMapper.selectInboundCode();
        int number = Integer.parseInt(inboundCode.replaceAll("\\D", ""));
        return "IN" + (number + 1);
    }

    //    입고관리 페이지에는 (입고요청, 승인대기) 상태 입고목록만 보여진다.
    @Override
    public Optional<List<InboundDTO>> findAllInboundList() {
        List<InboundDTO> list = inboundMapper.selectAllInboundList().stream()
                .filter(vo -> "입고요청".equals(vo.getInboundStatus()) || "승인대기".equals(vo.getInboundStatus()))
                .map(vo -> {
                            InboundDTO dto = InboundDTO.builder()
                                    .inboundCode(vo.getInboundCode())
                                    .inboundDate(vo.getInboundDate())
                                    .inboundStatus(vo.getInboundStatus())
                                    .warehouseCode(vo.getWarehouseCode())
                                    .build();
                            return dto;
                        }
                ).toList();
        return list.isEmpty() ? Optional.empty() : Optional.of(list);
    }

    // 입고상세 목록 변환 작업
    @Override
    public Optional<List<InboundDetailDTO>> findAllInboundDetailList() {
        List<InboundDetailDTO> list = inboundMapper.selectAllInboundDetailList()
                .stream()
                .map(vo -> {
                            InboundDetailDTO dto = InboundDetailDTO.builder()
                                    .inboundCode(vo.getInboundCode())
                                    .productCode(vo.getProductCode())
                                    .productName(inboundMapper.selectProductName(vo.getProductCode()))
                                    .productPrice(inboundMapper.selectProductPrice(vo.getProductCode()))
                                    .storedType(getStoredType(vo.getSectionCode()))
                                    .quantity(vo.getQuantity())
                                    .build();
                            return dto;
                        }
                ).toList();
        return list.isEmpty() ? Optional.empty() : Optional.of(list);
    }

    private String getStoredType(String sectionCode) {
        char type = sectionCode.charAt(sectionCode.length() - 1);
        if (type == 'R') return "냉장";
        else if (type == 'F') return "냉동";
        else return "상온";
    }

    @Override
    public void approveInbound(String inboundCode) {
        inboundMapper.approveInbound(inboundCode);
    }

    @Override
    public Optional<List<InventoryDTO>> findInboundDetailList(String inboundCode) {
        return Optional.of(new ArrayList<>(inboundMapper.selectInboundDetailList(inboundCode)));
    }

    @Override
    public void updateInventory(InventoryVO inventoryVO) {
        inboundMapper.updateInventory(inventoryVO);
    }

    @Override
    public void deleteInbound(String inboundCode) {
        inboundMapper.deleteInbound(inboundCode);
    }

    @Override
    public Optional<List<InboundStatusDTO>> findAllInboundStatusList() {
        List<InboundStatusDTO> list = inboundMapper.selectAllInboundStatusList()
                .stream()
                .map(vo -> {
                    InboundStatusDTO dto = InboundStatusDTO.builder()
                            .inboundCode(vo.getInboundCode())
                            .productCode(vo.getProductCode())
                            .productName(vo.getProductName())
                            .productPrice(vo.getProductPrice())
                            .inboundDate(vo.getInboundDate())
                            .inboundStatus(vo.getInboundStatus())
                            .sectionCode(vo.getSectionCode())
                            .quantity(vo.getQuantity())
                            .build();
                    return dto;
                }).toList();
        return list.isEmpty() ? Optional.empty() : Optional.of(list);
    }

    @Override
    public void qhUpdateInboundStatus(String inboundCode) {
        inboundMapper.updateQhInboundStatus(inboundCode);
    }


    //    본사관리자 페이지에는 (입고요청) 상태 입고목록만 보여진다.
    @Override
    public Optional<List<InboundDTO>> findAllQhInboundList() {
        List<InboundDTO> list = inboundMapper.selectAllInboundList().stream()
                .filter(vo -> "입고요청".equals(vo.getInboundStatus()))
                .map(vo -> {
                            InboundDTO dto = InboundDTO.builder()
                                    .inboundCode(vo.getInboundCode())
                                    .inboundDate(vo.getInboundDate())
                                    .inboundStatus(vo.getInboundStatus())
                                    .warehouseCode(vo.getWarehouseCode())
                                    .build();
                            return dto;
                        }
                ).toList();
        return list.isEmpty() ? Optional.empty() : Optional.of(list);
    }

}
