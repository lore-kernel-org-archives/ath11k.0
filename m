Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35935CCF9FA
	for <ath11k@archiver.kernel.org>; Fri, 31 Oct 2025 03:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MA5lbu0DUz3G5wLJNDxBqMZG25p85XEtyG0AHNBXzI4=; b=jD8/GxGkGb9lPWhd1jHVo86i4w
	pqrWCSAUyMzu99Uovn8q0H51GhVOWLPM5MZFxEee9N+jgyUWQamjo2cF9KWWh+fq0tYg1GoZN1nqF
	Ae5p3i3QJg10hiSo7FtiIlBRJfkavpA6JXW7p8g2A2SmWYiCg7u4FKdhbdPr01GgGLw33GtURCjDZ
	9wNFGiEgSz+XeUMxLlNBFjOVljWBjhIDLrSa+UmHkSlz9W3en+sRqhXGGh4TEL2MZxikYfjVMOcj9
	ZsLwp+Q11GUE8vQERfmxRMbHzx/ty6Cm+oERDeDdezTKfOuvYcRkoxzCKaNmj1d6lPxBTDc2fdIhN
	YcGVfDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfSU-00000005Ino-3eYJ;
	Fri, 31 Oct 2025 03:05:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfSS-00000005InS-1QoI
	for ath11k@lists.infradead.org;
	Fri, 31 Oct 2025 03:05:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V1mlHb1571629
	for <ath11k@lists.infradead.org>; Fri, 31 Oct 2025 03:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MA5lbu0DUz3G5wLJNDxBqMZG25p85XEtyG0AHNBXzI4=; b=ir9GRC5JdjP+/dKQ
	Z3dS46kEeRXwFXfgpq/7sSfwJmM4Fu8zpdK35oFx02SFxAHxINam2GoDa/DWDGH9
	lhYU21Dj5S05UIULdYGfa7Szw/IK2vN5UDH5p5xCY7+50HPosPPt5/ds4wlimKQv
	/ePubbdff1SFoZJ1L9mq2l7vRBp8hReln1x+3CdgOIXQb2W1bHNSZ+wrkLcQDODG
	OFWveYBS9itq2b3zo5jWRdRjAwUGc0FhpPw+Cdf8pAfBCSgpTSDjB11xW9uocdpF
	qigeNIbjRwkx5LQTIGx1I0qR4R4bouqmHSTafa1S0lfD9051NX/3/eTFnDZyMBPE
	m3d3MA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc05q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Oct 2025 03:05:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a264d65dbeso1481343b3a.0
        for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 20:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761879942; x=1762484742; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MA5lbu0DUz3G5wLJNDxBqMZG25p85XEtyG0AHNBXzI4=;
        b=H3nHsiEso4wQGV9Vu3zOcd3MywMxIgLua5ErOKvXEUnUlOmywrt0zZPTLSpwzEEknF
         qkcv/6ai8QJzhQ5KdwtTi3qKfZ5pIERULFJymiz5YhNcMUGRlK7SEp+jF5szrcH+bv4T
         sms8D9yZLg7taQnJREk8p8W/KdArtuQYsW0cFHlSfUUH7uOoPhllMcbUHwVI1ogxNXuo
         ztwst8yPBP2QTlKGxZvZplxqS6ekSUkhDu23qYEdChmdhtWo44q/NFXS7AO/HLhUcgca
         AOGgyOgj6GxLIuYfT9IXM8VKP6w4SQAxtMCehsmZM69rEv1RPqlX56KFpfV8H/DUcyTo
         wFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761879942; x=1762484742;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MA5lbu0DUz3G5wLJNDxBqMZG25p85XEtyG0AHNBXzI4=;
        b=vkeswVJUsQc5wyRIhj608BVLaPzuUrk7drVdk+qVa6V8Pp5U5HQcZq79/+E1MRHsIY
         rPpQmOB6CN7KBt9fiqpb72t/viGzWWkAugMQJECnEsqhXzfS1taufOVwIIFWzRwcDW09
         6VuDggHdsE1Hk0rw4sSB7J1uaG+/nZbyiFXSDTCVHoxvxqc4JMLiI0/SayWTTs6o8KH7
         qKoEHm6GsDG0/Nfe3poSUoN+0RSxChvygYpBpjUpp+X8kcB/kvLpvbPBeWTzH/iaWq0X
         8iGVpzv4aTWSGF5a72v+4s+A2ez4zHpKRO/zZxm8J/BXKDGA24aa65nwlgv/mpq5uSqt
         uA2A==
X-Forwarded-Encrypted: i=1; AJvYcCUaNgZu2a+Cwv8i38NRbS9oBnW9QHIykyb6qeVlsYA03/BEsX1svK2zofMsPlASHXAYy9lzrYs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBtOUWh7KpNyGrmAc7LHW/dJbWFuDZMP7oZ4cz7wE63hQ/uEh8
	9Qk7BmlVFT2goE3wRzPlyclEMerUj9wGWSeFP6uaY9C/JNSGyTv2C9NiJC+IFhvpzqy2jT611Kd
	y5elYlUwlBHU7kBbL6f4SFyMWODpeBUAfdQCukXpWNPOJQBlZJqbdHW9BrEVLF7ut
X-Gm-Gg: ASbGncsjwIye/ac4rbiXsBkWQUMThR2sYeQ13lsQ0y88M41k1g98arDPWgQRqKnPR37
	qnbGc50yATYQ/nJC0Yo3KboFCbwfPxcKc60oZBb6YPQP48SI3N0dKOgUUt9082pLyfcpX4a3n+C
	1Wz52kmk4aPt81ZO/8L81NPv0k/iSBEUmUBIT6HpLmeuAnDJd4mYbIypR3ZTxi1VtVBXQCfZltX
	SIA6WOVZBpH+4N7l6uvTdarP3pgMqeV29oytt/DnkLyf9x3LHPoip27uPxL/CSofqs/KDbTsPap
	SVYPXtrLfCWJXnRIEMqxhHjbC1Th+RAfDm2MP8xUDH/JKmhDLVasmIuy9UOwOfOIx19UhPc4Msm
	8EhEDfz0VdukQE4o66ABHl316zBC14eH67KYqdN3yv/YWRa39zRtiCVnvJLODTKuTuZCZuXI=
X-Received: by 2002:a05:6a00:cc7:b0:781:157b:3d2e with SMTP id d2e1a72fcca58-7a778cf3894mr2507813b3a.21.1761879941882;
        Thu, 30 Oct 2025 20:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgqFq+x83K/w0XoHv5jjm7Z7A1qf/no0XyscJ358L9PqS4j8gmhhK9TxM/9BK5TD3G5lEVAw==
X-Received: by 2002:a05:6a00:cc7:b0:781:157b:3d2e with SMTP id d2e1a72fcca58-7a778cf3894mr2507767b3a.21.1761879941288;
        Thu, 30 Oct 2025 20:05:41 -0700 (PDT)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8e6fa5bsm378826b3a.27.2025.10.30.20.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 20:05:40 -0700 (PDT)
Message-ID: <69db0369-91bd-4fb3-83aa-4db1216fc747@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 11:05:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 6/6] wifi: ath11k: Register handler for CFR
 capture event
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
 <20251030043150.3905086-7-yu.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251030043150.3905086-7-yu.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNiBTYWx0ZWRfX7MUfAurEPX3s
 +QyfWhDXB0Adt2eQx2sXZNDW4TG0BLxSJwhr0GH0sMiq5L5OoBDZlNZuSaQ75BGhb8vaJgacJx3
 faCoHXA/+1hYtTnIZi8eZbUAvEjg1bpWY/IM/zCa8lYdQlaSJARL1DbfCQmDhvVeoMPWgUIVn4U
 hAa95umCc3owQrIRAfm751RytoFsIVCD+y4BUXoqS0YXmHHc/88oQG4I0JtfL3usWxtiVVlHXqw
 UWMF+Y0N/5SRXk3JcYMBB7UqxD7rZZkdsICnjtXtaz3Lsi9D070YMil+49IOzhLT6HE/XZfeEqs
 SOo2xa5nECirLN82wTa1nkCFTsOny4e/MzshMMGC3lvi9qZeWo/gbGMTRhXzlpidsJtj87oYmkq
 uUHKoPrQbngWlAyBKsU0+WM4ZppSsA==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=69042786 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=c2OXSssSWZ9PRKTZbFMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZsETcLquoAYMXldEF_IZchq_bg_yoB7t
X-Proofpoint-GUID: ZsETcLquoAYMXldEF_IZchq_bg_yoB7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_200544_513684_6CBCDE03 
X-CRM114-Status: GOOD (  20.09  )
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



On 10/30/2025 12:31 PM, Yu Zhang(Yuriy) wrote:
> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> 
> Firmware sends CFR meta data through the WMI event
> WMI_PEER_CFR_CAPTURE_EVENT. Parse the meta data coming from the firmware
> and invoke correlate_and_relay function to correlate the CFR meta data
> with the CFR payload coming from the other WMI event
> WMI_PDEV_DMA_RING_BUF_RELEASE_EVENT.
> 
> Release the buffer to user space once correlate and relay return
> success.
> 
> Tested-on: IPQ8074 hw2.0 PCI IPQ8074 WLAN.HK.2.5.0.1-00991-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Co-developed-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/cfr.c | 145 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/cfr.h |  62 ++++++++++-
>  drivers/net/wireless/ath/ath11k/wmi.c |  90 ++++++++++++++++
>  drivers/net/wireless/ath/ath11k/wmi.h |  44 ++++++++
>  4 files changed, 340 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
> index e8a976d64733..61eeb02af6c5 100644
> --- a/drivers/net/wireless/ath/ath11k/cfr.c
> +++ b/drivers/net/wireless/ath/ath11k/cfr.c
> @@ -247,6 +247,151 @@ static int ath11k_cfr_process_data(struct ath11k *ar,
>  	return status;
>  }
>  
> +static void ath11k_cfr_fill_hdr_info(struct ath11k *ar,
> +				     struct ath11k_csi_cfr_header *header,
> +				     struct ath11k_cfr_peer_tx_param *params)
> +{
> +	header->cfr_metadata_version = ATH11K_CFR_META_VERSION_4;
> +	header->cfr_data_version = ATH11K_CFR_DATA_VERSION_1;
> +	header->cfr_metadata_len = sizeof(struct cfr_metadata);
> +	header->chip_type = ar->ab->hw_rev;
> +	header->meta_data.status = FIELD_GET(WMI_CFR_PEER_CAPTURE_STATUS,
> +					     params->status);
> +	header->meta_data.capture_bw = params->bandwidth;
> +	header->meta_data.phy_mode = params->phy_mode;
> +	header->meta_data.prim20_chan = params->primary_20mhz_chan;
> +	header->meta_data.center_freq1 = params->band_center_freq1;
> +	header->meta_data.center_freq2 = params->band_center_freq2;
> +
> +	/* Currently CFR data is captured on ACK of a Qos NULL frame.
> +	 * For 20 MHz, ACK is Legacy and for 40/80/160, ACK is DUP Legacy.
> +	 */

please check comment style

> +	header->meta_data.capture_mode = params->bandwidth ?
> +		ATH11K_CFR_CAPTURE_DUP_LEGACY_ACK : ATH11K_CFR_CAPTURE_LEGACY_ACK;
> +	header->meta_data.capture_type = params->capture_method;
> +	header->meta_data.num_rx_chain = ar->num_rx_chains;
> +	header->meta_data.sts_count = params->spatial_streams;
> +	header->meta_data.timestamp = params->timestamp_us;
> +	ether_addr_copy(header->meta_data.peer_addr, params->peer_mac_addr);
> +	memcpy(header->meta_data.chain_rssi, params->chain_rssi,
> +	       sizeof(params->chain_rssi));
> +	memcpy(header->meta_data.chain_phase, params->chain_phase,
> +	       sizeof(params->chain_phase));
> +	memcpy(header->meta_data.agc_gain, params->agc_gain,
> +	       sizeof(params->agc_gain));
> +}
> +
> +int ath11k_process_cfr_capture_event(struct ath11k_base *ab,
> +				     struct ath11k_cfr_peer_tx_param *params)
> +{
> +	struct ath11k_look_up_table *lut = NULL;
> +	u32 end_magic = ATH11K_CFR_END_MAGIC;
> +	struct ath11k_csi_cfr_header *header;
> +	struct ath11k_dbring_element *buff;
> +	struct ath11k_vif *arvif;
> +	struct ath11k_cfr *cfr;
> +	dma_addr_t buf_addr;
> +	struct ath11k *ar;
> +	u8 tx_status;
> +	int status;
> +	int i;
> +
> +	rcu_read_lock();
> +	arvif = ath11k_mac_get_arvif_by_vdev_id(ab, params->vdev_id);
> +	if (!arvif) {
> +		rcu_read_unlock();
> +		ath11k_warn(ab, "Failed to get arvif for vdev id %d\n",
> +			    params->vdev_id);
> +		return -ENOENT;
> +	}
> +
> +	ar = arvif->ar;

ath11k_mac_get_ar_by_vdev_id() is better?



