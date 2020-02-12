/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fgw.gch0712;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 *
 * @author cuong
 */
public abstract class MenuSystem{
    protected final static int EXIT = 0;
    
    protected abstract void printMenu();
    
    protected abstract void doTask(int choice); 
        
    
    protected int getChoice(){
        boolean invalid = true;
        int choice = 0;
        while (invalid) {
            try {
                System.out.println("Your choice: ");
                Scanner sc = new Scanner(System.in);
                choice = sc.nextInt();
                return choice;
            } catch (InputMismatchException ie) {
                System.out.println("Invalid choice! Please enter choice again!");
            }    
        }
        return choice;
    }
    
    public void run(){
        boolean running = true;
        while (running){
            printMenu();
            int choice = getChoice();
            doTask(choice);
            if (choice == EXIT) running = false;
        }
    }
}
