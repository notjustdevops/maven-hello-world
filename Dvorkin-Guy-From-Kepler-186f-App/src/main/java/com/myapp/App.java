// path: Dvorkin-Guy-From-Kepler-186f-App/src/main/java/com/myapp/App.java

package com.myapp;

import static spark.Spark.*;

public class App {
    public static void main(String[] args) {
        // Set the port to 8080
        port(8080);

        // Define a route for the root URL that returns the "Hello World" message
        get("/", (req, res) -> {
            return getGreeting(); // Use the method below
        });

        // Print a message to the console to confirm the server is running
        System.out.println("Server is running on http://localhost:8080/");
    }

    // Method that returns the greeting message with updated version string
    public static String getGreeting() {
        return "Hello World, this is Dvorkin Guy v1.0.3!";  // Increment the version here
    }
}
