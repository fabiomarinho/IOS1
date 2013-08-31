//
//  EEViewController.h
//  ContatosIphone
//
//  Created by Fabio Marinho on 24/08/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EERootController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tabela;
    NSMutableArray *contatos;
}

@property (retain, nonatomic) IBOutlet UITableView *tabela;
@property (retain,nonatomic) NSMutableArray *contatos;

@end
