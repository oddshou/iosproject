//
//  ILProductViewController.m
//  CSLottery
//
//  Created by niuwan on 15/5/6.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILProductViewController.h"
#import "ILProduct.h"
#import "ILProductCell.h"

@interface ILProductViewController ()

@property (nonatomic, strong) NSMutableArray *products;

@end

@implementation ILProductViewController

static NSString * const reuseIdentifier = @"Cell";

//从json初始化数据
- (NSMutableArray *)products
{
    if(_products == nil){
        _products = [NSMutableArray array];
        //解析json数据
        NSString *fileName =[[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:fileName];
        
        NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //avc 模式失效，原因是 id是类型，采用手动逐个解析
        for (NSDictionary *dict in jsonArr) {
            ILProduct *product = [ILProduct productWithDict:dict];
            [_products addObject:product];
        }
        
    }
    return _products;
}

- (instancetype)init
{
    //创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 80);   //cell 尺寸
    layout.minimumInteritemSpacing = 10;    //cell 垂直间距
    layout.minimumInteritemSpacing = 0;     //cell 水平间距
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10); //cell 内边距
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    //从xib加载uicollectionCell 需要注册
    UINib *xib = [UINib nibWithNibName:@"ILProductCell" bundle:nil];
    [self.collectionView registerNib:xib forCellWithReuseIdentifier:reuseIdentifier];
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //设置collectionView背景色为白色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    //获取模型
//    cell.backgroundColor = [UIColor redColor];
    ILProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //取出对应模型
    ILProduct *p = self.products[indexPath.item];
    cell.product = p;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ILProduct *product = self.products[indexPath.item];
    NSLog(@"点击了  %@", product.title);
}

#pragma mark uicollectionViewDelegateFlowLayout

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
