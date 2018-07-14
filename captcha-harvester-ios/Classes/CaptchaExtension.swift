//
//  CaptchaExtension.swift
//  captcha-harvester-ios
//
//  Created by David Krajewski on 7/14/18.
//

import WebKit

public extension WKWebView {
    
    public func displayCaptcha(sitekey: String, baseUrl: String, googleLogin: Bool) {
        if googleLogin {
            let googleUrl = URL(string: "https://accounts.google.com/signin/v2/identifier?hl=EN&flowName=GlifWebSignIn&flowEntry=ServiceLogin")
            let request = URLRequest(url: googleUrl!)
            self.load(request)
            
            
            self.checkGoogleTitle(sitekey: sitekey, baseUrl: baseUrl)
        } else {
            self.loadCaptcha(sitekey: sitekey, baseUrl: baseUrl)
            self.getToken(sitekey: sitekey, baseUrl: baseUrl)
        }
    }
    
    private func checkGoogleTitle(sitekey: String, baseUrl: String) {
        //document.title
        //sign in -> google account
        
        self.evaluateJavaScript("document.title") { (response, error) in
            if let error = error {
                print(error)
            }
            
            let responseString = response as! String
            
            
            if responseString.lowercased().range(of: "sign in") != nil || responseString.lowercased() == "" {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.checkGoogleTitle(sitekey: sitekey, baseUrl: baseUrl)
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                    self.loadCaptcha(sitekey: sitekey, baseUrl: baseUrl)
                    self.getToken(sitekey: sitekey, baseUrl: baseUrl)
                })
                
            }
            
        }
        
    }
    
    private func getToken(sitekey: String, baseUrl: String) {
        self.evaluateJavaScript("document.getElementById('g-recaptcha-response').value") { (response, error) in
            guard let response = response else {
                self.getToken(sitekey: sitekey, baseUrl: baseUrl)
                return
            }
            
            if let error = error {
                print(error)
            }
            
            
            
            if response as? String == "" || response as? String == nil{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.getToken(sitekey: sitekey, baseUrl: baseUrl)
                }
            } else {
                if Tokens.tokens.contains(response as! String) {
                    
                } else {
                    Tokens.tokens.append(response as! String)
                }
                
                self.loadCaptcha(sitekey: sitekey, baseUrl: baseUrl)
                self.getToken(sitekey: sitekey, baseUrl: baseUrl)
            }
        }
        
    }
    
    private func loadCaptcha(sitekey: String, baseUrl: String) {
        self.loadHTMLString("<html><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\" />\r\n<head>\r\n<style>\r\nform {\r\n  text-align: center;\r\n}\r\nbody {\r\n  text-align: center;\r\n\r\n  \r\n}\r\n\r\nh1 {\r\n  text-align: center;\r\n}\r\nh3 {\r\n  text-align: center;\r\n}\r\ndiv-captcha {\r\n      text-align: center;\r\n}\r\n    .g-recaptcha {\r\n        display: inline-block;\r\n    }\r\n</style>\r\n\r\n<meta name=\"referrer\" content=\"never\"> <script type='text/javascript' src='https://www.google.com/recaptcha/api.js'></script><script>function sub() { window.webkit.messageHandlers.captchaReceived.postMessage(document.getElementById('g-recaptcha-response').value); }</script></head> <body bgcolor=\"#ffffff\"oncontextmenu=\"return false\"><div id=\"div-captcha\"><br><img width=\"50%\"/><br><br><div style=\"opacity: 0.9\" class=\"g-recaptcha\" data-sitekey=\"\(sitekey)\" data-callback=\"sub\"></div></div><br>\r\n\r\n</body></html>", baseURL: URL(string: baseUrl))
        
    }
    
    
    
}


