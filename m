Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05F9C4451B
	for <ath11k@archiver.kernel.org>; Mon, 20 Jul 2026 06:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAxsj4WkF7EoB1I8FK7kcVdIqxSr5L8sLd8lHsuMIkU=; b=GY0XVqZ8rMoJmKj3zMm+Scw5E/
	YrI8O5GBJftGurc7vdhClGLMRP1/UgCpNpns1fucbnnzyX+QDdkKZt9ColRY5qa1RinqtAM5rzy3m
	0aRpm37zdFl644oyZkLXXqmjKmDWBZJD2zsQaQeCYKw0iUW3fMGx781FH6QYKPTTYuyJZJ1kGJw4V
	Nfqkppu66yV/Ge/XoI0T6qUrmFazpMJeak01qdPGAF6Yh8/pZ2BeJYVIEdl63eFQgckRqKUH5YcSE
	A7eySgRnPPtlkTOEFmXwYLdBMf4YH06kESj1kNSHFgdWfrAKdCmp/7LdsEE5WwnNvwKiU1JT/PVKO
	GHz08MJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhWy-00000005yHJ-2NOd;
	Mon, 20 Jul 2026 06:31:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhWw-00000005yGf-1srL
	for ath11k@lists.infradead.org;
	Mon, 20 Jul 2026 06:31:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6Rab61617086
	for <ath11k@lists.infradead.org>; Mon, 20 Jul 2026 06:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zAxsj4WkF7EoB1I8FK7kcVdIqxSr5L8sLd8lHsuMIkU=; b=T21+3LvnuDY4qgdo
	Ipz1Qt73p/u05pLLMnqdmJod7erdT7C8DANYuhie8WcT8k9MMQ6YnZitPtaI+AT0
	aGXc82I0Kk0V16zJu3UXOmP+tbzYTCXNselfcxIyLpb3M9oIaDL9h9cCa/QkGZm3
	WUPw+BB8oJTOFaVWXKsk+U9yvdsfgANjhIKslP1Hr369TEiqeIy/wvVTaO4Il1/o
	TAQVRKpZJ2wePvP2KQcfur7ow5z0OoddkRKIMH9bEnSKaIrJvdxM4gByfokyDSfa
	lkdeSXfH9wPjowHaFa0YR9zmTi1sEwoPSKBszL2luoHqQegbUbAvE88XYLE5z7q4
	tc94kg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnmqmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 20 Jul 2026 06:31:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so5187917a91.1
        for <ath11k@lists.infradead.org>; Sun, 19 Jul 2026 23:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784529068; x=1785133868; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zAxsj4WkF7EoB1I8FK7kcVdIqxSr5L8sLd8lHsuMIkU=;
        b=Fe+gJL5CcTerFCbnks/k+WGRRqfWEMqP0j4GvwDgUEAUx715KbGPOIx0ACLEAwUDVe
         6vmyhOtS0RNn+zvZh9fvnmesU/m/QY0FF2nl+HsMBx+QdNKK2UMi5UAnAypt7jNNzFVf
         OwHqAwQQdUCstIZDT3unIbpccOhWC5ICCHpHLmIX9doxnQE541MlWJI1s7GA+Kv3vr+8
         GKxIgu7hKzDH/CHr8B7HJBV2Nwymt9U5IzR6svaZ8BtheyLf0JQ7wBsjSuQKe+YVWbbW
         qQZcIuD8sXuDeuRkGuKrP3UeAHq/r0ruMvla2UEGKTCTLhy2enGAZ1N4yw7tPYrKmKHL
         TBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784529068; x=1785133868;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAxsj4WkF7EoB1I8FK7kcVdIqxSr5L8sLd8lHsuMIkU=;
        b=IjUyKmwyDhIS7hBEAvBrGEUNZieJqYwimPQJMHk/XNoSkkL5irXl/xIRNkO/9bKz3v
         9Wz/vrXEnXlK1EBI1hLqHRJw2aP+JN7/PhLW3MGZ2BefMmFahoNbZnup2fdZjkWNi+5D
         RcdQYANDCtVdsSzDLe3+rpjAQHuagyzW+ug1cL4jBcyE6P5EhE0Jyb4Tlsf5C0iB87UF
         4icdjoaX+2IsIUQ81Gr3hGyDCk8XUOduP8reOiuNozwLvxIMayPZLo+Xe73T/bi/D0Xo
         KJuEDjjgmP7IGzi00wSkJrIjHC9g04IIv7YSSZCt7ryMePIA2LHRU0km8CxcjHsIXfdc
         LD7A==
X-Forwarded-Encrypted: i=1; AHgh+Rq5ktq+8HApa5qkpmGpIe2m250fYgIH+BVFSNT35ciwLJNEwU34Dlf2MK4kbvmE196OUtoXriw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCZ0tf/hLWDVMpEd58Wx9IqPoWMowV54Se6zopcOmdcYijsjdZ
	zoQcdS1B+9e5FkjsSCaiILs8Pg8iQS7uqTALIWu9f9B8WQQn2E6rrKlZyM/ekss/dpkIj/Wsuy8
	dPGYzKfR5RxLbWmkRXRHJBTLXt/owKtF3UrbL6qLO3cnbP4yzkXD1a22hLxCLaRk1/sAwYk1SS0
	E=
X-Gm-Gg: AfdE7clwTAWo0++SdQgXHy3jbt5XVCW9tHxb5RCzXrFmgROE2NracCIPfvzCA0biQr7
	0uyAEP7w54XnqsHYpD4NnpzL7YmQfnKDIvKm7XyGt7NYVYs06IEGkT+YZDuJRe1UmpwM8Eq/4Qr
	/lVOsUOhJj7leP5BczVqpw9gmNOZNF5CbBw1aMbF4kiDZ0s0eWMfHG3kYRGgqvgXZemM6XLVxnV
	IyKkTPxEX59i85l7WSaApBZMynG6WylXiPqpC4Q2Lwr4OgePgcFUgqN6zof6z1qvkMyK54Us+bp
	sa+CYUvNc/e46FJkFq94Erd7b79xjFwrSdOJg27/Hj4W+hhcIYjLQSOhHK2OOXtAqrx6R8/yjjm
	7VuiujGrZbu0qU0E0E6A7+nE9TG/dJOx+fU/tefqzdnDXKeyLWE743GHPOuZTZVqZOSTBiqrO
X-Received: by 2002:a17:90b:5808:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-38e4b5419e7mr13896212a91.32.1784529068305;
        Sun, 19 Jul 2026 23:31:08 -0700 (PDT)
X-Received: by 2002:a17:90b:5808:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-38e4b5419e7mr13896173a91.32.1784529067700;
        Sun, 19 Jul 2026 23:31:07 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e656e5686sm3251253a91.14.2026.07.19.23.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 23:31:07 -0700 (PDT)
Message-ID: <2c56c58d-4e04-427b-9309-8895ccddc03a@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:31:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: fix txpower in ap mode for 6 Ghz
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260514202750.3040404-1-s.gottschall@dd-wrt.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260514202750.3040404-1-s.gottschall@dd-wrt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OGaH2Mb_INQ88pF2u07P_0BIzT3gViPe
X-Proofpoint-ORIG-GUID: OGaH2Mb_INQ88pF2u07P_0BIzT3gViPe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3MCBTYWx0ZWRfX0MvdTaYrvn3S
 yqqhnpTOT/yhLYBxCrRj+SBW1HOR+RxFrrRh4HNnNXVWEkYAR9DQXSU3BU6JAQtqmaq3O8zHdEn
 KQwgVufv60KSX3+wk1+uHPtIP3WqnsTm4UkeojteJd30U7OdpgakYIjWsf6IgNKjv1uhd37i67B
 ii/BPtM8JWxXZXkpuUkd+wkwgxsHllKhghdpD874vSMwrNMfl7Nqqf5bkGSwBZKxhIK85CZfkZb
 M2nf/PjWeI8fG3O+zBbVnKvCfFr/9BDd4UokH8/t0+sVRV0kO3zBQ1id//6JOHz3CYvLJE3uSxC
 F1//JoJrw8NQHc+lc9qTITyYwFttt3gjK0RhObNtEApCml7ZlGsyxSQt00JHcXI8tlrFkpGiCIM
 x8ulYQxA4+vlkmPrKhexqupTvg+HZV0i/ft7NSymhXrnpdS9WRE5WvMGI2fDT/Zv+ps13M84bvK
 uP5KRHrLQH4m8GgwQUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3MCBTYWx0ZWRfX9hS4ch9hULji
 OWEe0BVWGKpg9ogt4okFAfAFYiMU76wcC1KeavmaU5YKumVmCUjI3BLd/MgE3VKJsEZ3EVsGQIB
 Eh5txeYlVZ4rEzFz4I5OaotCQVNiB4Q=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5dc0ad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Y5XITzagAAAA:8 a=N9EDWGr9MySOorLMXccA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=dfzBCs9aBJshU-flp7fy:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_233110_608467_6AF8E22B 
X-CRM114-Status: GOOD (  25.70  )
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



On 5/15/2026 4:27 AM, Sebastian Gottschall wrote:
> there is an issue which has been discovered a while ago while testing
> which killed txpower to 0 dBm once scanning is triggered in AP mode
> on QCN9074 based chipsets if 6 GHz is in use.
> ath11k_wmi_send_vdev_set_tpc_power must be set in AP mode in the same
> way is it is for STA as it is implemented in ath12k and in the
> qsdk version for ath11k.
> this patch must be considered to be backported (i discovered that issue
> already 2 years ago)
> 
> fixes: 74ef2d05ede63fd6416aa635aa8972dff901325f
> (wifi: ath11k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz)

checkpatch errors on this. Three problems: (1) it must be Fixes: (capital F), not fixes:;
(2) the SHA should be truncated to 12 chars with the title in parentheses on the same
line, not split across two lines with the full 40-char SHA; (3) the tag belongs in the
trailer block just above Signed-off-by, not buried in the body separated by a blank line.
Correct form:

Fixes: 74ef2d05ede6 ("wifi: ath11k: use WMI_VDEV_SET_TPC_POWER_CMDID when
EXT_TPC_REG_SUPPORT for 6 GHz")


> 
> changes:
> v2: code formating fixes, take care about LPI setting in AP mode
> v3: fix typo in email annotation

The changes: / v2: / v3: block sits above the --- line, so git am would commit it into git
history. It should go below the --- scissors (after Signed-off-by, before the diff), so it
stays in the mail and is stripped from the final commit.

> 
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index a48b6bf1f29a..0984c3981ee4 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3497,13 +3497,13 @@ static int ath11k_mac_config_obss_pd(struct ath11k *ar,
>  	return 0;
>  }
>  
> -static bool ath11k_mac_supports_station_tpc(struct ath11k *ar,
> -					    struct ath11k_vif *arvif,
> -					    const struct cfg80211_chan_def *chandef)
> +static bool ath11k_mac_supports_tpc(struct ath11k *ar, struct ath11k_vif *arvif,
> +				    const struct cfg80211_chan_def *chandef)
>  {
>  	return ath11k_wmi_supports_6ghz_cc_ext(ar) &&
>  		test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map) &&
> -		arvif->vdev_type == WMI_VDEV_TYPE_STA &&
> +		(arvif->vdev_type == WMI_VDEV_TYPE_STA ||
> +		arvif->vdev_type == WMI_VDEV_TYPE_AP) &&

The continuation arvif->vdev_type == WMI_VDEV_TYPE_AP should align to the char after the
open paren.

>  		arvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE &&
>  		chandef->chan &&
>  		chandef->chan->band == NL80211_BAND_6GHZ;
> @@ -7647,8 +7647,8 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
>  	/* TODO: For now we only set TPC power here. However when
>  	 * channel changes, say CSA, it should be updated again.
>  	 */
> -	if (ath11k_mac_supports_station_tpc(ar, arvif, chandef)) {
> -		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, &arvif->chanctx);
> +	if (ath11k_mac_supports_tpc(ar, arvif, chandef)) {
> +		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, ctx);
>  		ath11k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
>  						   &arvif->reg_tpc_info);
>  	}
> @@ -8155,6 +8155,7 @@ void ath11k_mac_fill_reg_tpc_info(struct ath11k *ar,
>  		psd_power, tx_power;
>  	s8 eirp_power = 0;
>  	u16 start_freq, center_freq;
> +	u8 reg_6ghz_power_mode;
>  
>  	chan = ctx->def.chan;
>  	start_freq = ath11k_mac_get_6ghz_start_frequency(&ctx->def);
> @@ -8311,8 +8312,14 @@ void ath11k_mac_fill_reg_tpc_info(struct ath11k *ar,
>  	reg_tpc_info->num_pwr_levels = num_pwr_levels;
>  	reg_tpc_info->is_psd_power = is_psd_power;
>  	reg_tpc_info->eirp_power = eirp_power;
> +	if (arvif->vdev_type == WMI_VDEV_TYPE_STA)
> +		reg_6ghz_power_mode = vif->bss_conf.power_type;

The function already has struct ieee80211_bss_conf *bss_conf = &vif->bss_conf; use it.

> +	else
> +		/* For now, LPI is the only supported AP power mode */
> +		reg_6ghz_power_mode = IEEE80211_REG_LPI_AP;
> +
>  	reg_tpc_info->ap_power_type =
> -		ath11k_reg_ap_pwr_convert(vif->bss_conf.power_type);
> +		ath11k_reg_ap_pwr_convert(reg_6ghz_power_mode);
>  }
>  
>  static void ath11k_mac_parse_tx_pwr_env(struct ath11k *ar,


