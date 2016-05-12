//
//  ViewController.m
//  分页
//
//  Created by Aisaka Taiga on 16/4/28.
//  Copyright © 2016年 Aisaka Taiga. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *page;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    int count = 5;
    CGFloat w  = self.scrollView.frame.size.width;
    CGFloat h  = self.scrollView.frame.size.height;

    
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        NSString *name  = [NSString stringWithFormat:@"img_0%d",i];
        imageView.image = [UIImage imageNamed:name];
        imageView.frame = CGRectMake(i * w, 0, w, h);
        [self.scrollView addSubview:imageView];
         }
    
    
    CGFloat contentW = count * w;
    self.scrollView.contentSize = CGSizeMake(contentW, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    }

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int p = (int) (self.scrollView.contentOffset.x / self.scrollView.frame.size.width +0.5);
    self.page.currentPage = p ;


}

@end
