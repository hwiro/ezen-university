package edu.univ.ezen.mailSender;

public interface EmailService {
    String sendSimpleMessage(String to)throws Exception;
}