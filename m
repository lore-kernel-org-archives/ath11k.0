Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114FBC5AD44
	for <ath11k@archiver.kernel.org>; Sat,  8 Aug 2026 18:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DDHErlHnBZz4VB/m+ePIzuov6kkItLoeXRusC4Jtj0=; b=LajppEMjbPWQe1T7LB8qr6DYcg
	hDO35FxWPiUb4GD/+JjBdM/mCJm1cE6XkidLBq85s70gIVZ8U4QQHMNt4uxcea/Pah4qDVl/kzIDV
	PZGM0SaEcpQBcb2yie0O9tTY4llJANtQ2nVu1iWADKpMdBJB+yxgHpLIl1tdkRbim11r+Icq0wqPc
	K2Ic7g65Cxo3A2/UgEoxGydsuLOPzELLmjXrWFwh7vORexBQs6VTcSTDyMZHFShe7f3RMAImHOsky
	N3e1kVSkxFD95I0K1Vdiary3I52GGoWiyWKZIF0wXwquY1kMBQMN2cjEdLZIu7BSi2hCLM/mScMlq
	BiQuuzcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsm0M-00000009aY9-1qWC;
	Sat, 08 Aug 2026 18:42:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsm0J-00000009aXS-23h9
	for ath11k@lists.infradead.org;
	Sat, 08 Aug 2026 18:42:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678GnSHO902348
	for <ath11k@lists.infradead.org>; Sat, 8 Aug 2026 18:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/DDHErlHnBZz4VB/m+ePIzuov6kkItLoeXRusC4Jtj0=; b=KRHwmGjby/MZWAt6
	Y+w/dytUnBVUtxQyajM/anT1Dlooq2bHgMtgRZRyCfx7lnr4AdcHzxY1BZo/mXKB
	AkVuHREXgXsdEE5JX3KQsYXDMKag9qgm4r48MMpvjRqUU15uPmbVxjCJ0u5fGzM1
	imCqfpjO7GiO97lYhGmCd7LD5AS5x1Mfl+vANiAb3eOf/ktg88zRhnmYX72RQEu6
	ev7sgFotwJHJILp3L2721fTbmTu/NoZgIq9YIEKNrJl3aimb3xGJpzn4lpJmKvTc
	BxR50rG0Y+BgjzBFANhVZli5leWiA++U9GJI/IzVWNNZOcyUwA90op+wjaD3sLuo
	Opia2g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqhkx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 08 Aug 2026 18:42:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1824304a91.3
        for <ath11k@lists.infradead.org>; Sat, 08 Aug 2026 11:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786214561; x=1786819361; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DDHErlHnBZz4VB/m+ePIzuov6kkItLoeXRusC4Jtj0=;
        b=gnfqdlIUY3A/oRcQo3zjZZh43bw0cU7vHB/DetQZYJsnMWyC2RZOyIvWAKsWiTX5x9
         gNRuv/ktLo5glyupiBekKmbMRMoHuQJy6kQr46mMd1X4F2uVu3nUQ2dWp7/xeh+EVSpo
         FgPR3IWN8SM9C0/80H3LIy4vpxSsvAAeQwg74nQ4G5ZYsG2vgHqU7e4D7u0JioQvyuBw
         tOu5DRezdn275nWN3auYG4kx+pBus0sPrxX9DYAuY4XW9POECsFSQRls2OPhO8dWBloN
         TswsdxXkvtYdbgE+zuKj5Nhjgbgzn3A6inLEgkSQqwxNV1g7LwIuWCc5kwR5hEDkYAVc
         4w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786214561; x=1786819361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DDHErlHnBZz4VB/m+ePIzuov6kkItLoeXRusC4Jtj0=;
        b=roDAm+FRqLRtt3fpEhmhWOh3f9TuEWcZcdivycrQM6ZTHdirtUdO6/uOOhOcq2JEji
         A/nfXQfIpbtTdw+ZnsqaYjC70FAY2RcXFIPa/bEhWYTyGC2pOa/zbLVhCF3qRvT1d+Mr
         IdqDNIiDpYHTDqn2GCEO/B+8FT6TCAOFguFQ37Bflkb0E8RRC2kgazGawNkib3flYy6U
         LSq8u0AIGAkmet9OJgejUtslMAaVGsrPZ/NX7fma/R2GJUW/5KVrDSwAEd0V2X/u6SGA
         NTCoN772fUxnwMpIlWV5vXcHmHXMjSPp9D6qAU2DfrASxqGPo4w1PeISAlLu51jAsgnw
         avvg==
X-Gm-Message-State: AOJu0YxO4+NijDgqZcvrqvXhbYdbVvioYwOM+gKHpLyVvSYIpVLef33X
	3c2CcfgWOgJgbrhPjMNdCT9S5nloes2wvwRuJsrRB9FfmMBEOYn26a21eJc769lgQ/4SB5tfB+v
	0DieyH3j4V2eYdIAXRVBvTOvqJZ19TNZmHd5Yz6n4GznEn1fk8wXVT3199/SXwedy
X-Gm-Gg: AR+sD13ykYdz68OvEw0tembyFR03+WRhDyXzBf1uzZe8hNB2icWGBZ8Ix5t1hI1/YSr
	Z4VdUXyLrx52mSelAZt9SmxM0wjLfAjQgdir3DXxiaFSlwitMyBmQsM7s0pYq28ZrDZGsCOf2go
	PT+dx7a566JZvmHOsBmln2hSirhiNvaZ2P4YIQYwyJis50XYiUETXMewj2nDgrDWEbOn08B7khE
	a+GmXkFAgElt14tyoOSWr/SmandZ1c3fFpnJTi+Lkn2lKi2HSWNrBXnuESKHbe6lTvIjfSZK/EJ
	Gyl7AtCT6VsQFNpywwb0p/nCcJqy3GV5U9q29VjBRBt4W2hEYeH27Uyd7qp76LroL+jFxu5sz7A
	mnoQaLO2kt/Sr/Ue41PQdjhtJXrP3e42u8bOjB3yeXCkcEyzln4i63Wr8gvHr
X-Received: by 2002:a05:6a20:7290:b0:3c3:becb:b705 with SMTP id adf61e73a8af0-3cbc0431ddcmr13212937637.27.1786214560818;
        Sat, 08 Aug 2026 11:42:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3c3:becb:b705 with SMTP id adf61e73a8af0-3cbc0431ddcmr13212896637.27.1786214560339;
        Sat, 08 Aug 2026 11:42:40 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm36459413eec.18.2026.08.08.11.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 11:42:39 -0700 (PDT)
Message-ID: <2774127a-01ce-4d26-b8fc-e68f49da2bbc@oss.qualcomm.com>
Date: Sat, 8 Aug 2026 11:42:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] wifi: ath11k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260807105843.20203-1-jtornosm@redhat.com>
 <20260807105843.20203-4-jtornosm@redhat.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260807105843.20203-4-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE2MSBTYWx0ZWRfXxNbxNchRr7RQ
 dWtMAtfaHUGdDF+fZvvyv4CKp9b0r6FIfztctppLVZTZ+ZJX8VIYTvnKPaSe3SeSP5VtFBLgbGj
 YTdAZDq3JwXf8nYgcdVCi/0Gclvz8Vo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE2MSBTYWx0ZWRfX3AWsVsgNLtv7
 XJBZ2KGxMzixbBSg0bmNd6r5To+nKRcye44Jc4Jea8oQV4uLtC1EAjX1kg9ls16brsyIdFjQznf
 EkKaUNcToqgHL969Bmkl2dFgTtn2z0bZHkIFDp6MKx8+yq8XndbZkcMJSqZBfSAlUrz/uolfa+1
 D5BCGz4zuVqwvBP2GeeDCcWOci0Pj2wkRdK8ZfRD/JQwGKeXDuIuhFje8sN00BR1aInOeZjGyZB
 YG9qnrn9v86gsJHwiJ8JNo7Qs6KTt6oQErtTnmGimGEyZC6gDXMrfdvgjjfFTncVuvhQN6wRUJq
 RpHRASN4QTd+Ot9m2ECaIllmH678C96asKty+Qajx+hL6k8PgVgmlH5FFUNralHAq9gfhI4AGLL
 X6BSqoJ6CN4tpNAbjh1Q9DbWwiZP4Ut8XJSSbYnG65A+7+SIc/+q1feaT6r1w153c/0bGWdyqZs
 1pMwDFmX4CxnHL03KUw==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a7778a1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=UlviFDkLi7K7RJw89-AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: NR-ZO0-cs8TTrwFnuAPXJDDvaF4XkcsF
X-Proofpoint-GUID: NR-ZO0-cs8TTrwFnuAPXJDDvaF4XkcsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_114243_591361_F048494E 
X-CRM114-Status: GOOD (  26.42  )
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

On 8/7/2026 3:58 AM, Jose Ignacio Tornos Martinez wrote:
> Under heavy traffic, ath11k experiences frequent -ENOMEM errors
> ("failed to transmit frame -12") when the hardware TCL ring fills up.
> This issue is more commonly observed in VMs with PCIe passthrough but
> also occurs on bare metal systems. It is particularly problematic on
> devices with a single shared TCL ring where all traffic classes
> compete for the same 512 descriptor slots.
> 
> Implement a custom wake_tx_queue operation that:
> 
> 1. Checks hardware ring space before dequeuing packets from mac80211
> 2. Uses per-ring locking (wake_tx_lock with spin_lock_bh) to serialize
>    concurrent wake_tx_queue calls targeting the same ring and to ensure
>    bottom halves are disabled as required by ieee80211_tx_dequeue()
> 3. Syncs with hardware state to get accurate free slot count
> 4. Resolves the target TCL ring using get_ring_selector(txq->ac),
>    which selects the ring based on the access category
> 5. Returns early during firmware crash in the same way as other
>    tx paths
> 
> This approach follows the pattern used in the iwlwifi driver, adapted
> for ath11k's hardware ring architecture.
> 
> This eliminates -ENOMEM errors and improves throughput by optimizing
> resource usage and preventing unnecessary packet drops.

Missing Tested-on tag

> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> v5: no modification
> v4: https://lore.kernel.org/all/20260724053121.15759-4-jtornosm@redhat.com/
> 
>  drivers/net/wireless/ath/ath11k/dp.c  |  1 +
>  drivers/net/wireless/ath/ath11k/dp.h  |  2 ++
>  drivers/net/wireless/ath/ath11k/mac.c | 52 ++++++++++++++++++++++++++-
>  3 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index f389b97acbdd..2e5978ec2b05 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -1087,6 +1087,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
>  	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>  		idr_init(&dp->tx_ring[i].txbuf_idr);
>  		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
> +		spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
>  		dp->tx_ring[i].tcl_data_ring_id = i;
>  
>  		dp->tx_ring[i].tx_status_head = 0;
> diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
> index 84f66839f0c6..6d99501aa269 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.h
> +++ b/drivers/net/wireless/ath/ath11k/dp.h
> @@ -87,6 +87,8 @@ struct dp_tx_ring {
>  	struct idr txbuf_idr;
>  	/* Protects txbuf_idr and num_pending */
>  	spinlock_t tx_idr_lock;
> +	/* Serializes wake_tx_queue operations for this ring */
> +	spinlock_t wake_tx_lock;
>  	struct hal_wbm_release_ring *tx_status;
>  	int tx_status_head;
>  	int tx_status_tail;
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 2d55cdc4d165..9813f7923c34 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -10065,9 +10065,59 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
>  	return ret;
>  }
>  
> +static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
> +					struct ieee80211_txq *txq)
> +{
> +	struct ieee80211_tx_control control = {
> +		.sta = txq->sta,
> +	};
> +	struct ath11k *ar = hw->priv;
> +	struct dp_tx_ring *tx_ring;
> +	struct hal_srng *tcl_ring;
> +	struct sk_buff *skb;
> +	u32 ring_selector;
> +	int num_free;
> +	u8 ring_id;
> +
> +	if (!ar)
> +		return;

ar = hw->priv and the hw->priv space is allocated when hw is allocated.
so if hw is valid, hw->priv is valid, and this check is innecessary

> +
> +	ring_selector = ar->ab->hw_params.hw_ops->get_ring_selector(txq->ac);
> +	ring_id = ring_selector % ar->ab->hw_params.hal_params->num_tx_rings;
> +	tx_ring = &ar->ab->dp.tx_ring[ring_id];
> +	tcl_ring = &ar->ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
> +
> +	while (1) {
> +		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
> +				      &ar->ab->dev_flags)))
> +			break;
> +
> +		spin_lock_bh(&tx_ring->wake_tx_lock);
> +
> +		spin_lock(&tcl_ring->lock);
> +		num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, true);
> +		spin_unlock(&tcl_ring->lock);
> +
> +		if (num_free == 0) {
> +			spin_unlock_bh(&tx_ring->wake_tx_lock);
> +			break;
> +		}
> +
> +		skb = ieee80211_tx_dequeue(hw, txq);
> +		if (!skb) {
> +			spin_unlock_bh(&tx_ring->wake_tx_lock);
> +			break;
> +		}
> +
> +		ath11k_mac_op_tx(hw, &control, skb);
> +
> +		spin_unlock_bh(&tx_ring->wake_tx_lock);
> +	}
> +}
> +
>  static const struct ieee80211_ops ath11k_ops = {
>  	.tx				= ath11k_mac_op_tx,
> -	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
> +	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
>  	.start                          = ath11k_mac_op_start,
>  	.stop                           = ath11k_mac_op_stop,
>  	.reconfig_complete              = ath11k_mac_op_reconfig_complete,


