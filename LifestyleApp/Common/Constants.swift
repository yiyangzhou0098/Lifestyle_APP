//
//  Constants.swift
//  LifestyleApp
//
//  Created by ZYY on 12/7/23.
//

import Foundation
import UIKit

// MARK: storyboard identity id
let kFollowVCID = "FollowVCID"
let kNearByVCID = "NearByVCID"
let kDiscoveryVCID = "DiscoveryVCID"
let kNoteEditVCID = "NoteEditVCID"
let kChannelTableVCID = "ChannelTableVCID"
let kLoginNaviID = "LoginNaviID"
let kLoginVCID = "LoginVCID"
let kMeVCID = "MeVCID"
let kDraftNotesNaviID = "DraftNotesNaviID"
let kNoteDetailVCID = "NoteDetailVCID"
let kIntroVCID = "IntroVCID"
let kEditProfileNaviID = "EditProfileNaviID"
let kSettingTableVCID = "SettingTableVCID"

// Cell identity id
let kPhotoCellID = "PhotoCellID"
let kPhotoFooterID = "PhotoFooterID"
let kSubChannelCellID = "SubChannelCellID"
let kPOICellID = "POICellID"
let kDraftNoteWaterfallCellID = "DraftNoteWaterfallCellID"
let kMyDraftNoteWaterfallCellID = "MyDraftNoteWaterfallCellID"
let kCommentViewID = "CommentViewID"
let kReplyCellID = "ReplyCellID"
let kCommentSectionFooterViewID = "CommentSectionFooterViewID"


// MARK: service logic related
//  waterfall
let kWaterfallVCID = "WaterfallVCID"
let kWaterfallCellID = "WaterfallCellId"
let kWaterfallPadding = CGFloat(4)

let kChannels = ["For you", "Trip", "Fun", "Creative", "Cook", "Pet", "Indoor"]

// MARK: YPImagePicker
let kMaxCameraZoomFactor: CGFloat = 3
let kMaxPhotoCount = 6
let kSpacingBetweenItems: CGFloat = 2

// MARK: - Leancloud
// Config
let kLCAppID = "Qn5bIdevfLxjnG3jd4psNobG-MdYXbMMI"
let kLCAppKey = "5VUvzPup20Sr6h35WEmHXBI0"
let kLCServerURL = "https://qn5bidev.api.lncldglobal.com"

// Common
let kCreatedAtCol = "createdAt"
let kUpdatedAtCol = "updatedAt"

// tables
let kNoteTable = "Note"
let kUserLikeTable = "UserLike"
let kUserFavTable = "UserFav"
let kCommentTable = "Comment"
let kReplyTable = "Reply"
let kUserInfoTable = "UserInfo"

// User
let kNickNameCol = "nickName"
let kAvatarCol = "avatar"
let kGenderCol = "gender"
let kIntroCol = "intro"
let kIDCol = "id"
let kBirthCol = "birth"
let kIsSetPasswordCol = "isSetPassword"
let kNoteCountCol = "noteCount"

// Notes
let kCoverPhotoCol = "coverPhoto"
let kCoverPhotoRatioCol = "coverPhotoRatio"
let kPhotosCol = "photos"
let kVideoCol = "video"
let kTitleCol = "title"
let kTextCol = "text"
let kChannelCol = "channel"
let kSubChannelCol = "subChannel"
let kPOINameCol = "poiName"
let kIsVideoCol = "isVideo"
let kLikeCountCol = "likeCount"
let kFavCountCol = "favCount"
let kCommentCountCol = "commentCount"
let kAuthorCol = "author"
let kHasEditCol = "hasEdit"

// UserLikes
let kUserCol = "user"
let kNoteCol = "note"

// Comment
let kHasReplyCol = "hasReply"

// Reply
let kCommentCol = "comment"
let kReplyToUserCol = "replyToUser"

// UserInfo
let kUserObjectIdCol = "userObjectId"



let kMaxNoteTitleCount = 100
let kMaxNoteTextCount = 3000

let kAllSubChannels = [
    ["a", "b", "b", "d"],
    ["e", "f", "g"],
    ["h", "i"],
    ["j", "k", "l", "m", "n"],
    ["o", "p"],
    ["q", "r"],
    ["s", "t"], 
    ["u", "v", "w"]
]

let blueColor = UIColor(named: "main1")!
let mainColor = UIColor(named: "main1")!

let imagePH = UIImage(named: "imagePH")!
