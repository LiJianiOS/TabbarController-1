//
//  JComposeViewController.m
//  自定义的TabbarController
//
//  Created by bcc_cae on 15-11-30.
//  Copyright (c) 2015年 bcc_cae. All rights reserved.
//

#import "JComposeViewController.h"

@interface JComposeViewController ()

@end

@implementation JComposeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏内容
    [self setupNav];
}

-(void)setupNav
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)send
{
    NSLog(@"发送...");
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
