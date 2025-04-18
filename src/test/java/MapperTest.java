import com.donut.prokindonutsweb.dto.inbound.InboundDTO;
import com.donut.prokindonutsweb.dto.inbound.InboundDetailDTO;
import com.donut.prokindonutsweb.mappers.inbound.InboundMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.sql.Date;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MapperTest {

    @Autowired(required = false)
    private InboundMapper inboundMapper;
    @Test
    void mapper() {
        inboundMapper.getProductList().forEach(System.out::println);
    }

    @Test
    void insertInbound() {
        InboundDTO dto = InboundDTO.builder()
                .inboundCode("IN6")
                .inboundDate(Date.valueOf("2025-04-20"))
                .inboundStatus("입고대기")
                .warehouseCode("GG1")
                .build();

        inboundMapper.insertInbound(dto);
    }

    @Test
    void insertInboundDetail() {
        InboundDetailDTO dto1 = InboundDetailDTO.builder()
                .inboundDetailCode("In1-5")
                .quantity(200)
                .inboundCode("In1")
                .productCode("DPN1")
                .sectionCode("GG1-R")
                .build();

        InboundDetailDTO dto2 = InboundDetailDTO.builder()
                .inboundDetailCode("In1-6")
                .quantity(300)
                .inboundCode("In1")
                .productCode("DPN3")
                .sectionCode("GG1-R")
                .build();
        List<InboundDetailDTO> list = new ArrayList<>();
        list.add(dto1);
        list.add(dto2);

        inboundMapper.insertInboundDetailList(list);
    }
}
