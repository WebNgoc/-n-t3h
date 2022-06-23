package com.example.baitap.controller.admin;

import com.example.baitap.common.PagingAndSortObject;
import com.example.baitap.common.PagingAndSortParam;
import com.example.baitap.dto.ExportReportDTO;
import com.example.baitap.dto.ProductDto;
import com.example.baitap.entity.ExportReportEntity;
import com.example.baitap.entity.ProductEntity;
import com.example.baitap.entity.SizeEntity;
import com.example.baitap.repository.ExportReportRepository;
import com.example.baitap.repository.ProductRepository;
import com.example.baitap.repository.SizeRepository;
import com.example.baitap.service.Impl.BrandService;
import com.example.baitap.service.Impl.CategoryServiceImpl;
import com.example.baitap.service.Impl.ProductService;
import com.example.baitap.storage.IImageService;
import com.microsoft.schemas.office.visio.x2012.main.CellType;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.validation.Valid;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("backend/product")
public class ProductController {
    public static String UPLOADED_FOLDER = "D:\\T3h\\img\\";
    @Autowired
    ProductService productService;
    @Autowired
    CategoryServiceImpl categoryServiceImpl;
    @Autowired
    BrandService brandService;
    @Autowired
    SizeRepository sizeRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ExportReportRepository exportReportRepository;
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    @GetMapping("create")
    public String loadPageCreate(Model model) throws SQLException {
        model.addAttribute("listCat", categoryServiceImpl.listAllCat());
        model.addAttribute("listBrand", brandService.listAllBrand());
        model.addAttribute("listSize", sizeRepository.findAll());

        model.addAttribute("product", new ProductDto());
        return "backend/product/create";
    }
    @PreAuthorize("hasAnyRole('ADMIN')")
    @GetMapping("edit/{id}")
    public String loadPageEditProduct(@PathVariable Long id, Model model) throws SQLException {
        model.addAttribute("product", productService.findById(id).get());
        model.addAttribute("brand", productService.listAllBrand());
        model.addAttribute("category", productService.listAllCat());

        return "backend/product/detail";
    }
    @GetMapping("size/{id}")
    public String loadPageSizeProduct(@PathVariable Long id, Model model) {
        model.addAttribute("listSize", sizeRepository.findAll());
        model.addAttribute("product", productService.findById(id).get());
        return "backend/product/size";
    }
    @GetMapping("add/{id}")
    public String loadPageSizePro(@PathVariable Long id, Model model) {
        model.addAttribute("listSize", sizeRepository.findAll());
        model.addAttribute("product", productService.findById(id).get());
        return "backend/product/addSize";
    }
    @PostMapping("add/{id}")
    public String loadPageAddSizeProduct(@PathVariable Long id, Model model
                                            ,@RequestParam Set<SizeEntity> idSize) {
        for (SizeEntity s:idSize) {
            SizeEntity sizeEntity = sizeRepository.findById(s.getId()).get();
            ProductEntity productEntity = productService.findById(id).get();
            productEntity.setSize(sizeEntity);
            productRepository.save(productEntity);
        }
        model.addAttribute("product", productService.findById(id).get());

        return "redirect:/backend/product/size/"+id;
    }

    @GetMapping("list")
    public String loadProduct(@PagingAndSortParam(path = "product") PagingAndSortObject pagingAndSortObject, Model model) {
        productService.ListProduct(pagingAndSortObject);
        model.addAttribute("category", productService.listAllCat());

        return "backend/product/list";
    }


    @PostMapping(value = "create-form", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String createProduct(@ModelAttribute(name = "product") @Valid ProductDto productDto, BindingResult bindingResult, RedirectAttributes redirectAttributes) throws SQLException {
        if (bindingResult.hasErrors()) {
            return "backend/product/create";
        }
        productService.saveOrEditProduct(productDto);
        redirectAttributes.addFlashAttribute("message", "Tạo mới sản phẩm " + productDto.getNameProduct() + " thành công!");
        return "redirect:/backend/product/create";
    }

    @PostMapping(value = "edit", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String editProduct(@ModelAttribute(name = "product") @Valid ProductDto productDto, BindingResult bindingResult, RedirectAttributes redirectAttributes) throws SQLException {
        productService.saveOrEditProduct(productDto);
        redirectAttributes.addFlashAttribute("message", "Sửa sản phẩm " + productDto.getNameProduct() + " thành công!");
        return "redirect:/backend/product/list";
    }

    @PostMapping("/upload")
    @ResponseBody
    public String uploadFile(
            @RequestParam("file") MultipartFile uploadfile) {
        if (uploadfile.isEmpty()) {
            return null;
        }
        return  saveUploadedFiles(uploadfile);
    }
    @Autowired
    IImageService imageService;

    //save file
    private String saveUploadedFiles(MultipartFile file){
            try {

                String fileName = imageService.save(file);

                String imageUrl = imageService.getImageUrl(fileName);

                // do whatever you want with that
                return imageUrl;

            } catch (Exception e) {
                //  throw internal error;
                return null;
            }

    }
    @PreAuthorize("hasAnyRole('ADMIN')")
    @GetMapping(value = "/delete/{id}")
    public String loadDelete(@PathVariable Long id) throws SQLException {
        productService.deleteById(id);
        return "redirect:/backend/product/list";
    }
    /*----------------------------*/

    @GetMapping("/getExport")
    public void exportReport(HSSFWorkbook workbook) throws IOException {
        HSSFFont font = workbook.createFont();
        font.setBold(true);
        HSSFCellStyle style = workbook.createCellStyle();
        style.setFont(font);

        workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("report sheet");


        List<ExportReportDTO> listExport = new ArrayList<>();

            List<ExportReportEntity> list = exportReportRepository.exportReport();
        for (ExportReportEntity e:list) {
            ExportReportDTO exportReportDTO = new ExportReportDTO();
            exportReportDTO.setId(e.getId());
            exportReportDTO.setNameProduct(e.getNameProduct());
            exportReportDTO.setPrice(e.getPrice());
            exportReportDTO.setQuantity(e.getQuantity());
            exportReportDTO.setInventory(e.getInventory());
            exportReportDTO.setSale(e.getSale());
            exportReportDTO.setDate(e.getDate());
            listExport.add(exportReportDTO);
        }

        int rownum = 0;
        Cell cell;
        Row row;
        //

        row = sheet.createRow(rownum);

        // EmpNo
        cell = row.createCell(0);
        cell.setCellValue("id");
        cell.setCellStyle(style);
        // EmpName
        cell = row.createCell(1);
        cell.setCellValue("name");
        cell.setCellStyle(style);
        // Salary
        cell = row.createCell(2);
        cell.setCellValue("Salary");
        cell.setCellStyle(style);
        // Grade
        cell = row.createCell(3);
        cell.setCellValue("Quantity");
        cell.setCellStyle(style);
        // Bonus
        cell = row.createCell(4);
        cell.setCellValue("inventory");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("sale");
        cell.setCellStyle(style);

        cell = row.createCell(6);
        cell.setCellValue("date");
        cell.setCellStyle(style);

        // Data
        for (ExportReportDTO emp : listExport) {
            rownum++;
            row = sheet.createRow(rownum);

            // EmpNo (A)
            cell = row.createCell(0);
            cell.setCellValue(emp.getId());
            // EmpName (B)
            cell = row.createCell(1);
            cell.setCellValue(emp.getNameProduct());
            // Salary (C)
            cell = row.createCell(2);
            cell.setCellValue(emp.getPrice());
            // Grade (D)
            cell = row.createCell(3);
            cell.setCellValue(emp.getQuantity());

            cell = row.createCell(4);
            cell.setCellValue(emp.getInventory());

            cell = row.createCell(5);
            cell.setCellValue(emp.getSale());

            cell = row.createCell(6);
            cell.setCellValue(emp.getDate());
            // Bonus (E)

        }
        File file = new File("D:\\T3h\\demo.xls");
        file.getParentFile().mkdirs();

        FileOutputStream outFile = new FileOutputStream(file);
        workbook.write(outFile);
        System.out.println("Created file: " + file.getAbsolutePath());
    }

}
