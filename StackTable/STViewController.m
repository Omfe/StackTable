//
//  STViewController.m
//  StackTable
//
//  Created by Omar Gudino on 10/20/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "STViewController.h"
#import "STStack.h"

@interface STViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *stackTableView;

@property (strong, nonatomic) STStack *stack;

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.stack = [[STStack alloc] init];
}

#pragma mark - UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.stack.reversedStackArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *object;
    UITableViewCell *cell;
    static NSString *identifier = @"InformationTableViewCellIdentifier";
    
    cell = [self.stackTableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    object = [self.stack.reversedStackArray objectAtIndex:indexPath.row];
    cell.textLabel.text = object;
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Action Methods
- (IBAction)pushWasPressed:(id)sender
{
    NSArray *indexPaths;
    NSIndexPath *indexPath;
    
    indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    indexPaths = [NSArray arrayWithObject:indexPath];
    
    [self.stack pushAnObject];
    [self.stackTableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
}

- (IBAction)popWasPressed:(id)sender
{
    NSArray *indexPaths;
    NSIndexPath *indexPath;
    
    if (self.stack.stackArray.count == 0) {
        return;
    }
    
    indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    indexPaths = [NSArray arrayWithObject:indexPath];

    [self.stack popAnObject];
    [self.stackTableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationRight];
}

- (IBAction)topWasPressed:(id)sender
{
    NSIndexPath *indexPath;
    
    if (self.stack.stackArray.count == 0) {
        return;
    }
    
    indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self.stackTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    [self.stackTableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
