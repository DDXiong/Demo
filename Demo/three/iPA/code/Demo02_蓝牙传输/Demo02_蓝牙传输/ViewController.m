//
//  ViewController.m
//  Demo02_蓝牙传输
//
//  Created by tarena on 15/8/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <GameKit/GameKit.h>

@interface ViewController ()<GKPeerPickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//创建一个属性，用于存储会话对象
@property(nonatomic,strong)GKSession *session;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

//1.创建连接
- (IBAction)createConnect:(id)sender {
    //1.创建选择其他蓝牙设备的控制器
    GKPeerPickerController *peerVC = [[GKPeerPickerController alloc]init];
    //2.设置控制器的代理
    peerVC.delegate = self;
    //3.显示控制器
    [peerVC show];
}

#pragma mark - GKPeerpickerControllerDelegate
- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session
{
    //只要连接成功，就会打印设备的ID
    NSLog(@"%@",peerID);
    
    //连接成功后创建的通道就是session会话对象
    //需要保存该对象，用于后续的发送数据和接收数据
    self.session = session;
    
    //在连接成功后，立即设置，用哪个方法来处理接收数据
    [session setDataReceiveHandler:self withContext:nil];
    
    //连接成功后还需关闭控制器显示过的界面
    [picker dismiss];
}

//当session接收到发来的数据时就会自动执行该方法
- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession: (GKSession *)session context:(void *)context
{
    //data就是发来的图片的二进制数据
    UIImage *image = [UIImage imageWithData:data];
    self.imageView.image = image;
}



//2.打开相册，选择图片
- (IBAction)chooseImage:(id)sender
{
    //1. 创建图片选择控制器
    UIImagePickerController *imagePK = [[UIImagePickerController alloc]init];
    //2. 判断图库是否可用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        //3.设置打开的图库的类型
        imagePK.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        //为了处理用户选择完图片这个动作，需要设置imagePK的代理
        imagePK.delegate = self;
        
        //4.打开图片选择控制器
        [self presentViewController:imagePK animated:YES completion:nil];
    }
}
#pragma mark - UIImagePickerControllerDelegate
//选择完某张图片后执行该方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //选中的图片数据存在info字典中
    //可以使用一个key把图片取出
    self.imageView.image = info[UIImagePickerControllerOriginalImage];
    //将present过的选择器界面进行dismiss
    [picker dismissViewControllerAnimated:YES completion:nil];
}



//3.发送图片数据
- (IBAction)sendImage:(id)sender {
    //利用连接成功时的session会话对象完成发送
    UIImage *image = self.imageView.image;
    //将图片对象转换成二进制形式
    NSData *data = UIImagePNGRepresentation(image);
    //GKSendDataReliable 数据安全的发送模式，较慢
    //GKSendDataUnreliable 数据不安全的发送模式，较快
    //data为要发送的数据
    [self.session sendDataToAllPeers:data withDataMode:GKSendDataReliable error:nil];
}








@end
