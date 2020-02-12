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
public class QueueTest {
    
    public QueueTest() {
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
    
    @Test
    public void testEnQueue() {
        queue.enQueue("message 1");
        assertEquals(queue.front(), "message 1");
    }
    
    @Test
    public void testDeQueue() {
        queue.enQueue("message 1");
        queue.enQueue("message");
        assertEquals(queue.deQueue().data, "message 1");
    }
    
    @Test 
    public void testFront() {
        queue.enQueue("message 1");
        queue.enQueue("message 2");
        assertEquals(queue.front(), "message 1");
    }
    
    @Test 
    public void testRear() {
        queue.enQueue("message 1");
        queue.enQueue("message 2");
        assertEquals(queue.rear(), "message 2");
    }
    
    @Test
    public void testIsEmpty() {
        assertEquals(queue.isEmpty(), true);
        queue.enQueue("message 1");
        assertEquals(queue.isEmpty(), false);
    }
    
    @Test
    public void testSize() {
        queue.enQueue("message 1");
        queue.enQueue("message 1");
        queue.enQueue("message 1");
        queue.enQueue("smadas");
        assertEquals(queue.size(), 4);
    }
    
    /*@Test
    public void testIsFull() {
        queue.enQueue("message 1");
        queue.enQueue("message 1");
        
        assertEquals(queue.isFull(), false);
    }*/
}
