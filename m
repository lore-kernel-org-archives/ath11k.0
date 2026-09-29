Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A472CA5FA5
	for <ath11k@archiver.kernel.org>; Tue, 29 Sep 2026 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yfq9SBz+PoIlJYBWKIwSyYS2FEOm4EgkNy+o5Gu1D34=; b=5F7c8DN9K0JPuTq/VoIwwW2ekK
	AoDX/3dpwoeAXc1ElxkWqfkPBIWT0XiBM5TOPmT7NpiOVk9mtOtaJchh2IUCX+6XxL7CoYU0cVvtS
	PFfa25SEHacxiIlXbk4Q6oKHSA2l2mLj3wfv7ftH2Nt21x4mTZJb5WIVMFLnQj1s52/9UAxr6YuAb
	PaCU45IzjYA8D76eKTiPMPjvgbi09Knj6mMx4DN3fgRGMafRa0gLHWFAWMwGTDIXdEVAVGTkyde84
	Wdpp5xPn9cSFMwHu7Y/JUWr8lTWo1RG1iUpJk6NNtNLvo7NhUGZJjlCMwTW/eoxk7HRYExxsefvKn
	KzimS2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYOU-00000003jkl-3Vp8;
	Tue, 29 Sep 2026 14:01:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYOR-00000003jkL-3fCz
	for ath11k@lists.infradead.org;
	Tue, 29 Sep 2026 14:01:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqgRD4151413
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 14:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yfq9SBz+PoIlJYBWKIwSyYS2FEOm4EgkNy+o5Gu1D34=; b=S19NDNWPaxsY6T1m
	jdUX0b713cA9G3GBCtngAogLYz+d/4v//H6VhZkfmZuBJmx0SzapqPB5zEN9Xlmd
	awBUfZMcGq+6XI/MODbAw9/ImAcyfSL6HsyfCwYMS7POzBVK2wdOThA273El7B3q
	9cYKDntk9yLWcOaPZG0h0Mhz8X05SXGQ/VPH8w1P+czY2LIXl8X3pEkgrdkmTGUM
	IHc/SvxpD7sBTq8TiOpvbvJPdoYkntFdV4srnJIRauCv4Qh3bty7T3nd0+57wqHb
	qJiYzmfVhMB3gRp1ei0Hi0BlD/eW3D/9BVAfrrhS4RUup+dbAjzc5Dw1gGMpjOoe
	NG8DGQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwncdt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 14:01:13 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-81a9f98acfcso4722066a34.2
        for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790690472; x=1791295272; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yfq9SBz+PoIlJYBWKIwSyYS2FEOm4EgkNy+o5Gu1D34=;
        b=WzZatKD2UWXIQ4Lks+Qa4240AVSyNg3EwzCfD+giju50Iz8CUBC+bEoadWja991+No
         YbQtDMZGB4jaI0nrlPaPwmENd2Vl8mPAIjtY2R08C3t2rDFR3XBobz5Q9WTFIvxEBRdr
         cd8A6PdvfFXenOV0iJAwRIYi/XYoopkrFvHO7iTWh6uKzQbc+gevQvCTLqUNzBlWY6ZB
         tnXYlcL82WYiPSnjgACG+Edl9xa32Ij5t03bIOlBztosvwSKUctr/ZxoHteFV7zzyCEe
         4HULzzRHbXxfI/6Q6S+jiFnSyBKGwyZJm7HoMJfPa44RsxHnysQY6w8VuB7AoE+g2dM1
         PNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690472; x=1791295272;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yfq9SBz+PoIlJYBWKIwSyYS2FEOm4EgkNy+o5Gu1D34=;
        b=enxq/cLL2afCFPqgq7PgPGHasksc1r5AmxXWZ+wDZHvzRoHs27PcGYkAsOfpZ/L5/k
         iKnkM6WrltVy6b4avRetT5jH12GJocn0z00GfEzdYt2qmav1ucYQ/wPBlc8txalt53nG
         /GkmCHpLtGjaz2pzPhnNlXPVaX3aEVmBMjHpZ7H+91B7ZHd/EhMtdMz5y2iHgfspXYOG
         nxp/yVeeG+JDbhTCKvmdHiXNoV/1gtLSoxyCOxMVYRvi7g0kDv3c7LTxg4mN+eZGdoYc
         GPgGUS/GpBWTYxLMke/PXZ/0NsNRtlp4+RzNjD7Hqv5ZrlSCzUnXO2KC5j8rRveBJT0F
         HRdA==
X-Forwarded-Encrypted: i=1; AKwUvByn2omdDIeF/QP3NcY/yNCBVEBivK7mQrbqwrM+DCc5U3xaFxWun15fDqwhuYnDvoiJOK5gvk8=@lists.infradead.org
X-Gm-Message-State: AFuF++nHtmWGgeTtAYO+Uh3ktyGhfUWVoAYcK2xLnoDJUGe4tivwWUlQ
	ZgvfRfOl0ruGxuo+ppRZQx71WbbhhtS/8PjJPDGATcdJc8CVJOhZUr7mKfrdlkPDqTOUmfowMOK
	AdegyfM9xerTmc9XtnG5wbnqezNhVd0bsBOZYYSO9607M8VsGrxi3eWHKk+Sr1cxy
X-Gm-Gg: AYBFou1PUUvaaDVKjp2vXumvvFRITi+VFqd4WKqYSo8EWynlOnCCdRKBf0UF6cB2DjU
	H5xZb96iIQkkMzA8fSP6aoSccX3QDyPUZOBXSpndVEeLKeMc12nBFwFBI9YKZZhHG0q7/Imj5l6
	fw/stTmyvi9Xl4yjr9vHA+WzEhiRRYY+YSFd4CboRzFVOoVMHKi4oZm5u1+Z7wSOrxiEePSZM+2
	M4b7f3SZ4rPl9tmZWHFw6vD2D35lP/L6sPmlDjoiD2Pfd0ZXvgmAYDuEfv8jfbrAaIPAzdBHG8Q
	HvmtBUeCoon2Jjb0cGUhbe6w1iwMkhcofFJZ1ixKbOTPoN5WzLwhX9VOE/o30PAMO6SGTLUbX8d
	rgf/H7aAUOSTS3XtOOdg9oYBM3YNxgbdVpxU0rRlqdOlVEZQeZd5w0uOLnZlL
X-Received: by 2002:a05:6830:91e:b0:81b:b7e3:23b7 with SMTP id 46e09a7af769-81bb7e3269amr7255231a34.31.1790690472273;
        Tue, 29 Sep 2026 07:01:12 -0700 (PDT)
X-Received: by 2002:a05:6830:91e:b0:81b:b7e3:23b7 with SMTP id 46e09a7af769-81bb7e3269amr7255188a34.31.1790690471664;
        Tue, 29 Sep 2026 07:01:11 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81d583f8a58sm4591309a34.10.2026.09.29.07.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:01:10 -0700 (PDT)
Message-ID: <f3066128-7880-4396-b9c5-ef4c9821e3be@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 07:01:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] wifi: ath11k: avoid IDR mutation during pending mgmt
 TX cleanup
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
        Ganesh Sesetti <gseset@codeaurora.org>,
        Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260926154824.75224-1-yaojiale02@163.com>
 <20260926154824.75224-3-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926154824.75224-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX9aOU6MfCIJtx
 Qq99n3OwvaUrk63h8luGwO/ZnF9/ANeaPpMxFdBGighGPi5oA4Prac99B7UTXIfykpsiXPcaCI9
 LaVLTZMRYM+N0pUxSdUSF4cLKy5IJ/ufXd3XVdDJEBeUbhkIgQoCAcbDULYIkyG2RyKLOipCnSd
 qWRf1LIwn7FZZ94Xb1nShlFkvu9ZdRtyspt9KG2nnhhcTJDqR9unu1yiF2g8FD+fMfmK49NUd46
 FF15bNdw3jfPA+KxpJruXgJT6LvgqQiBaiXSlPRCgP+wvOLKUX0Uh5+1UNYlz3KcJsFvyfg78nT
 HinWyiAj3gmR9exSqGcd2SLtrSc4IoukvII1NhLz+09FmfAtVPkVuuieSFA4OCjJnHn4rAM527G
 IAVIbWDUsz7bMxHqwE/Br2/poa5jpA==
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbc4a9 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Byx-y9mGAAAA:8 a=PbnQRnT-oomjuI1N5UMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: 9jYeOeUNyfChFQmtPSkKI57A21VYcdr3
X-Proofpoint-GUID: 9jYeOeUNyfChFQmtPSkKI57A21VYcdr3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX5skQ5ona6iyL
 2HGlFQ1LryEI1UJOKjlWl//NMBs8JpylKufCDRjfxSS2scFDsENwLjB/bJheYs8vUYMgiciUTO3
 +Se3bv2g35HKy9EZPDLbhhE+iGupPhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_070115_937795_C91B800A 
X-CRM114-Status: GOOD (  21.65  )
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

On 9/26/2026 8:48 AM, Jiale Yao wrote:
> ath11k_mac_tx_mgmt_pending_free() is passed as an idr_for_each()
> callback and removes the current entry from txmgmt_idr. This can
> invalidate the radix-tree iterator retained by idr_for_each().
> 
> Both callers destroy the IDR immediately after the walk, so removing
> each entry in the callback is unnecessary. Split skb release from IDR
> removal and let the callback release the supplied skb without updating
> the IDR. The following idr_destroy() tears down the IDR itself.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index ae91b57c8422..696f9dd65ad4 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -6146,18 +6146,11 @@ static void ath11k_mgmt_over_wmi_tx_drop(struct ath11k *ar, struct sk_buff *skb)
>  		wake_up(&ar->txmgmt_empty_waitq);
>  }
>  
> -static void ath11k_mac_tx_mgmt_free(struct ath11k *ar, int buf_id)
> +static void ath11k_mac_tx_mgmt_free_skb(struct ath11k *ar,
> +					struct sk_buff *msdu)
>  {
> -	struct sk_buff *msdu;
>  	struct ieee80211_tx_info *info;
>  
> -	spin_lock_bh(&ar->txmgmt_idr_lock);
> -	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
> -	spin_unlock_bh(&ar->txmgmt_idr_lock);
> -
> -	if (!msdu)
> -		return;
> -
>  	dma_unmap_single(ar->ab->dev, ATH11K_SKB_CB(msdu)->paddr, msdu->len,
>  			 DMA_TO_DEVICE);
>  
> @@ -6167,11 +6160,23 @@ static void ath11k_mac_tx_mgmt_free(struct ath11k *ar, int buf_id)
>  	ath11k_mgmt_over_wmi_tx_drop(ar, msdu);
>  }
>  
> +static void ath11k_mac_tx_mgmt_free(struct ath11k *ar, int buf_id)
> +{
> +	struct sk_buff *msdu;
> +
> +	spin_lock_bh(&ar->txmgmt_idr_lock);
> +	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
> +
> +	if (msdu)
> +		ath11k_mac_tx_mgmt_free_skb(ar, msdu);
> +}
> +
>  int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
>  {
>  	struct ath11k *ar = ctx;
>  
> -	ath11k_mac_tx_mgmt_free(ar, buf_id);
> +	ath11k_mac_tx_mgmt_free_skb(ar, skb);
>  
>  	return 0;
>  }

Just documenting that this has the same potential UAF issue as the ath12k patch:

The ath11k patch makes the same structural change:
ath11k_mac_tx_mgmt_pending_free now calls
ath11k_mac_tx_mgmt_free_skb(ar, skb) instead of ath11k_mac_tx_mgmt_free(ar,
buf_id), so it frees the skb while leaving the IDR entry pointing to it until
idr_destroy() runs.

And we already confirmed that wmi_process_mgmt_tx_comp() in ath11k/wmi.c:6031
holds txmgmt_idr_lock, calls idr_find(), drops the lock, then dereferences the
returned pointer — the same UAF race as in ath12k.

/jeff

