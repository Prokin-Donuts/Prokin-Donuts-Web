package com.donut.prokindonutsweb.service.inbound;

import com.donut.prokindonutsweb.dto.inbound.*;
import com.donut.prokindonutsweb.mappers.inbound.InboundMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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
    public void saveInboundDetail(List<InboundDetailDTO> inboundDetailDTO) {

    }

    @Override
    public String findNextInboundCode() {
        String inboundCode = inboundMapper.selectInboundCode();
        int number = Integer.parseInt(inboundCode.replaceAll("\\D", ""));
        return "IN" + (number+1);
    }


}
