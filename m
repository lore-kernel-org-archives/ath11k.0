Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E89CCFA0D
	for <ath11k@archiver.kernel.org>; Thu,  6 Nov 2025 01:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nifKokH76T4zhRjj5YF4AXC0b1BHwVNT0qMq0CzQleo=; b=brx87GFZFMNnaFWbE/X4YIX9mk
	w39Z/I+tzhq2S9jIUQtDWuwYBbnCxQPvXGGA6dp4ds0unSnfuG26rs+/kyVU4U+4xL0/1q5tDxzs6
	coyBPZn99mDRKcU1EVpsSiIbybmPAoVYjEyBh+UTTvr/ic1Worlk8T8FGuz5DKFPOHsryYShvHGDX
	dKqVGOy0y0Ty8RyYDK34CUIOFJ8spgJUK3GaPl+GTFbhBP3FqfpupxT93eHTe6rmwsiKAPh28VMfM
	YC6gGKejP9WD7jizW+QaS1jDdtVQXEFrvfCI4BEnW/A+QvwiyqBPCleDjHoxBpU4hZLDo36zclrJ0
	af7vVoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGp01-0000000EhvT-2Tu5;
	Thu, 06 Nov 2025 01:41:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGozz-0000000Ehv6-3SL3
	for ath11k@lists.infradead.org;
	Thu, 06 Nov 2025 01:41:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KF9MF1805164
	for <ath11k@lists.infradead.org>; Thu, 6 Nov 2025 01:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nifKokH76T4zhRjj5YF4AXC0b1BHwVNT0qMq0CzQleo=; b=liusBrOXso3jmETS
	0Lf/XVQqc8wIiIMhRLdgNp4HH8I4EBX++OlychevAtpZcfxSr5cBwG8AIG8/HGnH
	wA1SB37rIxORi4+N8/SrXcCunZoJtd396TVsyL50g0vqo2yXt7mJnm8FNzUnYyoG
	TGDi2D8XA7AcS1depkYsAAupVoKYLIHPiV8rVfZiEHpvFpseOokFxT8x6rTC4c17
	74B6MGOc6XZAtWre3dfdtw5EYyUSbE1flLZiU6RiymLo5nq/mHpuhG4XUAerDXG7
	VBF0Jeb2Dc69lkh8QiL8WV0bWjYzWBkXh1oO1Tx+VgG3GQp2d77B1IBwMIJzJDp8
	btQQqA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8c8s8yd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Nov 2025 01:41:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7afcefb4418so524215b3a.3
        for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 17:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762393272; x=1762998072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nifKokH76T4zhRjj5YF4AXC0b1BHwVNT0qMq0CzQleo=;
        b=MjupfacVv/lnEeQteoXaU+LRf6z3fn6uOYGC8VQwYL6LT+lLprYv0UpauZrSwXjOcP
         zq9XyPmYYpUAieGEQ+ljKF5dTjKIsiwr3073hBCC0hQflt81qI44VjI18u8zJ0lTN3O5
         6G0L8fK+5CTWl4Xy2/XiILE2fTb0jiyMB/BHAFoJSoe3OC8y5/Ej+IwE9VGJfTOMycui
         T3lDxGtErYURPf6FN4kfsLa0ly+zYPbywVS5PQDFnOP2IAjHJ2PGVSLAknQ8cp8/Pzgs
         2KWni9ZnLm8yKofjFFeAA7AVz20fLiBNUScD2ea6Hhmz7zCUkezvSlq+vcFzAAgd3gk6
         H8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762393272; x=1762998072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nifKokH76T4zhRjj5YF4AXC0b1BHwVNT0qMq0CzQleo=;
        b=WJPmDVyYFDIdfEWqlosRtcG2evH4qPdhPuIYAW7iutXplGMKD6k+yQzjZdya8B1XpO
         qpO0q2nj7vlpNWGD6+hR1F/4i9DbxgNpewZDBlnbwCjOTuhhL05GqGQBuUTqOQfKk3mk
         wLi6b4wg26/R3mIoDZI5J85hCAKu9aqk9WuwjM++mj11Xm70bVwmAzaCldWKFaQwLEED
         UUxoWDO0+eMR2t3g85CzHrEexepJ+iMBLj7WGnyYA56C4qtmY1deqGGQM1kk8MKxqAW2
         fTE4meBfKNv+i9H4DCS7xkDKc3+uMz0xJ0Fk3EqC27vE/qWsSgNXjEvDwIgrgqlXl5y+
         5Ptw==
X-Forwarded-Encrypted: i=1; AJvYcCWuKwznrGs/nMVYhwdHsZxHZDXv9at2Xe7I9go+Y8leOezVybxcQdAUCYkLqQ7ccIV/iwFMz38=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUGCz++c0JsPSanHsF5pvhYW/BWMC8r7NgM+8Mbdj4WWFZW1rf
	i0ORxaIsoG4L+Bj0vbpIknVdDLVO3xMd87BoYyaPOiiBOR33gRvYO8nYVvtFog5xXYMOiJmNual
	74Io2v9b394WaoljvUTDYNxIQEAXXMtEqtdz1d8HD2rzf1ssZw7iFjm/FC9te5+nx
X-Gm-Gg: ASbGnctu1N80wR+c7PbTx2pnaRFwf1IWy0OavTBgfmAT4CNAuKWVzeRUplY7Cv2/uMa
	aCNpYqv+7vWlLxohMe4DSWKxzcJiS+xxa9aQKUvEKFv6GOS6sAM6EcZL0BlUGtQKLQ/U5KBEIpQ
	10dX/EqsfwBYAOEjwE001vPVpPPM1BIGq7NcKl98Mn28arhYOMvJa5ygMXPXeR+ho6IZyldPrW0
	zl+viDYdguRxKZ5qClhxWOBNMao/Qk6EJOeCvE2yiJAxto2oK5pNYRQWX6vbuA1rMO+7eentN95
	3+N1yVhNHw/sPR/7cTmlC7lJ0d7Ti3CVsguXr/z7UYyzeechp16jAGOwPckT5wY9pieOW3BwkzE
	Qc18KAE7a5G8uKGq5X6Hw2eDhbMoEuEfcm+v2aHsR6GuJYUCv+TrKVwqywHiwjpvrBOgwZHCr
X-Received: by 2002:a05:6a00:331a:b0:7af:16f1:b47b with SMTP id d2e1a72fcca58-7af16f1b4f2mr3904412b3a.17.1762393272305;
        Wed, 05 Nov 2025 17:41:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKp2Ag5tdLM6RA+At3ZylLTVkpkx9WsAdiG9EmMuTwVQQsXwhKyho07oC6IOv2IKLftdAk4w==
X-Received: by 2002:a05:6a00:331a:b0:7af:16f1:b47b with SMTP id d2e1a72fcca58-7af16f1b4f2mr3904383b3a.17.1762393271770;
        Wed, 05 Nov 2025 17:41:11 -0800 (PST)
Received: from [10.133.33.172] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7f7569cbsm794275b3a.4.2025.11.05.17.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 17:41:11 -0800 (PST)
Message-ID: <bd5340d8-15e9-4fd3-8dab-baa68f06c9cd@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 09:41:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: zero init info->status in
 wmi_process_mgmt_tx_comp()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251104083957.717825-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251104083957.717825-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAxMiBTYWx0ZWRfX6FWPeF/QE0SO
 SiO0Ygo7RrbBkjxqS2jU21gmUPPmgxZWfksm2BU3UX7oRuE84kO2w3WiVXLF7JzzgbCPNr7mobz
 NGrNjTyQr9FozRXtEFC3Ytne8T9mMhBVXlx2KjaEziklTUQ70xn62Urc0Q3GyOm5upqXDZz2deZ
 AZX9d7dPmZE72gHXRHM++U/1OOMfr+8/hY1IB5Jknsr/lUDWSfIt6AhFbMuCR0gXcoKM94h8f3b
 Y7nYyMWvRG3nJ+o5TB1tXLSIjRvHxRhEdeYM+wkBDpilDqaMWBCklE11XLs3/Ri/qUPgWtYsr4d
 4wvwefnh8He6hJWyC5v2xfxZEkXv5xCeHyHKBh0uakv0rOZHNVHm18VcErnZ0uSG1f1zbQeC3n+
 gW4ONpvQ8Ehf6erjfSU7BmlWeds/EA==
X-Authority-Analysis: v=2.4 cv=RLu+3oi+ c=1 sm=1 tr=0 ts=690bfcb9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Gipo2f9WZfF9FUe0tr0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: gGBMsMjm1WiGq2sIODlAUsLOipbgsyrS
X-Proofpoint-GUID: gGBMsMjm1WiGq2sIODlAUsLOipbgsyrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_174115_988794_7A611F8E 
X-CRM114-Status: GOOD (  18.46  )
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



On 11/4/2025 4:39 PM, Nicolas Escande wrote:
> When reporting tx completion using ieee80211_tx_status_xxx() familly of
> functions, the status part of the struct ieee80211_tx_info nested in the
> skb is used to report things like transmit rates & retry count to mac80211
> 
> On the TX data path, this is correctly memset to 0 before calling
> ieee80211_tx_status_ext(), but on the tx mgmt path this was not done.
> 
> This leads to mac80211 treating garbage values as valid transmit counters
> (like tx retries for example) and accounting them as real statistics that
> makes their way to userland via station dump.
> 
> The same issue was resolved in ath12k by commit 9903c0986f78 ("wifi:
> ath12k: Add memset and update default rate value in wmi tx completion")
> 
> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index edff6fb61344..110035dae8a6 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -5967,6 +5967,9 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar,
>  	dma_unmap_single(ar->ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
>  
>  	info = IEEE80211_SKB_CB(msdu);
> +	memset(&info->status, 0, sizeof(info->status));
> +	info->status.rates[0].idx = -1;
> +
>  	if ((!(info->flags & IEEE80211_TX_CTL_NO_ACK)) &&
>  	    !tx_compl_param->status) {
>  		info->flags |= IEEE80211_TX_STAT_ACK;

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

