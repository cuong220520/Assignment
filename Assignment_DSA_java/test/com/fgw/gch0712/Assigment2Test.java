/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fgw.gch0712;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author cuong
 */
public class Assigment2Test {
    
    public Assigment2Test() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }
    Queue queue = new Queue();
    Stack stack = new Stack();
    
    @Test
    public void testDoTaskSentMessage() {
        queue.enQueue("message 1");
        queue.deQueue();
        stack.push(queue.deQueue().data);
        assertEquals(stack.pop(), "message 1");
    }
    
    @Test
    public void testDoTaskTotalMessage() {
        stack.push("message 1");
        stack.push("message 2");
        assertEquals(stack.size(), 2);
    }
    
    @Test
    public void testDoTaskDeleteMessage() {
        stack.push("message 1");
        stack.push("message 2");
        while (!stack.isEmpty()) {
            stack.pop();
        }
        assertEquals(stack.isEmpty(), true);
    }
}
