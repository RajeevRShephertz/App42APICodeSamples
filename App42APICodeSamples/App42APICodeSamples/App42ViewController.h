//
//  App42ViewController.h
//  App42APICodeSamples
//
//  Created by Rajeev on 15/06/14.
//  Copyright (c) 2014 Shephertz Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface App42ViewController : UIViewController
{
    IBOutlet UITextView *responseView;
}

-(IBAction)clearLogs:(id)sender;

-(IBAction)createGame:(id)sender;
-(IBAction)saveScore:(id)sender;
-(IBAction)getUserScore:(id)sender;
-(IBAction)getTopNRankers:(id)sender;

@end
