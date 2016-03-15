//
//  GameModel.m
//  TwoPlayerMath
//
//  Created by Thomas Friesman on 2016-03-14.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "GameModel.h"
#import "Player.h"
#import "ViewController.h"

@interface GameModel ()

@property (nonatomic,strong)NSMutableArray *answer;
@property (nonatomic,strong)NSString *player1Name;
@property (nonatomic,strong)NSString *player2Name;
@property (nonatomic) int player1CurrentLives;
@property (nonatomic) int player2CurrentLives;
@property (nonatomic,strong)NSString *currentPlayer;

@end


@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self generateMathQuestion];
        self.answer = [NSMutableArray new];
        self.player1CurrentLives = 3;
        self.player2CurrentLives = 3;
        self.player1Name = @"Player 1";
        self.player2Name = @"Player 2";
        self.currentPlayer = @"Player 1";
    }
    return self;
}

-(void)generateMathQuestion {
    self.x = arc4random()%20;
    self.y = arc4random()%20;
    [self.answer removeAllObjects];
}

-(void)buildAnswerFrom:(int)selectedNumber {
    NSNumber *number = [NSNumber numberWithInt:selectedNumber];
    [self.answer addObject:number];
}

-(int)checkAnswer {
    NSString *answerString = [self.answer componentsJoinedByString:@""];
    int finalAnswer = [answerString intValue];
    if ([self.currentPlayer isEqualToString:@"Player 1"]) {
        if (finalAnswer != self.x + self.y){
            self.player1CurrentLives = self.player1CurrentLives - 1;
        }
        return self.player1CurrentLives;
    } else {
        if ([self.currentPlayer isEqualToString:@"Player 2"]) {
            if (finalAnswer != self.x + self.y) {
                self.player2CurrentLives = self.player2CurrentLives -1;
            }
            return self.player2CurrentLives;
        }
    }
    
    return 0;
}

-(void)switchPlayers {
    if ([self.currentPlayer isEqualToString:@"Player 1"]) {
        self.currentPlayer = @"Player 2";
    } else {
        if ([self.currentPlayer isEqualToString:@"Player 2"]) {
            self.currentPlayer = @"Player 1";
        }
    }
    
}

-(NSString *)resetScoreLabelForPlayer1 {
    if (self.player1CurrentLives == 0) {
        return @"Game Over!";
    } else {
        return [@"Player 1: " stringByAppendingString:[NSString stringWithFormat:@"%d", self.player1CurrentLives]];
    
    }
}
-(NSString *)resetScoreLabelForPlayer2 {
    if (self.player2CurrentLives == 0) {
        return @"Game Over";
    } else {
        return [@"Player 2: " stringByAppendingString:[NSString stringWithFormat:@"%d", self.player2CurrentLives]];
    }
}

-(NSString *)resetMathQuestionLabel {
    if ([self.currentPlayer isEqualToString:@"Player 1"]) {
        return [[[[@"Player 1: " stringByAppendingString:[NSString stringWithFormat:@"%d", self.x]] stringByAppendingString:@" + "] stringByAppendingString:[NSString stringWithFormat:@"%d", self.y]] stringByAppendingString:@" ?"];
    } else {
        return [[[[@"Player 2: " stringByAppendingString:[NSString stringWithFormat:@"%d", self.x]] stringByAppendingString:@" + "]stringByAppendingString:[NSString stringWithFormat:@"%d", self.y]] stringByAppendingString:@" ?"];
    }
}

@end
