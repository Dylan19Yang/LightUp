//
//  LightupViewController.m
//  LightUp
//
//  Created by Forever.H on 15/9/26.
//  Copyright (c) 2015年 Atlas19. All rights reserved.
//

#import "LightupViewController.h"

@interface LightupViewController ()

@end

@implementation LightupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideAllPlaces];
    [self hideCityBtn:YES];
    [self hideOtherCityBtn:NO];
    [self bindEventForBtn];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0/255.0 alpha:1/255.0];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"LightupTitleWithoutBtn.png"] forBarMetrics:UIBarMetricsDefault];

    [self.wholeBtn addTarget:self action:@selector(wholeBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.urbanBtn addTarget:self action:@selector(urbanBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideAllPlaces
{
    self.bsImageView.hidden = YES;
    self.cmImageView.hidden = YES;
    self.pdImageView.hidden = YES;
    self.cnImageView.hidden = YES;
    self.xhImageView.hidden = YES;
    self.hpImageView.hidden = YES;
    self.jaImageView.hidden = YES;
    self.ptIamgeView.hidden = YES;
    self.zbImageView.hidden = YES;
    self.hkImageView.hidden = YES;
    self.ypImageView.hidden = YES;
    self.cqImageView.hidden = YES;
    self.fxImageView.hidden = YES;
    self.jdImageView.hidden = YES;
    self.jsImageView.hidden = YES;
    self.mhImageView.hidden = YES;
    self.qpImageView.hidden = YES;
    self.sjImageView.hidden = YES;
}

- (void)hideCityBtn:(BOOL)isHide
{
    self.ypBtn.hidden = isHide;
    self.hkBtn.hidden = isHide;
    self.zbBtn.hidden = isHide;
    self.hpBtn.hidden = isHide;
    self.jaBtn.hidden = isHide;
    self.xhBtn.hidden = isHide;
    self.cnBtn.hidden = isHide;
    self.ptBtn.hidden = isHide;
}

- (void)hideOtherCityBtn:(BOOL)isHide
{
    self.cmBtn.hidden = isHide;
    self.bsBtn.hidden = isHide;
    self.mhBtn.hidden = isHide;
    self.cqBtn.hidden = isHide;
    self.jdBtn.hidden = isHide;
    self.sjBtn.hidden = isHide;
    self.qpBtn.hidden = isHide;
    self.jsBtn.hidden = isHide;
    self.fxBtn.hidden = isHide;
    self.pdBtn.hidden = isHide;
}

- (void)bindEventForBtn
{
    [self.bsBtn addTarget:self action:@selector(bsBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.cmBtn addTarget:self action:@selector(cmBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.pdBtn addTarget:self action:@selector(pdBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.cnBtn addTarget:self action:@selector(cnBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.xhBtn addTarget:self action:@selector(xhBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.hpBtn addTarget:self action:@selector(hpBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.jaBtn addTarget:self action:@selector(jaBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.ptBtn addTarget:self action:@selector(ptBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.zbBtn addTarget:self action:@selector(zbBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.hkBtn addTarget:self action:@selector(hkBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.ypBtn addTarget:self action:@selector(ypBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.cqBtn addTarget:self action:@selector(cqBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.fxBtn addTarget:self action:@selector(fxBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.jdBtn addTarget:self action:@selector(jdBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.jsBtn addTarget:self action:@selector(jsBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.mhBtn addTarget:self action:@selector(mhBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.qpBtn addTarget:self action:@selector(qpBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.sjBtn addTarget:self action:@selector(sjBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark - ButtonEvent

- (void) wholeBtnClickEvent
{
    [self.wholeBtn setBackgroundImage:[UIImage imageNamed:@"Whole_on"] forState:UIControlStateNormal];
    self.bgImageView.image = [UIImage imageNamed:@"Bg_shanghai"];
    [self.urbanBtn setBackgroundImage:[UIImage imageNamed:@"Urban_off"] forState:UIControlStateNormal];
    [self hideAllPlaces];
    [self hideCityBtn:YES];
    [self hideOtherCityBtn:NO];
}

- (void) urbanBtnClickEvent
{
    [self.urbanBtn setBackgroundImage:[UIImage imageNamed:@"Urban_on"] forState:UIControlStateNormal];
    self.bgImageView.image = [UIImage imageNamed:@"Bg_city"];
    [self.wholeBtn setBackgroundImage:[UIImage imageNamed:@"Whole_off"] forState:UIControlStateNormal];
    [self hideAllPlaces];
    [self hideCityBtn:NO];
    [self hideOtherCityBtn:YES];
}

- (void)bsBtnClickEvent
{
    self.bsImageView.hidden = NO;
}
- (void)cmBtnClickEvent
{
    self.cmImageView.hidden = NO;
}
- (void)pdBtnClickEvent
{
    self.pdImageView.hidden = NO;
}
- (void)cnBtnClickEvent
{
    self.cnImageView.hidden = NO;
}
- (void)xhBtnClickEvent
{
    self.xhImageView.hidden = NO;
}
- (void)hpBtnClickEvent
{
    self.hpImageView.hidden = NO;
}
- (void)jaBtnClickEvent
{
    self.jaImageView.hidden = NO;
}
- (void)ptBtnClickEvent
{
    self.ptIamgeView.hidden = NO;
}
- (void)zbBtnClickEvent
{
    self.zbImageView.hidden = NO;
}
- (void)hkBtnClickEvent
{
    self.hkImageView.hidden = NO;
}
- (void)ypBtnClickEvent
{
    self.ypImageView.hidden = NO;
}
- (void)cqBtnClickEvent
{
    self.cqImageView.hidden = NO;
}
- (void)fxBtnClickEvent
{
    self.fxImageView.hidden = NO;
}
- (void)jdBtnClickEvent
{
    self.jdImageView.hidden = NO;
}
- (void)jsBtnClickEvent
{
    self.jsImageView.hidden = NO;
}
- (void)mhBtnClickEvent
{
    self.mhImageView.hidden = NO;
}
- (void)qpBtnClickEvent
{
    self.qpImageView.hidden = NO;
}
- (void)sjBtnClickEvent
{
    self.sjImageView.hidden = NO;
}
@end
