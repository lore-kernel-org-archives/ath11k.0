Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D0DCCFA04
	for <ath11k@archiver.kernel.org>; Wed,  5 Nov 2025 02:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z82SbUtYiowhkxe7KgzgwLjWQMrm7JLfiBO5E0UsegI=; b=GoVK4ZqaSXtlH68kRDW3WtwscN
	g1ZNV0NwE+JRO/+Cd/SZKrFPgFigGc02C4GRuFUjDFYMCzZ/XRra+/YrjJB4xrb4T7jlngwANAXTe
	bVe48oPdyFw60NQ2bf3X8M1kb3BGSIGmPk1uhUG0JeQm+TnvDpiofODDlUEd3V31ZHWZdfgwNDDsH
	GKccBF9KEGutKPlLtCIS1u68QVCJywm1PjONyqTCll4fDwk8lGhkLUcI2oNBx6fGu+F/xw6H5CQOr
	S/XryufEjQ+kgEpcpvSxh7snPZZlDCuoch7HA20K5tzYTC/RY7BttoFWmTguzzNmEfsFxxiusa70c
	W9o2/qtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTS0-0000000CutR-1Li0;
	Wed, 05 Nov 2025 02:40:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTRx-0000000Cut0-1oep
	for ath11k@lists.infradead.org;
	Wed, 05 Nov 2025 02:40:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfnaX2967309
	for <ath11k@lists.infradead.org>; Wed, 5 Nov 2025 02:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z82SbUtYiowhkxe7KgzgwLjWQMrm7JLfiBO5E0UsegI=; b=EHeQhTrmpw09NDfx
	4muN/DAkeBwYbImq0BluHCo9G0IjWiXdviFtfODZiYFWYxHaw+DvRC92mNfJAwJi
	6I7lruuckhjJNEf1Hsr2DT4Q3a5E6KRfTklUrqSswEmc7odC3HU1pN0tY/3sWu+k
	ip44eTRjY1oPUDVaztRH/gxOlrCuhpea3/HH364rrNXKHjVav4DipFD0tNtTD31b
	5CMgNYFhj6o8JZjVui+s+P0VhJ84Mu+IytCdDFqVC93/8uCXmS+Mhv0Hrk0SOsGZ
	8WHZU8JrizA57AO4FhbEgWT8gNo9jXFP9+w2DPbI9Y8Sx5XEp+ZovUCP44T6b6Au
	ff6DUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7heajb1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 02:40:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso10563772a91.2
        for <ath11k@lists.infradead.org>; Tue, 04 Nov 2025 18:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762310439; x=1762915239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z82SbUtYiowhkxe7KgzgwLjWQMrm7JLfiBO5E0UsegI=;
        b=jbty/PEJ724oN1O/6joqVCHBbjSeVqnT9ApUBxy84g8WsfzUCUYelkJKHeilF9xM/5
         UhnN8JhZoig41io3VM/kerJQGdjBBsuwjhBFQ6+QXGyD/uaIwlb1n5USfaFJOtFuwSis
         aGnzUYXc72VLk1L0b4+M4f6q1HhMxRUs9j9Kauaj0qfruCqem9iQ/a8K3AjwJ+uXI5dm
         cmgjdWqjEL+Mzg6BwS86dXXMK5Pylhj4xTxIogfkau6FiIUzyd4MTRbyLCDzqyBOGLLw
         m13cE8HghNsXkcTpG1JvAnrYR/hH1U3NDZpO2ZA7XRiy+TzktPQLKK3d8Yj2c9axsAZA
         IRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762310439; x=1762915239;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z82SbUtYiowhkxe7KgzgwLjWQMrm7JLfiBO5E0UsegI=;
        b=EBfOOx69TisII/SFmkZGVc8XRd+fj+SxsAxXfY4L7Mge4jVs+t8s3joLaGn0G34qMr
         gh+IoPzx3jUnn6kPAisYs91GkzxGspk0NoYVGGDc5aeZcGx0Rz62sXvjy0i0Zu50Cakv
         wpKnL2RLKwPaxGXToYZN1zH3reR3X2dSj+imgRtQoIGRzutAA4TDvDYKeogfCIRm7LiR
         R2Kb2bzK35Zj/pndki7px9x6wnBEQ6EcLndQkf785wERGUli3Wb2xCQLvFQ9YTdequLp
         qCaxqzmNT2Kh7A2pABsUWBLhK+/cxhYC39k1XjH+lSbeWjelyi2/l+2lXB0HSHeHLKbG
         J81g==
X-Forwarded-Encrypted: i=1; AJvYcCXoq9O5clkywfMzYX6rm3lvEPIHvN6OCFJ6BR3SnGwAkdEqXfktQvoC1YSHD8iQ84AhFFuPsDM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXvh6crepJHGfyEdjg/Vq6uvv1FEeihiPXUXTnuN9cYmWfIgZM
	d6ogphRue6LwiaX2C3iRuFVerDwmgVTnIUPturrq6h52rj+UYu/cxck2D1W4/dGRAKWVot61LUm
	tM3jQ70M1z++OG8unDxYXPs/B+YR7Tujr0pPthBwd94yyN9akCOJuT4gSRwVCcNJe
X-Gm-Gg: ASbGncskDVrzpiM0okNzZWaSvivialUDWIUKJq8DJfO1k46OzPrTCFfnGJBDpblql+/
	GkffmZt7k+ETEybXkZ6EmzSVCWnMtifMK8OhBR0pqELBc19AQ96UJ56635A12SB4sYvs1BrsC4h
	5SpAIumc9h5+2uOgJxmuehNuqA72KralkCMfUDPKsr1gPHY3p0mREOMxRfC3tzPF71RP5vgXeb+
	gO5oSQxeCtdy1rMojV7/rjg2NbX7ZcJlFPHOKPu3fppwCwgccjJKSxq+TRb9Km1PnLta05x+4KP
	fRgJ9OqDWkt8eFGEgexNdcQ7+760KS2wBpDXAwBtkfdV92tsherAQZItZAoEKhSASOIE1h9ndkB
	RXhEkXp46H1eIlc1foeZ530I/xx5RfS+IF3r4mWYLcb/ti9519pRcnkvolcg/H5dCJ/xOeMM=
X-Received: by 2002:a17:90b:3c08:b0:340:f05a:3eca with SMTP id 98e67ed59e1d1-341a6dc4b17mr1965629a91.20.1762310439056;
        Tue, 04 Nov 2025 18:40:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDuWiRwazftd6t2s4wdBPAp02THBe+Zs4XUJxxyHZqsHdFitgl1KE5K/oEAKb/kWJ93nt93g==
X-Received: by 2002:a17:90b:3c08:b0:340:f05a:3eca with SMTP id 98e67ed59e1d1-341a6dc4b17mr1965610a91.20.1762310438491;
        Tue, 04 Nov 2025 18:40:38 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba675d384f5sm121115a12.27.2025.11.04.18.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 18:40:38 -0800 (PST)
Message-ID: <809038ef-dd0b-4b42-9357-f4f0825a4857@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:40:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 1/6] wifi: ath11k: Add initialization and
 deinitialization sequence for CFR module
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20251104162633.3007874-1-yu.zhang@oss.qualcomm.com>
 <20251104162633.3007874-2-yu.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251104162633.3007874-2-yu.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GekaXAXL c=1 sm=1 tr=0 ts=690ab927 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9cJcMz6cYvtNARQ-iUYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAxNSBTYWx0ZWRfX8nXR4FxoMFAb
 97zidU/Xfd76W7m7hHU/+MsTSl7WM9nD1VbHjC5tv3GSIlTgIBxPuB/NB031PKgllqH5B8utrmK
 EzIJyTnmDFFjwMiJlYoOVX0qBXuWaex8wW2NOT+q2VgeWgx+OOr1+QYHmzjthK0QYZOSvvbvj7M
 m3TAs2P8Oq311iZdD4az9RcIoxJehj/ZPAvZzSJm6dio1wOELT3MSNIhi+kcloWvAO4UJQs3leo
 zGalF80H0J/HFtTswULPMWkG5Kdo4Y7ZNIWGt5EZA6uIBQw5h2HikmLNSCDVLFsftHTL4abFxBJ
 9fxjyEUkXxmhhB/DFbhgoqzj08zyxaQtVmMFeI8EKlV9AzfIGGM5YpLNxSHcwFkFVKOknNk0oyQ
 Y2446Do3WbLX8+B9LZ2gHmjmdeef6g==
X-Proofpoint-GUID: frSLAFlxvAqdlmisWPru3H8_HKvdVsZB
X-Proofpoint-ORIG-GUID: frSLAFlxvAqdlmisWPru3H8_HKvdVsZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_184041_495262_B917D854 
X-CRM114-Status: GOOD (  34.26  )
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



On 11/5/2025 12:26 AM, Yu Zhang(Yuriy) wrote:
> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> 
> Channel Frequency Response (CFR) module will be initialized only when
> the following criteria passes:
>  * Enabled CFR support for the hardware through the hardware param
>    'cfr_support'
>  * WMI service enabled for the CFR support
>    'WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT'
> 
> Also, provide a configuration option CONFIG_ATH11K_CFR to enable CFR
> feature support during the compilation time.
> 
> CFR module initialization includes Direct Buffer(DB) ring initialization
> where hardware uses the DB ring buffers to copy CFR data to host.
> Number of buffers and buffer size of the ring is based on the DB ring
> capabilities advertised by the firmware through WMI service ready.
> Also ring configurations are sent to firmware through
> ath11k_dbring_wmi_cfg_setup().
> 
> Predefine ath11k_cfr_dma_hdr, ath11k_look_up_table, and ath11k_cfr
> structs and fields for subsequent patches.
> 
> Tested-on: IPQ8074 hw2.0 PCI IPQ8074 WLAN.HK.2.5.0.1-00991-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Co-developed-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/Kconfig  |  11 ++
>  drivers/net/wireless/ath/ath11k/Makefile |   1 +
>  drivers/net/wireless/ath/ath11k/cfr.c    | 160 +++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/cfr.h    |  84 ++++++++++++
>  drivers/net/wireless/ath/ath11k/core.c   |  41 +++++-
>  drivers/net/wireless/ath/ath11k/core.h   |   8 +-
>  drivers/net/wireless/ath/ath11k/dbring.c |  40 ++++--
>  drivers/net/wireless/ath/ath11k/dbring.h |   6 +-
>  drivers/net/wireless/ath/ath11k/hal.c    |   3 +-
>  drivers/net/wireless/ath/ath11k/hw.h     |   5 +-
>  drivers/net/wireless/ath/ath11k/wmi.h    |   1 +
>  11 files changed, 343 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
>  create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h
> 
> diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
> index 659ef134ef16..47dfd39caa89 100644
> --- a/drivers/net/wireless/ath/ath11k/Kconfig
> +++ b/drivers/net/wireless/ath/ath11k/Kconfig
> @@ -58,3 +58,14 @@ config ATH11K_SPECTRAL
>  	  Enable ath11k spectral scan support
>  
>  	  Say Y to enable access to the FFT/spectral data via debugfs.
> +
> +config ATH11K_CFR
> +	bool "ath11k channel frequency response support"
> +	depends on ATH11K_DEBUGFS
> +	depends on RELAY
> +	help
> +	  Enable ath11k channel frequency response dump support.
> +	  This option exposes debugfs nodes that will allow the user
> +	  to enable, disable, and dump data.
> +
> +	  Say Y to enable CFR data dump collection via debugfs.
> diff --git a/drivers/net/wireless/ath/ath11k/Makefile b/drivers/net/wireless/ath/ath11k/Makefile
> index d9092414b362..b1435fcf3e1b 100644
> --- a/drivers/net/wireless/ath/ath11k/Makefile
> +++ b/drivers/net/wireless/ath/ath11k/Makefile
> @@ -28,6 +28,7 @@ ath11k-$(CONFIG_THERMAL) += thermal.o
>  ath11k-$(CONFIG_ATH11K_SPECTRAL) += spectral.o
>  ath11k-$(CONFIG_PM) += wow.o
>  ath11k-$(CONFIG_DEV_COREDUMP) += coredump.o
> +ath11k-$(CONFIG_ATH11K_CFR) += cfr.o
>  
>  obj-$(CONFIG_ATH11K_AHB) += ath11k_ahb.o
>  ath11k_ahb-y += ahb.o
> diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
> new file mode 100644
> index 000000000000..73ffe3510ffe
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath11k/cfr.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/relay.h>
> +#include "core.h"
> +#include "debug.h"
> +
> +static int ath11k_cfr_process_data(struct ath11k *ar,
> +				   struct ath11k_dbring_data *param)
> +{
> +	return 0;
> +}
> +
> +void ath11k_cfr_lut_update_paddr(struct ath11k *ar, dma_addr_t paddr,
> +				 u32 buf_id)
> +{
> +	struct ath11k_cfr *cfr = &ar->cfr;
> +
> +	if (cfr->lut)
> +		cfr->lut[buf_id].dbr_address = paddr;
> +}
> +
> +static void ath11k_cfr_ring_free(struct ath11k *ar)
> +{
> +	struct ath11k_cfr *cfr = &ar->cfr;
> +
> +	ath11k_dbring_buf_cleanup(ar, &cfr->rx_ring);
> +	ath11k_dbring_srng_cleanup(ar, &cfr->rx_ring);
> +}
> +
> +static int ath11k_cfr_ring_alloc(struct ath11k *ar,
> +				 struct ath11k_dbring_cap *db_cap)
> +{
> +	struct ath11k_cfr *cfr = &ar->cfr;
> +	int ret;
> +
> +	ret = ath11k_dbring_srng_setup(ar, &cfr->rx_ring,
> +				       ATH11K_CFR_NUM_RING_ENTRIES,
> +				       db_cap->min_elem);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to setup db ring: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ath11k_dbring_set_cfg(ar, &cfr->rx_ring,
> +			      ATH11K_CFR_NUM_RESP_PER_EVENT,
> +			      ATH11K_CFR_EVENT_TIMEOUT_MS,
> +			      ath11k_cfr_process_data);
> +
> +	ret = ath11k_dbring_buf_setup(ar, &cfr->rx_ring, db_cap);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to setup db ring buffer: %d\n", ret);
> +		goto srng_cleanup;
> +	}
> +
> +	ret = ath11k_dbring_wmi_cfg_setup(ar, &cfr->rx_ring, WMI_DIRECT_BUF_CFR);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to setup db ring cfg: %d\n", ret);
> +		goto buffer_cleanup;
> +	}
> +
> +	return 0;
> +
> +buffer_cleanup:
> +	ath11k_dbring_buf_cleanup(ar, &cfr->rx_ring);
> +srng_cleanup:
> +	ath11k_dbring_srng_cleanup(ar, &cfr->rx_ring);
> +	return ret;
> +}
> +
> +void ath11k_cfr_deinit(struct ath11k_base *ab)
> +{
> +	struct ath11k_cfr *cfr;
> +	struct ath11k *ar;
> +	int i;
> +
> +	if (!test_bit(WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT, ab->wmi_ab.svc_map) ||
> +	    !ab->hw_params.cfr_support)
> +		return;
> +
> +	for (i = 0; i <  ab->num_radios; i++) {
> +		ar = ab->pdevs[i].ar;
> +		cfr = &ar->cfr;
> +

don't you need to check whether the radio has WMI_DIRECT_BUF_CFR capability just as what
is done in the init path?

And for the other functions where CFR is involved, do we need to check it as well?
Checking spectral feature which seems to be similar to CFR, there is a 'enabled' flag
there indicating whether this capability is supported and initialized, maybe we need it as
well?

> +		ath11k_cfr_ring_free(ar);
> +
> +		spin_lock_bh(&cfr->lut_lock);
> +		kfree(cfr->lut);
> +		cfr->lut = NULL;
> +		spin_unlock_bh(&cfr->lut_lock);
> +	}
> +}
> +
> +int ath11k_cfr_init(struct ath11k_base *ab)
> +{
> +	struct ath11k_dbring_cap db_cap;
> +	struct ath11k_cfr *cfr;
> +	u32 num_lut_entries;
> +	struct ath11k *ar;
> +	int i, ret;
> +
> +	if (!test_bit(WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT, ab->wmi_ab.svc_map) ||
> +	    !ab->hw_params.cfr_support)
> +		return 0;
> +
> +	for (i = 0; i < ab->num_radios; i++) {
> +		ar = ab->pdevs[i].ar;
> +		cfr = &ar->cfr;
> +
> +		ret = ath11k_dbring_get_cap(ar->ab, ar->pdev_idx,
> +					    WMI_DIRECT_BUF_CFR, &db_cap);
> +		if (ret)
> +			continue;
> +
> +		idr_init(&cfr->rx_ring.bufs_idr);
> +		spin_lock_init(&cfr->rx_ring.idr_lock);
> +		spin_lock_init(&cfr->lock);
> +		spin_lock_init(&cfr->lut_lock);
> +
> +		num_lut_entries = min_t(u32, CFR_MAX_LUT_ENTRIES, db_cap.min_elem);
> +		cfr->lut = kcalloc(num_lut_entries, sizeof(*cfr->lut),
> +				   GFP_KERNEL);
> +		if (!cfr->lut) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		ret = ath11k_cfr_ring_alloc(ar, &db_cap);
> +		if (ret) {
> +			ath11k_warn(ab, "failed to init cfr ring for pdev %d: %d\n",
> +				    i, ret);
> +			spin_lock_bh(&cfr->lut_lock);
> +			kfree(cfr->lut);
> +			cfr->lut = NULL;
> +			spin_unlock_bh(&cfr->lut_lock);
> +			goto err;
> +		}
> +
> +		cfr->lut_num = num_lut_entries;
> +	}
> +
> +	return 0;
> +
> +err:
> +	for (i = i - 1; i >= 0; i--) {
> +		ar = ab->pdevs[i].ar;
> +		cfr = &ar->cfr;
> +

same here
> +		ath11k_cfr_ring_free(ar);
> +
> +		spin_lock_bh(&cfr->lut_lock);
> +		kfree(cfr->lut);
> +		cfr->lut = NULL;
> +		spin_unlock_bh(&cfr->lut_lock);
> +	}
> +	return ret;
> +}

