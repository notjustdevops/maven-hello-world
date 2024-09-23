package com.myapp;

import static org.junit.Assert.*;
import org.junit.Test;

public class AppTest {

    @Test
    public void testGreeting() {
        // Test if the getGreeting method returns the expected message
        String expected = "Hello World, this is Dvorkin Guy v1.0.2";  // Update expected version
        assertEquals(expected, App.getGreeting());
    }
}
