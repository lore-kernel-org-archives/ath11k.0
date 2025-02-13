Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6241C021A6
	for <ath11k@archiver.kernel.org>; Thu, 13 Feb 2025 23:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrKqwAz8/y/nYtbJvGFXtPOikpfxCNae5javLo1xFL0=; b=CtB/+Q7rWhiQattrlolrMwQYmj
	stVifkbqY0cBAz6Iem/+Gqi4MzBkhOS+3YmmSH9fgO2uPqOgA1OoOxIy79mI5bJJXH0D6SfSxlB80
	jXa/N+K75/x2HmXR0Zah2Y3Hoyl4srVn8Dsd6Pkhg4+gLrI1OLyyHFMrGjJCth2r/z45RlCQp9267
	09uT+7EOkPQZ9z9Ohc2g7Ij6GO80/Mk0ZEStnLoKGVcTiD8MzgKOM6U1GX6DNVV8D+jJP9xvpJ/tN
	+at7VEw8H0pl9zS90u4iGiai6XV+xJd99Y48tph62RrcsShctRg5aLABINet2W1NA3Wi58avkagZu
	IRJfXspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiTV-0000000CvrX-13kf;
	Thu, 13 Feb 2025 23:18:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiSp-0000000CvmX-3rGC
	for ath11k@lists.infradead.org;
	Thu, 13 Feb 2025 23:17:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DKcgWu001648
	for <ath11k@lists.infradead.org>; Thu, 13 Feb 2025 23:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrKqwAz8/y/nYtbJvGFXtPOikpfxCNae5javLo1xFL0=; b=HeqQg5O9K0Y7E2at
	X8d5r24mh7rsqGWqMCZMr1fXcvANuTXs2srUlJhxiIa5iLLIVekqoq1bbfxDKYU9
	ZAhwDVHLixMxBn0IWqsKlQHBRXi3Fq4OkfoHqCYgK21bApxWVaUkeU2DL59D33uE
	LfOTLd2i+VECGZQfTO6pYsk418w3Ou4SDvov2ox++ZCWiVWJdYFipasC+0RKrbc/
	kx6bLQ6hXQHLfqU52KRBX1JhV1agA6+PFsbL4UZTRMUJVPOEcwoC7bC6B8nt+Gof
	ALy2Uv91KbqmafKYcQf0df9IT09xidVIpa2n+wEtgjwoWLRDCfhLNwbeCVj3HFPR
	1xQQOw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44semp9vdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Feb 2025 23:17:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e65a429164so33871706d6.3
        for <ath11k@lists.infradead.org>; Thu, 13 Feb 2025 15:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739488665; x=1740093465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrKqwAz8/y/nYtbJvGFXtPOikpfxCNae5javLo1xFL0=;
        b=tfBbBeeO0h/6P0ICok5/VqYLTd9Ki8xmk/7rsHY7lXkpZ1LUlragwZM89FLJaEb80i
         KlfLh86MkajdrcFBysZK0QceKNC9I/qbtXVLytUXUZ3WL8HS9WVFK8vWuq+tF7qc1vXx
         AH1XIMF+W2eVWQyLXHHRWPvNn47ouu5NkCaa0f+onJbrkyAHu7F5JhWe45BMyWbt4EOQ
         1ePJFP7fz90ggdI7QzBbe51ChHQm2ZYTqe/u5G1PchwJwk0ku3T0TEN51d8EzXxZGR7I
         svryAZawZ3YnD+ox+KqdDMAor+/RXNGnKs9ciXf7JYME11SvlrIK98jOtWSNcCHMZt1g
         yWFA==
X-Gm-Message-State: AOJu0YxdIcGfdbpeQj3sZxB+j2Sb7EucY2sfkldVKKBk1M7XpAj9Sx8m
	Wvk27kKck8ICgA2qgo5xsR6NoQKqfzQZd7kHh1Yj44I/ItHYz/S5cb6APy7LJJwc7tXfr+mjVZJ
	IudWKAvsbdDSG1NCv8Y0gDbdC9tmGKiST5Dtfl3w2OCPzuCze7UrPkJKE7idRmp0Yt2Rx
X-Gm-Gg: ASbGncv0wC/p8nbrfSnTuXztAuYWIOwhjSNS+/Bu3L0FI8s8w0kmEDN2nNIlDIQTmVu
	lOTRreNp7zvsEWdv0TQnt+C21Xjr3zRqn2MmkmO1KChz38DxtwE5exIWdxYcqt9i05QfFcv8WPn
	H99KQXLpHnC4dY1uk+vyJHRewjPOjG0LexYGc7lwCpdpG/3zjMfqofVvwJ0hYQFoDEdUgIzNFF8
	tgP2E615sxO4cmWXVhLPlarjBlwvq8oz1ciu1AuCZpqxNHdTDgC8zdMMyAYD7FoBZDCbY3Ir+k2
	H4Mxs8zPir0HZ5JxDimTtTbLCVNptp94Lomzhc6jGg0zjMHS+QbI9fkegg9XVKS0kct2sg==
X-Received: by 2002:a05:6214:2028:b0:6e6:5e66:770f with SMTP id 6a1803df08f44-6e65e66780fmr67123206d6.16.1739488665690;
        Thu, 13 Feb 2025 15:17:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3IyNLcVOqUOu1ZVdzkIWViilmcFh2U7s8tXWp9vxKaW2ksV73AkING7XUGsAp9dIz/TYnvw==
X-Received: by 2002:a05:6214:2028:b0:6e6:5e66:770f with SMTP id 6a1803df08f44-6e65e66780fmr67123006d6.16.1739488665371;
        Thu, 13 Feb 2025 15:17:45 -0800 (PST)
Received: from [192.168.69.139] (c-98-35-147-9.hsd1.ca.comcast.net. [98.35.147.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d7a4379sm14800796d6.64.2025.02.13.15.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 15:17:45 -0800 (PST)
Message-ID: <14da00e1-f1df-4269-ad9f-4f9be02ea552@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 15:17:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] wifi: ath12k: use link ID for CSA finish
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
 <20250213225036.3118133-4-aloka.dixit@oss.qualcomm.com>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <20250213225036.3118133-4-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2BbhA1KwyR2_HwRptK7vytlhZNlwDDB3
X-Proofpoint-GUID: 2BbhA1KwyR2_HwRptK7vytlhZNlwDDB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_151747_969531_9887D81B 
X-CRM114-Status: GOOD (  15.43  )
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

On 2/13/2025 2:50 PM, Aloka Dixit wrote:
> From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> 
> Send link ID instead of default 0 to finish channel switch operation.
> 
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>>
> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 4dd6cdf84571..198e22ec6735 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -6894,7 +6894,7 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
>   		}
>   
>   		if (arvif->is_up && conf->csa_active)
> -			ieee80211_csa_finish(ahvif->vif, 0);
> +			ieee80211_csa_finish(ahvif->vif, arvif->link_id);
>   	}
>   	rcu_read_unlock();
>   }

This is merged now as part of another patch so can be ignored.

