//
//  ViewController.m
//  SimpleQuizAppForObjectiveC
//
//  Created by kazu on 2024/03/06.
//

#import "ViewController.h"
#import "QuizViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)nextButton:(id)sender {
    [self performSegueWithIdentifier:@"start" sender:self];
}

- (IBAction)closeButton:(id)sender {
    [self openDialog];
}

- (void) openDialog {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"確認"
                                                                   message:@"アプリを終了しますか？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* OKAction = [UIAlertAction actionWithTitle:@"終了します"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
        exit(1);
    }];
    
    UIAlertAction* NGAction = [UIAlertAction actionWithTitle:@"終了しません" 
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
        
    }];
    
    [alert addAction:NGAction];
    [alert addAction:OKAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
