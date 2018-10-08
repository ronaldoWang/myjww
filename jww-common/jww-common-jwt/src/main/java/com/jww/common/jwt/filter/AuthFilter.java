package com.jww.common.jwt.filter;

import cn.hutool.core.util.ReUtil;
import com.jww.common.core.Constants;
import com.jww.common.core.exception.BusinessException;
import com.jww.common.jwt.JwtTokenHelper;
import com.jww.common.jwt.configration.JwtProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 对客户端请求的jwt token验证过滤器
 *
 * @author shadj
 * @date 2018/5/12 11:50
 */
@Slf4j
@Order(3)
@WebFilter(filterName = "authFilter", urlPatterns = "/wx/*")
public class AuthFilter implements Filter {
    /**
     * TOKEN前缀
     */
    private static final String PREFIX_TOKEN = "Bearer ";

    @Autowired
    private JwtTokenHelper jwtTokenHelper;

    @Autowired
    private JwtProperties jwtProperties;

    public static final String USER_KEY = "userId";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        log.debug("=============AuthFilter.init()============");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        String isOpen = jwtProperties.getIsOpen();
        if (JwtProperties.JWT_ISOPEN_CLOSE.equals(isOpen)) {
            log.debug("JWT校验未开启");
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String path = request.getServletPath();
        if (path.equals("/" + jwtProperties.getAuthPath())) {
            filterChain.doFilter(request, servletResponse);
            return;
        }
        if (isExcludePaths(path)) {
            log.debug("请求路径：{}，不需要校验", path);
            filterChain.doFilter(request, servletResponse);
            return;
        }
        final String requestHeader = request.getHeader(jwtProperties.getHeader());
        String authToken = null;
        if (requestHeader != null && requestHeader.startsWith(PREFIX_TOKEN)) {
            try {
                authToken = requestHeader.substring(7);
                log.debug("***************authToken:[{}]***************", authToken);
                //验证token是否过期,包含了验证jwt是否正确
                boolean flag = jwtTokenHelper.isTokenExpired(authToken);
                if (flag) {
                    throw new BusinessException(Constants.ResultCodeEnum.UNLOGIN);
                }
                request.setAttribute(USER_KEY, jwtTokenHelper.getClaimFromToken(authToken).getSubject());
            } catch (BusinessException e) {
                throw e;
            } catch (Throwable e) {
                throw new BusinessException(Constants.ResultCodeEnum.UNLOGIN);
            }
        } else {
            throw new BusinessException(Constants.ResultCodeEnum.UNAUTHORIZED);
        }
        log.debug("请求路径：{}，权限校验通过", path);
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }

    /**
     * 是否是不校验路径
     *
     * @param path 请求路径
     * @return 不校验路径返回true，否则返回false
     */
    private boolean isExcludePaths(String path) {
        String excludePath = jwtProperties.getExcludePaths();
        return ReUtil.isMatch(excludePath, path);
    }
}