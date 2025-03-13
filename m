Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B66C282DE
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 22:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlscsM8kt3jhJKPPI6WK1DrD4tGRZlDapuFyYmG6mcg=; b=eBC67tmojFkVkUj71DVrx/6hrz
	4xpjdhl/CLtCYNXg5EMtSjeiIBWCaNwHu652SGVRHBCCSqX7U24RXub+yHu0NTvEkPgZ/i8NTlUNy
	+3FhPEX8c4cUViCNE9990DTn3lOPPfF2AzjiTRezin/ycMOBXjP3vcAVnCY/rH5pOcrcCc5Hli32V
	AHGNmQACScSoHmV7Hk6aJxHMCb1I22AAeq6QosWIMqm7O3NmXqKdTjX6fSHAXsAFJQ/vaO9eP8fDC
	uvPuE1S5vev9Ctu2rfQmhC5Pg+71RXMRZRAG7u206RCKy3Bsq843ok5EVN/qRpOM6eVuiJ40opncT
	Z6y31W3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrWO-0000000CfSh-2t8E;
	Thu, 13 Mar 2025 22:59:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrWM-0000000CfRf-22wN
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 22:59:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DLEHn9027307
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 22:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DlscsM8kt3jhJKPPI6WK1DrD4tGRZlDapuFyYmG6mcg=; b=b8CMSaYBktavQErc
	gzusZSPvMwScqKoW3tctXMTYLyd4gcn2OOieGcI6SL/mRyT4xG0+Slv54X9a10/b
	/N8QcUdtGMV9bnNoc8pSRuXMP6enZu4Be9umNz3O4+xit/f5KIff4kRw+HWSe0Fh
	TBalFKphubh2sVN72QtDCdJ/7cKOWqd64OSdazkE35xxo9adt5J5BdlTL7K+Uoau
	Ow8regM880z1csbIkMIaKIAdKhQaTTR/XDChREwF2P1mZjNF06ncWPFD3ZHV7UOG
	aQ4m2bRbKj3OOnWIK8LQiH4/IBvVc6h1ZB3peYTO6UvIglweINVPtJJsawIptu+t
	h/Lg/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2pybyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 22:59:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-223d86b4df0so13653565ad.3
        for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 15:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741906759; x=1742511559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlscsM8kt3jhJKPPI6WK1DrD4tGRZlDapuFyYmG6mcg=;
        b=pcs8nOzqQOZ3qOqulQaJpf5eSwaGwwly4Ub4A/bEfVkzMJB68/2YL5q/GzdV5YFwhZ
         hddePLEdWQi8YOHWyu2MxcnnlKF5UsJ430LlqRU+2c+G59wBLH8I7Agrsfz1JLeRcNOH
         Xtwzj42+RGB6JdIavT0P/x8ivUdGNxpvIu6B1HqmU/H415DqmBMxTEYYKjyokSANQZMv
         RHWCZRYBg94KiY4ZM35uftYpUo9Bmvw/B+PPH4DL+AOKODjQv8nep//thzVjl4zRq6QH
         OKy6sQrnqjg+MkAgwhtUVErddkl29mZqu2y8j8+bzpViv0YpbJoK0jbKc5eROMv3tY3Q
         zWsw==
X-Forwarded-Encrypted: i=1; AJvYcCWD0Q+5OfSzRnA+Az1szXwt1RgCzLcNjUp/zRWYV/QKjxQv3X4vnnWfiI+HmgIdaYll7WPPoyc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVey5IIcpIfElPgYAE+IeO3msTwIvMub8yV+TNC2YBIeQfTqnP
	sDNgoYxG+WWeuPKZvN3R4SdZ17MGG4MtmCBbMuSdnAX6v0Ke2hZh7XweM4frFB55Z4wPqTLN1Kg
	V/F0k2hV3RhqL+n/VK7WyTzFamE5ncX4k8AdvPk01PSmlKXfAVxrr2l8VaWBU
X-Gm-Gg: ASbGncvZBR3wh4+r5zLsk+IYkS9nYvEGpucI0afGUcAO8jjxJWse+yZROcwp7OiQwxW
	WGPIqOyTYUT0OJX/FeYnroMBOmWn5jXy8MO6/P93yeWb8svcD+qSwGl32y7gcWKWK9kr3pgfvZq
	vXAPqGULLlru27+5wNPUYoHwP4AfHFXtEy3Y+xbLfsg7KyM52LyxEictpkpWdN6Y6y/EHH8qg6D
	qFOL5XcyMX261HIRf2kBILS/dSrdTScqTvJemc11JB4cEhEfO5cuakHaB/p8Mh5KNi8aMRW+wgj
	6KToJSc11B34moOeRX5czFMU6/vfdJ+MVTMnHoqDW3CwwMXppYHyx+FA1BdhxbTpD99VooSt
X-Received: by 2002:a05:6a00:a27:b0:736:4644:86ee with SMTP id d2e1a72fcca58-7372235af19mr315815b3a.14.1741906759451;
        Thu, 13 Mar 2025 15:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy3xVoqb3anhbGk6RmIqiQdZbFPhRI7ciTb9mdlxU62/8hh2eKyhDOtWNxtwvEg4Z7wcZKAA==
X-Received: by 2002:a05:6a00:a27:b0:736:4644:86ee with SMTP id d2e1a72fcca58-7372235af19mr315798b3a.14.1741906759009;
        Thu, 13 Mar 2025 15:59:19 -0700 (PDT)
Received: from [10.227.89.219] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371155077fsm1897725b3a.37.2025.03.13.15.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 15:59:18 -0700 (PDT)
Message-ID: <4e4e4737-6040-4ec2-a3be-3fe1aba7b7cf@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 15:59:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] wifi: nl80211: add link id of transmitted profile
 for MLO MBSSID
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
 <20250310200237.652950-2-aloka.dixit@oss.qualcomm.com>
 <52beaa2c05c91590797cc1f53b779fca085c8850.camel@sipsolutions.net>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <52beaa2c05c91590797cc1f53b779fca085c8850.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d36348 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=0-u4nmc4IinrO2lHwEAA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Iorcyzo5OGCBvHiApuXWvySv7c2GLW70
X-Proofpoint-ORIG-GUID: Iorcyzo5OGCBvHiApuXWvySv7c2GLW70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_155922_524772_DC6F76AC 
X-CRM114-Status: GOOD (  20.68  )
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

On 3/12/2025 1:55 AM, Johannes Berg wrote:
> Hi Aloka, all,
> 
>> + * @NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID: Link ID of the transmitted profile.
>> + *	This parameter is mandatory if the transmitted profile is part of an MLD
>> + *	and the interface getting configured is a non-transmitted profile. For all
>> + *	other cases it will be ignored.
> 
> So I guess it's a question of what "the interface getting configured"
> means, but I guess you could set up the transmitting interface?
> 
Right, if the interface getting configured is the transmitted profile 
the link_id is ignored.

>> @@ -5561,6 +5563,18 @@ static int nl80211_parse_mbssid_config(struct wiphy *wiphy,
>>   			}
>>   
>>   			config->tx_wdev = tx_netdev->ieee80211_ptr;
>> +
>> +			if (config->tx_wdev->valid_links) {
>> +				if (!tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID])
>> +					return -ENOLINK;
>> +
>> +				config->tx_link_id =
>> +					nla_get_u8(tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID]);
>> +
>> +				if (!(config->tx_wdev->valid_links &
>> +				      BIT(config->tx_link_id)))
>> +					return -ENOLINK;
>> +			}
>>   		} else {
>>   			config->tx_wdev = dev->ieee80211_ptr;
>>   		}
> 
> So shouldn't that be one layer out, so the link ID can also apply if no
> interface index was given, i.e. we took the else branch? Seems like that
> should be applicable, or is there a specific reason not to apply in that
> case?

The 'else' case in the highlighted snippet above is the same scenario as 
the 'else' case you referred to, which is one layer out: "else if 
(!config->index) {".

Both are executed when the interface getting configured is the 
transmitting interface. The difference between these two 'else's is that 
in one case userspace explicitly provides 
"NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX" and in other it hasn't.

Similarly, for MLO, mac80211 does not need the link_id of the tx 
interface because it already has the link_conf for it as part of basic 
AP configuration parameters, hence link_id is ignored in both 'else's.

Thanks.

