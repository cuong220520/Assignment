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
public class MenuSystemTest {
    
    public MenuSystemTest() {
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

    /**
     * Test of printMenu method, of class MenuSystem.
     */
    @Test
    public void testPrintMenu() {
        System.out.println("printMenu");
        MenuSystem instance = new MenuSystemImpl();
        instance.printMenu();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of doTask method, of class MenuSystem.
     */
    @Test
    public void testDoTask() {
        System.out.println("doTask");
        int choice = 0;
        MenuSystem instance = new MenuSystemImpl();
        instance.doTask(choice);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getChoice method, of class MenuSystem.
     */
    @Test
    public void testGetChoice() {
        System.out.println("getChoice");
        MenuSystem instance = new MenuSystemImpl();
        int expResult = 0;
        int result = instance.getChoice();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of run method, of class MenuSystem.
     */
    @Test
    public void testRun() {
        System.out.println("run");
        MenuSystem instance = new MenuSystemImpl();
        instance.run();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    public class MenuSystemImpl extends MenuSystem {

        public void printMenu() {
        }

        public void doTask(int choice) {
        }
    }
    
}
