Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE39CA9ED1
	for <ath11k@archiver.kernel.org>; Mon, 12 Oct 2026 05:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkD4JY1ZO3pJQ5gfIZXunsLTb3XXMRhy176nFx/Ifb8=; b=uYynXNm7u3o3zlgUWfm/K8Ueeo
	79b0Ryi3eg9AB1gS4bGzwG+ltEw54QtmLFHLWTRRdF70qWz69TN6mADNlpDzgES6cXgAafDT6sC9d
	d7b3dyQ1MgCjvfuqlB8pQXXUX3dRLf7M1I9/qNdMBZ96U+BzmxrkAjQBEiLSlyVEh2oVv8OSPA20Y
	e+O/mlRzjucLFH7hR4xwnyWY7g6vSx7RuWLzaooimfweyC9xAq5tz4LZ7wFX0+9JpuZg0oPtC2QmV
	+hzKTBGX/r9rSgTveGvNsAbkW+yUjUTD6qDbmoIN1HOSf/qX4aBbXlgNWqfS6DXRIkzz9OfJV9zVi
	JFH2dUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8ND-00000009fZv-3JLa;
	Mon, 12 Oct 2026 05:14:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8NB-00000009fZY-2OZ6
	for ath11k@lists.infradead.org;
	Mon, 12 Oct 2026 05:14:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C56IMs1003060
	for <ath11k@lists.infradead.org>; Mon, 12 Oct 2026 05:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkD4JY1ZO3pJQ5gfIZXunsLTb3XXMRhy176nFx/Ifb8=; b=VMCfjwSD2eIutGaZ
	CCljrb0FLrDK7+RMxV40hYQtSH4R4F8bcx5YN2+o4kwvM3rAjVdrtgQek35Mq8zQ
	aAUCizHTY5bKhZjmqXkSEKtUFAcLEAW0ekcxDBvB3nri6aPWcPZ94KdmrMkpR5rV
	GErMRmZrbYf4tjNephwZU1vfEjISQdAtqJ0AjUcs92pbrdQ3uHucC/PgoZaWeCX+
	6q6VM/OHcvAEpVxDZM5qIDpoCYNDXJzHMXyWEJPrB2gE5B+BUUQXSX60dQiuu43O
	0veUEf2VXAvCulQw61K2z/yxvz/K/lh9UlOgcxxNxlDcDDayxQ8UgjTeQyUDE0f0
	qAGIiQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkg7qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 12 Oct 2026 05:14:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3515266f6eeso2951861eec.0
        for <ath11k@lists.infradead.org>; Sun, 11 Oct 2026 22:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791782091; x=1792386891; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkD4JY1ZO3pJQ5gfIZXunsLTb3XXMRhy176nFx/Ifb8=;
        b=QjsQITfHOVx+PMHUUgFi7T0yf/gxv8jEr5yaVtnaObP878uWSEctZHK3fW50lUZ/s8
         XAg77s82M2DkChVqWTGP7ZQ4p5FjVwKhEFOO785mXYFpNzu0DJ/Bu9pfmFvHQAvZA2Rm
         fGT5Q2XZ2cDNWqE1Nx6dniyKfgRR8ydZJPWMLxcrUQwOkkg1wCm8DLV64OAC/MUuXJGs
         ruuwhrzkgDZxo1Jf6rlN6z/IC897FjO1Th7zpijLFFFYT5Iry+UPmlqvBzcIP541RuZv
         gvKWO55F5r4QohBm5FxsyTlRJkir4MM+3Re+Irh/qZuZ/MUjSmF+PDjFXN5+z35QXSwm
         JBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791782091; x=1792386891;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QkD4JY1ZO3pJQ5gfIZXunsLTb3XXMRhy176nFx/Ifb8=;
        b=X8ts3GU4i8cjyZiZiyhD7J63iuDKtfBHdhu2Dtg5PB68E+vupQoRR9xRC8y/Tm10ny
         YQseh7GmvhiedICPDizKT6CVrM7hs1zFDY8t0LTpJO94cr1o4If5vL725yk+Gn84X7vD
         dh3Fp+Aq7ILUSjFqV1jaQjfxOYnT3GitSoy7Rn/yiBAKf98AJqobcfUgELzm+2HlR7xP
         3pdvvX45TAPEcGV7OvKd/aSRg5QYP4DOBatybCktLoczUnyzLCHb3lfROva6+A5ZiYnd
         RRDpMkb+r9M3iBfENfmQul95uZm+uDvR2DS9DjXvP+a5Wwh8VH7YcT8u8yUivvwaz8cL
         yzIg==
X-Forwarded-Encrypted: i=1; AKwUvBwe4QpPS/UYFQxhzrLKJYKx1evU5ciGwW21ddMTpzbI7isHMeDhN8hnvXuZ8DL7RTg4oi3SGQI=@lists.infradead.org
X-Gm-Message-State: AFq9FYIQ3eNhF+LHozQ/npDJYGCGqc8RxngRC59jJnpYbobhVQenMFEB
	y9+tDcpPZeTLGMsCZBc8HwAMYN264dEGIfPD4YiLIM67EaHcxZrcjhtlrV7LKhknYK86NOfUmO2
	tKu6HprshYfWhMO7w82TUB2M2rWwnObamwGfeZ1uf1ubVV75BAJ3s8P3TGzXcwCtK
X-Gm-Gg: AYBFou2AYu3lKTxSROGlWAxpGbXTISymTRyuBMW+4cxO1nzCkKkOtTIW6/L6prR1GD6
	D5HHu9u/We0DPF5cd5oxcrPyaMlhHxVJXWz0/aWQ5V36uc+d1OyUuu9CnAAhEnF0nPs+a7eUUti
	tTFLlFV/lxK4GF/ztoJHaWGB60pMePePDnzs8FSxe/CeeviSCAKXyNX/Twy1yYXfuM0BjomuJmE
	MWFKvl4KHz58F4OPU7bYqBTnFw5JNzFzNvyzSeWrVwjBo8LMPNtW+jcEagx4kjuHPe8nfBUonZB
	qTO0hbIkToOpuR4wr7BiQIFAfzYpp1yZjjNkFVGhsBLVCU4po0snKW3KU88cN/LJBibRY66dPQ9
	jAcbtocIFUWixm0pFe0obFxYJI7liMS6I82Z2N4Ht
X-Received: by 2002:a05:7301:fd8a:b0:351:5151:95d9 with SMTP id 5a478bee46e88-3537de0069emr10295464eec.3.1791782090708;
        Sun, 11 Oct 2026 22:14:50 -0700 (PDT)
X-Received: by 2002:a05:7301:fd8a:b0:351:5151:95d9 with SMTP id 5a478bee46e88-3537de0069emr10295432eec.3.1791782090130;
        Sun, 11 Oct 2026 22:14:50 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm29526794eec.16.2026.10.11.22.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:14:49 -0700 (PDT)
Message-ID: <167d7bdc-05d0-4d77-8bb5-199a1f8e6aa8@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:44:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] wifi: ath11k: avoid IDR mutation during vif mgmt
 TX cleanup
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Rajkumar Manoharan <rmanohar@codeaurora.org>,
        Sriram R <quic_srirrama@quicinc.com>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261003092104.520135-1-yaojiale02@163.com>
 <20261003092104.520135-4-yaojiale02@163.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-4-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMCBTYWx0ZWRfX4YwsRV9oz/8t
 8UPDkfQnHRb7M9zQhfp+yWfKkPeSCdfMaxhCDxt5Z+D36ltYMVUiNpVfnoFnt2wamXiTQ/W0iB2
 KrZqP7jfi2u/aFiFso0eIxio3oFzMOYJWGA3Tr8Yr6cUWCOXg/SR0fT2BIpCjnGDTgWtZBhbOfZ
 vZ8DGIjUXGyh0tIGY+5JJNT+Oha0bVISsch9nEmLEaeI0tcTLhCY64F+doMpcTermodVxbehoiF
 rFsCoaJ+To8CMftn+JcpvBN5M40Rds5LfkHOTQeytGVFCZvE1En+Kz4KmCsQn0paWC5MxoqJFmH
 N7GprMCIXX7E/Qb2G53PTWxZgm7sdgodwsDA3FA+Cbq7VR8gyL4z1k3+IyVmzKR84d8gXNjssXi
 VZPVuE1ls7BV1K6rPDL+OytdeDrFCZhCPE3kkTH3OnxkwIROAKylmDviNL3m+0GrCUHHA81agPq
 3TbEltsS9KziVQ94q2A==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc6ccb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Byx-y9mGAAAA:8 a=kRE5jT5O_-UJYxJXrn0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMCBTYWx0ZWRfX6DCQGJR745wT
 2FefKBfp7YNz31mFfIrossIaL6mqJP/Igr9m4Swun+c2FbT5sb9R8uyc2ieiqUIwsov3M7/Oxfi
 UkZeJDvUSeacDWgpOPdTmz98qg9Vb5E=
X-Proofpoint-ORIG-GUID: 5A5ajGZETKptywCnPRFw2i7OyY_c_gOG
X-Proofpoint-GUID: 5A5ajGZETKptywCnPRFw2i7OyY_c_gOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_221453_744619_5DAD2955 
X-CRM114-Status: GOOD (  23.67  )
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

On 10/3/2026 2:51 PM, Jiale Yao wrote:
> ath11k_mac_op_remove_interface() walks txmgmt_idr with idr_for_each(),
> and its callback removes each entry belonging to the interface. Removing
> the current entry can invalidate the radix-tree iterator retained by
> idr_for_each().
> 
> Move the walk into a helper that uses idr_for_each_entry(). It performs a
> fresh lookup for every iteration, so each matching entry can be removed
> through the locked removal helper without retaining iterator state across
> the removal.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index f9af403a2f0d..e7ece258f142 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -6176,16 +6176,18 @@ void ath11k_mac_tx_mgmt_pending_free(struct ath11k *ar)
>   		ath11k_mac_tx_mgmt_free(ar, buf_id);
>   }
>   
> -static int ath11k_mac_vif_txmgmt_idr_remove(int buf_id, void *skb, void *ctx)
> +static void ath11k_mac_vif_txmgmt_cleanup(struct ath11k *ar,
> +					  struct ieee80211_vif *vif)
>   {
> -	struct ieee80211_vif *vif = ctx;
> -	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB((struct sk_buff *)skb);
> -	struct ath11k *ar = skb_cb->ar;
> -
> -	if (skb_cb->vif == vif)
> -		ath11k_mac_tx_mgmt_free(ar, buf_id);
> +	struct ath11k_skb_cb *skb_cb;
> +	struct sk_buff *skb;
> +	int buf_id;
>   
> -	return 0;
> +	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
> +		skb_cb = ATH11K_SKB_CB(skb);


The skb dereference here appears unsafe. A parallel WMI TX completion 
path can remove the entry from txmgmt_idr and free the skb while the IDR 
is being iterated, leading to a potential UAF when accessing skb_cb->vif.

Would it make sense to hold txmgmt_idr_lock for the duration of the 
iteration and remove the locking from ath11k_mac_tx_mgmt_free()? 
ath11k_mac_tx_mgmt_pending_free() could take the same lock as well.

This looks like a pre-existing issue rather than something introduced by 
this change, so I'm fine with fixing it in a follow-up patch if preferred.


> +		if (skb_cb->vif == vif)
> +			ath11k_mac_tx_mgmt_free(ar, buf_id);
> +	}
>   }
>   
>   static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
> @@ -7416,8 +7418,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
>   
>   	ath11k_peer_cleanup(ar, arvif->vdev_id);
>   
> -	idr_for_each(&ar->txmgmt_idr,
> -		     ath11k_mac_vif_txmgmt_idr_remove, vif);
> +	ath11k_mac_vif_txmgmt_cleanup(ar, vif);
>   
>   	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>   		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);


-- 
Ramesh

