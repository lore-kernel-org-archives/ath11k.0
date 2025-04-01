Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25110C3601A
	for <ath11k@archiver.kernel.org>; Tue,  1 Apr 2025 19:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRoJbb0vYJ9DMlZQ5GCvBXIE3zU73+Ef62RKapWg2ns=; b=COJq0x0YNSnQXH1Dy0d0DTdD7T
	1FEz0pVQ4oxhKAKFX/ftBnO5QrVE7U8zoSwvBkQxCYMUTokrF+OBrmgH6WRmjqY7T6GSsJQBJ8ggH
	eXrbi7HbM7Z8Ll8+7iGj0poLU3bYiwERCJ/7+HQmZ77XF1d2R4FnhGBU44IGHGyD39ChiroDHp7Jx
	T19vVMQGqrAkNYlTtUmC/3Jtar1jApyA9ofQcwNp7pF29O/2qz1icP6v/u4/SAf6UUc3Qzi/SAqUT
	VsCWh7uH95NmLJyFh8QOTsZdmWA2Un5s4+u7rbHg+m5HkFy0KvtgFQCLj7L2Di9VYzWecN0RJai4/
	gllKcxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhNz-00000004EUM-05Gm;
	Tue, 01 Apr 2025 19:34:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhEN-00000004DH6-25OV
	for ath11k@lists.infradead.org;
	Tue, 01 Apr 2025 19:25:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531APaw2030891
	for <ath11k@lists.infradead.org>; Tue, 1 Apr 2025 19:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QRoJbb0vYJ9DMlZQ5GCvBXIE3zU73+Ef62RKapWg2ns=; b=D+lHBVvpwvzBQKWC
	O1XziUalrBP5kmXcdEY+1/LDXqqmaG/GEkF+YMMczmGe/qbWB6STbq+mZro9eLgr
	13aolxa7FwvO60bhwCmn4UJZz7ucMm5bpdimON98bTMXUOpLCM3zpaaqF0K43M19
	8tZcfd9xX8mG90KhpwYG6vQxX09KMNF7MGjkBEh6FSfvSSl5mT+jJeYRyPo6A2DJ
	IHZd+fahSd2tpaDZpGQQ+2sc6nL3Wzt29q3Z8vN9PvOC/+AGVxMIe3tmxPTk3RvP
	6hr/2Jxm1aTKoOebaxGYq8K48qrackyPbJnSB5yLXyCqiwkO6wnmInL4eaM+en8n
	Kw5bKw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45recpheqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 01 Apr 2025 19:25:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22406ee0243so85469095ad.3
        for <ath11k@lists.infradead.org>; Tue, 01 Apr 2025 12:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535501; x=1744140301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRoJbb0vYJ9DMlZQ5GCvBXIE3zU73+Ef62RKapWg2ns=;
        b=rbD3vMPm25qxCq7iXSnt4N2MWDm3dW8NrpKRKnJTeLvAQQSO2eNKuSN1eWdcQHYqHb
         JehV/Q27muINwAsvXaNy1cqGE7oYGL+Ag1lGa9A/k7Z6zgbW5O+R3jS23UfqKBBIpaGh
         MuntGDRJAChP/nJXvEtPhSIKtz71KelnAyA1fxJCbXSKPx+G9LZPE/xdty7tk8rTfJ3F
         kGPa/0XWt/NWnxF5Jb7GeTUjiuac0w9Pn+rLGrBGByGRW7JZTyKW9QCjUVPVG8eLnaR8
         qCmtkFAgF2B8Po7IKKhU+KNveEnAEzflKFfs2wRxXzmj6CsJoXRt8goPVu4g39tPb/Fd
         jjLw==
X-Forwarded-Encrypted: i=1; AJvYcCVYI+JmZ135NpVvYrF6sICekSfUEUHs1BCxvQvwCWEY5wBIn3xSmSpWzpHWzgdBYIhuJj2RsiM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9ZUEkbn5sOB/EzAmBb3jge/8IGMi4LqDrQJqZIf+gOuJKaA2s
	Zlh8jgfIZHYkUDbbIszu0FrsxfAHFb4u3mwZcwlWwFH5wgJsL2fmH55Xdg11BiWzJRuWyXUgYDd
	5u2PNavbHjJtvNOBnGxj4+bkJgwNaYqLx2fxvLsDlRYq48hrrtvq+fJ2du+Aj8we9RgHS
X-Gm-Gg: ASbGncsbonDU5Ep+GJfyWrcZzw8fhR29OOd4H1WxvJlhowUDUnlM3kiwd86k2bBFH34
	xvDdSxMjj5Vq7GxQlD5hCcjgSNxtfoxbPm2DyfDoxSAzgsrEj6CAUqcpyuTgwBuwDPZh1QGE3kf
	tNvwMbyyZRwWyNffwtO5fwmklzOx65RilU3MyFMK9MIux/oLCow/cI7Vrr14E7maUbpmUJZ3+rt
	YovWFFWncTWTO0ahNaLg6hcOv3qswsCKJHDsZwKUTzJQ5nTOq2SZKKfzjvPLMiID6kZ5gwWGYz0
	qzuPp6Ei1Xb3Yo2+k/yxEDaUyJDdq9pES2pQ9Up+94hH0gTz/KnnXZM/z6Op+qzM132OmIgL
X-Received: by 2002:a05:6a00:2305:b0:736:5486:7820 with SMTP id d2e1a72fcca58-739803aa74emr18219591b3a.13.1743535500928;
        Tue, 01 Apr 2025 12:25:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGBVJ/NC27+iFdu2CR264VQCXW0ScxRXyk06iJFgEY+n+dIz2sBI/bdnJkP2tkJDBV5gFAww==
X-Received: by 2002:a05:6a00:2305:b0:736:5486:7820 with SMTP id d2e1a72fcca58-739803aa74emr18219570b3a.13.1743535500440;
        Tue, 01 Apr 2025 12:25:00 -0700 (PDT)
Received: from [10.227.89.219] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970def120sm9297103b3a.7.2025.04.01.12.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 12:25:00 -0700 (PDT)
Message-ID: <6b33cf41-838e-45a3-8793-dec1ed6e48b1@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 12:24:58 -0700
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
 <4e4e4737-6040-4ec2-a3be-3fe1aba7b7cf@oss.qualcomm.com>
 <b3efabfe73ad2c194e49a01342f90eda6c7903af.camel@sipsolutions.net>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <b3efabfe73ad2c194e49a01342f90eda6c7903af.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o3zbWmUNtt65HG6CacXQb5xNajdIrLqo
X-Proofpoint-ORIG-GUID: o3zbWmUNtt65HG6CacXQb5xNajdIrLqo
X-Authority-Analysis: v=2.4 cv=J4Sq7BnS c=1 sm=1 tr=0 ts=67ec3d8e cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=k16_wN6ffYU5a0wl804A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_08,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_122503_562866_907CAEBE 
X-CRM114-Status: GOOD (  21.89  )
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

On 3/22/2025 2:04 AM, Johannes Berg wrote:
> On Thu, 2025-03-13 at 15:59 -0700, Aloka Dixit wrote:
>> On 3/12/2025 1:55 AM, Johannes Berg wrote:
>>> Hi Aloka, all,
>>>
>>>> + * @NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID: Link ID of the transmitted profile.
>>>> + *	This parameter is mandatory if the transmitted profile is part of an MLD
>>>> + *	and the interface getting configured is a non-transmitted profile. For all
>>>> + *	other cases it will be ignored.
>>>
>>> So I guess it's a question of what "the interface getting configured"
>>> means, but I guess you could set up the transmitting interface?
>>>
>> Right, if the interface getting configured is the transmitted profile
>> the link_id is ignored.
> 
> But I guess I don't understand yet why it's not needed? If you want to
> configure MBSSID stuff for the transmitting profile it seems you'd need
> the right link anyway?
> 
> But if it's not needed, should we at least validate it's correct or so?
> 
>> The 'else' case in the highlighted snippet above is the same scenario as
>> the 'else' case you referred to, which is one layer out: "else if
>> (!config->index) {".
>>
>> Both are executed when the interface getting configured is the
>> transmitting interface. The difference between these two 'else's is that
>> in one case userspace explicitly provides
>> "NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX" and in other it hasn't.
> 
> Right.
> 
>> Similarly, for MLO, mac80211 does not need the link_id of the tx
>> interface because it already has the link_conf for it as part of basic
>> AP configuration parameters, hence link_id is ignored in both 'else's.
> 
> Oh so you're saying that you have an outer link_id already in
> nl80211_start_ap() (or other callers). So then I guess we're back to
> validating it, in line with how we say:
> 
>                  if ((!config->index && tx_ifindex != dev->ifindex) ||
>                      (config->index && tx_ifindex == dev->ifindex))
>                          return -EINVAL;
> 
> now?
> 

Sure, let me know if any more comments regarding this patch ant 2/2, I 
will send a new version together for all.

Thanks.


