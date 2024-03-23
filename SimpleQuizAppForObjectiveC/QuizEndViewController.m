//
//  QuizEndViewController.m
//  SimpleQuizAppForObjectiveC
//
//  Created by kazu on 2024/03/23.
//

#import "QuizEndViewController.h"


@interface QuizEndViewController ()
@property (weak, nonatomic) IBOutlet UILabel *correct_answer;
@end

@implementation QuizEndViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.correct_answer.text = [NSString stringWithFormat:@"%lu / 5", (unsigned long)self.finalScore];
}

- (IBAction)return_title:(id)sender {
    // タイトルに戻る
    [self performSegueWithIdentifier:@"title" sender:self];
}

@end
