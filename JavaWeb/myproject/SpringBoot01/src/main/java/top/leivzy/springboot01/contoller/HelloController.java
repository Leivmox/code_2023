package top.leivzy.springboot01.contoller;


import org.springframework.web.bind.annotation.*;

@RestController
public class HelloController {

    @RequestMapping("/hello")
    public String hello(){
        System.out.println("Hello World ~~");
        return "Hello World ~";
    }

}