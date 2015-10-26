//
//  OpcoesSourcesViewController.m
//  telaPlayer
//
//  Created by Renato Ioshida on 10/26/15.
//  Copyright © 2015 Renato Ioshida. All rights reserved.
//

#import "OpcoesSourcesViewController.h"

@interface OpcoesSourcesViewController ()

@end

@implementation OpcoesSourcesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sourceCell"];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)fecharView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
