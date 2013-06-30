//
//  DNEylemResultController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNEylemResultController.h"
#import "UITextView+DNConvTest.h"
#import "DNHomeController.h"
#import "DNStatusView.h"
#import "DNAppDelegate.h"
#import "DNPlayer.h"

#define player ((DNAppDelegate *)[UIApplication sharedApplication].delegate).player
#define city ((DNAppDelegate *)[UIApplication sharedApplication].delegate).city
#define database ((DNAppDelegate *)[UIApplication sharedApplication].delegate).database


@interface DNEylemResultController ()

@end

@implementation DNEylemResultController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) goBackToMeydan:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"\n\n\n%@\n\n\n",[player getCumulativeScore]);
    [super viewWillAppear:animated];
    [self.mainText setTextN:self.text];
    self.background.image = self.backgroundImage;
    if ([player getAttrribute:@"points"]<=0) {
        
        NSMutableArray *scores = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"scores"]];
        [scores addObject:@{@"name":[player getName],@"score":[player getCumulativeScore]}];
        NSSortDescriptor * sort = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:false];
        NSArray *sorted;
        if ([scores count]>10) {
            sorted = [[scores sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]] subarrayWithRange:NSMakeRange(0, 10)];
        }else {
            sorted = [scores sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
        }
        [[NSUserDefaults standardUserDefaults] setObject:sorted forKey:@"scores"];
        
        [player addToAttrribute:@"points" value:[player getAttrribute:@"points"]*-1];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oyun Bitti" message:[NSString stringWithFormat:@"Puanın sıfırlandı. Gelecek sefere daha dikkatli olman gerek.\nToplam puanın:%@",[player getCumulativeScore]] delegate:self cancelButtonTitle:@"#anamenuyedonuyoruz" otherButtonTitles:nil];
        alert.tag = 27;
        [alert show];
    }else if([player getHour]==6){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bu günlük bu kadar" message:@"Güneşin açmasıyla hayat yavaş yavaş normale dönüyor. Akşama tüm gücünle direnebilmen için eve gidip güç toplamalısın." delegate:self cancelButtonTitle:@"Eve Dön" otherButtonTitles:nil];
        [alert show];
    }
    [self.status redraw];
}

- (IBAction) goBack:(id)sender{
    if ([player getAttrribute:@"points"]<=0) {
        player = nil;
        [DNPlayer save:player];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        [player passTime:1];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (alertView.tag==27) {
        player = nil;
        [DNPlayer save:player];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        [player passTime:8];
        for (int i=0; i<[[self.navigationController viewControllers] count]; i++) {
            if([[[self.navigationController viewControllers][i] class] isEqual:[DNHomeController class]]){
                [self.navigationController popToViewController:[self.navigationController viewControllers][i] animated:YES];
                break;
            }
        }
    }
}

@end
