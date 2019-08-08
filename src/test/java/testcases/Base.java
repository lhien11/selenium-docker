package testcases;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


public class Base {

    public static WebDriver driver;

    public static void initialization() {

        System.setProperty("webdriver.chrome.driver", "/Users/hienle/Desktop/drivers/chromedriver");
        driver = new ChromeDriver();

        driver.get("http://www.google.com");

    }

    public void failed() {
        File scrFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
        try {
            FileUtils.copyFile(scrFile, new File(
                    "/Users/hienle/Desktop/Selenium-Tutorial/workspace/SeleniumSessions/" +"failshot_" + this.getClass().getName() + "_" + ".png"));
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }

//    // Take screenshot and store as a file format
//    File src = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
//    // now copy the screenshot to desired location using copyFile //method
//        FileUtils.copyFile(src, new File("/Users/hienle/Desktop/Selenium-Tutorial/workspace/SeleniumSessions/google.png"));

}