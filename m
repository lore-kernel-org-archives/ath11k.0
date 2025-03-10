Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A57FC2BA1B
	for <ath11k@archiver.kernel.org>; Mon, 10 Mar 2025 20:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWaSKwt/0sm+5opJTd/K6Dt7zpEGvd26BHZwG2Qbd2Q=; b=sVAvIjlXP9OSVu3wONky2BUXC7
	Z9Thx0jUMqAu2k1DPaAAO8D7nNqyIbUwiNnR4jCjLYnWiNUh6FsRthr+luns0gPykZ7v/Nk2Tgysr
	apHj+avkAZHtcBgw/s/WhkuxihzLijZIfGuYnz/2p2PuiGAp3JHFJySq7rD2+fBcrh64GIzk9h0nH
	gwRB8Kg8D4tM9J1Dqa+/DR0w/BAAmfBqpPOaxpJWFLfvWFoMhocj5OzZ5oCFG5A6EwvKSwJG4NDF4
	hgFBca781ZHzrVELPiRgLjK8DN1qHKLD1rkV7y3/6APG2npY0YctPi2kWyBASywR5JlI9SJlJw4GT
	GRL1qdeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjWk-00000003pxp-32wp;
	Mon, 10 Mar 2025 20:15:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjO9-00000003oED-2EGn
	for ath11k@lists.infradead.org;
	Mon, 10 Mar 2025 20:06:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AJhVjb028572
	for <ath11k@lists.infradead.org>; Mon, 10 Mar 2025 20:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWaSKwt/0sm+5opJTd/K6Dt7zpEGvd26BHZwG2Qbd2Q=; b=ZMrMF8+z6ZS5RZct
	DhHnmYfg1hS4n724aeHgXIz5l711Jg6quztIYTuES8vr2cjVTgQdTR8tdpvWeOss
	ouuQFLQbVM1ebXgvmEPsJV19lkz9luoCwVwRlGbhQ5HAHz+yUUWMeJmECqw9DSJS
	795GB6A/ZER7y4P82w7QhlqQav7MhMWV0zVht4OLUG62PVr+yg/xlZVMOcNQBeKJ
	d/j032TXMZUWeKdQT2zzMQxW9dzfFvw/7wBTmEWseMnyxJgs77VKOWOXw8LaPkMc
	2iRelHDm+WTrvfEXaNsigivFT0bKZxZ/LiQrgaaCp66l554/icaAprKSDzVgPf4X
	adSD5Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f1jwyd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Mar 2025 20:06:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22410053005so143340635ad.1
        for <ath11k@lists.infradead.org>; Mon, 10 Mar 2025 13:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741637171; x=1742241971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWaSKwt/0sm+5opJTd/K6Dt7zpEGvd26BHZwG2Qbd2Q=;
        b=Zwjejo43TSXeSItkzt4bo839BnO81tZZlkaAbqSf9HcCDghL0S8bprZS5h5DWtXR86
         vdpqB47zsUtSJ7EHRE4ofVesDHoYSSGz96V84RfDN+8wbCXRGYIw1MQEpgKh+Ws+I21F
         EgQtgYcpQ6hKbtUoTWKC6C5YV//piu0/0bapiNvttZK8QWznAxuNLzTuKTY7lxnvrElu
         9H+dFE/utouY4vJFlU6RS6B3FV1u4x1dCxJXYNgxoURfczo7jbl3UyquoIz9vV9FBf0X
         IzN2mp1F0bnm6SnM38FlxY29Jwa9DnUFr7O2P6PlSXQIWGeKrRk+REDKgp7/4V3hdbf7
         gG/g==
X-Forwarded-Encrypted: i=1; AJvYcCVp/7e1UAjnwn93pwhUpSmvOiSd6pfmdGtE4Szc5MACPOyZ/30atCwKEcksr/6HCmszoFJ83So=@lists.infradead.org
X-Gm-Message-State: AOJu0YwecAXnBOvkNY5HANv+WAhThiLgfiCJsZL2r2Y5T9878IOsBHkf
	ep+hDZDysoPYqnI+fMzaO1443Pc0riST9k5SVwV1qEL+CuLRQC/2atl9qD6CW/H6lHTbPQkkBan
	H4rmMdyzmp3TfID8AfsZInWZagbjG95EivTdDwrSM8bqSqVPS652W8S4Lkvof
X-Gm-Gg: ASbGncvRtfFnmxwsZzBwVaRQ6ovXBamM3FlrlgEIXGI9xZGXguyAPLOIHKANgUxnPrn
	zosvUGP4i0uLQqWjkiZhUNHKkn3IAVo/8a7fZXCAngq+iUG9QTrF6c9CZL+ppmPRFF7uJ/7jsD0
	DY2dJc/NSTlkiF0ioOSdpAPGr/gl+M209ncIXEo6F2GzjbIkSy2M/YL6bWmjfW4yzP22MccQaAf
	IhLO11VcPTlq8cBWaB61pp976Z/9cp5TbrklzN0WtVFqghv/TZEKqQWfkaeVkcBD/Z/OUv9KbEG
	XFXKzDVLmZG9R7uZBQ6AtebcZC/KCyAGCC9FINN80HMSMZrqGvH7zz8e4wc1zFITKT/0qqTy3eN
	LE/MQ
X-Received: by 2002:a05:6a00:1819:b0:736:73ad:365b with SMTP id d2e1a72fcca58-736aaa76791mr19717030b3a.14.1741637171177;
        Mon, 10 Mar 2025 13:06:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKRXO5Aqpy7hm1pqQTj4PHI1ULOzwIS0JSNlPjhEGkDWQa++DbhyJzHpZ2fI7xywd1An9rsg==
X-Received: by 2002:a05:6a00:1819:b0:736:73ad:365b with SMTP id d2e1a72fcca58-736aaa76791mr19717006b3a.14.1741637170820;
        Mon, 10 Mar 2025 13:06:10 -0700 (PDT)
Received: from [192.168.69.142] (c-98-35-147-9.hsd1.ca.comcast.net. [98.35.147.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736acc799b4sm7228793b3a.54.2025.03.10.13.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 13:06:10 -0700 (PDT)
Message-ID: <289cca50-b559-4b7f-bc89-e089d7bdf6e0@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 13:06:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] wifi: ath12k: pass link_conf for tx_arvif
 retrieval
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
 <20250310200237.652950-4-aloka.dixit@oss.qualcomm.com>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <20250310200237.652950-4-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ctthk04i c=1 sm=1 tr=0 ts=67cf4634 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=UlYobBNIKLIdKoAhXwLdVw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=N-p2Yt28-VMXFBeuicUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: OxrxejTtyzU674E15x90PenFZb_-UUg3
X-Proofpoint-GUID: OxrxejTtyzU674E15x90PenFZb_-UUg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=960
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130613_690230_53D0536A 
X-CRM114-Status: GOOD (  12.36  )
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

On 3/10/2025 1:02 PM, Aloka Dixit wrote:
> Three out of four callers to ath12k_mac_get_tx_arvif() have
> link_conf pointer already set for other operations. Pass it
> as a parameter. Modify ath12k_control_beaconing() to set
> link_conf first.
> 
> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 31 +++++++++++++++------------
>   1 file changed, 17 insertions(+), 14 deletions(-)
> 

Forgot to add tested on tag:
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Will send the driver changes again with the tag if required once 
nl80211/mac80211 review completes.

- Aloka

