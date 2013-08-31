//
//  EEViewController.m
//  persistencia
//
//  Created by Fabio Marinho on 31/08/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import "EEViewController.h"

@interface EEViewController ()

@end

@implementation EEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botao:(id)sender {
    NSString *texto = self.txt.text;
    if ([texto length]>0){
        [self gravarArquivo:texto];
    }
    
    NSString *conteudo = [self leArquivo];
    
    self.lbl.text = conteudo;
    
}

/* Apple tem o conceito de Sandbox: possui uma área restrita do aplicativo no sistema de arquivos */
-(NSString *) instanciaArquivo{

    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *file = @"myfile.txt";
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *storePath = [rootPath stringByAppendingString:file];
    NSLog(@"StorePath: %@",storePath);
    
    if ([fileMgr fileExistsAtPath:rootPath]){
        NSLog(@"Diretório Root existe");
    }
    
    if ([fileMgr fileExistsAtPath:storePath]){
        NSLog(@"Arquivo da aplicação existe");
    }
    
    return storePath;
    
}

-(void) gravarArquivo: (NSString *) conteudo{
    NSString *storePath = [self instanciaArquivo];
    NSError *saveError = nil;
    if (![conteudo writeToFile:storePath atomically:NO encoding:NSStringEncodingConversionAllowLossy error:&saveError]){
        NSLog(@"Erro na hora de salvar o arquivo: %@", saveError);
    }
}

-(NSString *) leArquivo{
    NSString *storePath = [self instanciaArquivo];
    return [[NSString alloc] initWithContentsOfFile:storePath encoding:NSStringEncodingConversionAllowLossy error:nil];
}


@end
