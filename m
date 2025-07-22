Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F978C83F25
	for <ath11k@archiver.kernel.org>; Tue, 22 Jul 2025 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BjM9ebfFLsQQcZe6TQ0vgUH4ajpI01hnGqNMGuQ5N4=; b=gNav+NesnhrNyFeNyzauRvbuAD
	5R55BzTXX+Dh3DbVL6ZJU0EBcklM3zkGavMnyYCIvK9wqXhqrfBBCuSX1VMaJhJ60x9IUHc1s/CMX
	73RAykpcl1Yv8LeiJHZW+JUBHgyGiVBx7W1S5WKRY5CKZOrl+RlTkcgpoNRhR631mbi82NxKRXuBi
	wX9jWbKpqmzE7vaC81nvx5PYCwMvX+vLLKJtJO0ORhft+Dvb8GX3S5LCX6e4CVjxY6rTzSS9OzTsB
	hIra7Cudb2Y58VP4YX8eddVx+CSRgIuKQMm6Q3cOAyLaxMEgGb9vYRw28VsP2/7yvc1DVtVWSmB2j
	j2HFsCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9cA-000000023fH-3iS3;
	Tue, 22 Jul 2025 09:48:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9bD-000000023XW-1G4d
	for ath11k@lists.infradead.org;
	Tue, 22 Jul 2025 09:47:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M2OqMn016582
	for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8BjM9ebfFLsQQcZe6TQ0vgUH4ajpI01hnGqNMGuQ5N4=; b=bNmGnpZBKEr/+gT+
	Gf7YHgqDyL36SAGt8rwfkfYdw1+m84Sa/N8PyIrOktbzpow0609ipmsdR8zbGoTT
	v20gVWNzdF5F8d1S5/4ZrXGo23r7sFMTaOlqcQKYZ91x58pk6XxlYQ7eDXQuwsF1
	7JKMJx8KI74TlvzC4Q5kn2Z1av2o+gkjjvgJVbFV4bfPMsXv0U39DF99xGajnJrf
	0Nq6ru8p/FDV0JMnSecEVJiSy6a2hyty7wM1416WdVdZPzOoLhxzD94KKWRXzOAo
	XXh+LF5n5HcQL6zVRZMZKqsK54dIISctG49NJF5SEfSQFKVqzbRolryju45TWIpO
	ABzC8w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s122k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 09:47:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-236725af87fso74373995ad.3
        for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 02:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753177669; x=1753782469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8BjM9ebfFLsQQcZe6TQ0vgUH4ajpI01hnGqNMGuQ5N4=;
        b=QhfiRmhOsmvHS3ljo07YnLC7mu/RqC9MuA3HJp7wiW2fOABTQY8asPb7fWNQOWviCy
         dNMmDCy1aZG9TUihc3vUbzMa2ycZvymMuaGGB8oIdp1l3VttxCmMUq8BRyIB3zFU9I0G
         5b+QFpZNbD66BmMmwhOTpAbiAwToyx63kfc9IVkA6ROQb5dlbbnSdt0ZQju5gPO0ItoE
         p3cJryryLhFATGkwRoseWzrusu2wlA/72Gy/96qr99yvKmus4KFZYgphlnQgyE9dbB19
         SJYTJ+BUICSKZ1lAYvdW4yW3oNDUmdBT3+syqC9UIxlVAP1F8wpXrDMXvhNuK5I5/H7l
         2M7w==
X-Forwarded-Encrypted: i=1; AJvYcCWG3BPwPSMI1mYZ5nx5srssjfZ7EEFrYlovo/6oaRXAbrokFMT91eEbAks+cCvC+/vQFyFQ4JA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1nhNm7By/8f80Q4OMD+q6lhFSIyB4d/PVDvODfnEVfLUSp2DX
	0GnTF7lDMptBjimSv11QXqqfRi1CaI6AxPXMlgKCk0rWpSZsAmc+N2zMgMf4RU35nX3fHL+yQGy
	+IAiHk6xIG1HgZ0TFSQCVGV4ZSutGWiROlZL/be2qSA3LZsrexL6M2Zw3NO17tusu
X-Gm-Gg: ASbGncvvbJc+FDQXgzmPe/n1jjAkTx4EBTVNXIEtbevs+lB/92OyxyNjlqBNgBhggNa
	15lWU2rW7GpRmZoLlyWY4W9IMRXp0Dy53CE/HcKAUiQZduv7Qx5BPtTz9Ej1Aghb4bLKWARKJVR
	wiaklIrGrZii/qDwwK8Ob+Nl8zsq0Aw7N76ZkFApjEHTEhmfh7J4LvDGjaDZQrKfDSNi18P8vJI
	fVLTIVjig62mCqPffzYhZFYeD2bLlYVWHcAWaq9sBUO9nx+5v5puXsI9DfzieJe/nqlGgjLtoe6
	lLLISyKdDH4MAgq5bOmrggleTb/DjVmUXbKwS7Rpso/G6XWi25SX7t2uSp4ON7lSx4V2xaNmO+3
	Fsxi31934uwHs2JHXCL7qz1IpN7NjufA=
X-Received: by 2002:a17:903:2d2:b0:234:c5c1:9b84 with SMTP id d9443c01a7336-23e3035f2eamr249469315ad.37.1753177668785;
        Tue, 22 Jul 2025 02:47:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb4WZW5dxHh8zGqRjkvN4xW3CSAyaaR3EwQbz0e6h/H5rEz1JsDrBRAu/UMYCUGTF2EEQHYA==
X-Received: by 2002:a17:903:2d2:b0:234:c5c1:9b84 with SMTP id d9443c01a7336-23e3035f2eamr249468855ad.37.1753177668301;
        Tue, 22 Jul 2025 02:47:48 -0700 (PDT)
Received: from [10.133.33.45] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef9aesm72272625ad.211.2025.07.22.02.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 02:47:47 -0700 (PDT)
Message-ID: <1598d25d-e254-410e-ac5c-66d5450fd686@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 17:47:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: HAL SRNG: don't deinitialize and
 re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        kbuild test robot <lkp@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
        Sven Eckelmann <sven@narfation.org>,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Cc: kernel@collabora.com, stable@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Miles Hu <milehu@codeaurora.org>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250722053121.1145001-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250722053121.1145001-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4MSBTYWx0ZWRfX4gUihEHECyLK
 oOv1pzg9W5nLJORWTJC4NLA90rGT4ffOQysdAf3TvPDfrd3TLlWVwFeSpqDLZmrW/dgyN2iAj+A
 2+5vUa2tnGmo/VgyAJe7sF1UHtRqHeVrX51nMJAW3bkOP1xc59cDmNEPZ1e0nqw/nd0LwhovcEf
 v+6pMxTlQX5DrHY600ONcdZXbeDvSxyR9qxAfEdILVaby5ThHkoWWyr6SgQ6+BZ75I0EROlgh68
 e+u4PLAxOw2nT/5qxBBPxqqdZ/U5GHTheVwLN5Tf0xWBLCcpBRDIa0E9QLrILBJXLi25pybji7r
 C5oe7B4UvGisRxkezZMqm13uyO9FGOYlJt2U2JttTkn6xPUI2Y+V6XvAj5Q527euCyJDB8kngK5
 nn+DUOV8lrUYH7KkXTqzi0MBWYz7DUDPejVtE43NqgsIF/rbReXeu4cvsZPu3Je9WyvJNOVc
X-Proofpoint-ORIG-GUID: Cej54yLpb5JEfLCOlIspfiuzDR4fBexe
X-Proofpoint-GUID: Cej54yLpb5JEfLCOlIspfiuzDR4fBexe
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687f5e46 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=FO1u493g7a1ack9Z5SAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_024751_464593_6CF7C570 
X-CRM114-Status: GOOD (  22.60  )
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



On 7/22/2025 1:31 PM, Muhammad Usama Anjum wrote:
> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org
> Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since v1:
> - Cc stable and fix tested on tag
> - Clear essential fields as they may have stale data
> 
> Changes since v2:
> - Add comment and reviewed by tag
> ---
>  drivers/net/wireless/ath/ath11k/core.c |  6 +-----
>  drivers/net/wireless/ath/ath11k/hal.c  | 16 ++++++++++++++++
>  drivers/net/wireless/ath/ath11k/hal.h  |  1 +
>  3 files changed, 18 insertions(+), 5 deletions(-)
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
> index b32de563d453a..e8ebf963f195c 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1359,6 +1359,22 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>  }
>  EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>  
> +void ath11k_hal_srng_clear(struct ath11k_base *ab)
> +{
> +	/* No need to memset rdp and wrp memory since each individual
> +	 * segment would get cleared ath11k_hal_srng_src_hw_init() and

nit: s/cleared /cleared in/

> +	 * ath11k_hal_srng_dst_hw_init().
> +	 */
> +	memset(ab->hal.srng_list, 0,
> +	       sizeof(ab->hal.srng_list));
> +	memset(ab->hal.shadow_reg_addr, 0,
> +	       sizeof(ab->hal.shadow_reg_addr));
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


