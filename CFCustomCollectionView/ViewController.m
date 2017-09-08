//
//  ViewController.m
//  CFCustomCollectionView
//
//  Created by YF on 2017/9/8.
//  Copyright © 2017年 CooFree. All rights reserved.
//

#import "ViewController.h"
#import "EqualSpaceFlowLayoutEvolve.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addContentView];
}
- (void)addContentView
{
    EqualSpaceFlowLayoutEvolve * flowLayout = [[EqualSpaceFlowLayoutEvolve alloc]initWthType:AlignWithCenter];
    flowLayout.betweenOfCell = 20;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
//    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerIdentifier"];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellIdentifier"];
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 52;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *moreCellIdentifier = @"CellIdentifier";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:moreCellIdentifier forIndexPath:indexPath];
    NSLog(@"%ld",indexPath.section);
//    ItemData *itemData = [self.dataArray objectAtIndex:[indexPath item]];
//    cell.content = itemData.content;
    cell.contentView.backgroundColor=[UIColor lightGrayColor];
    return cell;
}
//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    UICollectionReusableView *reusableview = nil;
//    if (kind == UICollectionElementKindSectionHeader){
//        HeaderCollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerIdentifier" forIndexPath:indexPath];
//        headerView.backgroundColor = [UIColor yellowColor];
//        reusableview = headerView;
//    }
//    return reusableview;
//}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake(collectionView.frame.size.width, 40);
//}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(60,50);
}


@end
