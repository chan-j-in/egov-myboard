package main.web;

public abstract class BaseController {

	protected String generateVisitorName() {
        int rnd = (int) (Math.random() * 900) + 100;
        return "방문자" + rnd;
    }
}
