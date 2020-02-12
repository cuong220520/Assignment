/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fgw.gch0712;

import java.util.ArrayList;

/**
 *
 * @author cuong
 */
public class Stack {
    /*ArrayList<String> stack = new ArrayList<String>();
    int top = 0;
    
    public void push(String data) {
        stack.add(top, data); // add value to the top element.
        top++; // increase index of top.
    }
    
    public String pop() {
        top--;
        return stack.remove(top);
    }
    
    public String top() {
        top--;
        return stack.get(top);
    }
    
    public void show() {
        for (String message : stack) {
            System.out.println(message);
        }
    }
    
    public boolean isEmpty() {
        return (top == 0);
    }*/
    
    private Node head;
    
    public Stack() {
        this.head = null;
    }
    
    public boolean isEmpty() {
        return (this.head == null);
    }
    public void push(String data) {
        Node newNode = new Node(data); // create a new node
        newNode.next = this.head; // point next node is head (top of Stack is head)
        this.head = newNode; // newNode now is head.
        if (this.size() > 100) throw new StackOverFlowException("Message Box is full, please clean the Message Box!");
    }
    
    public void show() {
        if (isEmpty()) throw new MessageBoxEmptyException("Message box is empty!");
        Node temp = this.head; // Initiate temp is head 
        while (temp != null) {
            System.out.println(temp.data);
            temp = temp.next; // variable temp run until finish the Stack (temp = null).
        }
    }
    
    public String top() {
        if (isEmpty()) throw new MessageBoxEmptyException("Message box is empty!");
        return this.head.data; // return top of Stack.
    }
    
    public String pop() {
        if (isEmpty()) throw new MessageBoxEmptyException("Message box is empty!");
        Node temp = head; // initiate temp = head.
        this.head = this.head.next; // point head to next node.
        return temp.data; // return Stack when have poped element.
    }
    
    public int size() {
        if (isEmpty()) 
            return 0; // if stack is empty return stack size = 0.
        Node temp = this.head; // initiate temp = head of stack.
        int count = 0; // initiate count = 0.
        while (temp != null){
            count++;
            temp = temp.next; // increase count by 1 and temp to next temp until temp = null.
        }
        return count;
    }
    
    public boolean search(String mess) {
        Node temp = this.head; 
        while (temp.data != mess) {
            temp = temp.next;
        }
        return true;
    }
}
