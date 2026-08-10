Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1951EC5AD7B
	for <ath11k@archiver.kernel.org>; Mon, 10 Aug 2026 19:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5uRF4apvDG4n26t0qi0Zot/rx+YatnhGdz3MSqeY6s=; b=sq/50dlaqNOILr84KIZ4ky5hbl
	n5J6N/foRmK7XzQWIF72DV05nvNg61uNvQi8H9DZJJa29UWKnrW2/+0d70hwZshjW/le+U/rcp0Vi
	RQFAA8QBfcYePNXwI3nSdQUx6vbu3PU7K22OuKgmf/B6WnQ35Kh6Wl0IJpNSeCpbnXqsmcAeEJW8E
	S9Cs0KvOloD9HMVlxDJDymPxRV4ER43I7RRAhqQ+LDAv25RUcf3DsUzwwWJiMMg6JIFhhYiiJ9x1z
	zKfclRFfKRP/OFj902whbKz9wU8QuPgji/bUBMP3A8OqaOiek1R/H+d26GsWihgfpBUPT74y5746M
	BIaEUshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVJe-0000000Chlt-1W4A;
	Mon, 10 Aug 2026 19:05:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVJb-0000000ChlC-3qT7
	for ath11k@lists.infradead.org;
	Mon, 10 Aug 2026 19:05:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AIwIkT2805153
	for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 19:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5uRF4apvDG4n26t0qi0Zot/rx+YatnhGdz3MSqeY6s=; b=PzdgkBfX1N0CFsoG
	tItC9EhvBl4tPbr/T/Bq6Oi97AQY7PR9F1/kXyqSruc15myEyPzAir9iAT8PsXLH
	vajjS45lChNlppZDxEHsAkVJ8ZGD+gXbkQseRcOU0IchA+bRY+tqXk4qO+xkGTWN
	OijtkgFWsbJSHL76BDe7yTb5bO1wOs0B6sDBR91T5PS2cAG/6tyva/V0GwOPXVab
	pbQ9T7MRP9nLqM5fCr21nKczLRNbXtiINzIdOZM1lYYCz3xkpYCIMboeCc1USSb9
	Hdf6iEeB/Km4H0/rGt0l5PwttHoTD48tuos9iu5kHfROkm0lN18TUBcUi9nNy4F7
	XxMxxA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfrfdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 19:05:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so3327409a91.2
        for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 12:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786388737; x=1786993537; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5uRF4apvDG4n26t0qi0Zot/rx+YatnhGdz3MSqeY6s=;
        b=TJkF+dNpXD3lp4V33u/njZkny+FgGvqJN0cJ8dW5npjZEF4WSaoTQj8Jp66SdYkuhC
         7zbwmuy+qF/OQYDki9ZPxUua37X7Wdo4SFKdhTj+b79HM6fVf751u8qlWwoJTOPWELcC
         GpPV6lZvyh4QFsG1VF05NuCVs80c3RaYFCAmEVkZj7gAwRn30R5u0rQliIOhy7X7LwMs
         6RX9y9gav+UDiACKI1NDRWW9BvdWlFmsvX6CEipu9eI10nn53MyDuCWPh+hoq//QjLAL
         Jh7NEsiEmvNXmqFSn0fSMwQsqlJDedTSj7C/Vs3OlCi1F2lyYb2rlvJTe47IWe0+APiP
         2gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786388737; x=1786993537;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5uRF4apvDG4n26t0qi0Zot/rx+YatnhGdz3MSqeY6s=;
        b=Jd52jco0YxypzNkbCdb/d2sokr833bLq6mS02IDXQcGHMjLFG9nqf0N/AIBgKqd+WX
         a0QuGsI9MKZE81imEMx3G9n/o3qtJOGadEQaL4YFDUczF1KQXFl1yBST94u2J8MFqIyk
         9jWJh7EmxE8KuIwFlQFNLtuHiAA+baG4+xAzDxKfJgcqP+qOgbGQkpcWFFGSiD3n3J3Q
         /Pn7bTVyk8sjBl74agTA6BJo8DgfnyShl+cKkgENqMLJIeQFwtWZxD+FPq7PE8Dy2R8Z
         ptwVuqEc/vKDAWLtyoqWppOyPpbh1oZuwIcf4Td7PFYg8i5vfITiXT+UdW92JcQSpLOS
         WaYQ==
X-Forwarded-Encrypted: i=1; AHgh+RptMW63XUQ+x//7zI3Yj7eSLJ1VsOszk7fPQAiMHHOVgB4y61lqunWdG9BVIYQK73Y2DRIpJs0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlBlOaVHGyYkXACJVGaqtPLx7npA/V/jSKdO8cn2zuAZQwXolV
	R/EqGY19E40sWsZLqpX/PiieBLWPX1N+j78Unk5UW2VnqxY1jFIEVei+KrE5S5RqW+1FfJ5+67I
	HTiTc1wJVIlecnU3Wy7/6v54Y2fnHrRAJ0tRKxTcvkcYhfDePM5lCPa9ZGxU8TWxmwtszcjlp
X-Gm-Gg: AR+sD125NFTzxtL6v08wkwamoxXr4ZNWhevlVVUUhSmvFG70oOOVxE068XTlla60Nn+
	rQJJdU2hmvSpq+mtNcjfyrwUuAWOCt3VTUULG7THxWDjkdr/MRmxhK9PkHE0Nyp7K3nNHrDFpHu
	0wYEUK8gSqohQfb67Uxpjcs3L/tqBkBcTlubh8QHMNHFsGQcdj1GHJEjDMMB7qDLTzrQA2LD7vJ
	lXABKWHzwq/aEPsg4y1t8XynXb2Oh66odONTgXQtqAH5dBI2lAwDFDr9ClUtolLDldXr1u1quxc
	X6HuNHW/93IYjdVOc+dTyHXLM12z0He+GjPUVLrwHQZkapUGtlaQqa6BL0QV91rvLkXnCF977wj
	hOLvN8PRo08lij63KjG9LeJXdRCs24T3wp5njFzScyCU/fhB1i1T17+7MN0W3
X-Received: by 2002:a17:90b:4c8d:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-392cc9f4517mr3371868a91.10.1786388736458;
        Mon, 10 Aug 2026 12:05:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8d:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-392cc9f4517mr3371769a91.10.1786388735541;
        Mon, 10 Aug 2026 12:05:35 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141018f18d6sm41432625c88.0.2026.08.10.12.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 12:05:34 -0700 (PDT)
Message-ID: <33165600-be3b-4faa-aef9-97c0b56e36de@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 12:05:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: run ahb shutdown() teardown only on
 WCN6750
To: =?UTF-8?Q?Andr=C3=A9_Valentin?= <avalentin@marcant.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Kalle Valo <kvalo@kernel.org>, stable@vger.kernel.org,
        Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
References: <20260807094858.1548216-1-avalentin@marcant.net>
 <20260808213551.4169863-1-avalentin@marcant.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260808213551.4169863-1-avalentin@marcant.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7wGqblZ2S32HbaETnzaUzQuUoGZD0_DR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE2MiBTYWx0ZWRfXyKLkqcIOCLA7
 0nVi4YJ2JnMkEd1k/0WofSZz0x52iFupaBtzTYTbklPyFYOY5JXPlo4eqMNFQy9V7SozfHDf9x2
 9XIyUVT5V8X8fljQpv7++7BXws0Gc6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE2MiBTYWx0ZWRfX49pYYG+x3HR6
 1T2GXF6BWyyj0s6WaEpk3YrDBnrZOU75kWOu8FlMjrbfnkX7jDn2KR4gQD14BcX4Ow8SOf3tnfn
 5O7cYaFuQqmexF4XxKPRNrJBRQwkpf3YZJtK3E3ZEocu3746EPJA2VrymcQ3Es7cfk0xG6G2h+W
 IQrZaWZDEEGVNvZXmZMITLGVyFGTnqPlQDttoc8qU2wLSy0bnCEEjZAMNmFKU1pP8kzB+m4RVQR
 73sQPS7ybfLhJLpfVr8+Hws2FxuAvuc1mX8IcL+ao8RAYGZxzTe+YutN+UIlUFJuc56FEPO8RuC
 xta2QDWDmH8176BIUX93d36/VKctvIlupci0LQcTe+r5tWe0pWM/OxbSnXF7l+0bbvpvOSbzqMM
 MOM9zjll+eUyoZTwAZ37IrvrTD91yEKQIcoRNegYEkjk8QpFef1OSJZDEU1iTTeJSy8sFvU6yd/
 v9XtHI2V/KU7x6ny6fg==
X-Proofpoint-GUID: 7wGqblZ2S32HbaETnzaUzQuUoGZD0_DR
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7a2102 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=7bAZdoCWAAAA:8 a=EUspDBNiAAAA:8 a=uQHCV-ZHde5g8KG_UQEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=7DsIbQzYVz3x35o7bboS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_120540_075689_098542E1 
X-CRM114-Status: GOOD (  35.96  )
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

On 8/8/2026 2:35 PM, André Valentin wrote:
> The AHB shutdown() callback was added solely for WCN6750, which must stop
> DMA before the SMMU is torn down at system reboot/shutdown. It was
> registered unconditionally in the shared
> ath11k_ahb_driver, so it also runs on the IPQ AHB targets (IPQ8074/
> IPQ6018/IPQ5018), which never had a shutdown() handler before and have no
> such SMMU requirement.
> 
> The commit message claimed the change "will not impact other AHB ath11k
> devices", but it does: on IPQ6018 the teardown stops the WCSS Q6 remote
> processor firmware, which leaves shared WCSS state such that the boot ROM
> hangs during DDR training on the following warm reset -- only a cold
> (power-on) reset recovers, so a plain reboot never comes back and needs a
> physical power cycle. This was pinned by bisecting the teardown: skipping
> ath11k_qmi_firmware_stop() (i.e. not stopping the Q6) is what lets the
> warm reset train DDR and boot normally, whereas none of the q6v5 power,
> reset or clock steps reproduce it on their own.
> 
> Restrict the shutdown() teardown to WCN6750 via hw_params, restoring the
> pre-regression behaviour for the IPQ AHB targets: they simply have no
> shutdown() teardown again, exactly as they did for years before that
> change, and on reboot/shutdown the SoC reset re-initializes the WCSS from
> scratch. WCN6750 keeps the teardown. Module removal (rmmod / remove()) is
> unchanged for all targets.
> 
> Verified on a MikroTik Chateau 5G R17 ax (IPQ6018): before, a plain
> reboot froze in the boot ROM during DDR training; after, it trains DDR
> and boots the kernel across repeated reboots.
> 
> Fixes: ac41c2b642b1 ("wifi: ath11k: Register shutdown handler for WCN6750")
> Cc: stable@vger.kernel.org
> Cc: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
> Signed-off-by: André Valentin <avalentin@marcant.net>
> ---
> Changes in v2 (per Jeff Johnson's review):
> - Drive the difference from hw_params instead of comparing ab->hw_rev in
>   ath11k_ahb_shutdown(): add shutdown_teardown, set only for WCN6750.
> - Frame it as restoring the pre-regression behaviour for the IPQ AHB
>   targets (no shutdown() teardown), rather than a per-SoC quirk.
> 
> v1: https://lore.kernel.org/linux-wireless/20260807094858.1548216-1-avalentin@marcant.net/
> 
>  drivers/net/wireless/ath/ath11k/ahb.c  | 11 +++++++++++
>  drivers/net/wireless/ath/ath11k/core.c |  1 +
>  drivers/net/wireless/ath/ath11k/hw.h   |  4 ++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 1e1dea4..5d71ff4 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1288,6 +1288,17 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
>  	 * remove() is invoked during rmmod & shutdown() during
>  	 * system reboot/shutdown.
>  	 */
> +
> +	/* The teardown below is only needed on WCN6750 (stop DMA before the

1) incorrect block comment style, /* should be on a line by itself
(at one time networking had a different style, but no longer)

2) we avoid mentioning hardware in generic code. that is the whole point of
the hw_params. mention the feature not the specific hardware (since there may
be hw other than WCN6750 that have this behavior)

> +	 * SMMU is torn down). It was registered for all AHB targets, but on
> +	 * the IPQ SoCs it stops the WCSS Q6 firmware and leaves shared state
> +	 * that hangs the boot ROM during DDR training on the next warm reset;
> +	 * they never had a shutdown() teardown before and the SoC reset
> +	 * re-initializes the WCSS from scratch, so skip it there.
> +	 */
> +	if (!ab->hw_params.shutdown_teardown)
> +		return;
> +
>  	ath11k_ahb_remove_prepare(ab);
>  
>  	if (!(test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)))
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 8dacc87..c6df829 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -578,6 +578,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  	{
>  		.name = "wcn6750 hw1.0",
>  		.hw_rev = ATH11K_HW_WCN6750_HW10,
> +		.shutdown_teardown = true,

please add = false to all other records
we enforce explicitly initializing all members

>  		.fw = {
>  			.dir = "WCN6750/hw1.0",
>  			.board_size = 256 * 1024,
> diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
> index 4996536..8279eb4 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.h
> +++ b/drivers/net/wireless/ath/ath11k/hw.h
> @@ -231,6 +231,10 @@ struct ath11k_hw_params {
>  	bool cfr_support;
>  	u32 cfr_num_stream_bufs;
>  	u32 cfr_stream_buf_size;
> +	/* run the ahb shutdown() teardown; only WCN6750 needs it, to stop

again wrong block comment style, and should not have an explicit chip
reference. describe the behavior, not which chipsets have that behavior.
only the hw_params initializer should establish the correlation of the
feature/behavior to the chipset

> +	 * DMA before the SMMU is torn down at reboot/shutdown
> +	 */
> +	bool shutdown_teardown;
>  };
>  
>  struct ath11k_hw_ops {
> 
> base-commit: f9a2394a23482bfd330911e9c8295b71724feacd


