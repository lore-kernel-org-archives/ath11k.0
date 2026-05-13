Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FBCCD4F21
	for <ath11k@archiver.kernel.org>; Wed, 13 May 2026 00:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRsjr2XRZOOe7w30bXakQLv+3EIBrw/fqmP4NplYARU=; b=kjI3vEuOo5RZwUL+TAjTPL6XWY
	upinp5N701HNRmW5DThydYruzuWe9bYKpjh6oD5Nekna8cdbzIfLgF/JEb9Y98gPR03Lm6lWcPPur
	it95uCxgCR18lwe78pN7uGXhCbIEreaeF6hxPVkwExQO7zgq1+/7vKpKlyV4d1EscaKj2ddQSXc4t
	VXccbG7MvJBl1DT2e6mhKc5O3t3L2VilM8LHB/iWXUgGtaGIk60mufhEYEAvr1TdhaHf6U3kiNTsE
	rSorwtwMF7vmxTVfn1IQwRr1yU1N19HLE72dU+UEvQPe0trYc4tbQOdG9IXB9uS/kSmefVscyyT4C
	rFIQT92A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMx4t-00000000kW5-0A9v;
	Wed, 13 May 2026 00:03:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMx4q-00000000kVT-1ca9
	for ath11k@lists.infradead.org;
	Wed, 13 May 2026 00:03:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CLn6mM420958
	for <ath11k@lists.infradead.org>; Wed, 13 May 2026 00:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRsjr2XRZOOe7w30bXakQLv+3EIBrw/fqmP4NplYARU=; b=QnKuHmYcWDLtAAK/
	dYhFRpF35KvwqrM+LmDM+7qj7VOFKPXjTjZCXndOu/8GxLi48MihMt20Eff+n5F2
	n/XGV8wGMq8+NvO0ZoL7eYS0eAW+nOstLlKH/PxgQeEEkIz/v4V3hlXfNudQHJqS
	9eMLfyMxSvAzDlajY43NeGr5FeBamP872//7Csz84bAFAX2gkoutmdSRG0Ag2CDf
	2UIxxQZpwIBblPsZFKj/rhcBshguwSZ4gzwuwJz8ScZLEbx9rn7J20sRjXbZ5Jx+
	3VJn74ZvCPCCASOCMrsC3MfVyXCIjdwM7SojfgOxNhnzPiNj3Lpc0o2RqUwyEGAG
	vGz2Kg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1tghu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 13 May 2026 00:03:51 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dc3d81736so5664959c88.1
        for <ath11k@lists.infradead.org>; Tue, 12 May 2026 17:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778630631; x=1779235431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRsjr2XRZOOe7w30bXakQLv+3EIBrw/fqmP4NplYARU=;
        b=BaoFlTtcrB1asFSMFzznej/zUom28HARFU52ErGZ9+dOVC9L+rqe/Zd1aemd9R/4Od
         qRixhH3P2MAumF3n7nLHupqKhiLmYHjqMPkrxICwmm6FvYaaQ1GwKVOyswJ6jv8oLOgS
         f3CX7r3ffLpIfPoZJCg/FDl593nQ/MEn5t0ajbtGsbo0wCOwbCwvD57VmxsMg94AlB+l
         CxbSzJKxwNM5LfvnNasiKCI4CsIi6fucpk6LyD62K+KXuGN3Az2F22BwERyhlGfRVpGk
         C2r2wF3bqQP378tryVpzSHN5q8PvJHg8f5W7ENf9W9zMMxkhknc8zRElsoXUE7ea08HI
         TSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630631; x=1779235431;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRsjr2XRZOOe7w30bXakQLv+3EIBrw/fqmP4NplYARU=;
        b=OVf4O1afrFosLVLZ4D5QngJFPAowBFQHo3pHyws9NytbQFZyNWNRlV2lQEVzZCXVQI
         ByEUKOIyloxq3TlpgwTSzRcBIK+Xnm0Kkwx+DdOuCqfTTKMeHdrHMYA/y7QQnN4WnMFV
         MJT0BHrR36qdjQXc/e99wTk2bT+V0J6BIEyWZxrePWJPq/JNMS/5Xo16nQndYmj/ZKde
         6ub/sOV2iKSLTr2CWrr1/A/IW4/N0dyINruWXxWO4JZgmgzXnv1hCINIc+KW097qHL6x
         j6FA1YzDrQC+Eet2kCmYPdSXX6ZQ4o85n3PNFGoOpyYj2uJy2A66qwehkbYeClsdtNjT
         m16A==
X-Forwarded-Encrypted: i=1; AFNElJ/dzdvCNydlbHb4sO88LxpCIQxhLR/gh//VoN2VmnEjO4fgkHfNUnJ3ZPrg9/HlofYHvWm62xg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzuhEpkRHC9/aVc8sx7X4ha4SvJjhCDaXK2F7cI1cywW4bTJGg
	jPzcyEY/mPMyeVbjAWln5dgTfgrDzxsYmspveKa3TazthtHxqW9QjG0taEqDnnmjy3fB6Yc/KAa
	DUoglou4RBrorWcQGBFjoAKI6/raZWMtUpmhtm2RJEuV1nFN3ohOr039Tl7Ml/s5C
X-Gm-Gg: Acq92OGludHr1ZjqViNHjxnNqTGQ6Rz8dOEWo5CeJBxUZCh5EWIWnKaJdBWNC2xpSde
	npTD5h3xLBjM/TFyVqWyoSvUNCRAUr89kWL74gI5HESMyElg4Zd13QRkI4bQhkRGJG4m3gS3r+l
	xT3qWCgY4zu82gP595DqdysQ0YW6AfLQpJFNvSV5Yc2lxdNHhRHXwonIqg4XZwe7h9pJn3mMVNQ
	Is0spXXsUy6krTSe6YDFs1f8U6BkXwub4ituwEsnwCnT5Qhf4H2ZfNrs7YFM0wilxTc8D/VupFl
	nz7daMZdpmUJRuAMNta4oLXgRwlJdb460o1b9uruoqt94/qGHF6HQbuM1crZifP5Bi1sXrj35s1
	vb01MpV/FZ2ltciDr7FN1E4SgYrninxeLcrJS2wbX+Q03l/6q90MiJojYaC/AZTEEMNqMMT639Z
	nzPWBKciCPFxuhmQ==
X-Received: by 2002:a05:701a:c971:b0:119:e56b:98a4 with SMTP id a92af1059eb24-1349a80b5a7mr296497c88.11.1778630630861;
        Tue, 12 May 2026 17:03:50 -0700 (PDT)
X-Received: by 2002:a05:701a:c971:b0:119:e56b:98a4 with SMTP id a92af1059eb24-1349a80b5a7mr296484c88.11.1778630630286;
        Tue, 12 May 2026 17:03:50 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210ff2sm21412690c88.6.2026.05.12.17.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 17:03:49 -0700 (PDT)
Message-ID: <45f1c979-ea8d-4118-8551-eff93966b4e1@oss.qualcomm.com>
Date: Tue, 12 May 2026 17:03:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Add two missing Lenovo IDs to the quirk
 table
To: =?UTF-8?Q?Santiago_Ruano_Rinc=C3=B3n?= <santiagorr@riseup.net>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kfarnung@outlook.com, Kyle Farnung <kfarnung@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, koike@igalia.com
References: <20260506200249.317690-1-santiagorr@riseup.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260506200249.317690-1-santiagorr@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1MIZHm9BKaicVK_TM5iq1SH_nKN1otrx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDI0NiBTYWx0ZWRfX2WDweqEjGjfT
 s50bNgL7suxWObATbnRkeHfLvE85zPKI4ZF784GXy1ub5retdSEM+bTgo44WwgChKFXCkWAI3Dr
 2Sze9lAZFwnVvJ8W+HJQpqDnNR0gPhKBe8TgM9gGISEu3UQW+4M+YZm8/ARa/d/bg8DwXJ/Cr02
 vyJqE6opGqHtn4fSkUoSplv03oEIwZmTl0TpDihgttU2wN3sHgReZper3EIsXnR6MDrABFL36G1
 qsoZYUIqbJ2v9f2IO1T60wLCb7FHRY7gx4a1TUFCzpUfJC5N2fGtKbWg/daK99tmPcD56swcoJ3
 3KbUFwX+KnchfI19mjWc0t8egqeFQlV8w9uIszCP6fXcGoYXkesk5xou42u1k5agY7/qtHFfEdT
 KGW7uQIbViGX5v7Cqg+/Ksgf5VQLBPtTFzZQLXmQGEP8zE6BLQrSIuTriZbGq2XIM4w3DBd56Uq
 lPy7zsFK0yEARqFUQwQ==
X-Proofpoint-ORIG-GUID: 1MIZHm9BKaicVK_TM5iq1SH_nKN1otrx
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a03bfe7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bBqXziUQAAAA:8 a=UdeeB3KLDkuo1hJFcNUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_170352_434030_CC5C38A8 
X-CRM114-Status: GOOD (  22.17  )
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

On 5/6/2026 12:54 PM, Santiago Ruano Rincón wrote:
> Commit 0eb002c93c3b4 ("wifi: ath11k: Add missing platform IDs for quirk
> table") added some Lenovo platform IDs to the quirk table to address a
> wakeup from suspend issue [1].  However, at least P14s Gen 5 AMD, as
> reported by Kyle Farnung [2], and P14s Gen 3 AMD are missing in the
> table.  This commit adds the two corresponding Lenovo version IDs for
> each.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=219196#c23
> 
> Tested-on: P14s G3 AMD running 7.0.3.
> 
> Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machine model")
> Co-authored-by: Kyle Farnung <kfarnung@gmail.com>

This is not a standard Linux kernel commit tag.
Co-developed-by: could be used, but I'd need a Signed-off-by: from Kyle

Kyle, if you'd like these added please reply with both a Co-developed-by and
a Signed-off-by tag

I can apply these fixes when I process the patch in my tree.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>
> ---
> Changes in v2:
> - Merged the Lenovo P14s G5 AMD #1 and #2 related changes proposed by
>   Kyle Farnung in
>   https://lore.kernel.org/all/20260330-p14s-pm-quirk-v2-1-ef18ce07996b@gmail.com/
> - Added Kyle Farnung as Co-author of the commit
> - Added the second ID of Lenovo P14s G3 AMD, and adapt the comments
>   accordingly
> - v1: https://lore.kernel.org/ath11k/20260423211458.458911-1-santiagorr@riseup.net/
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 3f6f4db5b7ee..c1ce0a11af44 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -957,6 +957,20 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
>  		},
>  	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* P14s G3 AMD #1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21J5"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* P14s G3 AMD #2 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
> +		},
> +	},
>  	{
>  		.driver_data = (void *)ATH11K_PM_WOW,
>  		.matches = { /* P14s G4 AMD #1 */
> @@ -971,6 +985,20 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
>  		},
>  	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* P14s G5 AMD #1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* P14s G5 AMD #2 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21MF"),
> +		},
> +	},
>  	{
>  		.driver_data = (void *)ATH11K_PM_WOW,
>  		.matches = { /* T16 G2 AMD #1 */


