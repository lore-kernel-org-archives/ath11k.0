Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6EEC35FF2
	for <ath11k@archiver.kernel.org>; Mon, 10 Mar 2025 23:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obMMFOPF5wt116Cas1gkTzZ+oUeuOoZd+h1bPui0PVU=; b=F8RA4Rv/2G9fUWGrJufBeffWzD
	yfecoYZrnHoeUpDvS3XPFSyrRSj1sTFZI7BOcFJHTsm+iFxSshw2Q4xz2kPNfyLBXeBJk0GWKJbwc
	V89SxOj5xWPZgG94ReeP7U2fvzNflUNRpPna4jCzrFnX6loc3vrg0tOygsFp0quYZ4VpFjBixM0GK
	H4CCBwLd995Jre5T6R3yjr3Y8mcD3iZhiH1q+fPXwmpwm/FuIIjG1VZcXmU+66lrs44yu65xPWk+x
	H7EMc0OgsBsvSR49HUslXAp5jolwv0drJacNTIGbZ/2YVvBd+MrRuGx2d3qMVrLdn//ID3W36YOND
	ffAoZSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trmNx-00000004Bok-26pv;
	Mon, 10 Mar 2025 23:18:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trmNu-00000004BnS-1JP3
	for ath11k@lists.infradead.org;
	Mon, 10 Mar 2025 23:18:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AIgaDQ006531
	for <ath11k@lists.infradead.org>; Mon, 10 Mar 2025 23:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	obMMFOPF5wt116Cas1gkTzZ+oUeuOoZd+h1bPui0PVU=; b=B8YM4bubbPENKARi
	X2ZgZyivSe+rdpXGm//efbpnATEJPOqv0E4W0G9gcT4JgDGKOcV1OLZaSR57ypRC
	j8gl474iU6XkmpcNS9E1b34yuL9K0XnH4zo9CLtdkW4ruLLSwiy0dc338ksiYm1S
	qRqX+Gnu2HeZtv9HndRTlAKepoB6r19pZt7eWjjuDWYUxkerSEwPVh4kcplgnIMT
	BWP7GqWF4K+g0Y+MGk/+Z1NZzFZ2TyDvuwUsIfMu67LTEwGB+CVlTKYJ5yxha8jJ
	AuKwgeV2pZp3aheBLBf3b5aJGcqyYiW5wErSdIhXuAkdrzBCo/Pd6bTtHWHhaxeL
	Nxt1HA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6xegy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Mar 2025 23:18:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2240fea0482so123629415ad.3
        for <ath11k@lists.infradead.org>; Mon, 10 Mar 2025 16:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741648687; x=1742253487;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obMMFOPF5wt116Cas1gkTzZ+oUeuOoZd+h1bPui0PVU=;
        b=WXRImkzaOg2CZMVUtnFYltlicAu4WNI2XAEL0f41CThDrwOLPiMKVbQBzDHyopCPs/
         JKvsu150wdZKFKC34apT+eQscBAqb45ogDcDD4sMWG2xFppmU9NPVCG8bB6UCcO36eom
         tnKP/MVC1PM8elS4+HYBPfcvIXGcZAaogKtiaAOP81nb2iot80uHHzWdgMCZfvMKM3Og
         OYRKO+uzmPIPX1aP5tygbBVKozB2FMKYa9Roa+9S/yYyr3DyYTHHLEWm84QB+jAHKHJU
         vEOSIaHxkY5tmcGd9bEJGdk+/cjuHXY9+gmrvYBrDk6Sdhqr8kGWNl/+LAQYNuuGzq31
         1VSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUveDrcPj/joHHiGgHMgHj7gmRv/DrYShaofSR7inA6LhxxMQOsiLtcn8B9bZdX0+bMTg1UFcg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx81DVvvDtpz7FLlBGm8TDpsViKR7rPBqGWPnMkBdiKgxzMl2TB
	mmpq/ylaUgBfZfWOPYyzTGqh7fFbQNWSrc0vVfFfMrwvMxiVm+nYKX6RPcy2QXBjqLDM/gekcjy
	kmq8woG2zSjBXyspiJg4vDf+M7TLNQ1pDeu7Z1gJo/pebuIHE7HuQ+l80bMvN
X-Gm-Gg: ASbGnct0wNWdlN6CS28w8nlygEQMfXlDmuQkCaBCjhD/8MHisOIB3aYf4oipz9Wrp+P
	axxkbnMa6DZT2RSoHFv5L5IsJC3RvGwrotdPUo9OMZdVz03TUtfvWFo1XlVsVfio6RP7zxZ9k0j
	lTK2GvBYVmdh7f60o7fUEwLv4jy6C4do/tdUC7Zv3I71vXeoufs/neqo826WTdAGcs0gs237wIC
	in1rS0tvOZp7gweSbtiVkQIhCuZ/kLzlcJNj4LoTszvsV/YTzuw6LKT/pa4g2U48ojhwVlAtPrb
	nNzZTzDJxBCMc/9tQ0hUbegyWsTFX+3fURAC8m1FygsuwQ8/+qtOTjcSKO+u4yg1L120mlS7/yB
	hkcixUKb2
X-Received: by 2002:a17:902:f54e:b0:224:255b:c92e with SMTP id d9443c01a7336-2242887b608mr222139585ad.3.1741648687388;
        Mon, 10 Mar 2025 16:18:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7wxwgSYH7C6i7r9Zsu2dJoV847cVMhkIqYL3tpPcSHg0KFBJpFZOZtRby1x6RrL6KDqfb/A==
X-Received: by 2002:a17:902:f54e:b0:224:255b:c92e with SMTP id d9443c01a7336-2242887b608mr222139405ad.3.1741648686970;
        Mon, 10 Mar 2025 16:18:06 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa5c41sm83646795ad.232.2025.03.10.16.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 16:18:06 -0700 (PDT)
Message-ID: <b9ccf604-800e-4e4e-bf35-62d97cd1d90a@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 16:18:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] wifi: ath12k: pass link_conf for tx_arvif
 retrieval
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
 <20250310200237.652950-4-aloka.dixit@oss.qualcomm.com>
 <289cca50-b559-4b7f-bc89-e089d7bdf6e0@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <289cca50-b559-4b7f-bc89-e089d7bdf6e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cf7330 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=Cd0U8RgZcvPyX981gHkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ZhKh71lkyOqg3T2T7uEonTJiJnKqoE90
X-Proofpoint-ORIG-GUID: ZhKh71lkyOqg3T2T7uEonTJiJnKqoE90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=973 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_161810_356561_E327F777 
X-CRM114-Status: GOOD (  13.80  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 3/10/2025 1:06 PM, Aloka Dixit wrote:
> On 3/10/2025 1:02 PM, Aloka Dixit wrote:
>> Three out of four callers to ath12k_mac_get_tx_arvif() have
>> link_conf pointer already set for other operations. Pass it
>> as a parameter. Modify ath12k_control_beaconing() to set
>> link_conf first.
>>
>> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 31 +++++++++++++++------------
>>   1 file changed, 17 insertions(+), 14 deletions(-)
>>
> 
> Forgot to add tested on tag:
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Will send the driver changes again with the tag if required once 
> nl80211/mac80211 review completes.

If Johannes accepts the first two patches I can add this to the ath12k patch.

Note, however, that you forgot the wireless-next subject prefix tag ;)

/jeff

