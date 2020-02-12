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
public class Queue {
    /*ArrayList<String> queue = new ArrayList<String>();
    private int front;
    private int rear;
    private int size;
    public Queue() {
        front = 0;
        rear = -1;
        size = 0;
    }
    
    public boolean isEmpty() {
        return front > rear;
    }
    
    public void enQueue(String data) {
        rear++;
        queue.add(rear, data);
        size++;
    }
    
    public String deQueue() {
        if (this.isEmpty()) throw new MessageEmptyException("Message is empty, please type message!");
        size--;
        return queue.remove(front++);

    }
    
    public void show() {
        for (int i = 0; i < size; i++) {
            System.out.println(queue.get(i));
        }
    }*/
    
    private Node front;
    private Node rear;
    private int count;
    
    public Queue() {
        this.front = null;
        this.rear = null;
        this.count = 0;
    }
    
    public boolean isEmpty() {
        return (size() == 0);
    }
    
    public void enQueue(String data) {
        Node newNode = new Node(data);
        if (data.length() > 250) throw new RuntimeException("Message can contain maximum 250 characters");
        if (this.rear == null) {
            this.front = this.rear = newNode; // if Queue is empty front = rear = newNode.
        }
        this.rear.next = newNode; // else, next node is rear.
        this.rear = newNode; // now rear is newNode.
        count++;
    }
    
    public void show() {
        if (isEmpty()) throw new MessageEmptyException("There are no messages to send!");
        Node temp = this.front; // initiate temp = front
        while(temp != null) {
            System.out.println(temp.data);
            temp = temp.next; // print data until finish queue (temp == null)
        }
    }
    
    public String front() {
        if (isEmpty()) throw new MessageEmptyException("There is no message to send!");
        return this.front.data; // return front value
    }
    
    public String rear() {
        if (isEmpty()) throw new MessageEmptyException("There is no message to send!");
        return this.rear.data; // return rear value
    }
    
    public Node deQueue() {
        if (isEmpty()) throw new MessageEmptyException("There is no message to send!");
        Node temp = this.front; // initiate temp = front
        this.front = this.front.next; // poiting front of queue is the next node
        if (this.front == null)
            this.rear = null;
        count--;
        return temp;
    }
    
    public int size() {
        return count;
    }
    
    public boolean isFull() {
        return (size() >= 5);
    }
}
