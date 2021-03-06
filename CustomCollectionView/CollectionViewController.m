//
//  CollectionViewController.m
//  test
//
//  Created by xiexiaolong on 16/3/22.
//  Copyright © 2016年 xiexiaolong. All rights reserved.
//

#import "CollectionViewController.h"
#import "YFCollectionViewLayout.h"
#import "GridrLayout.h"

@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,YFCollectionViewLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) YFCollectionViewLayout *yfLayout;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(30, 30);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    
    self.yfLayout = [[YFCollectionViewLayout alloc] init];
    self.yfLayout.numberOfColumns = 3;
    self.yfLayout.interItemSpacing = 10;
    self.yfLayout.delegate = self;
    
    GridrLayout *grid = [[GridrLayout alloc] init];
    grid.itemSize = CGSizeMake(50, 50);
    grid.interitemSpacing = 5;
    grid.lineSpacing = 5;
    grid.contentInset = UIEdgeInsetsMake(10, 0, 0, 100);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:grid];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 100;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
    
    return cell;
    
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(YFCollectionViewLayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath{
//    CGFloat randomHeight = 100 + arc4random()%140;
//    
//    return randomHeight;
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"第%ld个",indexPath.row] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"action" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

@end
































