Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0250FCCD1A5
	for <ath11k@archiver.kernel.org>; Wed, 22 Oct 2025 03:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUxHszA84SpDbswEiJAWHOm21jvb/4ghMJWmQTldBGI=; b=ZMU2FxpZZde/UIVdjV0R3cfQlj
	q1dQRwMY0oZOyMUEymtPf//nPwhpeiZ2/pFvyxZboHAM34sH4Si0RdKN2dBaABwv6s7vi8I3tcwya
	Ya6LV/2u7qvcmzYSlUkXgx4A+FAxlVv5u3dJKLrH4xgvtb2aQ/SJ3B/W6sMIA3E8tCGOKZhUJtYZq
	JUPPFiRVA5x76wKBiy9qypUAOme4W12qH3vVCplDv30XqCXlhJ2aupFDVOgvHMcFkfIGZm+WneEud
	yNWlm16Xn2t5Ztdh/wCdkcyuYF6w/wNHvqe54p8DCD8OtXqmZ9BJMGXbsubQ6kZ77JHz2/hSV5C8F
	6rtOsmzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPNd-00000001JNU-0iYp;
	Wed, 22 Oct 2025 03:19:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPNa-00000001JLN-1Abw
	for ath11k@lists.infradead.org;
	Wed, 22 Oct 2025 03:19:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M24X8P024689
	for <ath11k@lists.infradead.org>; Wed, 22 Oct 2025 03:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUxHszA84SpDbswEiJAWHOm21jvb/4ghMJWmQTldBGI=; b=c9icrxW8IQTU0QKz
	Lx0Wynl6QYT2x7FEgoNRYLlpy0iHwuAKG6uCiPqP1BgJMg42E8kt684X7xr4FdhQ
	pvL8LbWXKQ/b2WoP7bIzlI14AF3Vb5M4csl5enhL36ngQaslwbyPphr6WeW6TYte
	6pijrCvHgGEcfqFm3uQIyfsquMsVe3cVsmHE+jG8PMKsJmbeSdR+lkVKtB7hFpRU
	r1lgPYHQPn93W3PVbYMDgz2AtiEnFsuqHjxny7Pmau7e6mSYKJ9khSk8386ssLD8
	Fc2rRFWTC7hDmlz+zLKGHBcQjkacMRoB1/nMBIpDNLHTgK98huBZ7cZcCdv8cPNw
	enAJ5g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws5dvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 22 Oct 2025 03:19:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78102ba5966so5859202b3a.2
        for <ath11k@lists.infradead.org>; Tue, 21 Oct 2025 20:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761103151; x=1761707951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUxHszA84SpDbswEiJAWHOm21jvb/4ghMJWmQTldBGI=;
        b=n9l1qm9NhRKJVt7MbH7LOZ7WuFRc3TVzVs/Ss2hziiCQybsOj7liq4xQheZ+lx6Hhc
         T420Pxia/jBA5q/8Nw3AlMwe0F3Rf/yR4e1wdTllYWyEmx0be2BiokSSUX8fvOBQO+Tw
         d1nTxihqGYJFA/3yBXveoaMPoSfwkz1ss0qc5FtourqijSWticytfINFeHmHJw072t86
         v76DpjK7D3dBsa6PXrEqCf5FW4v/NqWxi3xc3GsTk1xozO0qJELSma4kDz5Lo7jQXh1N
         WWwxLvGf/TZCXt5zEvVvT+8aeN7h6FYDb002NzfOMgFaEkQ0MwjbqLustt+aENuExlqW
         /GBw==
X-Forwarded-Encrypted: i=1; AJvYcCW2s+NbgeGHIDg9yso1snHM8k1e4xZbxmHv4rIezzWeJ/KW9RqS+g44LRp6AHdVkQ0No2ctRHQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIZGqdNbI4oSjP5eU1A70w8bLFNrZzDWwHOlb3e3RAv9XSEPju
	tXJlxiN0MvJk2ItdDY4T6c41FedkZ8oqSxxHjXU+Bx/PJPyerbHJlwmJjwx0haL7tZe/ykAeLDi
	AiB98bBaOrIwWeI7u7P/KnCOYt3PB5+l63X61+wgI61ALsSN3DFphBmtxYWOdYKs+
X-Gm-Gg: ASbGncsv86NEsWMv4PvCfudzFv7MfQ5ZEW2MijKYSpRWwEF3YuZUqM5u2eu3r3JzdM8
	SNfNFdRRRb908/71KxJw/dlB2UPZVLJwagdaojwtJnGM8s+SU4VnQ7YSP5lgWu9HRD0F6POmdKh
	8dgD+9irfzs76A9R89Qu5L39xsY5B0P1WVaRwmEKVRvDefpUvT7ZxO2lt8VLQHk64IktYuLrBgX
	HxPwK6YyiWdQHAuppzFP1Dv9xPfXYTwd9rJnY2KyHj6RkEce+yEPSKBuDLKTpqGe4PNxbZE9dJV
	iieD0Wm8J8x7xl7pQrKq4Uan//PHvZT3P6hgvVWQenVLfJ1V/pBt8RPFcoIAtqvt4W3JiFjZ9Z0
	4sW6W8j2RQkXNrcUVbdsbgThpEtLrtq1MRdyXRryWSXm0F9KIvA==
X-Received: by 2002:a05:6a00:848:b0:77e:7302:dbe7 with SMTP id d2e1a72fcca58-7a220b2d9f8mr22614386b3a.27.1761103151601;
        Tue, 21 Oct 2025 20:19:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9YS+Bi6lS4cwpZ6iiWH1l3zhczUehFls6zq/0FXyPGo2MHNYgkuKEiVb/fW+l0KOvqlVeiA==
X-Received: by 2002:a05:6a00:848:b0:77e:7302:dbe7 with SMTP id d2e1a72fcca58-7a220b2d9f8mr22614359b3a.27.1761103151158;
        Tue, 21 Oct 2025 20:19:11 -0700 (PDT)
Received: from [192.168.225.142] ([157.48.122.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff15878sm12923986b3a.10.2025.10.21.20.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 20:19:10 -0700 (PDT)
Message-ID: <92307b97-8c8e-3c91-c233-527c96352ed3@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 08:49:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k: fix MCS assignment
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20251017-ath11k-mcs-assignment-v1-0-da40825c1783@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251017-ath11k-mcs-assignment-v1-0-da40825c1783@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX+A1hxsZHAaUs
 2ZiwvP/+oQjvf30uNCzAotL99fuloUyOXTcSyYH1j/AQjLSidgF9rViAdf73OIY2JTuiCa7y6wJ
 cw1wO+1nlFtoqliFVG7/4QlXQ1pw0GkTIGlgZVbTTs6EGKQdXOSVSp/efbhhQFhU5EeofWIPLzd
 GMJWrZ+bMyW/EX8dJhW+zxhUzZi1v+o83q4nGghRwOw3ISR3F+WoHsBLranyMchJjkGi/YjKJo0
 nH02GtXRU0lmsuzcro4DDRxPvErHUDTUQRpo/Q8Ffc8v3Z0QylU8bw81a7b4zhPwlFrOz2Tv9nf
 E00qvpQ0DXeTpKlAwb8Q88RRbwLJhs5yvy3l0ruAJzm7518FOjzEzQIxX2HA0l+DLVzJrwkNV8W
 bdKFozEqoEZNozMRMKgtopDskny4eg==
X-Proofpoint-GUID: q8ruu7XFQd8oW6y3AXKbbT4AwKHWTRXi
X-Proofpoint-ORIG-GUID: q8ruu7XFQd8oW6y3AXKbbT4AwKHWTRXi
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f84d30 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=MVWiM3nRykcdLg9H6cDE8w==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gyaHW-YjZbi6TJeFgK4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_201914_442104_F216E3DB 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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



On 10/17/2025 7:18 AM, Baochen Qiang wrote:
> VHT and HE MCS handling are wrong, fix them.
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Baochen Qiang (2):
>        wifi: ath11k: fix VHT MCS assignment
>        wifi: ath11k: fix peer HE MCS assignment
> 
>   drivers/net/wireless/ath/ath11k/mac.c |  8 ++++----
>   drivers/net/wireless/ath/ath11k/wmi.c | 20 +++++++++++++-------
>   drivers/net/wireless/ath/ath11k/wmi.h |  2 ++
>   3 files changed, 19 insertions(+), 11 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

