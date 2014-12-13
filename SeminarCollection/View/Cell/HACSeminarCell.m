//
//  SeminarCell.m
//  SeminarCollection
//
//  Created by Nishinobu.Takahiro on 2014/12/13.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "HACSeminarCell.h"
#import "Seminar.h"

@interface HACSeminarCell ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *siteLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation HACSeminarCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setupCellWithModel:(Seminar *)seminar {
    self.dateLabel.text = [seminar startDateString];
    self.siteLabel.text = seminar.site;
    self.titleLabel.text = seminar.title;
    self.numberLabel.text = [seminar numberStatus];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
