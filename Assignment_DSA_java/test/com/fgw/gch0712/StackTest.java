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
public class StackTest {
    
    public StackTest() {
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

    Stack stack = new Stack();
    @Test
    public void testPush() {
        stack.push("message 1");
        assertEquals(stack.top(), "message 1");
    } 
    
    @Test
    public void testPop() {
        stack.push("message 1");
        stack.push("message 2");
        assertEquals(stack.pop(), "message 2");
        assertEquals(stack.pop(), "message 1");
    }
    
    @Test
    public void testIsEmpty() {
        assertEquals(stack.isEmpty(), true);
        stack.push("message 1");
        assertEquals(stack.isEmpty(), false);
    }
    
    @Test
    public void testTop() {
        stack.push("message 1");
        assertEquals(stack.top(), "message 1");
    }
    
    @Test
    public void testSize() {
        stack.push("message 1");
        stack.push("message 2");
        stack.push("message 3");
        assertEquals(stack.size(), 3);
    }
    
    /*@Test
    public void testSearch() {
        stack.push("message 1");
        stack.push("message 2");
        stack.push("message 3");
        assertEquals(stack.search("message 2"), true);
    }*/
}
