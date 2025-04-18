package com.donut.prokindonutsweb.service.inbound;

import com.donut.prokindonutsweb.dto.inbound.ProductDTO;
import com.donut.prokindonutsweb.mappers.inbound.InboundMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InboundServiceImpl implements InboundService{

    private final InboundMapper inboundMapper;
    @Override
    public List<ProductDTO> productList() {
        return inboundMapper.getProductList();
    }
}
