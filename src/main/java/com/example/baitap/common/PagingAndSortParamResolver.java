package com.example.baitap.common;

import org.springframework.core.MethodParameter;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class PagingAndSortParamResolver implements HandlerMethodArgumentResolver {
    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        return methodParameter.getParameterAnnotation(PagingAndSortParam.class) != null;
    }

    @Override
    public Object resolveArgument(MethodParameter methodParameter,
                                  ModelAndViewContainer modelAndViewContainer,
                                  NativeWebRequest nativeWebRequest, WebDataBinderFactory webDataBinderFactory) throws Exception {
        String path = methodParameter.getParameterAnnotation(PagingAndSortParam.class).path();
        Integer page = 1;
        String pageStr = nativeWebRequest.getParameter("page");
        if (!StringUtils.isEmpty(pageStr)) page = Integer.valueOf(pageStr);
        Integer perPage = 3;
        String perPageStr = nativeWebRequest.getParameter("perPage");
        if (!StringUtils.isEmpty(perPageStr)) perPage = Integer.valueOf(perPageStr);

        String sort = nativeWebRequest.getParameter("sort");
        String key = nativeWebRequest.getParameter("key");
        return new PagingAndSortObject(page, perPage, key, sort, path, modelAndViewContainer);
    }
}
