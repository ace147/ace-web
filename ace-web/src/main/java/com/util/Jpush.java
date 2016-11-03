package com.util;

import java.util.ArrayList;
import java.util.List;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.PushPayload.Builder;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.audience.AudienceTarget;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;

public class Jpush {
	
	public static void main(String args[]){
//	public static void push(String ALERT,List registrationIds,String TITLE,String messType){
//	  JPushClient jpushClient = new JPushClient("40afeaeb8c2bec1c5f360fb4", "dad825233683eeb046a83b34", 1);
	  JPushClient jpushClient = new JPushClient("dad825233683eeb046a83b34", "40afeaeb8c2bec1c5f360fb4", 1);
	  PushPayload payload=null;
//	  if(messType.equals("4")){    //全部
//          payload = pushAll(ALERT,registrationIds,TITLE);
//	  }else if(messType.equals("2")){   //android
//		  payload = pushAndroid(ALERT, TITLE, registrationIds);
//	  }else if(messType.equals("3")){  //IOS
//		  payload = pushIOS(ALERT, TITLE, registrationIds);
//	  }
	  List list=new ArrayList();
//	  list.add("140fe1da9eaa667ec19");
	  payload = buildPushObject_all_all_alert("23333");
	  
      try {
          PushResult result = jpushClient.sendPush(payload);
          System.out.println("Got result - " + result);

      } catch (APIConnectionException e) {
          // Connection error, should retry later
          System.out.println("Connection error, should retry later");

      } catch (APIRequestException ex) {
          // Should review the error, and fix the request
          System.out.println("Should review the error, and fix the request");
          System.out.println("HTTP Status: " + ex.getStatus());
          System.out.println("Error Code: " + ex.getErrorCode());
          System.out.println("Error Message: " + ex.getErrorMessage());
      }
	}      
	
	//龙眼推送  all
    public static PushPayload pushAll(String ALERT,List registrationIds,String title) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.all())
                .setAudience(Audience.registrationId(registrationIds))
                .setNotification(Notification.alert(ALERT))
                .build();
    }
    
    //龙眼推送  android
    public static PushPayload pushAndroid(String ALERT,String TITLE,List registrationIds) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.android())
                .setAudience(Audience.registrationId(registrationIds))
                .setNotification(Notification.android(ALERT, TITLE, null))
                .build();
    }
    
    //龙眼推送  IOS
    public static PushPayload pushIOS(String ALERT,String TITLE,List registrationIds) {
        return PushPayload.newBuilder()
        		 .setPlatform(Platform.ios())
                 .setAudience(Audience.registrationId(registrationIds))
                 .setNotification(Notification.alert(ALERT))
                 .build();
    }
	   
    
    //push All
    public static PushPayload pushAll(String ALERT) {
    	return PushPayload.newBuilder()
//                .setPlatform(Platform.ios())
                .setPlatform(Platform.all())
                .setAudience(Audience.all())
//                .setAudience(Audience.tag_and("tag1", "tag_all"))
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(IosNotification.newBuilder()
                                .setAlert(ALERT)
                                .setBadge(5)
                                .setSound("happy.caf")
                                .addExtra("from", "JPush")
                                .build())
                        .build())
                 .setMessage(Message.content(ALERT))
                 .setOptions(Options.newBuilder()
//                         .setApnsProduction(true)
                         .build())
                 .build();
                
                
    }  
    
	  //快捷地构建推送对象：所有平台，所有设备，内容为 ALERT 的通知。
      public static PushPayload buildPushObject_all_all_alert(String ALERT) {
          return PushPayload.alertAll(ALERT);
      }
      
      //构建推送对象：所有平台，推送目标是别名为 "alias1"，通知内容为 ALERT。
      public static PushPayload buildPushObject_all_alias_alert(String ALERT) {
          return PushPayload.newBuilder()
                  .setPlatform(Platform.all())
                  .setAudience(Audience.alias("alias1"))
                  .setNotification(Notification.alert(ALERT))
                  .build();
      }
      //构建推送对象：平台是 Android，目标是 tag 为 "tag1" 的设备，内容是 Android 通知 ALERT，并且标题为 TITLE。
      public static PushPayload buildPushObject_android_tag_alertWithTitle(String ALERT,String TITLE) {
          return PushPayload.newBuilder()
                  .setPlatform(Platform.android())
                  .setAudience(Audience.tag("tag1"))
                  
                  .setNotification(Notification.android(ALERT, TITLE, null))
                  .build();
      }
      
//      构建推送对象：平台是 iOS，推送目标是 "tag1", "tag_all" 的交集，推送内容同时包括通知与消息 - 通知信息是 ALERT，
//      角标数字为 5，通知声音为 "happy"，并且附加字段 from = "JPush"；消息内容是 MSG_CONTENT。通知是 APNs 推送通道的，
//    	消息是 JPush 应用内消息通道的。APNs 的推送环境是“生产”（如果不显式设置的话，Library 会默认指定为开发）
      public static PushPayload buildPushObject_ios_tagAnd_alertWithExtrasAndMessage(String ALERT,String MSG_CONTENT) {
          return PushPayload.newBuilder()
                  .setPlatform(Platform.ios())
                  .setAudience(Audience.tag_and("tag1", "tag_all"))
                  .setNotification(Notification.newBuilder()
                          .addPlatformNotification(IosNotification.newBuilder()
                                  .setAlert(ALERT)
                                  .setBadge(5)
                                  .setSound("happy.caf")
                                  .addExtra("from", "JPush")
                                  .build())
                          .build())
                   .setMessage(Message.content(MSG_CONTENT))
                   .setOptions(Options.newBuilder()
                           .setApnsProduction(true)
                           .build())
                   .build();
      }
      
//      构建推送对象：平台是 Andorid 与 iOS，推送目标是 （"tag1" 与 "tag2" 的并集）且（"alias1" 与 "alias2" 的并集）
//      ，推送内容是 - 内容为 MSG_CONTENT 的消息，并且附加字段 from = JPush。
      public static PushPayload buildPushObject_ios_audienceMore_messageWithExtras(String MSG_CONTENT) {
          return PushPayload.newBuilder()
                  .setPlatform(Platform.android_ios())
                  .setAudience(Audience.newBuilder()
                          .addAudienceTarget(AudienceTarget.tag("tag1", "tag2"))
                          .addAudienceTarget(AudienceTarget.alias("alias1", "alias2"))
                          .build())
                  .setMessage(Message.newBuilder()
                          .setMsgContent(MSG_CONTENT)
                          .addExtra("from", "JPush")
                          .setTitle("")
                          .build())
                  .build();
      }

}
