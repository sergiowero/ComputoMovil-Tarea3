//
//  ViewController.m
//  TareaCirculo
//
//  Created by MacL on 18/09/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sliderRedValue.value = self.redValue = 0;
    self.sliderGreenValue.value = self.greenValue = 0;
    self.sliderBlueValue.value = self.blueValue = 0;
    
    self.nameValue = @"S/N";
    self.phoneValue = @"S/T";
    
    [self changeColor];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeColor {
    UIColor *color = RGB(self.redValue, self.greenValue, self.blueValue);
    self.circleImage.image = [self.circleImage.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.circleImage setTintColor:color];
    
    self.hexValue = [self hexFromInt:self.redValue  hex2:self.greenValue hex3:self.blueValue];
    
    self.HexaColorLabel.text = self.hexValue;
    self.redColorLabel.text = @(self.redValue).stringValue;
    self.greenColorLabel.text = @(self.greenValue).stringValue;
    self.blueColorLabel.text = @(self.blueValue).stringValue;
    
}

- (NSString *)hexFromInt:(NSInteger)val1 hex2:(NSInteger) val2 hex3:(NSInteger) val3 {
    return [NSString stringWithFormat:@"#%02X%02X%02X", (int)val1,(int)val2,(int)val3];
}


- (IBAction)onColorSliderRed:(id)sender {
    self.redValue = self.sliderRedValue.value;
    [self changeColor];
}

- (IBAction)onColorSliderGreen:(id)sender {
    self.greenValue = self.sliderGreenValue.value;
    [self changeColor];
}

- (IBAction)onColorSliderBlue:(id)sender {
    self.blueValue = self.sliderBlueValue.value;
    [self changeColor];
}

- (void) changeStateElements:(BOOL)state{
    [self.circleImage setHidden:state];
    
    [self.HexaColorLabel setHidden:state];
    
    [self.redColorLabel setHidden:state];
    [self.greenColorLabel setHidden:state];
    [self.blueColorLabel setHidden:state];
    
    [self.sliderRedValue setHidden:state];
    [self.sliderGreenValue setHidden:state];
    [self.sliderBlueValue setHidden:state];
    
    [self.rndBtnReference setHidden:state];
}

- (IBAction)onSwitchCircle:(id)sender {
    [self changeStateElements:![self.switchValue isOn]];
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

- (IBAction)onRandomButton:(id)sender {
    self.sliderRedValue.value = self.redValue = [self getRandomNumberBetween:0 to:255];
    self.sliderGreenValue.value = self.greenValue = [self getRandomNumberBetween:0 to:255];
    self.sliderBlueValue.value = self.blueValue = [self getRandomNumberBetween:0 to:255];
    
    [self changeColor];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(![self.nameTextField.text  isEqual: @""])
        self.nameValue = self.nameTextField.text;
    else
        self.nameValue = @"S/N";
    
    if(![self.phoneTextField.text  isEqual: @""])
        self.phoneValue = self.phoneTextField.text;
    else
        self.phoneValue = @"S/T";
    
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldReturn: (UITextView *) textField{
    if(![self.nameTextField.text  isEqual: @""])
        self.nameValue = self.nameTextField.text;
    else
        self.nameValue = @"S/N";
    
    if(![self.phoneTextField.text  isEqual: @""])
        self.phoneValue = self.phoneTextField.text;
    else
        self.phoneValue = @"S/T";
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)mostrarMensaje:(id)sender {
    
    NSString *circleValue = self.hexValue;
    if(![self.switchValue isOn])
        circleValue = @"No hay circulo";
    
    NSString *alertMsg = [NSString stringWithFormat:@"%@\t%@\n%@", self.nameValue, self.phoneValue, circleValue];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:alertMsg
                                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
