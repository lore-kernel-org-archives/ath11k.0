Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B05CAC59A
	for <ath11k@archiver.kernel.org>; Wed, 17 Sep 2025 20:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEM1lJMKa2QVcYthJ1BIIXMBnRFN8LfFqYTZtb21724=; b=lQcRTACqPy6lQDmnTPnPZSWVpa
	pamcGq0MsHQl6cTfoH69l4thPawxNUL4BOlYPLI2Mif8Gjt7It6haWkvrv2okB8MG9Ys0G26SB5RS
	w3jmJV5N9R+2Hv+zfv9vnHQHQxqpymMA1axVox0iqzK8WwwQseyvW/BQBhd7RGW6/k7Jsd5CNI3fF
	YNUtEPoM1wd4Vb++HQ27GVrb0H1GkNp/aqicVQY2XsdtfELgDCC7HZbf+zHCIUtn51J1CjDrAYc8w
	4xN2vx8bj+/epDOd4xN0LkhFiXsRcvNbePcwQ4yp9Wqq/buMSYNBwWIDsEYPXStx1MpgvfwjnMlPZ
	oSCbfnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyymr-0000000EaQl-1SAm;
	Wed, 17 Sep 2025 20:29:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyymo-0000000EaQ5-040v
	for ath11k@lists.infradead.org;
	Wed, 17 Sep 2025 20:29:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGOHfH029779
	for <ath11k@lists.infradead.org>; Wed, 17 Sep 2025 20:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEM1lJMKa2QVcYthJ1BIIXMBnRFN8LfFqYTZtb21724=; b=O32RE3riyGSoQUA3
	q1AU52H69/hFWKxCdkNT2rE9A5iLo9O2DE2gH3UigCTJWh/IhPNYpdk/6/T7rPV/
	dRxVGsbUMtE+V4iN+zYI6w40/OKEW1d6Sbztnqhi9ZNpWabFlEDTj7FqKdBhknfP
	PtoAXuOEl+TX8ni9ogB9Hs8kqbNtxtAO2cnLFJjpoMcDVeg1zv262qAaiQI6wOLu
	frgsJ9YRwVZKFw0wCWi8Vw5UHqile123TQ4Jwp+QDXrOF57S6gra+EInum6rW7gx
	pnR9gxL7Tn3l54eh6bm3o4MRRVn3DO11RHmYj9HTZ+7iTlLFsBrDTGrUISaF3Ydz
	lgPv3A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0urpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 17 Sep 2025 20:29:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54d0ffd172so165030a12.0
        for <ath11k@lists.infradead.org>; Wed, 17 Sep 2025 13:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758140989; x=1758745789;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEM1lJMKa2QVcYthJ1BIIXMBnRFN8LfFqYTZtb21724=;
        b=g5TRg2spa9l5wj67s9Hh1r2l/Vm7lP2apJ7qzVcwIfXhxhAshmzQfbMA7jGD+1dcmp
         Miz1R8tWoE/wdcyZBm4MOFwk4CfPgL+KRXx8h1850FrIm4KuXcQ14Xvefm5mdUDm5vK4
         n/f7G9SmyBQH1rGGyi5XrC1CbDPdD/woi6xrQeqoLmCkjW/WujNTplYplmGDkGZnk+fk
         JoVOoZC9nCsYbhLSmZ81R/0b9SpGjNd06P99f6koYkMn+hM3wpJD41FbqmG082L+pgVp
         AnU6EOSe3TCEpiTGs7Cj4LkmkiB2HlfI4Yqoy1QyA15tyOIfWmykY04UhTa8NGBKr4Ks
         5YWA==
X-Forwarded-Encrypted: i=1; AJvYcCU5tpMtSy1x4gy2kVw9QYHOCvQIILvi6Yr+zIOZHsOMvzTL2fMoNnfZMZBlOgt9LVKrpxZE4mw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ2oPxjJM2WzwnGZUnHtoWL4rm4IvaQSJmRpv5F7+3jQMCUag2
	/w9aNqvzO2olVc1Znz8WWjCrEPXvpT3MQ4pVA648QZD/XwbS65ABVOrMJY3qcMRZem1ZY7ijgJp
	Q+MHStfR5MDhK68I8eNGXfULObhU8Vajw2eFxD3bVSRV8jnLj8ay2yKSQZTQtqNJs
X-Gm-Gg: ASbGnctVuwYzRzyApwQ2/Y3nh9jrJaziPxvNGEw9aFTJXdrujGBpzGqnkpAO3OLx/4q
	utv4fwnjMaGpV/HUZauUFXfmKfavaru6ykEE33HNx/RqBoksu210eMbKUZ/rdBaxV7R2KaSdR0h
	iiD0aUpStUtWxvwrsoeX37PuDE0YRpJK5GVUWfCMmsNSIyuuvyNTSRc1E+4t+JA30JakdyITbeH
	iUfaM5J8wJrLHw63qEOlLeEQUlB1ON61AQzyiNn5Dj4tJPam0NT8JId1pbC9RUcL/v2Vl1LdrWG
	i28NZaXd8hZv2/FrUhDioArEBXx4T0q9dC8GdoQ+czMnZyTgUbVwHdYStrdYIgBVlaJfuSwOGbY
	+JojegBWa8pfuqk8atrcRe9+ZRVSFFdmDnSNt
X-Received: by 2002:a17:903:11d1:b0:266:3f63:3500 with SMTP id d9443c01a7336-2697c829fd7mr9913375ad.12.1758140989442;
        Wed, 17 Sep 2025 13:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoM/05y1CwkSSQcd6Pm0FZF2zcDhD38jOzV9/eRqaD0ZUm8ijYqgE/YnLUSCVJPnWy0wFC1w==
X-Received: by 2002:a17:903:11d1:b0:266:3f63:3500 with SMTP id d9443c01a7336-2697c829fd7mr9913175ad.12.1758140988955;
        Wed, 17 Sep 2025 13:29:48 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802fe08bsm4163555ad.103.2025.09.17.13.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 13:29:48 -0700 (PDT)
Message-ID: <b2efb1f2-df89-4c88-8f97-e164e89c7532@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 13:29:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Remove redundant semicolons
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Jeff Johnson
 <jjohnson@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <linux-wireless@vger.kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250812075259.6921-1-liaoyuanhong@vivo.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250812075259.6921-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sFPhmXHSzF3CJNBIZ40L4D2HCSYofoxn
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cb1a3e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=1WtWmnkvAAAA:8 a=mgvM1FoPK4XduYGJcSIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: sFPhmXHSzF3CJNBIZ40L4D2HCSYofoxn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX5lYV3eAixh5r
 2STPICQI3lsh9oOoKnz0XmOu+qfOaujV8eaoEWpYP6DImDxCBzGYpSIWgilAi3oNS+TOcUEpR/i
 xcNnUprAb5o7EFKfd3+uvNe1OxaHtGALiDo3uN6TTQ67OB7Nf+xQaJy0eOJPgzcJwJq/9vx4c5/
 O8pRiPDXeWpVB0iGZM9CYIsrPnz+b/tmk/Yaoqvg7j55iAyXqhah9IGvJWpvVba12T7eDd5nqnz
 ZCaaeZOi2UE7WKCdjyznro1G2Q3wZNYpycv+NOzYHNnfIu5GDVfxAyvhdXyJeTrKnii6ztpnBZB
 l3pVj5HCC1YT+KYka/XEPUdAgj7xBf8nCJUj4zTIkvwbn8FKoZG+UcJM3/qGmXyr3ijr+qgEhWw
 1gfu6A24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_132954_067965_20DDAC19 
X-CRM114-Status: GOOD (  16.77  )
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

On 8/12/2025 12:52 AM, Liao Yuanhong wrote:
> Remove unnecessary semicolons.

There is only one so s/semicolons/semicolon/ here and in subject

> 
> Fixes: d5c65159f2895 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")

Drop this since this isn't a bug fix that needs to be backported

> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index ffc7482c77b6..b9e976ddcbbf 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -4615,7 +4615,6 @@ static void ath11k_hal_rx_msdu_list_get(struct ath11k *ar,
>  			      msdu_details[i].buf_addr_info.info0) == 0) {
>  			msdu_desc_info = &msdu_details[i - 1].rx_msdu_info;
>  			msdu_desc_info->info0 |= last;
> -			;
>  			break;
>  		}
>  		msdu_desc_info = &msdu_details[i].rx_msdu_info;
No need to repost -- I'll incorporate these changes when I process the patch.

/jeff

