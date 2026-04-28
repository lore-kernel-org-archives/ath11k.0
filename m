Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02291FF8868
	for <ath11k@archiver.kernel.org>; Tue, 28 Apr 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6ZWVOLEabM1Q1/TAsy7ZN2TCZOO2dSSjesAd9yiZhI=; b=A0NPy21ZXIcmiWK4kGA/G1v6hU
	zacCx0VF8CoSIf6p3vxNYOAmybGRXgqF0H5JR2RkbxSTMkqepBwAZzuUJTcbt3Xhhluk6BQLBnvJE
	ybEPd0Czd++d2aJ0ay3DFDJYx1/KHh2b2hVpzn4qmfMNax+E+Wt0Cf7vNtrGk3dAwjAcD1QFXN+VH
	nT7ALyiDxowYJ1oFEUty9XVYVrt2BFmKlQunk5Vz9DQRdBpL5Z89INSGcAb8Gyeby/DsaaRpbghU/
	5L76B42mmK0s4s7kPxOMGKgvtJVV/qXPQDsW4XhUt3ZOXLn1SYPAVQQJNfGEcWiQP0Vxm4aUFxTam
	jFRxyOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHf5Y-000000017Qv-4620;
	Tue, 28 Apr 2026 09:50:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHf5W-000000017QZ-1AhV
	for ath11k@lists.infradead.org;
	Tue, 28 Apr 2026 09:50:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S6pcm91625529
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 09:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u6ZWVOLEabM1Q1/TAsy7ZN2TCZOO2dSSjesAd9yiZhI=; b=dVwt1E64iK6nvC4M
	KXXf67fsu4pLiLnFKfGKyhVL/iIyZ5Bk/kQLz/UVEfp3806Zwrva4qrGL/ijUwnl
	I1PgDmsFg6NPo4iq/h7o2Cn+3x2L+YKboxcMk1+NZ3CFFOBSPiis1SrpnXZGhfVl
	t//eDGhNqBnNjGpIlIjfnx8Wkl3dyq6JwmODfPSnOIFq1N/eJq4pp9hJ6eEgmMdc
	r8LHJr6//Zl70Snlh7m8pfe7HRJ/qwWiL40mFfzyYBsSG4BhpFOOmFKxZG9eJtbm
	kkD42AdBAIO8HyoTmWWZ3oWY8+6eds+r1yTRwT4bI9Y5V3GLDEy90VWu/LEstbas
	HlhLNA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsab36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 09:50:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so5827353a91.0
        for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777369841; x=1777974641; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6ZWVOLEabM1Q1/TAsy7ZN2TCZOO2dSSjesAd9yiZhI=;
        b=CNeHfN8jZlg5OlTWONDtkIwRokzxSTcp0ut/i7ZvH1Sy86YNwCfTeLvQR+DEQYXCjL
         qW+k0p0mPgZSW05ma52AmIW76zhBfDpRFSZU+tF2pruo2jA6ct6HeXu3kWQd/2yAdRGy
         bbvLL3zA5ghLWomejuGvFV9djZXJC9hSYlAFdhdE2+Z/qlw2GWJ9gbWYoGuMvNYY+8zn
         hzMOuE2ISL/xnCSpgpYOpuA/O1WlPr+QdH1GjRHodY7F+YyZlL2Xc5FQtdOvg2vlwqai
         xbT103ox/TPH74UuhoST5IDOxNCOCVnqPays0CdRy7cx4DcSqEnxHBnmDaHZXNQhjvZi
         +yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369841; x=1777974641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6ZWVOLEabM1Q1/TAsy7ZN2TCZOO2dSSjesAd9yiZhI=;
        b=PhWrEP+2Z/vgTWZq3p6gA7fLwiHboIfO1/6zDmv80PqDhJoaOcyBfjkfnf0xsJPtm+
         1phgGADqt4f0PUTlf5GUKD34fvJRf1O0ZhzS5bwHXSFKppoUMOgHs71JGOL+XNThx56g
         hsCRwcaaJAW6Uwlhcr9mzHWasqov9r0fqHrgqJRBfRGeoQ5PIFkUKVHIPPM22HgWXS40
         M2Yw830tjl2tBYBfjg1GYyq/0iVEc3gyACB5EQhbbRo5HEUIwjdWf4ICQbadmflaBtGC
         97H5ynDJf7D4iGRvpm9C3kDl6nkj14LUEyjUuM9bTpDE9K3hK1qe+S0mxljM2luLG35K
         9zFw==
X-Forwarded-Encrypted: i=1; AFNElJ9d3VnA5w+1OcWxUF4xGPgE6rtEbD5hUaTVrBR6FC0c7OkS2AyerHalQHY5wHAQDU+pC7WaXv8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHom3P2p5lPEFwRStat3uH1zhC6lEHHHMsv4/wPZYnron1+inI
	gLyNyIU1A+PsbvRCQvlPYqyYL//Y0s7VZ3E8rre1vfIzlMixeaUmS9eGE2TQrGwgTg01vSObyNd
	I67cf43B+jIVlsTMyW8xm5aCC4W/zeCSmn6JH3JixQKKfyoC6sfpCKGdsKdKQuJnR
X-Gm-Gg: AeBDiesNqDWRok2kt/MJ9wqGqVCKoIqOOoWAs3PcIIzDKb5rdANpV38hRIEFns6JVBL
	WdtHawJIjJ+EPbNsSgebERMRcSUzDL/BE9SKwLUUTTYAyMD6f8A69At6bTSnfKAECTuxBgG3Ufm
	+ZHhYZZxYwSL3j+W36fI0r0s7zcJjMtzgapzu7ck+xdIIYRILEdrQDmuyyxP5iI2tL9CD7+vpVO
	RcFBjP6Qw+T8C89XwR/unUsf3l1mZ0BgmrJdodo03w6FZfJ1irzofDVzxi/2bRCE81BAaEkvoTP
	uq5/vLKeM4eI2ky9jx5CJXQaAybDgTDkqBiP52DoYTNa0dOB3uOoQCl2Vv6J78LQrB1S/oTMVnC
	jov7z8LydQOtHK3yd9kqLj6xAOIMpopyfGK5qnrxq6rWJaLZcOX6O7THfnfHqp+iOdGkJcUua
X-Received: by 2002:a05:6a21:6d9e:b0:39f:91e9:cada with SMTP id adf61e73a8af0-3a39c049fe3mr2900878637.9.1777369840820;
        Tue, 28 Apr 2026 02:50:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d9e:b0:39f:91e9:cada with SMTP id adf61e73a8af0-3a39c049fe3mr2900836637.9.1777369840254;
        Tue, 28 Apr 2026 02:50:40 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc35d0eadsm1983071a12.27.2026.04.28.02.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:50:39 -0700 (PDT)
Message-ID: <582155ff-1cac-4d88-a6b2-006146ba4e67@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 15:20:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 ath-next] wifi: ath11k: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260421231205.77361-1-rosenp@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260421231205.77361-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fPi-lhApZiTQHg5jeLGz7-cRdFfydQ9f
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f082f1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=DUA8lF3kxO5kyfe6QosA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4NiBTYWx0ZWRfX/KDQmf58kEgC
 Qs1LeqFoFq0fmtUe2iPssc1gQ+bkD9tHuZRkZVlA2/21NyBlhnXqbAbIioOEcyHw6lZjqTjnges
 qGbMKavkrTMpNUFYaXTVU/G9vvGhv/qlVEpVvgOclpAy70iB4iJK7OA1u20wYM5h/pUX3hRy1hz
 HuSpmTJmQP1SJ3vilvwnb3RXNEy0wjTmuv5sJKCjqRoAGVl2H9wZjqg1rHFbgq8StRqLsWdHAXp
 r7pKfg3nZv39Uk53x+NJVdrm8tZsnJDW9B7uEX7+Ego1ooK1yg8CzbU5iR0ChDefin4dKdiobhd
 Tk5osvOOYYlVxihpXnpM/SEPdxNcQD+xliuZkWVo8P0xukh8ffQxSwE17vZed7rcGjPoFB7kxbQ
 7bXsyNUEDgZLk7qpK4wQ9RXHK2DXZmm2W9a00DKYdj0Jg+ST8L0bILYLvoS3ND5tlHoeP8qEexH
 QPGrUdpw5DruIsBgamw==
X-Proofpoint-ORIG-GUID: fPi-lhApZiTQHg5jeLGz7-cRdFfydQ9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_025042_329819_073BB356 
X-CRM114-Status: GOOD (  24.27  )
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

On 4/22/2026 4:42 AM, Rosen Penev wrote:
> Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
> 
> Add __counted_by to get extra runtime analysis. Move counting variable
> assignment immediately after allocation before any potential accesses.
> kzalloc_flex does this anyway for GCC >= 15.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   v2: reword counting variable comment.
>   drivers/net/wireless/ath/ath11k/mac.c | 71 ++++++++++-----------------
>   drivers/net/wireless/ath/ath11k/wmi.h |  2 +-
>   2 files changed, 28 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 4a68bb9ca4fa..b5f3d7221b5f 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -4228,13 +4228,14 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
>   	if (ret)
>   		goto exit;
> 
> -	arg = kzalloc_obj(*arg);
> +	arg = kzalloc_flex(*arg, chan_list, req->n_channels);
> 
>   	if (!arg) {
>   		ret = -ENOMEM;
>   		goto exit;
>   	}
> 
> +	arg->num_chan = req->n_channels;
>   	ath11k_wmi_start_scan_init(ar, arg);
>   	arg->vdev_id = arvif->vdev_id;
>   	arg->scan_id = ATH11K_SCAN_ID;
> @@ -4262,38 +4263,27 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
>   		arg->scan_f_passive = 1;
>   	}
> 
> -	if (req->n_channels) {
> -		arg->num_chan = req->n_channels;
> -		arg->chan_list = kcalloc(arg->num_chan, sizeof(*arg->chan_list),
> -					 GFP_KERNEL);
> +	for (i = 0; i < arg->num_chan; i++) {
> +		if (test_bit(WMI_TLV_SERVICE_SCAN_CONFIG_PER_CHANNEL,
> +			     ar->ab->wmi_ab.svc_map)) {
> +			arg->chan_list[i] =
> +				u32_encode_bits(req->channels[i]->center_freq,
> +						WMI_SCAN_CONFIG_PER_CHANNEL_MASK);
> 
> -		if (!arg->chan_list) {
> -			ret = -ENOMEM;
> -			goto exit;
> -		}
> -
> -		for (i = 0; i < arg->num_chan; i++) {
> -			if (test_bit(WMI_TLV_SERVICE_SCAN_CONFIG_PER_CHANNEL,
> -				     ar->ab->wmi_ab.svc_map)) {
> -				arg->chan_list[i] =
> -					u32_encode_bits(req->channels[i]->center_freq,
> -							WMI_SCAN_CONFIG_PER_CHANNEL_MASK);
> -
> -				/* If NL80211_SCAN_FLAG_COLOCATED_6GHZ is set in scan
> -				 * flags, then scan all PSC channels in 6 GHz band and
> -				 * those non-PSC channels where RNR IE is found during
> -				 * the legacy 2.4/5 GHz scan.
> -				 * If NL80211_SCAN_FLAG_COLOCATED_6GHZ is not set,
> -				 * then all channels in 6 GHz will be scanned.
> -				 */
> -				if (req->channels[i]->band == NL80211_BAND_6GHZ &&
> -				    req->flags & NL80211_SCAN_FLAG_COLOCATED_6GHZ &&
> -				    !cfg80211_channel_is_psc(req->channels[i]))
> -					arg->chan_list[i] |=
> -						WMI_SCAN_CH_FLAG_SCAN_ONLY_IF_RNR_FOUND;
> -			} else {
> -				arg->chan_list[i] = req->channels[i]->center_freq;
> -			}
> +			/* If NL80211_SCAN_FLAG_COLOCATED_6GHZ is set in scan
> +			 * flags, then scan all PSC channels in 6 GHz band and
> +			 * those non-PSC channels where RNR IE is found during
> +			 * the legacy 2.4/5 GHz scan.
> +			 * If NL80211_SCAN_FLAG_COLOCATED_6GHZ is not set,
> +			 * then all channels in 6 GHz will be scanned.
> +			 */
> +			if (req->channels[i]->band == NL80211_BAND_6GHZ &&
> +			    req->flags & NL80211_SCAN_FLAG_COLOCATED_6GHZ &&
> +			    !cfg80211_channel_is_psc(req->channels[i]))
> +				arg->chan_list[i] |=
> +					WMI_SCAN_CH_FLAG_SCAN_ONLY_IF_RNR_FOUND;
> +		} else {
> +			arg->chan_list[i] = req->channels[i]->center_freq;
>   		}
>   	}
> 


the exit: label at the end of the function has kfree(arg->chan_list); 
which now must be removed.



--
Ramesh

