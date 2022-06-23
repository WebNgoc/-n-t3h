package com.example.baitap.common;

import com.example.baitap.dto.ResponseListDto;
import com.example.baitap.repository.ProductRepository;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.method.support.ModelAndViewContainer;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PagingAndSortObject {
    private Integer page = 1;
    private Integer perpage = 3;
    private String key;
    private String sort;
    private String path;
    private ModelAndViewContainer model;

    public <T> void findAll(JpaRepository<T, Long> repository) {
        Page<T> pageList = repository.findAll(PageRequest.of(page - 1, perpage));
        List<T> data = pageList.getContent();
        Long total = pageList.getTotalElements();
        ResponseListDto<T> dto = new ResponseListDto();
        dto.setData(data);
        dto.setPage(page);
        dto.setPerpage(perpage);
        dto.setTotal(total);
        dto.setNumberPage((total % perpage == 0) ? (total / perpage) : (total / perpage + 1));
        dto.setBegin(page - 3 < 0 ? 1 : page - 3);
        model.addAttribute("list", dto);
        model.addAttribute("key", key);
        model.addAttribute("sort", sort);
        model.addAttribute("path", path);
    }
}