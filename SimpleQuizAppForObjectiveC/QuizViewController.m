//
//  QuizViewController.m
//  SimpleQuizAppForObjectiveC
//
//  Created by kazu on 2024/03/06.
//

#import "QuizViewController.h"
#import "QuizEndViewController.h"

@interface QuizViewController()
@property (weak, nonatomic) IBOutlet UITableView *answerArea;
@property (strong, nonatomic) NSArray *listData;
@property (weak, nonatomic) IBOutlet UILabel *question_text;
@property (weak, nonatomic) IBOutlet UIButton *next_button;
@property (nonatomic, strong) NSArray *quizDataArray;
@property (weak, nonatomic) IBOutlet UILabel *question_number;
- (NSUInteger)getRundom:(NSUInteger)arrayNum;
@end

@implementation QuizViewController
// ユーザーが選択した答え
static NSString *myAnswer = @"";
// QuizDataで設定いる答え
static NSString *questionAnswer = @"";
// 現在の問題数
static NSUInteger questionNumber;
// 正解した数
static NSUInteger correctAnswerNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    questionNumber = 1;
    correctAnswerNumber = 0;
    self.answerArea.dataSource = self;
    self.answerArea.delegate = self;
    
    // plistからクイズデータを取得
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"QuizData" ofType:@"plist"];
    self.quizDataArray = [NSArray arrayWithContentsOfFile:filePath];
    self.question_number.text = [NSString stringWithFormat:@"第%lu問", (unsigned long)questionNumber];
    
    [self updateQuiz];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // セルを取得または生成
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // セルにデータを設定
    cell.textLabel.text = self.listData[indexPath.row];
    
    return cell;
}

// 画面遷移
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Segueの識別子を確認
    if ([segue.identifier isEqualToString:@"end"]) {
        // 遷移先のViewControllerを取得
        QuizEndViewController *destinationVC = segue.destinationViewController;
        
        // 遷移先のViewControllerに正解数を渡す
        destinationVC.finalScore = correctAnswerNumber;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 回答を設定
    myAnswer = self.listData[indexPath.row];
    // セルの選択状態を解除
    [_next_button setEnabled:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction)next_quiz_button:(id)sender {
    [self resultAnswer];
}

- (void)resultAnswer {
    if ([myAnswer  isEqual: questionAnswer]) {
        // 正解の処理
        correctAnswerNumber++;
    }
    questionNumber++;
    if (questionNumber > 5) {
        [self performSegueWithIdentifier:@"end" sender:self];
    } else {
        [self updateQuiz];
        [self.answerArea reloadData];
    }
    
}

- (void)updateQuiz {
    self.question_number.text = [NSString stringWithFormat:@"第%lu問", (unsigned long)questionNumber];
    // クイズ数のランダム数値を取得
    NSUInteger randomNumber = [self getRundom:self.quizDataArray.count];
    // 問題文
    self.question_text.text = self.quizDataArray[randomNumber][@"question"];
    // 回答の配列
    self.listData = self.quizDataArray[randomNumber][@"choice"];
    // 答え
    questionAnswer = self.quizDataArray[randomNumber][@"answer"];
    // 回答ボタンの無効
    [_next_button setEnabled:NO];
}

- (NSUInteger)getRundom:(NSUInteger)arrayNum {
    // ランダム番号を返す
    return arc4random_uniform((unsigned int)arrayNum);
}
@end
