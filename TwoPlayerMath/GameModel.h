//
//  GameModel.h
//  TwoPlayerMath
//
//  Created by Thomas Friesman on 2016-03-14.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "GameModel.h"
#import "ViewController.h"

@interface GameModel : NSObject

@property (nonatomic) int x;
@property (nonatomic) int y;



-(void)generateMathQuestion;
-(void)buildAnswerFrom:(int)selectedNumber;
-(int)checkAnswer;
-(void)switchPlayers;
-(NSString *)resetScoreLabelForPlayer1;
-(NSString *)resetScoreLabelForPlayer2;
-(NSString *)resetMathQuestionLabel;




@end
