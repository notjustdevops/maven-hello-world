// path: Dvorkin-Guy-From-Kepler-186f-App/src/test/java/com/myapp/AppTest.java

package com.myapp;

import static org.junit.Assert.*;
import org.junit.Test;

public class AppTest {

    @Test
    public void testGreeting() {
        // Test if the getGreeting method returns the expected message
        String expected = "Hello World, this is Dvorkin Guy v1.0.3!";  // Ensure the version matches
        assertEquals(expected, App.getGreeting());
    }
}
