Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D74DC83F17
	for <ath11k@archiver.kernel.org>; Wed, 16 Jul 2025 03:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1NecSqh/K6FXbaYkgId4IAbjQh5zLHrJiU/Yh9hchg=; b=c/oC7m4+5tb1/pJGHiZKPD7GpB
	HqjKFcKykAQeMEAIOJjsQAqSkCKp5Jdig6LqTTRKf9kseq2YPPNwCv+m/1Z5MncSS04zeJ65r/5TB
	c+gkNby+SEP9nr2qUISNYMEETEBcgZXH0m6ctb+ICFAepiYW519ytKe6Dj3M1eZZmsMm3G6ffExmt
	fxt0momj0bna53CZrwaaN44jTuGVXUk3S/bBLE63G79zUYIeYmsIMAlGO3eQeRGDuhajbZIgh6D+Z
	8hnh0znKeZJoMRaHPlAfPj/2GOpIQUNio+pEaqTRUZDVKq4QX5YOZi1217VdiHW7m053ZwoBb4Xix
	zuYlk89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubsXO-00000006eJ5-1LKe;
	Wed, 16 Jul 2025 03:10:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubsXM-00000006eIj-0T7a
	for ath11k@lists.infradead.org;
	Wed, 16 Jul 2025 03:10:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDGkM017997
	for <ath11k@lists.infradead.org>; Wed, 16 Jul 2025 03:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1NecSqh/K6FXbaYkgId4IAbjQh5zLHrJiU/Yh9hchg=; b=g7YYe9l020tJCFHM
	Kl+x+DKnpjysRbOWcWVs2tVAuyktWwyyuP5gVJkaqeTZ7Ln1Mr/Hrq4meXgmnTCA
	kiYVJmaP9/guUMfyo82hHkOdmn/iDlKnOEgnzMRLA918j93ZubHEN+MVLLmjgF+O
	lei3xGovsyCaQEFCiPcWJC/+s7my2SvXybNGqGUaUPnwNcowho8viXhhy6buNDIk
	9WdH146m/Gj5USCWPHAWDkyeDFb73JMd7ZYauDXws4gAqGEyKq5zt/r8jq7RZ2gW
	Ds4vGgiuFyVgYrfjLH6AINGgyLV9jLuSqMlSEPYZ0W8KCMRsdgJuD8tfqxGoXBoP
	Lg7Wsw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug382ee4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 16 Jul 2025 03:10:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748e1e474f8so9221672b3a.2
        for <ath11k@lists.infradead.org>; Tue, 15 Jul 2025 20:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752635424; x=1753240224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1NecSqh/K6FXbaYkgId4IAbjQh5zLHrJiU/Yh9hchg=;
        b=wXCxbVRW9XMSt3eHjJvB49NU5HYtqPyJdzp8ePtxCIYy+yRy1dfVx27297VqVdgKQk
         n+XvSPnaDX3JgUbE5G6B3H5V3RikCxG1Twx+FW3jz5qwY57K7YQf/W1sXMLUjO8sXp0c
         DBALo/xVK67swxOugnm3RCw3DQ7upwpuni78hcAgpXjbcZ6Y0bCqlLN2FvEI11/vd2Od
         NzD3+TFNCvrZIzAkybrTU7BkkOTmR//kQi4fVNpp9JCdGABS03nzJl41ekCk4d6+SlKK
         2Nub64+x0i+qLjhr97ISw3ZWlDFYO43e8Hcpjr09duqxsMPSohQQ55IYJRwRuoJDUfG1
         gAww==
X-Forwarded-Encrypted: i=1; AJvYcCXOei/A/0wSVTJOyCzZ6LkXDBaTiKsH+isXpdHDBhqr/BJWgQlkxqkAibURPdWsZyhTCPtW1s8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUmpuI5uEjppdOL5OLT4GX9CczFk9T4/kKqr46iHLFjfpeNBwN
	yhW9VDmQ0AbPkGdbInkepy2b2vi26iPni0Ta4P3IXfWI9cGVZHRMyXPN9485xupM7+/QqYYgq2h
	DpWklt2OmebZWGRq9HhDggsrKO2eZ1lsx+B3iruGfDAJ37ODkI1QrjrdUCvX6Rzl0
X-Gm-Gg: ASbGncvDedqYpKccO+jLFntLVhmVvwhBns4FGkFSsupRajQoqz9eVnlBGyWqRPt9nev
	T5eL69s4Ep405ljMpsNOo7h8vwNkbWFoDD5mzJg7Kju2lbukKujpOhC9+fRE0viza+SLCmSlc9b
	rFVdwkySg/a6sDPEo47vYP+ssppAFDViT21NVlAy41cIRGVi6A69xrHCfoEydAgNELgNWVfPOEx
	Y46eEYMundIpdfp4DpqYlreaPm01Vt9Tc1szbQ/V5pJVYcvAN2Vw2DmJFMjD5CuHKISSvTipTpH
	azep8EaJdcX+MkfqumqsB2Otv0rOuQ01E7WifCJDKopmsVsrR7EBqFeuIpbQIhsOdN7BRsx7jsB
	FjfecWC82T0yGNwXBKTVsVhthb4At8QZq
X-Received: by 2002:a05:6a21:1508:b0:220:94b1:f1b8 with SMTP id adf61e73a8af0-2380db8e8d7mr1249316637.0.1752635424551;
        Tue, 15 Jul 2025 20:10:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiGRFaDVgMVw/6S2T7ToRpEE2QAahqPlEgNa4QLbCX9jXVhoF1n7FVrczoZKBOg8MHlEG5KA==
X-Received: by 2002:a05:6a21:1508:b0:220:94b1:f1b8 with SMTP id adf61e73a8af0-2380db8e8d7mr1249278637.0.1752635424071;
        Tue, 15 Jul 2025 20:10:24 -0700 (PDT)
Received: from [10.133.33.219] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4c989sm13514936b3a.130.2025.07.15.20.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 20:10:23 -0700 (PDT)
Message-ID: <7ecc1cfc-5033-4d74-9303-9ac58527113c@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:10:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: HAL SRNG: don't deinitialize and
 re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>, kbuild test robot <lkp@intel.com>,
        Ganesh Sesetti <gseset@codeaurora.org>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: kernel@collabora.com, stable@vger.kernel.org,
        Sriram R <quic_srirrama@quicinc.com>,
        Rajkumar Manoharan <rmanohar@codeaurora.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250715132351.2641289-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250715132351.2641289-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAyNyBTYWx0ZWRfX1RDNqF79Ylly
 XJfpm1vgBpoaIQEESkC4ZrtIoKua6tAbHcTeq1ZOq2IBUMrqKYGDpEM2RfCezgnNHnA+eAKI+JW
 XVxNJv3levFbeYbjcFQns5sJwRe24dyQRDhbr9mB0C6dd5lh5qxSCDIK9M1yApo8hTaeuFAr5Ij
 poNjMcjflGT4LZi0ewLXODdjtsSS5ubmeUzsAjf9HslrgPhjm7nWWK8xuW0HGPBTvtc4YFrFJco
 m2PGXnvyxhNt9mlh2oSB5Kzgpv5btKThT9tTcz/dExFfEwyWZkwpGWLSX/ySu7FQc4Je1WEjjw5
 gqXSoADvFCZW5w8vZj+T71lG7XskJJ2AVdVOoPRX2FCxg1ZmnSiFtDdKF3cHxdaSqyDva6lXS2o
 WQZWy45uVCJUmIMUcVsHsc6tEXwsQrWtNw0M+FpS/V6550s+hgo6KVqbq1ZU3Nn9mEkj39Uf
X-Proofpoint-GUID: tAQnxd5UJUSwjsLBSZbnxrpdLrNpGSlQ
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68771821 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=FO1u493g7a1ack9Z5SAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: tAQnxd5UJUSwjsLBSZbnxrpdLrNpGSlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_201028_279650_2B66F5E8 
X-CRM114-Status: GOOD (  20.63  )
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



On 7/15/2025 9:23 PM, Muhammad Usama Anjum wrote:
> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org
> Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since v1:
> - Cc stable and fix tested on tag
> - Clear essential fields as they may have stale data
> ---
>  drivers/net/wireless/ath/ath11k/core.c |  6 +-----
>  drivers/net/wireless/ath/ath11k/hal.c  | 12 ++++++++++++
>  drivers/net/wireless/ath/ath11k/hal.h  |  1 +
>  3 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 4488e4cdc5e9e..34b27711ed00f 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2213,14 +2213,10 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>  	mutex_unlock(&ab->core_lock);
>  
>  	ath11k_dp_free(ab);
> -	ath11k_hal_srng_deinit(ab);
> +	ath11k_hal_srng_clear(ab);
>  
>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>  
> -	ret = ath11k_hal_srng_init(ab);
> -	if (ret)
> -		return ret;
> -
>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  
>  	ret = ath11k_core_qmi_firmware_ready(ab);
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index b32de563d453a..dafa9bdbb3d32 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1359,6 +1359,18 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>  }
>  EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>  
> +void ath11k_hal_srng_clear(struct ath11k_base *ab)
> +{
> +	memset(ab->hal.srng_list, 0,
> +	       sizeof(ab->hal.srng_list));
> +	memset(ab->hal.shadow_reg_addr, 0,
> +	       sizeof(ab->hal.shadow_reg_addr));

nit: I would add comment here that no need to memset rdp and wrp memory since each
individual segment would get cleared when

ath11k_hal_srng_src_hw_init()
	*srng->u.src_ring.tp_addr = 0;

and
ath11k_hal_srng_dst_hw_init()
	*srng->u.dst_ring.hp_addr = 0;

> +	ab->hal.avail_blk_resource = 0;
> +	ab->hal.current_blk_index = 0;
> +	ab->hal.num_shadow_reg_configured = 0;
> +}
> +EXPORT_SYMBOL(ath11k_hal_srng_clear);
> +
>  void ath11k_hal_dump_srng_stats(struct ath11k_base *ab)
>  {
>  	struct hal_srng *srng;
> diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
> index 601542410c752..839095af9267e 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.h
> +++ b/drivers/net/wireless/ath/ath11k/hal.h
> @@ -965,6 +965,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
>  			  struct hal_srng_params *params);
>  int ath11k_hal_srng_init(struct ath11k_base *ath11k);
>  void ath11k_hal_srng_deinit(struct ath11k_base *ath11k);
> +void ath11k_hal_srng_clear(struct ath11k_base *ab);
>  void ath11k_hal_dump_srng_stats(struct ath11k_base *ab);
>  void ath11k_hal_srng_get_shadow_config(struct ath11k_base *ab,
>  				       u32 **cfg, u32 *len);

other than the nit:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

