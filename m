Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFD2CF6C08
	for <ath11k@archiver.kernel.org>; Wed,  7 Jan 2026 08:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBuwaMm4bZ+yPyQdkYpjplpxW3pZ1MDyEeCZZ5McEt8=; b=XYVefU3rxHrTiwXC2228xYnXAf
	I4cInbSkE5rzmpHuZlU0VKpZpK0pzKPqNiOrmRVCwzNXkI45UdG/IQJLbnHFaExvUI3jd8xTMuv0L
	zFPjJTnKlAHJTfq8Wy9znDT5yitIbtRW8ACzlw7op0vNAp/G7+VnUT7gANQpQzXMKX3XAXl6Ek/1T
	b67QkXyedlhsk6NvsvIVTTukBAmtKxLHCoAYE8Q3GpOuc0aE+oPk0mvuoC7NFZFfCDyoEk2ACetaU
	uKLvC7enmPzsUtNzHbaMwpGdEgTehB4X5H1gXp8M1ZWIhfC3PJzmCCpINi964yYjqvIO4sye8oGfD
	+xEmqlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOpP-0000000EOhn-3CQ7;
	Wed, 07 Jan 2026 08:23:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOpL-0000000EOgv-3ajc
	for ath11k@lists.infradead.org;
	Wed, 07 Jan 2026 08:23:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6070qWR91979560
	for <ath11k@lists.infradead.org>; Wed, 7 Jan 2026 08:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBuwaMm4bZ+yPyQdkYpjplpxW3pZ1MDyEeCZZ5McEt8=; b=a89aR+293YWI+gEF
	8hziP09TCK5C4nQIC/AukMkZGEhoNex3EfbRhx9ACXh8Kb+3rC1TPnUNVPgsOPbN
	u672wiLlNsJxcJohaQnzJU8o/niHUcXUt5ez7Y1vI2XlqfRuO5IfJBhff0UzZwk2
	13JENiEhJCDUl0wwpV5bTi+wGTCD+x7ZSZFiMEHlCgaNdO7tOMsXiv2e2CirFcPS
	q7+G3ebbaC9tX8+myN9gtGUhtGtsdTUgExIXivGO1jvlav5qqDSkaRr6y4lS31jD
	vf/Tqa04Otrz3U04nv/Flr3rghM8CIiypNWOcin8y2DOjhh7wnKXn2bV4ulFBtYl
	37Ii6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavh810-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 08:23:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f27176aa7so31844335ad.2
        for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 00:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767774213; x=1768379013; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBuwaMm4bZ+yPyQdkYpjplpxW3pZ1MDyEeCZZ5McEt8=;
        b=Au+VROlb7FvuQhq7HsG2ZSXdgudj/XSkF/JjgoNXjfi/vaG7+x/M9yJMgrXV8uAAFd
         nyImcxSTOd1lakpSEVLShii6KtF9PGo4krtjxP6TJ71M2YlVrz/97oGzi0YuyC/jVtoW
         AhgA1thtSbrSGjDUpsZL5FQvlmov07SSm2MGxaid+J4QsHHPayeE9BQSw+qwdCD3p4Jt
         f1aMk9fVAi9zZXpRjhc/FBxPrDJ7YCupFHgfSZ+zGGHKKsjbPP8CE2ItyZd4/srLo1U5
         ZMbU4Mn/UubVR1TueEIeiHh0zXuUBFBKN2sNtG9IZnUiK/Q1UN+c37iFC4B7AxMFSflB
         YoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767774213; x=1768379013;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBuwaMm4bZ+yPyQdkYpjplpxW3pZ1MDyEeCZZ5McEt8=;
        b=u9BvkX4aWfHZi2jwvfcPkUvjULbUESlA3eckZpjMB57LKJlQr2A/p3komNAQ9562Lg
         Nz53sF+ZJ5ZTXCu+ZxZtPeDiudLLIsSoHBmzg4EZE5y4Il3GuEzZQgENgfPENjRKNa8q
         D5TZ81XSm+VuuhA9+EWeJO3Vxyu5RMJJH/c3RJ1PMmUK5aUry3k04T3nB09cJ9ERrp4z
         43M/Z5dk9erwC2IlbHH8PdDW6EHCkiuzrVR6bcQA5gdZVZogTW8pRgZ80yAE7U58SoEu
         wOG5jTm5FvvBwd5DFsatLX12Ep9qgk531B6MhDS8M4rS9oBUZy5F2htgssCm1vssGO+v
         KePQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0OFYpCuvQIqpQuJs8QLDwjADJsUMDLPkkgixblxwlJXhxgUe/JV/IGPicN+abdpDYzlOTXAI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhj9eUWiQjBkATEPk0PKxq+isgidjvImcBljno4m5skzrCC2h9
	4IB03Ycd8XH/BD3aizhjNu3Lm5VRDj6NdxGgpUUi1DisV/OyerFVCe6lv31nFMUlCRpJNgB4H20
	QkBROVl4sdJdPHZfUy9kf7QRxaxZqZKfa3G227dUdtLXPvG8lp2Os2Mqv+x0DBUtM
X-Gm-Gg: AY/fxX4ABXkL/FHFB/qB/oiuZLyPOBEEu20SlGd7Yvbt0crGC3HYV3ch+8oK6CSUi1n
	0YRTI6+EW1Y6QwQlTJZye4UuTsAxa9e8yUpinxMWujPeDks7goEOBNhUDyokLzgbin1HNLartOL
	rXODObfIEkWK5icF9Dpea2jt6vDxjNAcLwLetw8/60/o4y96sH5da/p5H3hY/B9NhYw7QrP5rwk
	bjGP5LM0or0LFVlEeAHBj9rEHDIoBeWkzG6dYNWSsdAAxfjRwhp8grT5/bg2BQnDqkP4Nn54rhf
	Gh1rMiL5+hRY6hpYWmdcNFi+9U5y2/L9JmLU1NaMeYNFEDzrhn1fyQXhydUV95G2M4bff+Hrybx
	JwoaqR7vU0BI9OEbMspO6M9StzyPknRmNUBAo5TKbd9iqEg8PBiWeEbmjCZNuFFWRw/xpGal6Oo
	QkExbL6A==
X-Received: by 2002:a17:903:9cf:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a3ee49b022mr14956975ad.46.1767774213511;
        Wed, 07 Jan 2026 00:23:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3TZ4GQaPbdT3f2ezunaG9T1GNbXJf8ctiV6LrSX+qsLZ85jLkn3gXZQO5gR77jNLghh88Wg==
X-Received: by 2002:a17:903:9cf:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a3ee49b022mr14956855ad.46.1767774213030;
        Wed, 07 Jan 2026 00:23:33 -0800 (PST)
Received: from [10.133.33.54] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm42588685ad.75.2026.01.07.00.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 00:23:32 -0800 (PST)
Message-ID: <bac6e271-5bd8-42be-ac20-6873d88c16a3@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 16:23:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v1] wifi: ath11k: Fix failure to connect to a 6
 GHz AP
To: Qian Zhang <qian.zhang@oss.qualcomm.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260107060255.29530-1-qian.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260107060255.29530-1-qian.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NyBTYWx0ZWRfX6uWXjw8JZVHY
 p4MSckGF5uFUnsAgqlXfFrhndomvmHRKqmR/E8SbumMHLGauP4MnyWRLXPqutZ9J1f5COoo1ryS
 ZmkC5jdt/5MJrDfIoiQ2DLL1meSKmJNSx5QZiHMJ76/BQesM9/YrIs4+P9OrQDnxIaqSEgDRRV9
 G/1o+VKZoIzeupPasYKnlLBeFlPMJz9ogBg01NmBjbVU2vWst0Z6BfgrseOnUOyZncRcofw2AsW
 R2PykY8EEi5XOphlIRhDh6wx6U1mtbsXkIdyvu+yJfYazhU8nA+Am7YjQ/IQ8zRBpzUvVlxsGLR
 sVNr2fLdp2BoP8vr9uLrHS1ao7rR5U+6FfpNhaNwBVMbw0g0+/m2qwtakKcI0T31MGuKXyW0koW
 ut0ZRdk3ExqyQ0QqscrlYVbqIJia/ei+chC4/v/GDmqXi4B+Nz2SMkRYRrUww/TMjInHwfx7L8D
 3R3S1TZmq7GGhZJ7+UQ==
X-Proofpoint-ORIG-GUID: n2OLyojR-U5nMnZI9RaFojA5_sPIgCje
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e1806 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PKyBAWt5R5Rl1cvDm-IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: n2OLyojR-U5nMnZI9RaFojA5_sPIgCje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_002336_027872_6D051BC9 
X-CRM114-Status: GOOD (  20.60  )
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



On 1/7/2026 2:02 PM, Qian Zhang wrote:
> STA fails to connect to a 6 GHz AP with the following errors:
>  ath11k_pci 0000:01:00.0: failed to handle chan list with power type 1
>  wlp1s0: deauthenticating from c8:a3:e8:dd:41:e3 by local choice (Reason: 3=DEAUTH_LEAVING)
> 
> ath11k_reg_handle_chan_list() treats the update as redundant and
> returns -EINVAL. That causes the connection attempt to fail.
> 
> Avoid unnecessary validation during association. Apply the regulatory
> redundant check only when the power type is IEEE80211_REG_UNSET_AP,
> which only occurs during core initialization.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/reg.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
> index d62a2014315a..8786ca3870fc 100644
> --- a/drivers/net/wireless/ath/ath11k/reg.c
> +++ b/drivers/net/wireless/ath/ath11k/reg.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  #include <linux/rtnetlink.h>
>  
> @@ -926,8 +926,11 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
>  	 */
>  	if (ab->default_regd[pdev_idx] && !ab->new_regd[pdev_idx] &&
>  	    !memcmp((char *)ab->default_regd[pdev_idx]->alpha2,
> -		    (char *)reg_info->alpha2, 2))
> -		goto retfail;
> +		    (char *)reg_info->alpha2, 2)) {
> +		if (power_type == IEEE80211_REG_UNSET_AP)
> +			ath11k_reg_reset_info(reg_info);
> +		return 0;
> +	}
>  
>  	/* Intersect new rules with default regd if a new country setting was
>  	 * requested, i.e a default regd was already set during initialization
> 
> base-commit: e33fc1c6d54ee1569a57255e11c2978ba9a42ffc

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


