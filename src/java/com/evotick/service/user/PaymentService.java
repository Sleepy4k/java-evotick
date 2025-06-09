/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.evotick.service.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Pandu
 */
public interface PaymentService {

  public void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

  public void handlePayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
