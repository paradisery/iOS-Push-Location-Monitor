//
//  ViewController.m
//  RYAccessAuthority
//
//  Created by ruanyang on 16/9/30.
//  Copyright © 2016年 mengtukeji. All rights reserved.
//

#import "ViewController.h"
#import "AccessAuthority.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *push;

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
      [self allow];
    
}
-(void)allow{
    if ([AccessAuthority allowLocation]) {
        NSLog(@"成功");
        _location.text=@"允许定位";
    }else{
        NSLog(@"失败");
        _location.text=@"不允许定位";
    };
    if ([AccessAuthority allowPush]) {
        NSLog(@"成功");
        _push.text=@"允许通知";
    }else{
        NSLog(@"失败");
        _push.text=@"不允许通知";
    };
}

-(void)openGPS{
    //定位服务设置界面
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        NSURL *url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if( [[UIApplication sharedApplication]canOpenURL:url] ) {
            [[UIApplication sharedApplication]openURL:url options:@{}completionHandler:^(BOOL success) {
            }];
        }
    } else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        NSURL *url = [NSURL URLWithString:@"prefs:root=com.mengtukeji.Crowdsourcing"];
        if( [[UIApplication sharedApplication]canOpenURL:url] ) {
            [[UIApplication sharedApplication]openURL:url];
        }
    } else {
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
