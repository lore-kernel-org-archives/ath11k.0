Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED84FC83038
	for <ath11k@archiver.kernel.org>; Wed,  2 Jul 2025 03:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B32luW0Sw1ltGtcSblfZe+j06KEyJ9zkhx3k4IlmlpI=; b=uVj/OsOG8Y5B3dK6SBUh17TeqL
	Edtuj2KTKkytweAb8bw14KpA0E20zzM6dY/Tcmf7sNVTjHnRSnuC7TzHoErZZ0VP9tRpAWn6DJmSF
	LXe463xLsrPKJ9HrA35qX5aEpn6er0fxWxT1OEUigO51U+T+D4C3HlzhHWf5mjPNkbdk0HjZfTRjA
	jaiqhr8pBr9hr5ZC1+MC3lsVdMyzGnXpTymwWLMHMJ2zdh6ezpqOc+6rP0IhliNEMXx4GU1Ut4W/b
	tJXCQRd0wUlX0f50oiqREQltoCmyxwAK6Kd8PhZnujOFhCOeOLOPsD3cy9nbhBLqQogS0F/B3WBaT
	EzgC5c8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWoUy-000000079O4-1uMH;
	Wed, 02 Jul 2025 03:51:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWoUv-000000079NR-02zP
	for ath11k@lists.infradead.org;
	Wed, 02 Jul 2025 03:51:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561HT88s032421
	for <ath11k@lists.infradead.org>; Wed, 2 Jul 2025 03:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B32luW0Sw1ltGtcSblfZe+j06KEyJ9zkhx3k4IlmlpI=; b=FEi30UPUuoSGSfRf
	M9U5f/XhyVi/oUJ6zB5wflNxRDXDrApWQx1lDehRQjn8KmSxvQflv+4Cpoz8mZgT
	PPAU++VyU+CMsAlbqwV/FtWKlCfGdm3R7QWpNRGD2XZDp7AZbHFuKubOJFkdYafn
	qu/CzqXA7gCXNmA6CtNs+pyJmEvBuT9Ai41s0Q28hyLiJvrLFe+22B9fTQ3Ko4em
	ebX8SFOCZoGe+e2v8tCOlQ2aa4JngI8nlKjjxvIeNkJS6wJ5KoprBC5h4lC2AEtQ
	uusM6OyG9Pgc6pkZ7NKJGo51Jvkjc2Mxw7zZbRuKqmxTtoPM9UxlDIxYivGoTqSl
	ekaZNA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kb4w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 02 Jul 2025 03:50:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3183193374so3103072a12.1
        for <ath11k@lists.infradead.org>; Tue, 01 Jul 2025 20:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751428259; x=1752033059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B32luW0Sw1ltGtcSblfZe+j06KEyJ9zkhx3k4IlmlpI=;
        b=qXXi7Wlt3ITZyU5Qu9tPhOFsgjfMSQqHDr2zmi3GOfOQrP0+fvmuLJbp3PA5Sju0uL
         9dEsqA0RZRJY7p295HcIpL1BweAMLEfpOHdWpCgLVOMdLrO1ZtX3ESvb6LjnP66kHqxQ
         eFE1jDpbQss1QsCg379O54FZ8w1t0HDDQrk1J/Xpas7QeDlJXJVNOHGwj6MM+8402GJ7
         qlVb60t+cRdrQE++CWnTbnSOBrzyQF3qsv6TPxWbrRia+kITJU59Srom6VPXuagXxRos
         +DJrMX12MCFb8eHUZtWTXVdDpiOPm3sqSHgBi0xfC44HIodKKfg2RwCGizhVAwyB6oQq
         Pkfg==
X-Forwarded-Encrypted: i=1; AJvYcCWHwqAIVEb8SBIrJGfqXGg2qIk6+lkaBfNldD+nj3+aK+h/+HxubFr7yf1eIqWNWpRTESGO73c=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg5NQtE+qO/T3ISvUVeBnNL6A4fwte32qUUHwY1swSPNkjoHf9
	t816/7Pb+wDkWiUcAWXS05kTlpz6yY9aLyzUTcrzSnZkLQRvFi6x1U9//bQOE2IZ95yZqQfrR7H
	wSCKV6x0LwlA9324N7jeL4RAwX+5AqMtvkCRiD1f66HYCXzpgqkLkIULH45iLaaZV
X-Gm-Gg: ASbGncvWjO1m+EODONaS/YSh7EX0B7fNPsy7dNrceeMX8Z4+7y/NbUZZql2qCJ68BvN
	GUrH8bw03ps5aCV2yBtfpttiCnoZVzJAfVpuR9NO3F+fSxAFsbiriP8fkxMqfRdVSepU24JO27h
	hPAKofY/qaYfvqdPI2HE/F6bLyU7qHG85OK8Gdo2/9YouYl1/w4772PZEziFo0MfVxM26b9ze2E
	QO25uOaijTxsq2cULTwzeTNMV8ZgHykA4378pdAgBB45s4+HiJP8NP4WKTFwDSOvxFHNGh6I33y
	wGhDSrEpCYFntJw9tiBnCW74fBrtPD27x3LDeH10UZscYnIJl20YdkC6MqXHcUxnEH+Ji3zYUzE
	pkaoyeynsgOuhS6I=
X-Received: by 2002:a05:6a20:7350:b0:222:c961:af1d with SMTP id adf61e73a8af0-222d7dc49eamr2846934637.8.1751428258819;
        Tue, 01 Jul 2025 20:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8idSmfFKyDABY7yM0MVRpAAZkjEtC9DI11EGGNuOUHqgZpQyGDn56ZzZiQmPlDfFVsxkK9g==
X-Received: by 2002:a05:6a20:7350:b0:222:c961:af1d with SMTP id adf61e73a8af0-222d7dc49eamr2846895637.8.1751428258347;
        Tue, 01 Jul 2025 20:50:58 -0700 (PDT)
Received: from [10.133.33.132] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300994asm11767768a12.3.2025.07.01.20.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 20:50:58 -0700 (PDT)
Message-ID: <5f2a900a-3c8e-4b16-bd91-500af7d0315e@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 11:50:51 +0800
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
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250630074330.253867-3-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6864aca3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=UYPn-Rg_fxiY8il1LgUA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDAyOSBTYWx0ZWRfX6CH7xqtrYHF8
 Y/6sahSSD0CszoQjH3AMggthPe+RTqgMWqS02D/96B067qrxRnrAmYKaxG9ThL/+a1vFSNVT9uK
 fL+N32QoH9CSNLQi4kDYsRaZBtoBOpHy+EWKTz2cKTWRiKjuqy5DRqMkIGvumVV2TR/dFaKLL9A
 xKYVLSn/dfGj6LcyMTDAr9E8lNaRGzaNFaks3j2F1fTH8PtQBSaLVaB6RkkSsumXfOAtXa3cXw8
 J7psk8z+G7+eu8ZDEo8UB7QYu5rlUPyiVhgIfj2u92EPMHMSX1g1sGcA4pKwPzP8sO1G9wxQrF4
 YT8c8oNK1zw/KDvJ4jzW+uqKCKzRNGVTWrFLwXY/7S+kZHvagfbSRT3gv47Oeqoamoeddngwsdd
 6xkhG2EcWz/u1okqndoOfPIXi4ga08Buv6Rkjh4C8wgs8svDOJ4MhCuL7KWaWdbzNGzQtrcH
X-Proofpoint-ORIG-GUID: du5cLhNjpvAV6tEzPYzbHXtuBD-n9wAt
X-Proofpoint-GUID: du5cLhNjpvAV6tEzPYzbHXtuBD-n9wAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_205101_068285_9EC95FE4 
X-CRM114-Status: GOOD (  21.38  )
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



On 6/30/2025 3:43 PM, Muhammad Usama Anjum wrote:
> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
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

while I agree there is no need of a dealloc/realloc, we can not simply remove calling the
_deinit()/_init() pair. At least the memset() cleanup to hal parameters (e.g.
avail_blk_resource, current_blk_index and num_shadow_reg_configured etc.) inside the
_init() needs to be kept as the later operation needs a clean state of them.

>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  
>  	ret = ath11k_core_qmi_firmware_ready(ab);

the _deinit() is still getting called in case ath11k_core_qmi_firmware_ready() fails,
making it a little odd since there is no _init() anymore with this change, though this is
the way of current logic (I mean the hal is currently deinit in the error path).

Thinking it more, if we hit the error path, seems the only way is to remove ath11k module.
In that case the _deinit() would be called again in ath11k_pci_remove(), leading to issues
(at least I see a double free of hal->srng_config). But this is another topic which can be
fixed in a separate patch.


