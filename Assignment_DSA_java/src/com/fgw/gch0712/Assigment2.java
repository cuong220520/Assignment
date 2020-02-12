/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fgw.gch0712;

import java.util.Scanner;

/**
 *
 * @author cuong
 */
public class Assigment2 extends MenuSystem{
    private final static int SENT_MESSAGE = 1;
    private final static int MESSAGE_BOX = 2;
    private final static int TOTAL_MESSAGE = 3;
    private final static int DELETE_MESSAGE = 4;
    private final static int SEARCH_MESSAGE = 5;
    private final static int TIME_PUSH = 6;
    private final static int TIME_POP = 7;
    private final static int TIME_SIZE = 8;
    Queue queue = new Queue();
    Stack stack = new Stack();
    
    public static void main(String[] args) {
        
        Assigment2 program = new Assigment2();
        program.run();              
    }
    
    @Override
    protected void printMenu() {
        System.out.println("Message System: ");
        System.out.println("1. Sent message");
        System.out.println("2. Message box");
        System.out.println("3. Total message in Message box");
        System.out.println("4. Delete message");
        System.out.println("5. Search message");
        System.out.println("6. Time execution of push function");
        System.out.println("7. Time execution of pop function");
        System.out.println("8. Time execution of size function");
        System.out.println("0. Exit");
    }
    
    @Override
    protected void doTask(int choice) {
        switch (choice) {
            case SENT_MESSAGE:
                doTaskSentMessage();
                break;
            case MESSAGE_BOX:
                doTaskMessageBox();
                break;
            case TOTAL_MESSAGE:
                doTaskTotalMessage();
                break;
            case DELETE_MESSAGE:
                doTaskDeleteMessage();
                break;
            case SEARCH_MESSAGE:
                doTaskSearchMessage();
                break;
            case TIME_PUSH:
                doTaskTimePush();
                break;
            case TIME_POP:
                doTaskTimePop();
                break;
            case TIME_SIZE:
                doTaskTimeSize();
                break;
        }
    }

    private void doTaskSentMessage() {
        Scanner sc = new Scanner(System.in);
        while (!queue.isFull()) {
            try {
                System.out.println("Type message:");
                String message = sc.nextLine();
                queue.enQueue(message);
                System.out.println("Message has saved to the Buffer!");
            } catch (RuntimeException re) {
                System.out.println(re.getMessage());
            }
        }
        System.out.println("Sending messages.........................");
        System.out.println("Messages have been sent successfully!");
        for (int j = 0; j < 3; j++) {
            try {
                String receivedMessage = queue.deQueue().data;
                stack.push(receivedMessage);
            } catch (StackOverFlowException se) {
                System.out.println(se.getMessage());
            }
        }
    }

    private void doTaskMessageBox() {
        try {
        System.out.println("Recveived message: ");
        stack.show();
        } catch (MessageBoxEmptyException me) {
            System.out.println(me.getMessage());
        }
    }

    private void doTaskTotalMessage() {
        System.out.println("Total message in Message box: " + stack.size());       
    }

    private void doTaskDeleteMessage() {
        while (!stack.isEmpty()) {
            stack.pop();
        }
    }

    private void doTaskSearchMessage() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Search Message: ");
        String message = sc.nextLine();
        if (stack.search(message)) {
            System.out.println("Stack contain this element: " + message);
        }
        else 
            System.out.println("Stack do not contain this element: " + message);
    }

    private void doTaskTimePush() {
        long start = System.nanoTime();     // Set time before run function push.
        stack.push("message");
        long finish = System.nanoTime();    // Set time after finish function push.
        long time = finish - start;         // Execution time = finish - start.
        System.out.println("Execution time of push function: " + time + " (nano seconds)"); // Print time execution of push function.
    }

    private void doTaskTimePop() {
        long start = System.nanoTime();     // Set time before run function pop.
        stack.pop();
        long finish = System.nanoTime();    // Set time after finish function pop.
        long time = finish - start;
        System.out.println("Execution time of pop function: " + time + " (nano seconds)"); // Print time execution of pop function.
    }

    private void doTaskTimeSize() {
        long start = System.nanoTime();     // Set time before run function size.
        stack.size();
        long finish = System.nanoTime();    // Set time after finish function size.
        long time = finish - start;
        System.out.println("Execution time of size function: " + time + " (nano seconds)"); // Print time execution of size function.
    }
}
