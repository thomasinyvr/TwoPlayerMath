//
//  ViewController.m
//  TwoPlayerMath
//
//  Created by Thomas Friesman on 2016-03-14.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"


@interface ViewController ()
@property (nonatomic)GameModel *game;

@property (weak, nonatomic) IBOutlet UILabel *player1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *mathQuestionLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game = [GameModel new];
    self.mathQuestionLabel.text = [self.game resetMathQuestionLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)zero:(id)sender {
    [self.game buildAnswerFrom:0];
}
- (IBAction)one:(id)sender {
    [self.game buildAnswerFrom:1];
}
- (IBAction)two:(id)sender {
    [self.game buildAnswerFrom:2];
}
- (IBAction)three:(id)sender {
    [self.game buildAnswerFrom:3];
}
- (IBAction)four:(id)sender {
    [self.game buildAnswerFrom:4];
}
- (IBAction)five:(id)sender {
    [self.game buildAnswerFrom:5];
}
- (IBAction)six:(id)sender {
    [self.game buildAnswerFrom:6];
}
- (IBAction)seven:(id)sender {
    [self.game buildAnswerFrom:7];
}
- (IBAction)eight:(id)sender {
    [self.game buildAnswerFrom:8];
}
- (IBAction)nine:(id)sender {
    [self.game buildAnswerFrom:9];
}
- (IBAction)enterAnswer:(id)sender {
    [self.game checkAnswer];
    [self.game generateMathQuestion];
    [self.game switchPlayers];
    self.mathQuestionLabel.text = [self.game resetMathQuestionLabel];
    self.player1ScoreLabel.text = [self.game resetScoreLabelForPlayer1];
    self.player2ScoreLabel.text = [self.game resetScoreLabelForPlayer2];
    
}

@end
