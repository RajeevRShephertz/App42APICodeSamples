//
//  App42ViewController.m
//  App42APICodeSamples
//
//  Created by Rajeev on 15/06/14.
//  Copyright (c) 2014 Shephertz Technologies Pvt Ltd. All rights reserved.
//

#import "App42ViewController.h"
#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>

#define API_KEY     @"Your_API_Key"
#define SECRET_KEY  @"Your_Secret_Key"

@interface App42ViewController ()
{
    GameService *gameService;
    ScoreBoardService *scoreBoardService;
    
    NSString *gameName;
    NSString *description;
    
    NSString *userName;
    
    int max;
    int offset;
}
@end

@implementation App42ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initializeApp42API];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initializeApp42API
{
    [App42API initializeWithAPIKey:API_KEY andSecretKey:SECRET_KEY];
    [App42API enableApp42Trace:YES];
    gameService = [App42API buildGameService];
    scoreBoardService = [App42API buildScoreBoardService];
    
    gameName = @"YourGameName";
    description = @"Description";
    userName = @"userName";
    
}


-(IBAction)createGame:(id)sender
{
    responseView.text = @"";
    @try
    {
        Game *game = [gameService createGame:gameName gameDescription:description];
        NSLog(@"GameName=%@",game.name);
        NSLog(@"Description=%@",game.description);
        responseView.text = game.strResponse;
        
    }
    @catch (App42Exception *exception)
    {
        NSLog(@"Exception = %@",[exception reason]);
        NSLog(@"HTTP error Code = %d",[exception httpErrorCode]);
        NSLog(@"App Error Code = %d",[exception appErrorCode]);
        NSLog(@"User Info = %@",[exception userInfo]);
        responseView.text =  exception.reason;
        
    }
    @finally
    {
        
    }
}
-(IBAction)saveScore:(id)sender
{
    responseView.text = @"";

    @try
    {
        int score = 200;
        Game *game = [scoreBoardService saveUserScore:gameName gameUserName:userName gameScore:score];
        NSLog(@"Game Name=%@",game.name);
        NSLog(@"Description =%@",game.description);
        for (Score *score in game.scoreList)
        {
            NSLog(@"UserName=%@",score.userName);
            NSLog(@"ScoreId=%@",score.scoreId);
            NSLog(@"CreatedOn=%@",score.createdOn);
            NSLog(@"Score=%f",score.value);
            
            for (JSONDocument *doc in score.jsonDocArray)
            {
                NSLog(@"CreatedAt=%@",doc.createdAt);
                NSLog(@"UpdatedAt=%@",doc.updatedAt);
                NSLog(@"DocId=%@",doc.docId);
                NSLog(@"Owner=%@",doc.owner);
                NSLog(@"Doc=%@",doc.jsonDoc);
            }
        }
        responseView.text = game.strResponse;
        
    }
    @catch (App42Exception *exception)
    {
        NSLog(@"Exception = %@",[exception reason]);
        NSLog(@"HTTP error Code = %d",[exception httpErrorCode]);
        NSLog(@"App Error Code = %d",[exception appErrorCode]);
        NSLog(@"User Info = %@",[exception userInfo]);
        responseView.text = exception.reason;
        
    }
    @finally
    {
        
    }
}
-(IBAction)getUserScore:(id)sender
{
    responseView.text = @"";

    @try
    {
        Game *game = [scoreBoardService getScoresByUser:gameName  gameUserName:userName];
        NSLog(@"Game Name=%@",game.name);
        NSLog(@"Description =%@",game.description);
        for (Score *score in game.scoreList)
        {
            NSLog(@"UserName=%@",score.userName);
            NSLog(@"ScoreId=%@",score.scoreId);
            NSLog(@"CreatedOn=%@",score.createdOn);
            NSLog(@"Rank=%@",score.rank);
            NSLog(@"Score=%f",score.value);
        }
        
        responseView.text = game.strResponse;
    }
    @catch (App42Exception *exception)
    {
        NSLog(@"Exception = %@",[exception reason]);
        NSLog(@"HTTP error Code = %d",[exception httpErrorCode]);
        NSLog(@"App Error Code = %d",[exception appErrorCode]);
        NSLog(@"User Info = %@",[exception userInfo]);
        responseView.text = exception.reason;
    }
    @finally
    {
        
    }
}
-(IBAction)getTopNRankers:(id)sender
{
    responseView.text = @"";

    @try
    {
        max = 2;
        Game *game = [scoreBoardService getTopNRankers:gameName max:max];
        NSLog(@"Game Name=%@",game.name);
        NSLog(@"Description =%@",game.description);
        for (Score *score in game.scoreList)
        {
            NSLog(@"UserName=%@",score.userName);
            NSLog(@"ScoreId=%@",score.scoreId);
            NSLog(@"CreatedOn=%@",score.createdOn);
            NSLog(@"Rank=%@",score.rank);
            NSLog(@"Score=%f",score.value);
        }
        responseView.text = game.strResponse;
        
    }
    @catch (App42Exception *exception)
    {
        NSLog(@"Exception = %@",[exception reason]);
        NSLog(@"HTTP error Code = %d",[exception httpErrorCode]);
        NSLog(@"App Error Code = %d",[exception appErrorCode]);
        NSLog(@"User Info = %@",[exception userInfo]);
        responseView.text = exception.reason;
        
    }
    @finally
    {
        
    }
}


-(IBAction)clearLogs:(id)sender
{
    responseView.text = @"";
}
@end
