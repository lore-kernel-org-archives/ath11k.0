Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D291C7EE30
	for <ath11k@archiver.kernel.org>; Tue,  1 Jul 2025 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGmB+YfykJEgHd/lXi7FY+QDtnoGkDNaBJlLAV3kCVQ=; b=Zwvrp9RFagr4DV9wzlAX+QDCrt
	2e6WYxknogLAvuIkrfau57ThJrzJTx4t0vkc85EfALVCqxIG97upN05Z7sgDNvSAuLiol5hkoXz8F
	Vu6uP3PY9CFU0u9KZfgSjUtr9GCfRCf8nFBCw+WmeRnJ7Tqrm3wKELiI6/ZSceCZ+SH6yMuBi1NmW
	TkplgGNGYvZLcZJM4w1OuHSkeitvC0ugduzt+TTiMzNHe3Ipd6k17V3hIejvtR1+zwyd/21YUYq9d
	cbLvBzwMLVOFxubS/TfyAkBItJMWzcShskwunxEiLXMvawgYw47Hyxz0pI+u0Hc9YgUK7H/8h8ksZ
	ioYaM23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdmW-000000061qf-1PUN;
	Tue, 01 Jul 2025 16:24:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcIg-00000005lyM-0bLq
	for ath11k@lists.infradead.org;
	Tue, 01 Jul 2025 14:49:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A1Kxr026279
	for <ath11k@lists.infradead.org>; Tue, 1 Jul 2025 14:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGmB+YfykJEgHd/lXi7FY+QDtnoGkDNaBJlLAV3kCVQ=; b=kUEXXjWRWGbQa9Qr
	r003MGh6bnCm/U9M6kQDeZMtgTiFPgdiyzAxD/uqG0MkynGqevwcoXh6SnT5nM4O
	TJRcpGDH6GCbbUN/R3l4ReqRfSmbecTz3FyiaUCYkA42H+vqZR7IdkCSEdgp2eme
	QSm2NMRKJjpj2S7RL3m10Xrw42NuUrb0E3zW8lbv3bVztyRNgT9ERSexM9AEfQel
	pUgezVzsK5OirGkybTbMz6flVssAKmep+jmdCn48johrd2u26d0aW4GK0Zq7qS4J
	2cZ2Yoojq1GoG8wGU8yZHFk1Pzs19Aeg1hXXnG9qjDIGzP7XxiT2rflPjRGwLWtR
	festrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64phmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 01 Jul 2025 14:49:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23638e1605dso21607155ad.0
        for <ath11k@lists.infradead.org>; Tue, 01 Jul 2025 07:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751381372; x=1751986172;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGmB+YfykJEgHd/lXi7FY+QDtnoGkDNaBJlLAV3kCVQ=;
        b=NB/A0RvYi9k1IcdxomSVnn+QI2l6hqKW/FSjeFSWWQnGYkI39i64/gvpOXoCz6+wg2
         NShdsPT+4TvHN+vjmYdVEGsiauNuMc2RITUb4lHOkgrcmZ4dRDP+6ul/8V9gAl4EQkVQ
         YZg5qMfFAMMvJXb9bw6tOUU3/fXfncpGIRhHwARHo0ErH0eHbJghiDVPZZAJR9k460ml
         h79aY9lUMhFvbfaZnVbUMl9vFyh1aYYHH0jL4PYESgRMKrCzasomL13NoiKMeomW82+V
         5k/JZWF8z8QGSJSpp5IWuMdh8lm0pC4/4UZmkN6c6DQYHFRwfJMBHKtIVvVNSq4dfLM/
         lufA==
X-Forwarded-Encrypted: i=1; AJvYcCUOeGX76REUvOm6aO+pDZ5uRfozc8lPCFEX7grOq8k2A/VGtkg1uut8JEMOXlRq0AiZzkN3X0U=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPMdMrMX2cqrQ9vdyTyGSdgB/yn8vs/aawyV8qpsXADCLqQ5rd
	U2t0bwcNYXIekxXmEs/LKoJd6PUfnD62doNs9pW6IjkWAaW+y4/07RGeqh2NtRnGgPHwrkRqtqH
	KZJfsaYc3u0Tfa62ATkbU57PpNY+ugtMhmSQoS0SD+pmmylABelXAaLdrNrpvDQFi
X-Gm-Gg: ASbGncucLUDvWkzr0wJZV/xwqOs9TVhAfyFRW03XbN8FmaVARf+5eDT/2bCOW96/mtG
	e76Zs1nx9W3YkZoPzs5B1UlPznWHsAKvRMvfwhQYYpMhS26Bd2hxD+fjbUV8evD7hms2cSS1VXk
	aoc+LvZZWkS8NSHubAYwehnrUU/V36om6cuwGjL14Q902c77FRbhiUjbdjQx6uckWsyfNXyxUlI
	841nZ3xDKuudgVrS4XZZvXR+O6uKTSeUWEwcMAvDu0Ik/qyF4dKleHdbLOh32WQJnWXcxuvW/Vy
	TtO0t7ytvvb7WHTkdvog5zQnBV7q0bfJeJnNqr67UkefuCal1DthDOQEDvLxGUGSnE6kR/EorpZ
	aovL2xQV8ljjwPGc=
X-Received: by 2002:a17:903:2ece:b0:236:9dd9:b75d with SMTP id d9443c01a7336-23ac4606753mr303424385ad.40.1751381371770;
        Tue, 01 Jul 2025 07:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp1Ad/hhib51T+HK2hWQlQ5i/UENf7EU+ytKDeILLwtSvTV3KWZcptdDryg6BFVQuicGgoIA==
X-Received: by 2002:a17:903:2ece:b0:236:9dd9:b75d with SMTP id d9443c01a7336-23ac4606753mr303423845ad.40.1751381371312;
        Tue, 01 Jul 2025 07:49:31 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b001csm106117515ad.154.2025.07.01.07.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 07:49:30 -0700 (PDT)
Message-ID: <855ae20a-3675-4cce-b87d-6f25fb69e0a8@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 07:49:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250630074330.253867-3-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6863f57d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=IWbF6JPFI0dN2yP9E1IA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA5NyBTYWx0ZWRfX88Oq8EIq5lGj
 73vPGCQnSX2W4qnDn6aM7knLgSYJaCu8dlCy6LOYzHsyCHelHd6L6TvBswme02txito8jm7F0W7
 DpTT1NKhvJLSyKK12ShXIcORyNbUU1Vqo6d+F9RpZUiJ6P0GxnXJkjw3TdksJ0xXoVws6gJ5GZ+
 GrST5hejTGdBDxm9HbY14KRj4+nqw/NcMUcNAAu6YLRTmC/frwRNXhGGvXMjLkK/NMNPXQ6tM8M
 DauQTm+QCkJw9B5HwxakAG28IN+CIiQgpBRSkiP7rNUXZfEdQgmoO63Rn4WLZm4iGbvW+burULs
 Ori2dI1FgH+/CP/V65puI2bSsTa9SUwQn/0oo40EhB9eIuSUFagm2ZHKIKeijN/VcRTqL/NYDJl
 KivNPffeyaIho4tx/AoTVa/iF/H1Ha4jw3K9Ol/eHbu+fTwPcuvmxO+In3WtWjneVZykOkvk
X-Proofpoint-GUID: Dtj080yGshT0NwqSVQMtmZT4S2FxROjF
X-Proofpoint-ORIG-GUID: Dtj080yGshT0NwqSVQMtmZT4S2FxROjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_074934_376669_298959E7 
X-CRM114-Status: GOOD (  19.92  )
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

On 6/30/2025 12:43 AM, Muhammad Usama Anjum wrote:

Subject has incorrect prefix, should be "wifi: ath11k: "

And ideally it should mention HAL SRNG since it is specific to that allocation

> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

not quite the right format since it is missing hw version and bus

> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 4488e4cdc5e9e..bc4930fe6a367 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>  	mutex_unlock(&ab->core_lock);
>  
>  	ath11k_dp_free(ab);
> -	ath11k_hal_srng_deinit(ab);
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

does this patch have any dependency upon the 1/3 patch?
if not, then it should be sent separately since it should go through the ath
tree instead of through the mhi tree.

/jeff

