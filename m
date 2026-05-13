Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1955CCD37AC
	for <ath11k@archiver.kernel.org>; Wed, 13 May 2026 01:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saz+pev2K8mOzYf70PXVM9LCWt22Aarfa30XZsfqgsQ=; b=W5uEpKLGX/nX1gQK4BMFVsFp2L
	ejCJPq4/nVi9UNd0GNliPqYYK+xgiPchdSiQZf6IvIiweiKBaJYY0aPmiTTPU4Q31J7FOB6vBJFZx
	VVg1VI+YGcNBLy0bs/XjDmUGXVTHNIMskbUWyzyYzFoHsmYatod+5R0Sp7mZqlhLMks6Wocjn9675
	ROBoR6rjBMdFZS5viU8FCXH72FeihJj57UhHv6LSuHyraf6Q8F2NUOcZ1YqyMk3oMtInxwdbYW+F9
	jE7wTf9gBmIaXxA0xrtKcE3NaUR+6VpPuBc09USG/Wt2x+1ktdQwXbKLxIA9KPJEo5H/o8GHPDuDA
	gyaRX3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMyqB-00000000tXI-37K2;
	Wed, 13 May 2026 01:56:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMyq8-00000000tWk-1AKa
	for ath11k@lists.infradead.org;
	Wed, 13 May 2026 01:56:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D08mu22524900
	for <ath11k@lists.infradead.org>; Wed, 13 May 2026 01:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	saz+pev2K8mOzYf70PXVM9LCWt22Aarfa30XZsfqgsQ=; b=EmO0XZYDEtZXKIPc
	dhLy7ZVP6KZZwiyZQLkAunEmr1l4q7BytgsxmYVL6dxI/HzIQi1XGHsjclG64gKt
	eSXzjSKBqvRRDzTQgYFo19HRaDxWvU0H1h5OCkyiTtZJlDeiGb4W5QISvkdCh7n4
	UK/uxKeRCE9QmRronSTn5KcRvBxE7XhCgVzD/34zmMWuGNJKRURO5FYEH9krDg2j
	dsKBq2jk9m6pmNhpGpNseoQ/cmPtCqF0rmVe8jiYAaZ5crtJv779lb1xSEWgFoL6
	sMZMckmBCBNUlGaHwT8aMhdiPftmUpd5x6O51qT3NduAOczcCleisBfFtsgolZd7
	bTeMXA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhu85u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 13 May 2026 01:56:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3662668b825so10770722a91.3
        for <ath11k@lists.infradead.org>; Tue, 12 May 2026 18:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778637406; x=1779242206; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=saz+pev2K8mOzYf70PXVM9LCWt22Aarfa30XZsfqgsQ=;
        b=MfBeU8gX7WsjKH2/vTqzgfFitFziu6VIEVNHUAT7BVczI5/BcQZxzaXpqTw5YACOC9
         amBuVYnjhDyriRQXkhf2ONcOJZ87GZdufcb4VXqjY4yxdpahOl5H83Sqdlhvbqj5t4VY
         CJ/gUN3VAhoEHQv0zKMlyKiAGZuEAKZT9rZDPXO1zcP79RTamt7Fz4XNV6U501gzekeC
         G/ImuU2yDbsrE076osqvinQkt4qOinuMhOTEN+y0GPYh1NQR2bQ1X6aZ5+tQ+q8gQtCZ
         +r1c1Ee3gLxlIW20oUDGjz8MbCBL/gHzM1zB0baftqJCLxjZGQHeogfwUSDhdfDBskgt
         CqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778637406; x=1779242206;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saz+pev2K8mOzYf70PXVM9LCWt22Aarfa30XZsfqgsQ=;
        b=dnNNnBjgjXAAXA7piWddB4WwOpReNXN8BoZWDv4yCKMNCqL+ot1OO1UIq+iHBJDdUB
         0entPgdiY6PNg2BZln5l8CxU+4F3X9Y/Rd1MVEsaRrmittdaKQGNtDjZEC3NLA4pv+eK
         DYCXmIHd56XZadfVffWH9Oubhhig3iaKF02gzVLN8cTrA+uArlET9x1mu3FqruZGwHG1
         4Q1QQ4H4X0rKTTRm0RdwLJ5ZgoyaNSHSaAwOg3jc/qZq5kHPmqyXD/yXf+Y+VMAuBYCl
         wXsPHjwJlwAOXZzjDtW2C7FAe1F1L0Qh5SqKNrTP5By2vr5wB7F7XsfboOesxQDq1LnF
         te/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9scFvufVPD+BrsCoP1MftGoMMwN008HdEZeVeHXqs+/kBsEPOZFJJoUoXrwMP5yHYwg/9mBLc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTdVnh5DBlSxZskZHnel0NJuzFpTZbFUOMUiIPQvUZ7nOYykIm
	0fq3SmiRSZvBBZDVx14IGM96eaaNLt+NzVTVgwFY4FQsZMD5aSQZ5PFRL13RYPVhyHNIvY0BkA6
	qg8Am5k7KMjt7musfM/Y2Ktw2gMY5uukuJxHfA92+sLsRuZ2vssZRDntzX5w3IVnr
X-Gm-Gg: Acq92OHG7mDAwKz1cG9ba+DCEmhYivRTPyN1YDmsy5YVJjMh2VvAJL5nDwelcovULzk
	A26QTeCVPsBlASuV3wv3OY5d81lVtIVa2+Gi6c0fbeuVeO8vJriuFQVxXloyvhbPxDcjXpp0NFb
	CY0PcDOitdehqsAnuOSR4St9LpJqg1GMXGiDKpWzHTy8Gl5QxoEAd+Fi8JxZ7WD/o3p3kDDCoYR
	qS/EJHceRlBa5PE26ECnIhfHNFR2Ob0iet0gqZUO9s0U9P6nMKZPEL4+7zfno+g2RXLTYkEHnt2
	W1bSwFFLEZ3+21lUQypdYZsJAJ5oThfcoq3ZpahrO/AsIDHGV5J+fwk4VUTdumDacPZzofE/VWm
	7t066Ua8AwYnQ89KI3ObC87lD2VvkF2fTfclTmcY+QL055wDGhcgTQHEXYrfSwYimwW7TMUncd7
	2ZzE/TIflts1umQvlKtpA=
X-Received: by 2002:a17:90b:2f4d:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-368f781f60dmr965093a91.10.1778637405788;
        Tue, 12 May 2026 18:56:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2f4d:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-368f781f60dmr965071a91.10.1778637405302;
        Tue, 12 May 2026 18:56:45 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee327443sm1134873a91.11.2026.05.12.18.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 18:56:45 -0700 (PDT)
Message-ID: <17060e4f-f0f9-4842-9460-82422d23a8c1@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:56:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix txpower in ap mode for 6 Ghz
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath11k@lists.infradead.org
References: <20260512204851.2634163-1-s.gottschall@dd-wrt.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512204851.2634163-1-s.gottschall@dd-wrt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAxNyBTYWx0ZWRfX/c1EBQWZPwKS
 Ov5kc/c0O5d0y+8bANQq0g//mn3xB3BcnW8Ac63dTpyP39Iaq/Dt1OSjtqH+lPLIhVg0g6zMxFK
 kHvIWBrpfeZ6+JBfHsgNOi0YuBJjeSoZRBGVHsjDNrY2gxDcHJFpMCbalVUgEgWC0bocuY6Jkrh
 TVfonu5gAYZcfPKS0TS41e6F+N+9oZD45znqbmkt6WhbtDLem9S5CdXAeYGiYOJtNAJngCcdNih
 09Xxhwc2gwpAQNPUlkfdiIGgUqCHd6xHvsi5LJ9ZppmYapu1mXY/J3F9uqxwwmh7VfqjLPPie/A
 SM9zH4+qDzc46hxiO73mBqt3LqspxxTBJRFx8N2YSztyEqMReXQzq8RFeOB6xyRXD9df82AHtan
 nKWozX8s9OuIvLLEHRgrbyBc8PZ73HxHiOYgCafQd+tsJBfo5JaB2Y55v7rJiJolWVBjKUlhVyF
 Uz2WjUhFDVtgeaVG1cQ==
X-Proofpoint-GUID: 7i05L9Ro_3OKWKmbedxkhjkIq5F64Za0
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a03da5e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Y5XITzagAAAA:8 a=COk6AnOGAAAA:8 a=4gm6xPFbWwVjzW7VRE4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=dfzBCs9aBJshU-flp7fy:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7i05L9Ro_3OKWKmbedxkhjkIq5F64Za0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_185648_447731_E2785DED 
X-CRM114-Status: GOOD (  22.91  )
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



On 5/13/2026 4:48 AM, Sebastian Gottschall wrote:
> there is an issue which has been discovered a while ago while testing
> which killed txpower to 0dbm once scanning is triggered in AP mode
> on QCN9074 based chipsets if 6 Ghz is in use.
> ath11k_wmi_send_vdev_set_tpc_power must be set in AP mode in the same
> way is it is for STA as it is implemented in ath12k and in the
> qsdk version for ath11k.
> this patch must be considered to be backported (i discovered that issue
> already 2 years ago)
> 
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index a48b6bf1f29a..dc192152b2e8 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3497,13 +3497,14 @@ static int ath11k_mac_config_obss_pd(struct ath11k *ar,
>  	return 0;
>  }
>  
> -static bool ath11k_mac_supports_station_tpc(struct ath11k *ar,
> +static bool ath11k_mac_supports_tpc(struct ath11k *ar,
>  					    struct ath11k_vif *arvif,
>  					    const struct cfg80211_chan_def *chandef)
>  {
>  	return ath11k_wmi_supports_6ghz_cc_ext(ar) &&
>  		test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map) &&
> -		arvif->vdev_type == WMI_VDEV_TYPE_STA &&
> +		(arvif->vdev_type == WMI_VDEV_TYPE_STA ||
> +		arvif->vdev_type == WMI_VDEV_TYPE_AP) &&
>  		arvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE &&
>  		chandef->chan &&
>  		chandef->chan->band == NL80211_BAND_6GHZ;
> @@ -7647,8 +7648,8 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
>  	/* TODO: For now we only set TPC power here. However when
>  	 * channel changes, say CSA, it should be updated again.
>  	 */
> -	if (ath11k_mac_supports_station_tpc(ar, arvif, chandef)) {
> -		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, &arvif->chanctx);
> +	if (ath11k_mac_supports_tpc(ar, arvif, chandef)) {
> +		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, ctx);

is this intentional change? I doubt it even doesn't compile.

>  		ath11k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
>  						   &arvif->reg_tpc_info);
>  	}

the ath12k patch has additional changes to hardcode power_type to LPI for an AP vdev,
should it be done for ath11k as well?

commit a44958c83e52238996a48e7d604167c9b9d0a529
Author: Hariharan Basuthkar <quic_hbasuthk@quicinc.com>
Date:   Fri Jun 6 16:53:16 2025 +0530

    wifi: ath12k: Send WMI_VDEV_SET_TPC_POWER_CMD for AP vdev

    [...]

    For a AP vdev, hardcode ap_power_type as IEEE80211_REG_LPI_AP, which is
    filled in the WMI_VDEV_SET_TPC_POWER_CMDID sent to the target.
    Currently, LPI is the only supported AP power mode. Since there is
    no method currently to set the AP power mode from user-space, the
    power mode is hard-coded to LPI.


