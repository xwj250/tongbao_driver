//
//  Authentication.m
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Authentication.h"
#import "PicService.h"
#import "ManAuthenticationService.h"
#import "carAuthenticationService.h"

@interface Authentication ()

@end

@implementation Authentication


- (void)viewDidLoad {
    [super viewDidLoad];
    _manIsOkLabel.text = _authState;
    _carIsOkLabel.text = _authState;
    
    if([_authState isEqualToString:@"验证成功"]|| [_authState isEqualToString:@"正在验证"]){
        _tijiaoButton.userInteractionEnabled = NO;
        _tijiaoButton.alpha = 0.4;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)driverHeadButton:(UIButton *)sender {
    _currentPicNum = 1;
    [self pickPic];
//    _driverHeadPicUrl = _currentUrl;
//    NSLog(@"driverHeadPicUrl=%@",_driverHeadPicUrl);
}

- (IBAction)driverLicenseButton:(UIButton *)sender {
    _currentPicNum = 2;
    [self pickPic];
//    _driverLicensePicUrl = _currentUrl;
//    NSLog(@"driverLicensePicUrl=%@",_driverLicensePicUrl);
}

- (IBAction)carHeadButton:(UIButton *)sender {
    _currentPicNum = 3;
    [self pickPic];
//    _carHeadPicUrl = _currentUrl;
//    NSLog(@"carHeadPicUrl=%@",_carHeadPicUrl);
}

- (IBAction)carLicenseButton:(UIButton *)sender {
    _currentPicNum = 4;
    [self pickPic];
//    _carLicensePicUrl = _currentUrl;
//    NSLog(@"carLicensePicUrl=%@",_carLicensePicUrl);
}

- (void) pickPic{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"拍照/选择一张照片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    //UIAlertControllerStyleActionSheet 是你示意图的效果
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *TakeAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        /**
         其实和从相册选择一样，只是获取方式不同，前面是通过相册，而现在，我们要通过相机的方式
         */
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式:通过相机
        PickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
        PickerImage.allowsEditing = YES;
        PickerImage.delegate = self;
        [self presentViewController:PickerImage animated:YES completion:nil];
    }];
    
    UIAlertAction *SelectAction = [UIAlertAction actionWithTitle:@"从相册选择照片" style:UIAlertActionStyleDefault handler: ^(UIAlertAction * _Nonnull action) {
        //初始化UIImagePickerController
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式1：通过相册（呈现全部相册），UIImagePickerControllerSourceTypePhotoLibrary
        //获取方式2，通过相机，UIImagePickerControllerSourceTypeCamera
        //获取方法3，通过相册（呈现全部图片），UIImagePickerControllerSourceTypeSavedPhotosAlbum
        PickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //允许编辑，即放大裁剪
        PickerImage.allowsEditing = YES;
        //自代理
        PickerImage.delegate = self;
        //页面跳转
        [self presentViewController:PickerImage animated:YES completion:nil];
    }];
    
    
    [alert addAction:cancelAction];
    [alert addAction:TakeAction];
    [alert addAction:SelectAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - image picker delegte
//PickerImage完成后的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    PicService *s = [[PicService alloc] init];
    _currentUrl = [s upLoadPicture:image];
    
//    _currentUrl = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
//    NSLog(@"currentUrl = %@",_currentUrl);
    
    UIAlertView *myAlertView;
    if(_currentUrl.length == 0){
        myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"上传图片失败，请重新上传"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
    }else{
        myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"上传图片成功"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
    }
    
    switch (_currentPicNum) {
        case 1:
            _driverHeadPicUrl = _currentUrl;
            break;
        case 2:
            _driverLicensePicUrl = _currentUrl;
            break;
        case 3:
            _carHeadPicUrl = _currentUrl;
            break;
        case 4:
            _carLicensePicUrl = _currentUrl;
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)segmentedControlClicked:(UISegmentedControl *)sender {
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            [_carView setHidden:YES];
            [_manView setHidden:NO];
            break;
        case 1:
            [_carView setHidden:NO];
            [_manView setHidden:YES];
            break;
        default:
            break;
    }
}


- (IBAction)tijiaoButton:(UIButton *)sender {
    
    UIAlertView *myAlertView;
    int result = 0;
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            if((_driverHeadPicUrl==0)||(_driverLicensePicUrl==0)){
                myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"请选择图片"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                [myAlertView show];
            }else{
                if((_manNameTextField.text.length==0)||(_manTruckNumTextField.text.length==0)
                   ||(_manLicenseNumTextField.text.length==0)){
                    myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"请填充完整"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                    [myAlertView show];
                }else{
                    
                    ManAuthenticationService *s = [[ManAuthenticationService alloc] init];
                    result = [s setManAuthInfoWithTruckNum:_manTruckNumTextField.text realName:_manNameTextField.text LicenseNum:_manLicenseNumTextField.text LicensePicUrl:_driverLicensePicUrl DriverHeadPicUrl:_driverHeadPicUrl];
                    
//                    myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"%@%@",_driverHeadPicUrl,_driverLicensePicUrl] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
//                    [myAlertView show];
//                    NSLog(@"driverHeadPicUrl=%@",_driverHeadPicUrl);
//                    NSLog(@"driverLicensePicUrl=%@",_driverLicensePicUrl);
                }
            }
            break;
        case 1:
            if((_carHeadPicUrl==0)||(_carLicensePicUrl==0)){
                myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"请选择图片"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                [myAlertView show];
            }else{
                if(_carTruckNumTextField.text.length==0){
                    myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"请填充完整"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                    [myAlertView show];
                }else{
                    carAuthenticationService *s = [[carAuthenticationService alloc] init];
                    result = [s setTruckAuthInfoWithTruckNum:_carTruckNumTextField.text TruckHeadPicUrl:_carHeadPicUrl CarLiscensePicUrl:_carLicensePicUrl];
//                    myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"%@%@",_carHeadPicUrl,_carLicensePicUrl] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
//                    [myAlertView show];
//                    NSLog(@"carHeadPicUrl=%@",_carHeadPicUrl);
//                    NSLog(@"carLicensePicUrl=%@",_carLicensePicUrl);
                }
            }
            break;
        default:
            break;
    }
    
    if(result == 1){
        myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"提交成功"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
    }else{
        myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"提交失败，请重试！"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
    }
}


- (IBAction)backButton:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_manNameTextField resignFirstResponder];
    [_manTruckNumTextField resignFirstResponder];
    [_manLicenseNumTextField resignFirstResponder];
    [_carTruckNumTextField resignFirstResponder];
}

@end
