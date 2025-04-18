package com.donut.prokindonutsweb.fomatters;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.Locale;

import static org.junit.jupiter.api.Assertions.*;
@Log4j2
class LocalDateFormatterTest {
    private final LocalDateFormatter localDateFormatter = new LocalDateFormatter();

    //String을 Date로 변환
    @Test
    public void LocalDateparseTest() throws ParseException {
        String date = "2025-04-17";
        LocalDate localDate = localDateFormatter.parse(date, Locale.KOREA);
        log.info(localDate);

    }

    // Date를 String으로 변환
    @Test
    public void LocalDateprintTest(){
        LocalDate date = LocalDate.of(2025, 4, 17);
        String stringdate = localDateFormatter.print(date,Locale.KOREA);
        log.info(stringdate);
    }

}