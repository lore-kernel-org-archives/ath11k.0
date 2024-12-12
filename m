Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC3DE7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 19:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAbBNuC5dKh80ZLRB6uAixzC/AiHGtZB/P/yo4TxffE=; b=LLvKyIPeG3KktKk8PWWIgJh/Bu
	3X40RVY5afzELtjotb84uZJxeZ3tiqPxqzF1KItuKGwML0kY4XL3TS5FJbdqzKTosjCQwrMDkpXrp
	WsaztwEK5mFmx/c3cEK5NLvQCBNboUqJNxIxbCdLQqZJxcD/XbdDd/stNgQJK9wWzhXDrXqHU1lKd
	8cIJ6amll5+9o3W+q1HlXBwIDpy3iO5KRJCevBQhTgjd+AWgbEej3NuRLWFZS7HEmqH9py1rscjxv
	Jo8Aor27wC1ZOK2Xx8GKwkDrqewGIBMCdtbWD0hUTfAKnVsaLJipKAqAfaE/uabIu88kijopuUX3y
	PdT2rmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpAW-00000001hNZ-2xNi;
	Thu, 12 Dec 2024 19:48:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpAU-00000001hMf-1tn0
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 19:48:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHFeCV029009
	for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 19:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAbBNuC5dKh80ZLRB6uAixzC/AiHGtZB/P/yo4TxffE=; b=I7GeMFOGG5bo4FP8
	r/FO0HCn12rmY9Zi4VPW2ny4sD0uVgVTogCAP0U8zeV+TjlAFwDBUMfQXntrliNR
	bDU4u4zYEcbyVGiYei7i0x9RMDaLyvfr35JCD+1G2DmYrQTyOloFAKx085UbH/ZZ
	8/MCUz/CjY0VYQ5X+1LYI18K0RCzw6mRsuVs1+fUbu5cBj6FM5+j7DASr0uM1UJo
	DCpcIfIclYtwigaTJ8SVuy9ipEHofCtbNqM/alWnbBTE47esX2zKhuOoix1sqb6X
	9UQEc/m6iaHkqOgBoRijo1vXKn4ZcqeFqQlxrCMlXlK41kNhU5Bx8rgw2eXSJgYu
	ubJEPA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xv33m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 19:48:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21661949f23so13709335ad.3
        for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 11:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734032892; x=1734637692;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAbBNuC5dKh80ZLRB6uAixzC/AiHGtZB/P/yo4TxffE=;
        b=u35KT6idTbJ8MOdb2ncNFJmQCdUDW7crBfWF91ithWD1ed6gErV90s0T4CXBEK3rPC
         ILVxJFlUqpIxGOVn1vuY6CegT24njvCTd2Y13W8UA3EPhSdE2mm8PK5XKr+BcoX8B/dR
         tLCV3Fd48LFq1yJxp3uTA8rkkyrxv2pipVKawWDn/S3Bd6Xf4c/9U/PPvXaplK/YvT81
         gvoLqf9w8YxzuazzsajCyVC7BxYolpGuUDLGwwA7ydc43FkXdjJC5PyHI60AvwGHAu9k
         OhYIrFb0NUKNjWao/cyUUwbcIijfH6WXmnkS+0oW46G/zU7zIjTWEeslAwF4pYxeufvO
         OGyg==
X-Forwarded-Encrypted: i=1; AJvYcCXT1bJ6BUt/mw6H6x4X8mE5WExeeEwhzkEp0ZXvmT3dVAVD0QrzH+y1KKhndi8SRYi5jgDPslY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yww1PpTuafN6D1UbEMxYeFwM4UNzZ7TI/5swofBSBTOxHTEYs33
	me6mad8KPBHKMzs83fH/4WMQkCnmuxqY625g6pfFQ8Lq/zckPjEORbcMTJRe+4L7XwzYYVBcLJn
	EDWVhMk5tgaJPLjM1nR4eaBgqyWXgqnoYPehHNj68MgivSwOdvqDdy/Or+6Ef
X-Gm-Gg: ASbGncsFfLEUjVTw29pggB1tLxMtUgv/D8lLCP59+0ljkYO6lszif8iUn9bA5xcJ0pX
	8cFh60RLJlwMK/h5BNq3kCyPvsFy3EYGPfa+bvWLh9dZimBs/dgpg2e0x07scLByqB3oIBUUJ3R
	BMeB9j5eaLjve/hsLodnt2A3H/h03ZqrU8ki9V0zNwYka7hJgOa5lqTs/syODL4GwNA+TDxvhdf
	0xfNxTYC30RygWlBI3PSztnMynPy0zrw4dfhKIgYJkdYLopJ307NeiF1TVc7ttvrgpHqBpgfMDz
	oKzIPhnVHg3uS0YBkQ6DNi8eSm6aG4UR6XQXeY22dgDVcbglig==
X-Received: by 2002:a17:902:db10:b0:216:7ee9:21ff with SMTP id d9443c01a7336-2177899ae0fmr127146725ad.49.1734032891662;
        Thu, 12 Dec 2024 11:48:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFW7XSKqM3jKKacWwzOG+wYPFLfO7PtBM0UQJQ8AnQ2TaamTTp6q0bSOdwqN4uudfYhURTrQ==
X-Received: by 2002:a17:902:db10:b0:216:7ee9:21ff with SMTP id d9443c01a7336-2177899ae0fmr127146385ad.49.1734032891302;
        Thu, 12 Dec 2024 11:48:11 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2166ef8b8d7sm53340285ad.67.2024.12.12.11.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 11:48:10 -0800 (PST)
Message-ID: <a6d2bfba-c3a8-4cf4-9276-7f7e39671a15@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 11:48:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/2] wifi: ath11k: Convert timeouts to
 secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand <shailend@google.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
 <20241212-netdev-converge-secs-to-jiffies-v4-2-6dac97a6d6ab@linux.microsoft.com>
 <27cc63e7-1a63-4ba5-8c7a-12a78ad6d9fa@oss.qualcomm.com>
 <cc1d5e08-92e0-46d8-badb-2a61482200cf@linux.microsoft.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cc1d5e08-92e0-46d8-badb-2a61482200cf@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GUU-rKMDS4OrlcuFoR6J7gULixZRFwwC
X-Proofpoint-GUID: GUU-rKMDS4OrlcuFoR6J7gULixZRFwwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_114814_618327_972BA8BB 
X-CRM114-Status: GOOD (  18.99  )
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

On 12/12/2024 11:17 AM, Easwar Hariharan wrote:
> On 12/12/2024 9:51 AM, Jeff Johnson wrote:
>> On 12/12/2024 9:33 AM, Easwar Hariharan wrote:
>>> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
>>>
>>> secs_to_jiffies(). As the value here is a multiple of 1000, use
>>>
>>> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
>>>
>>>
>>>
>>
>> something is wrong with your patch since it introduces a blank line after each
>> line.
>>
> 
> This is some sort of weird interaction between b4 and git send-email. I
> used git send-email to send the patches after writing them out with b4
> send so as to edit "net-next" into the subject line. It's good to know
> to not mix the tools in the future.
> 
> I can resend from the branch with git send-email directly to avoid this
> if preferred.
> 
>> Also if you want the ath11k patch to be taken separately, it goes through the
>> ath tree, not the net tree.
>>
>> /jeff
>>
> 
> I don't have a preference on being taken separately, whatever approach
> works best is good with me.

Andrew has this in his mm tree, so let's just have it come from there:
https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-everything&id=b3b550379dd1f0b65fac207c9c4d0eb5ed84775e


