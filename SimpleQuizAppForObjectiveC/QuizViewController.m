//
//  QuizViewController.m
//  SimpleQuizAppForObjectiveC
//
//  Created by kazu on 2024/03/06.
//

#import "QuizViewController.h"

@interface QuizViewController()
@property (weak, nonatomic) IBOutlet UITableView *answerArea;
@property (strong, nonatomic) NSArray *listData;
@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answerArea.dataSource = self;
    self.answerArea.delegate = self;
    // サンプルデータ
    self.listData = @[@"cat", @"echo", @"cd", @"ls"];
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

@end
