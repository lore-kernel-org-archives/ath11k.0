Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A18C55167
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 08:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwN4m3GZszv7Lk8bq89AA1n4J6jRQ5eRfOtjYkSzynw=; b=ok9o4Pwp762EfbK/CrcvugXNwy
	FyUOKi1kScSgxoFABOuDEeuSl/svYR10wHxGZ4veTKB6tAJP/bSQAU7+18b9VSn8YTScbPh/v2tey
	vcAajJ60knK9ogJ7zejDwsZufNuLQZxEF9XWiux0sjLvsvL3Ef49CdVknSKFXwE8klyUT/Uqiqq+m
	v6qaJNL+S86Ba1lYHTbyxZy5ShxsOuctcDNhFA1FQTkfmNgCLMgoLFFPsdjW6Fms1KlP5ScR5JKvb
	gM5cMbk+kq+jI19AMNorUQiDerCgNjsTO/nB7BqfqtnEAFAbuM9+nQ7dwLbWU+AvzwGowsyC7GZBG
	qreEO30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiQ2-0000000C2e9-3SP9;
	Fri, 31 Jul 2026 08:16:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiPu-0000000C2c6-2B4O
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 08:16:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7vNVb3261147
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwN4m3GZszv7Lk8bq89AA1n4J6jRQ5eRfOtjYkSzynw=; b=azIvyioV22BMdMnZ
	uSu53KqY6KaVNQbchd+zdzT0W7jWelZDKSWIjg2DwPv6j7nXblpUA3O4Hcimh3aZ
	CmanFPq7ql0bm6gydB/BXYmd9tZ4g4kEfWOsXdqvelwMPzOK+n2UNfcme/YRJnPh
	iy0C/5J0IiWEuiTT6cRpHQqOzedSOnKgTj/gj+4NSmijlDzd24EtWQgMTBEz8FQ7
	zMg31bS+eirtgjLVtqZ5UUmXxkpVehllIDlPFKntd9AF42ToPn/CEIBbiGHRQw9B
	+MS8eBa5DmbN+8NV+eWAchHrD5Gm0MouFVo/gz8uCT4kuUlUz0CwmWdezYxVc9Er
	7wXtIg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqajr5et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:16:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848568a6f62so1631266b3a.0
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 01:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785485787; x=1786090587; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gwN4m3GZszv7Lk8bq89AA1n4J6jRQ5eRfOtjYkSzynw=;
        b=C7xEPOomt+uvGsXbiAr9pcIPfrjPFLpvWHtrm4qpyYMhEJO541Nq/uBdjHZqN90wL6
         iHaVt7ejGGibqIrflBycSVtI5VrTTVhNVrt0NFozTMz4QUjh6She7PHngg9aTVYWKqFP
         IF0xrMvL6+0at71HXcI8fZxY8zfJoB2ypefQ5DN2HWtNkDI7LLqVt4gsKAQySaF9ur7a
         5kC5/xIwZ+yolWYMEAlq13K/gBmcu1MAqvICRRjIOoDYJxFBBdehfv1Dp9/kzZ8Iq3VE
         NHRzkPx8gRP8k6/oyx9vl28wJcOHmorDZ8cYKy11kq/+M99kKd9ONT/09w+JpTMm7QaP
         UiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485787; x=1786090587;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwN4m3GZszv7Lk8bq89AA1n4J6jRQ5eRfOtjYkSzynw=;
        b=r2OdfmK1txXHc7KXF8Xxkis81dLb5j1LSLVLc6gB+TSD+U6KMfmX5lg3e5h0DfvBfN
         W9CPLPUmv7AvMZaM4eH0U91P2A7b4erS/DDGSFLf7yd/wDZLOxAlD/zq+LNLgcQC/xLt
         aIwIRV3nQrlKCO1fE2oKNCubiti4mq6f2jASUwm0V/NrDix55CaRr1sYH74YFMPV8Twn
         dSpjDUckhbf5uAeLMTHUCmvDSubwRr4MktRygUxncARSvBrhQ2WCNwhSbmg3JGfnMmXe
         UEEeTum55fzL8bvmIBXzcne4d2Q8FrklKzxLR3xU1O6vulwfXJW4ZtGw9yveZBtvCx1x
         W7LA==
X-Gm-Message-State: AOJu0YxtJFIzfHT3GRBtA6XKMjn/TAVBIDEWWrMTM7argpXkxgUACeIP
	/hUAphAic3VvNvbq2qVBOBkiX+UxQ5FSant8kg7nepI8djVYIHcfiu0eAoWQmtO51WZfaXVV258
	cYeHj/pDL1F14S8AZtiF57gpvlgep4qQHlVeuYgmCiZN4kbElJbsFNgjyOYZ1NbTZ
X-Gm-Gg: AR+sD11lkp82XQ7EFTE2w9Q8P/gz+3OJxd8Sc6eNkHl6r1sgk1/9j9Q20GFdYUNaly1
	q4mjMxhD5FRYhu0PGkq+njHKrp79q27Z2fYxAhLCTEQ5otd8dnvP40XT2vzyiBRnSB0As2Piq37
	EdKSRljb7mOjSsYEVAuL1znnVnXNbE2oZKj6xQZROtC3wu/uZHVz07Wm9x0RZSi6K5TMMDbYZU7
	/9W3mCqzPcqOAGFVwvrzHWAAJtt0wlLp0LQdIamwMdB8+UqXCIvT3gdYFcrgtUoxSzCBl9zFvkl
	HKip4iPti9evPWU16vuSoi9q16fs+9hPcV5aM7JsvxAOX+iXOi1z1XhaUSd0B2ij7dM6rmdu/Tv
	pU0Szj2sYSOJ81Le+LYaR4KUPrn+wwaJD4iphnm3Aw6FnpnZZLMCiWYSdSrIgU2+6u2JZG1rZTg
	==
X-Received: by 2002:a05:6a00:4285:b0:847:95a6:eb74 with SMTP id d2e1a72fcca58-84ed6d227e1mr908913b3a.23.1785485787267;
        Fri, 31 Jul 2026 01:16:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4285:b0:847:95a6:eb74 with SMTP id d2e1a72fcca58-84ed6d227e1mr908888b3a.23.1785485786626;
        Fri, 31 Jul 2026 01:16:26 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe564b3sm140033b3a.14.2026.07.31.01.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:16:26 -0700 (PDT)
Message-ID: <81041a09-bffe-426f-a087-f6e48de93531@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:16:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] wifi: ath12k: prevent scan during firmware recovery
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
 <20260727162748.963275-3-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727162748.963275-3-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ijrcdIhlpWVGF6JVi0hxubXL_RARUUu0
X-Proofpoint-GUID: ijrcdIhlpWVGF6JVi0hxubXL_RARUUu0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1OSBTYWx0ZWRfX5RABVT5lva1A
 vgl4YgoduuUgVUpaS5JLGzO9HPyK6/16LMuEQoz1LYUoqwl/NJZZVAeCIqi2KEUND4SmYsdJ/Dg
 DWdLzw7iFBCDR+ni/vVhzxsXH6+9YBkqRMQVaHSzHFKWyhAiIfYUTUFyVYKSjJrhqZrkS8jWdQn
 PJXOH1ZHa1hoaW71q8hQpi2GY0VNRxjGPo2EhFdg7pNRNjVD4wGVXv5TQjwhiCmM6HkQ4x2KmEj
 B2mCSVrzGbZAGu4jgApNRYNHWbsUr4H9LmxXF3dLJ0wb3AaRvLDYvkvSnTUvqz+RRuHeX92SOEX
 JEWHesVRU8MIXCBLtqWMa+H4W7c6ZIl1wIDOVOISfFkwAwoJHwa0TRsPtqHFZW2WOgGCgh8UTUe
 0OQGnVJzeUIJe89kP3fZUdbQTlm66RGwgKswmkBbHZVDI6d20wEl0F/UYdJV/JMWD2tseVt9y+b
 fZ+v48WH2AGV3sN6f0w==
X-Authority-Analysis: v=2.4 cv=e7I2j6p/ c=1 sm=1 tr=0 ts=6a6c59dd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=Ck2z4BDfFmx1ngdb9lwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1OSBTYWx0ZWRfXzberlJcDi4o8
 Zn8Xa/KKs6lzzS4lN9gMDg5c0qOWTsdU+uE2r12VajzDfOEzhMjPbMJ/vGtbI8v5RnWOVS7Wubg
 wyJk8EEM4g4YcK8tF5yCVd6QpIdMwq8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_011630_714273_31789AE2 
X-CRM114-Status: GOOD (  18.15  )
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



On 7/28/2026 12:27 AM, Jose Ignacio Tornos Martinez wrote:
> When firmware crashes while wpa_supplicant has an active connection,
> wpa_supplicant may immediately attempt a scan via nl80211 while the
> firmware is still powering on through MHI. ath12k_mac_op_hw_scan()
> proceeds without checking the recovery state, accessing partially
> initialized radio structures which leads to a NULL pointer dereference:

do we know the exact structure/pointer that is causing this issue? just want to know the
details of the crash.

> 
>   BUG: unable to handle page fault for address: 0000000000001508
>   RIP: ath12k_mac_op_hw_scan+0x148/0x2b0 [ath12k]
>   Call Trace:
>    drv_hw_scan+0x88/0x140 [mac80211]
>    __ieee80211_start_scan+0x2bc/0x6b0 [mac80211]
>    nl80211_trigger_scan+0x54a/0x9f0 [cfg80211]
> 
> Fix by checking ATH12K_FLAG_RECOVERY at the start of
> ath12k_mac_op_hw_scan() and returning -EBUSY. mac80211 will retry the
> scan after the recovery completes.
> 
> Tested on WCN7850 with MLO (Wi-Fi 7).
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index f33976fc1233..924c3c21ca78 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5707,6 +5707,9 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
>  
>  	lockdep_assert_wiphy(hw->wiphy);
>  
> +	if (test_bit(ATH12K_FLAG_RECOVERY, &ah->radio[0].ab->dev_flags))
> +		return -EBUSY;
> +
>  	chan_list = kzalloc_objs(*chan_list, hw_req->req.n_channels);
>  	if (!chan_list)
>  		return -ENOMEM;


