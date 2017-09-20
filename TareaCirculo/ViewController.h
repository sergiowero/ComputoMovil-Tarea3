//
//  ViewController.h
//  TareaCirculo
//
//  Created by MacL on 18/09/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RGB(r, g, b) [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:1.0]

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *circleImage;
@property (weak, nonatomic) IBOutlet UILabel *HexaColorLabel;
@property (weak, nonatomic) IBOutlet UISlider *sliderRedValue;
@property (weak, nonatomic) IBOutlet UILabel *redColorLabel;
@property (weak, nonatomic) IBOutlet UISlider *sliderGreenValue;
@property (weak, nonatomic) IBOutlet UILabel *greenColorLabel;
@property (weak, nonatomic) IBOutlet UISlider *sliderBlueValue;
@property (weak, nonatomic) IBOutlet UILabel *blueColorLabel;

@property int redValue;
@property int greenValue;
@property int blueValue;
@property NSString *hexValue;

@property (weak, nonatomic) IBOutlet UISwitch *switchValue;
@property (weak, nonatomic) IBOutlet UIButton *rndBtnReference;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property NSString *nameValue;
@property NSString *phoneValue;

- (void) changeColor;
- (NSString *)hexFromInt:(NSInteger)val1 hex2:(NSInteger) val2 hex3:(NSInteger) val3;
- (void) changeStateElements:(BOOL)state;
- (int)getRandomNumberBetween:(int)from to:(int)to;
- (IBAction)mostrarMensaje:(id)sender;

@end

