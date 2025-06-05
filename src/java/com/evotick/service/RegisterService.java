/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.evotick.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Pandu
 */
public interface RegisterService {

  public void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

  public void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
