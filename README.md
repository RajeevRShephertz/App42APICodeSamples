App42APICodeSamples
===================
- Before running the sample, Provide "API_KEY" and "SECRET_KEY" in __App42ViewController.m__
```
#define API_KEY     @"Your_API_Key"
#define SECRET_KEY  @"Your_Secret_Key"
```
- Provide the "gameName" and "userName" in __App42ViewController.m__ in the initialize method
```
-(void)initializeApp42API
{
    [App42API initializeWithAPIKey:API_KEY andSecretKey:SECRET_KEY]; // Initialize App42API with keys you got after creating
                                                                     // APP on AppHQ Dashboard.
    [App42API enableApp42Trace:YES];// Enable it if you want SDK internal logs to be printed in xcode console
    gameService = [App42API buildGameService]; // Get instance of Game Serveice
    scoreBoardService = [App42API buildScoreBoardService]; // Get instance of ScoreboardService
    
    /**
     *Provide the game name here you want to create by API call or already has created through AppHQ Console.
     */
    gameName = @"YourGameName"; 
                                
    description = @"Description"; // Provide the game description you are going to create on App42
    userName = @"userName"; // Provide the userName for which the score need to be saved to App42
    
}
```
