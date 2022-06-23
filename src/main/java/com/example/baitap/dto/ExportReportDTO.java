package com.example.baitap.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExportReportDTO {
    private Long id;
    private String nameProduct;
    private double price;
    private int quantity;
    private int inventory;
    private double sale;
    private Timestamp date;

}
