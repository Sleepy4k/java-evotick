/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package com.evotick.provider;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Pandu
 */
public class SecurityProvider implements Filter {

  public SecurityProvider() {
  }

  /**
   *
   * @param request The servlet request we are processing
   * @param response The servlet response we are creating
   * @param chain The filter chain we are processing
   *
   * @exception IOException if an input/output error occurs
   * @exception ServletException if a servlet error occurs
   */
  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpServletResponse res = (HttpServletResponse) response;

    res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    res.setDateHeader("Expires", 0); // Proxies.

    res.setHeader(
      "Permission-Policy",
      "accelerometer=(self), attribution-reporting=*, autoplay=(), bluetooth=(), browsing-topics=*, camera=(), compute-pressure=(self), cross-origin-isolated=(self), display-capture=(self), encrypted-media=(self), fullscreen=(self), gamepad=(self), geolocation=(self), gyroscope=(self), hid=(self), identity-credentials-get=(self), idle-detection=(self), local-fonts=(self), magnetometer=(self), microphone=(), midi=(self), otp-credentials=(), payment=(), picture-in-picture=*, publickey-credentials-create=(self), publickey-credentials-get=(self), screen-wake-lock=(self), serial=(self), storage-access=*, usb=(), web-share=(self), window-management=(self), vibrate=(), xr-spatial-tracking=(self)"
    );

//    String cspNonce = (String) request.getServletContext().getAttribute("cspNonce");
//    request.setAttribute("cspNonce", cspNonce);
//
//    res.setHeader(
//      "Content-Security-Policy",
//      String.format("default-src 'none';base-uri 'none';manifest-src 'self';form-action 'self';img-src 'self' https://*.googleapis.com https://*.gstatic.com https://assets.loket.com *.google.com *.googleusercontent.com i.ytimg.com data:;media-src 'self';object-src 'none';font-src 'self' https://fonts.gstatic.com data:;frame-src 'self' *.google.com *.youtube.com *.youtube-nocookie.com;block-all-mixed-content;connect-src 'self' https://*.googleapis.com *.google.com https://*.gstatic.com cdn.plyr.io noembed.com data: blob:;script-src 'self' 'unsafe-inline';style-src 'self' 'unsafe-inline' fonts.googleapis.com www.google.com cdn.plyr.io;upgrade-insecure-requests;frame-ancestors 'self';script-src-attr 'none'", cspNonce, cspNonce)
//    );

    chain.doFilter(request, res);
  }

  /**
   * Destroy method for this filter
   */
  @Override
  public void destroy() {
  }

  /**
   * Init method for this filter
   *
   * @param filterConfig
   */
  @Override
  public void init(FilterConfig filterConfig) {
  }

}
