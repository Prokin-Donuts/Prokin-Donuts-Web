package com.donut.prokindonutsweb.product.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CategoryCheckDTO {
  private String categoryCode; // 카테고리 코드
  private String categoryMid;  // 중분류명
  private String categorySub;  // 소분류명
}
