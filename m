Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C316C2D0CD
	for <ath11k@archiver.kernel.org>; Wed, 21 May 2025 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AWSjmvL8UOKEaItDjz6HH1x/3m449Yejc7i2eBcYjw=; b=qa1R1klnho1Xo8HW0Za8QXah+V
	/F7bcLlvvE2LQXdcI0JBaSZfH9NQSwLHy2iJmloXAZLZiqkPzoONvrBeu375th4yrJ/nE2lTl0vqR
	nFwIXkLwvW1/W9zLsrZt9KlAEluIMarGDl8jvEefG5R6INjXAckg96CAWaUz8vo+t4qAWRmAhtduR
	of8x1tTtRb4EX1eqdW/8p5/i4FYNAnt2UtnMa23mEB6wOgyTYYjIYpZklKU4T+TJuXUycorcEF2jS
	MLeJ0Libv9mUmxNTar5XmQTTWJB+a8xjciInbvrzybtO1PDRbsdbBNx7ZY8edMoELxFp2C3FfZHmO
	+iirgrFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmN3-0000000GTQi-0gWX;
	Wed, 21 May 2025 16:32:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmN1-0000000GTQJ-11tJ
	for ath11k@lists.infradead.org;
	Wed, 21 May 2025 16:32:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XMD6029048
	for <ath11k@lists.infradead.org>; Wed, 21 May 2025 16:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AWSjmvL8UOKEaItDjz6HH1x/3m449Yejc7i2eBcYjw=; b=pax+QLP6S9zFWKsK
	oZnGOYmg+ucchKgOKgvQoBAKWjbh6IffjMpXB1+/J7XNT9Fr9I5ym4XdNqvD3Dd8
	gvjvAuIqr6InfjaPxQ4r4mB3SISyVUZZ1LO65OfGmG/6eQRGZpEKBG5NvD7j7dpE
	11YXv1wRFESDkX+aJyCjt+TmSSbIrx54fUXjjGwKuAwSgszDqJyizUtDvlp5WiHx
	aiL9ely3cO4wxL7UFyu/lvFSdk/6vnDNvcIhw8wgLtXhJoDhRVKsf3iR3LqIS/5E
	ZDvISGTN0jVCEygHHfOttKIJkN6TQcov9Ijr97vH2fCObHzjDD1tH0YtutP+KSg1
	YrGWZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf43n55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 21 May 2025 16:32:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23209d8ba1bso42068915ad.3
        for <ath11k@lists.infradead.org>; Wed, 21 May 2025 09:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747845161; x=1748449961;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2AWSjmvL8UOKEaItDjz6HH1x/3m449Yejc7i2eBcYjw=;
        b=tPJVbxQJ9JOwTMuJD0iYnh8dtCAUkSywa/RQgHBsSiPSyJ9ff9RgyyXH9f8dRI7f3B
         Gv+s9k+eu2IIO6WnodwP/wu0hV+7bYRg4v9hB8ikdpD6ZjPAe9xlHI0wB/9E8fnvy6Gg
         xT+dQZpthtx1lJnPk5CcGzmcjfUygVD11ioIIDJaLYKp9b1F+lDHpbx8rhwT76WI2Imu
         fQP+sRAl+IFjAkFCXdNoxDwpvpOEpTOOfkGjLEi5fhglxzXK32qqfO5ni2rSHoDEtdB7
         miaHM6pfDDA2RMalHyCBAK4tkLYNb+DL5Jtmm6DSnLjeKQIiIBv4FMyC2MDdVVT1Gvdd
         DPoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUasQst/DVgFboQaYrxZWn/aGUJFaJJIjHfz49EhfVtLQUi+G/xnyuobmPHDFwTgrInkUdk8ZQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAMw37VeHc7JVXysBuWMpKCrMVaw1Vyiyb/0wAYgE7SltcsdHB
	1u6dXtjLep+VngW4dj9RUi6C7rTerp3xej12zPVze94J8SF2f9GP9ViuH/YS893Yon+W7OpPpMp
	Xn+1x83G4odcVjqf7yMaS/pq/rX1XvZsTIPNM9l+6eAtsP3s3l/7l/mOg8IHtgMZe
X-Gm-Gg: ASbGncs5ke/Ln1KVOzB9krAUQPDu/QUAAe8T72aVfi6mnnkkJ3TUEsHNwLG7cBPfSBT
	34fgucfqHgw/Nor3YuEPIQNlEorS++SuXBjM2uGCWwveeAvwaQw+uX7ajVjFmVTlwFg97XE2Cag
	KuDRNE3egq2XD5UyqL1BxVrDPfMHpgsOFhS2VgrEFq6Am2TJJjjkMB6XqBssDwhhYcMEHIbEikd
	GC3GsH4QyKuU3Rv+xrD5IhyohGYD7YtsW74naHbq2JIuJrp0dCY4BJUrf0RcKObe1WILN45WsJM
	FCXIzpBvXIvcE/ri6Lq1MwC72cFHeax8QjGv7qARUmwEYpuHD0mjmogdLqHEhe/iK0ZP/xD/qbI
	uF2OU
X-Received: by 2002:a17:902:da8f:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-231d4596b56mr322270265ad.32.1747845160990;
        Wed, 21 May 2025 09:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdKyjAG6Yh76sFkeES+Qwd89CL8J26v9RhihIoMT+/tbXa2Wl10248eke96oBcvSp8H1i55Q==
X-Received: by 2002:a17:902:da8f:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-231d4596b56mr322269845ad.32.1747845160422;
        Wed, 21 May 2025 09:32:40 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebac58sm95190325ad.188.2025.05.21.09.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 09:32:40 -0700 (PDT)
Message-ID: <4f68159d-3d90-44fe-b932-511ff3fe7d55@oss.qualcomm.com>
Date: Wed, 21 May 2025 09:32:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ath11k: add support for dynamic vlan (ap/vlan)
To: =?UTF-8?Q?David_Rapa=C5=88?= <david@rapan.cz>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "jjohnson@kernel.org" <jjohnson@kernel.org>,
        "johannes@sipsolutions.net" <johannes@sipsolutions.net>
References: <DB6PR08MB26934CD2145BE9BC3DF6980ADF9FA@DB6PR08MB2693.eurprd08.prod.outlook.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DB6PR08MB26934CD2145BE9BC3DF6980ADF9FA@DB6PR08MB2693.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2MiBTYWx0ZWRfXwVhdCTEDB2zZ
 oUFL+uXDqDsplPzzel5QrKkyRuRA3/o1E4WbDoTmhV/53axysXdTmIsDE4851WCpw9sw8Xfa5xA
 HNJtH31OyNLdpKveeEDi4sPSWbgD2AYhJI9yxW35+GUKKZvsG0AEnq+anrL1zLLmG3YptivwHKX
 o7K24MKzk4tMC7v3xI1qB9byRF/ftNe1Sz412yVR3nom5vjvp6zKcCV6qbNyN2pEvmWpl4P9PqG
 dfmVJz9mZcaVQtPn3qXd5q5K8w2viqC7xwMVKeo1EKRN+rfmSCpdp23SWKUwTXADGWunyOJ+ydo
 4qmDxdQB10hKOLiChQr41gm7Y5ggBZVce/BXt2HG2H66dHrck3462R1IMkxdTljnWUl2WhMnJBf
 dxm0QbRKsLvTPnvo2MvSNknEpjyCKkViZCm4jmlOrhJ81p/LLK8Fr6HDYqOJk8m/6WpNGU9s
X-Proofpoint-GUID: TkqA9qm_UK_Y80_EaRRuindllkX9kS1n
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682e002a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8
 a=Gb8rUTl75BWT300021YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: TkqA9qm_UK_Y80_EaRRuindllkX9kS1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_093243_320041_270E3AF3 
X-CRM114-Status: GOOD (  37.30  )
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

On 5/20/2025 2:16 PM, David Rapaň wrote:
> ath11k currently lacks support for dynamic vlan (AP/VLAN), so this patch
> adds feature advertisement in '__ath11k_mac_register' alongside
> all the other neccessary components supporting its function, including
> prerequisites for software encryption of VLAN group traffics.
> VLAN unicast packets shall be taking 8023 xmit path if encapsulation
> offload is enabled and multicast/broadcast then 80211 xmit path.
> 
> Metadata info in dp_tx added to notify firmware that the
> multicast/broadcast packets are encrypted in software.

Use imperative mood in your commit text
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> 
> Changes since v1:
>  Move 'cpu_to_be16(ETH_P_PAE)' to earlier condition and add
>  'ieee80211_is_qos_nullfunc' check so QoS NULL Data frames are
>  properly send as open type frames with TID 7 in ethernet encap.
>  WIthout this change are as QoS Data with TID 0.

patch revision history goes after the "---"

> 
> Tested, long-term in production environment using OpenWrt platform
> installed on multiple AX3600 with FT.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-01385-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
> Signed-off-by: David Rapan <david@rapan.cz>

Who authored this code? You are submitting it as the author, but the S-O-B
chain implies Seevalamuthu Mariappan was the author.

> ---
>  drivers/net/wireless/ath/ath11k/core.h  |   1 +
>  drivers/net/wireless/ath/ath11k/dp_tx.c |  82 +++++++++-
>  drivers/net/wireless/ath/ath11k/dp_tx.h | 197 ++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/mac.c   |   3 +
>  net/mac80211/tx.c                       |  15 +++
>  5 files changed, 296 insertions(+), 2 deletions(-)
> 
> base-commit: ff8069c7cf3eb0fcd53adebdf341b6aaa98bdd3b
> 
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -120,6 +120,7 @@ struct ath11k_skb_cb {
>  	u32 cipher;
>  	struct ath11k *ar;
>  	struct ieee80211_vif *vif;
> +	u32 pkt_offset;
>  } __packed;
>  
>  struct ath11k_skb_rxcb {
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -79,6 +79,42 @@ enum hal_encrypt_type ath11k_dp_tx_get_e
>  	}
>  }
>  
> +#define HTT_META_DATA_ALIGNMENT	0x8
> +
> +static int ath11k_dp_metadata_align_skb(struct sk_buff *skb, u8 align_len)
> +{
> +	if (unlikely(skb_cow_head(skb, align_len)))
> +		return -ENOMEM;
> +
> +	skb_push(skb, align_len);
> +	memset(skb->data, 0, align_len);
> +	return 0;
> +}
> +
> +static int ath11k_dp_prepare_htt_metadata(struct sk_buff *skb,
> +					 u8 *htt_metadata_size)
> +{
> +	u8 htt_desc_size;
> +	/* Size rounded of multiple of 8 bytes */
> +	u8 htt_desc_size_aligned;
> +	int ret;
> +	struct htt_tx_msdu_desc_ext *desc_ext;
> +
> +	htt_desc_size = sizeof(struct htt_tx_msdu_desc_ext);
> +	htt_desc_size_aligned = ALIGN(htt_desc_size, HTT_META_DATA_ALIGNMENT);
> +
> +	ret = ath11k_dp_metadata_align_skb(skb, htt_desc_size_aligned);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	desc_ext = (struct htt_tx_msdu_desc_ext *)skb->data;
> +	desc_ext->valid_encrypt_type = 1;
> +	desc_ext->encrypt_type = 0;
> +	desc_ext->host_tx_desc_pool = 1;
> +	*htt_metadata_size = htt_desc_size_aligned;
> +	return 0;
> +}
> +
>  int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>  		 struct ath11k_sta *arsta, struct sk_buff *skb)
>  {
> @@ -97,6 +133,9 @@ int ath11k_dp_tx(struct ath11k *ar, stru
>  	u32 ring_selector = 0;
>  	u8 ring_map = 0;
>  	bool tcl_ring_retry;
> +	bool is_diff_encap = false;
> +	u8 align_pad;
> +	u8 htt_meta_size = 0;
>  
>  	if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags)))
>  		return -ESHUTDOWN;
> @@ -189,7 +228,12 @@ tcl_ring_sel:
>  
>  	switch (ti.encap_type) {
>  	case HAL_TCL_ENCAP_TYPE_NATIVE_WIFI:
> -		ath11k_dp_tx_encap_nwifi(skb);
> +		if ((arvif->vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED) &&
> +		    (skb->protocol == cpu_to_be16(ETH_P_PAE) ||
> +		     ieee80211_is_qos_nullfunc(hdr->frame_control)))
> +			is_diff_encap = true;
> +		else
> +			ath11k_dp_tx_encap_nwifi(skb);
>  		break;
>  	case HAL_TCL_ENCAP_TYPE_RAW:
>  		if (!test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags)) {
> @@ -208,6 +252,33 @@ tcl_ring_sel:
>  		goto fail_remove_idr;
>  	}
>  
> +	/* Add metadata for software encryption of vlan group traffic */
> +	if ((!test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
> +	     !(info->control.flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
> +	     !info->control.hw_key && ieee80211_has_protected(hdr->frame_control)) ||
> +	    is_diff_encap) {
> +		/* HW requirement is that metadata should always point to a
> +		 * 8-byte aligned address. So we add alignment pad to start of
> +		 * buffer. HTT Metadata should be ensured to be multiple of 8-bytes
> +		 * to get 8-byte aligned start address along with align_pad added
> +		 */
> +		align_pad = ((unsigned long)skb->data) & (HTT_META_DATA_ALIGNMENT - 1);
> +		ret = ath11k_dp_metadata_align_skb(skb, align_pad);
> +		if (unlikely(ret))
> +			goto fail_remove_idr;
> +
> +		ti.pkt_offset += align_pad;
> +		ret = ath11k_dp_prepare_htt_metadata(skb, &htt_meta_size);
> +		if (unlikely(ret))
> +			goto fail_remove_idr;
> +
> +		ti.pkt_offset += htt_meta_size;
> +		ti.meta_data_flags |= HTT_TCL_META_DATA_VALID_HTT;
> +		ti.flags0 |= FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_TO_FW, 1);
> +		ti.encap_type = HAL_TCL_ENCAP_TYPE_RAW;
> +		ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
> +	}
> +
>  	ti.paddr = dma_map_single(ab->dev, skb->data, skb->len, DMA_TO_DEVICE);
>  	if (unlikely(dma_mapping_error(ab->dev, ti.paddr))) {
>  		atomic_inc(&ab->soc_stats.tx_err.misc_fail);
> @@ -216,7 +287,8 @@ tcl_ring_sel:
>  		goto fail_remove_idr;
>  	}
>  
> -	ti.data_len = skb->len;
> +	ti.data_len = skb->len - ti.pkt_offset;
> +	skb_cb->pkt_offset = ti.pkt_offset;
>  	skb_cb->paddr = ti.paddr;
>  	skb_cb->vif = arvif->vif;
>  	skb_cb->ar = ar;
> @@ -272,6 +344,8 @@ fail_unmap_dma:
>  	dma_unmap_single(ab->dev, ti.paddr, ti.data_len, DMA_TO_DEVICE);
>  
>  fail_remove_idr:
> +	if (ti.pkt_offset)
> +		skb_pull(skb, ti.pkt_offset);
>  	spin_lock_bh(&tx_ring->tx_idr_lock);
>  	idr_remove(&tx_ring->txbuf_idr,
>  		   FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ti.desc_id));
> @@ -348,6 +422,10 @@ ath11k_dp_tx_htt_tx_complete_buf(struct
>  		return;
>  	}
>  
> +	if (skb_cb->pkt_offset)
> +		/* Removing the alignment and htt meta data */
> +		skb_pull(msdu, skb_cb->pkt_offset);
> +
>  	memset(&info->status, 0, sizeof(info->status));
>  
>  	if (ts->acked) {
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.h
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
> @@ -17,6 +17,203 @@ struct ath11k_dp_htt_wbm_tx_status {
>  	u16 peer_id;
>  };
>  
> +/* htt_tx_msdu_desc_ext
> + *
> + * valid_pwr
> + *		If set, tx pwr spec is valid
> + *
> + * valid_mcs_mask
> + *		If set, tx MCS mask is valid
> + *
> + * valid_nss_mask
> + *		If set, tx Nss mask is valid
> + *
> + * valid_preamble_type
> + *		If set, tx preamble spec is valid
> + *
> + * valid_retries
> + *		If set, tx retries spec is valid
> + *
> + * valid_bw_info
> + *		If set, tx dyn_bw and bw_mask are valid
> + *
> + * valid_guard_interval
> + *		If set, tx guard intv spec is valid
> + *
> + * valid_chainmask
> + *		If set, tx chainmask is valid
> + *
> + * valid_encrypt_type
> + *		If set, encrypt type is valid
> + *
> + * valid_key_flags
> + *		If set, key flags is valid
> + *
> + * valid_expire_tsf
> + *		If set, tx expire TSF spec is valid
> + *
> + * valid_chanfreq
> + *		If set, chanfreq is valid
> + *
> + * is_dsrc
> + *		If set, MSDU is a DSRC frame
> + *
> + * guard_interval
> + *		0.4us, 0.8us, 1.6us, 3.2us
> + *
> + * encrypt_type
> + *		0 = NO_ENCRYPT,
> + *		1 = ENCRYPT,
> + *		2 ~ 3 - Reserved
> + *
> + * retry_limit
> + *		Specify the maximum number of transmissions, including the
> + *		initial transmission, to attempt before giving up if no ack
> + *		is received.
> + *		If the tx rate is specified, then all retries shall use the
> + *		same rate as the initial transmission.
> + *		If no tx rate is specified, the target can choose whether to
> + *		retain the original rate during the retransmissions, or to
> + *		fall back to a more robust rate.
> + *
> + * use_dcm_11ax
> + *		If set, Use Dual subcarrier modulation.
> + *		Valid only for 11ax preamble types HE_SU
> + *		and HE_EXT_SU
> + *
> + * ltf_subtype_11ax
> + *		Takes enum values of htt_11ax_ltf_subtype_t
> + *		Valid only for 11ax preamble types HE_SU
> + *		and HE_EXT_SU
> + *
> + * dyn_bw
> + *		0 = static bw, 1 = dynamic bw
> + *
> + * bw_mask
> + *		Valid only if dyn_bw == 0 (static bw).
> + *
> + * host_tx_desc_pool
> + *		If set, Firmware allocates tx_descriptors
> + *		in WAL_BUFFERID_TX_HOST_DATA_EXP,instead
> + *		of WAL_BUFFERID_TX_TCL_DATA_EXP.
> + *		Use cases:
> + *		Any time firmware uses TQM-BYPASS for Data
> + *		TID, firmware expect host to set this bit.
> + *
> + * power
> + *		Unit of the power field is 0.5 dbm
> + *		signed value ranging from -64dbm to 63.5 dbm
> + *
> + * mcs_mask
> + *		mcs bit mask of 0 ~ 11
> + *		Setting more than one MCS isn't currently
> + *		supported by the target but is supported
> + *		in the interface in case in the future
> + *		the target supports specifications of
> + *		a limited set of MCS values.
> + *
> + * nss_mask
> + *		Nss bit mask 0 ~ 7
> + *		Setting more than one Nss isn't currently
> + *		supported by the target but is supported
> + *		in the interface in case in the future
> + *		the target supports specifications of
> + *		a limited set of Nss values.
> + *
> + * pream_type
> + *		Preamble types
> + *
> + * update_peer_cache
> + *		When set these custom values will be
> + *		used for all packets, until the next
> + *		update via this ext header.
> + *		This is to make sure not all packets
> + *		need to include this header.
> + *
> + * chain_mask
> + *		Specify which chains to transmit from
> + *
> + * key_flags
> + *		Key Index and related flags - used in mesh mode
> + *
> + * chanfreq
> + *		Channel frequency: This identifies the desired channel
> + *		frequency (in MHz) for tx frames. This is used by FW to help
> + *		determine when it is safe to transmit or drop frames for
> + *		off-channel operation.
> + *		The default value of zero indicates to FW that the corresponding
> + *		VDEV's home channel (if there is one) is the desired channel
> + *		frequency.
> + *
> + * expire_tsf_lo
> + *		tx expiry time (TSF) LSBs
> + *
> + * expire_tsf_hi
> + *		tx expiry time (TSF) MSBs
> + *
> + * learning_frame
> + *		When this flag is set, this frame will be dropped by FW
> + *		rather than being enqueued to the Transmit Queue Manager (TQM) HW.
> + *
> + * send_as_standalone
> + *		This will indicate if the msdu needs to be sent as a singleton PPDU,
> + *		i.e. with no A-MSDU or A-MPDU aggregation.
> + *		The scope is extended to other use-cases.
> + *
> + * is_host_opaque_valid
> + *		Set this bit to 1 if the host_opaque_cookie is populated
> + *		with valid information.
> + *
> + * host_opaque_cookie
> + *		Host opaque cookie for special frames
> + */
> +struct htt_tx_msdu_desc_ext {
> +	u32
> +		valid_pwr            :  1,
> +		valid_mcs_mask       :  1,
> +		valid_nss_mask       :  1,
> +		valid_preamble_type  :  1,
> +		valid_retries        :  1,
> +		valid_bw_info        :  1,
> +		valid_guard_interval :  1,
> +		valid_chainmask      :  1,
> +		valid_encrypt_type   :  1,
> +		valid_key_flags      :  1,
> +		valid_expire_tsf     :  1,
> +		valid_chanfreq       :  1,
> +		is_dsrc              :  1,
> +		guard_interval       :  2,
> +		encrypt_type         :  2,
> +		retry_limit          :  4,
> +		use_dcm_11ax         :  1,
> +		ltf_subtype_11ax     :  2,
> +		dyn_bw               :  1,
> +		bw_mask              :  6,
> +		host_tx_desc_pool    :  1;
> +	u32
> +		power                :  8,
> +		mcs_mask             : 12,
> +		nss_mask             :  8,
> +		pream_type           :  3,
> +		update_peer_cache    :  1;
> +	u32
> +		chain_mask           :  8,
> +		key_flags            :  8,
> +		chanfreq             : 16;
> +
> +	u32 expire_tsf_lo;
> +	u32 expire_tsf_hi;
> +
> +	u32
> +		learning_frame       :  1,
> +		send_as_standalone   :  1,
> +		is_host_opaque_valid :  1,
> +		rsvd0                : 29;
> +	u32
> +		host_opaque_cookie   : 16,
> +		rsvd1                : 16;
> +} __packed;

we should not be using bitmasks with packed in upstream code.
QSDK may have done this, but it's not ok upstream
and why isn't this being added to hal_desc.h?


> +
>  void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts);
>  int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
>  int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -10324,6 +10324,9 @@ static int __ath11k_mac_register(struct
>  		goto err_free_if_combs;
>  	}
>  
> +	ar->hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_AP_VLAN);
> +	ar->hw->wiphy->software_iftypes |= BIT(NL80211_IFTYPE_AP_VLAN);
> +
>  	if (!ab->hw_params.supports_monitor)
>  		/* There's a race between calling ieee80211_register_hw()
>  		 * and here where the monitor mode is enabled for a little
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c
> @@ -40,6 +40,10 @@
>  
>  /* misc utils */
>  
> +static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
> +				struct net_device *dev, struct sta_info *sta,
> +				struct ieee80211_key *key, struct sk_buff *skb);
> +
>  static __le16 ieee80211_duration(struct ieee80211_tx_data *tx,
>  				 struct sk_buff *skb, int group_addr,
>  				 int next_frag_len)
> @@ -4257,6 +4261,7 @@ void __ieee80211_subif_start_xmit(struct
>  {
>  	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
>  	struct ieee80211_local *local = sdata->local;
> +	struct ieee80211_key *key = NULL;
>  	struct sta_info *sta;
>  	struct sk_buff *next;
>  	int len = skb->len;
> @@ -4281,5 +4286,15 @@ void __ieee80211_subif_start_xmit(struct
>  	if (IS_ERR(sta))
>  		sta = NULL;
>  
> +	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN &&
> +	    get_bss_sdata(sdata)->vif.offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED &&
> +	    !is_multicast_ether_addr(skb->data)) {
> +		if (sta)
> +			key = rcu_dereference(sta->ptk[sta->ptk_idx]);
> +		ieee80211_8023_xmit(sdata, dev, sta, key, skb);
> +		rcu_read_unlock();
> +		return;
> +	}
> +
>  	skb_set_queue_mapping(skb, ieee80211_select_queue(sdata, sta, skb));
>  	ieee80211_aggr_check(sdata, sta, skb);


