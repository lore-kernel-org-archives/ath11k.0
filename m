Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07676D1488A
	for <ath11k@archiver.kernel.org>; Thu,  8 Jan 2026 01:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5EaLq7l4r9Qv+eRKXCITAG5O5aPUa+9jzfjApZuprY=; b=g8KFgEIDJHfUVDOb/fmr1b8OI7
	kdeOydDZY8ELSeZWQJBnwDTwKgkIitufNJFh1tFG6ssSakV/8faVHmgYsAjZ60W8HVvYSpg2GiDyG
	YnyFu2Kju5NQ+pbgJjQlBS0tudvXGgC5IlRZW87UmK6l8RwfcUJYSMs1IfuIyg/E8JYMAYV8eKxOO
	MQ/un28jpNdtYSChUvwgVuc8Lfqvs2H9GY/7fKs+e4sahc9/loB6IdyEvxedJe0G36ckGkdxVvH4w
	QZlGbQxOojcQdz2ems4gDvTZOIdMeYE2yyIoV9QDZc2Nk/MCjw69NThKHBspmxljiYytqDctGi2nT
	fBZXxuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdf7z-0000000FoAd-3x40;
	Thu, 08 Jan 2026 01:47:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdf7w-0000000FoAI-3pN3
	for ath11k@lists.infradead.org;
	Thu, 08 Jan 2026 01:47:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607M8fef2239464
	for <ath11k@lists.infradead.org>; Thu, 8 Jan 2026 01:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H5EaLq7l4r9Qv+eRKXCITAG5O5aPUa+9jzfjApZuprY=; b=dBTs1j4oCONG0IzE
	GYhCHCcnnpOUKccuxKEIeVXBwdkxCR/POQu6aq6kZSwJyeQBpwjCyc+HDuPqwaiN
	Kt8DFFZu4ggQ2fNYwBcdKV+nYuV4T0o6zVV1akckOTeW3tPMN+FmRzN1i1llOKAW
	rmNq/1zzcX6doA4wxbvmQgPUX3mGAdkGqpF7WhYEewDxsKUQdPDzbDFR+KWzMh3f
	/WDlMn4F/V/lJvOhProAZE1wIlbkW3KfjNgi8FVC3ukCsDhgkdF1QHrCzaYxgS71
	Ytc1rPPcp4RAZfKjkJGOLyVyfmVioFoZauYXrJw2VQ1HQBC9Rt9loN1KAsMKE0CE
	frAvCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg24ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 08 Jan 2026 01:47:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so13847755ad.0
        for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 17:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767836870; x=1768441670; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5EaLq7l4r9Qv+eRKXCITAG5O5aPUa+9jzfjApZuprY=;
        b=XBekVB7cKzHFAjZ7AEhrZ4HszJmg8p7IrCcXadojPwojOQi1qOsjDTWl2MUwk8PdoP
         him29W6ZRIMaFqq4HCSAH5+ZdsJ96kQ/YEXHw1O36BX9CiphSE4+0sX+zeiruUA24ZSs
         QVtfk9qT1EzJWwI77iygaJh3/HRue0tKfgylJFg+Oj3cASiS0UiZcRdrreBBRTAKRFXs
         zIpOkMNTmxD4Dd5bXOMay8jlPvKoCj9S+uDmCC8vRn6hvliOFF/HD1OEUZ8KZlUITByu
         nn8SHtWl90JTV6oI4+n0rX2m0afxihDQowcvR5631l9Q/y71a70I2qO6kxuW16G+Exqj
         3gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767836870; x=1768441670;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5EaLq7l4r9Qv+eRKXCITAG5O5aPUa+9jzfjApZuprY=;
        b=B6xVrt0HdVhZm0XNlKFU0OJt5pqn5JflFsXKS66RCIruEbdxbadg8F6lqycgtff0ev
         X2hPMm1dGGr4pV6hwVs1nK7JvWVVQKsgRL9KPcV8lKLZVoyioagMhnUNiC4nOKebReOb
         u8EYTzfQfJaBgFy7hh37TF9qS+SGq3YYHrFHdY3MWeUvSMgbDPJNisj2Gk2KLHew9sjC
         veg+e/NVy/nUlBwg9g5tS/R6rgzvcrgEwYelrI2B4yntDYXFL511KlIb5S93ex0yVxE6
         8yZsngw+UUfFm0z1/Su9rWczyNxrnKaTfi4VCtrLIM39GXDNpFDlYcxHGbeM74bLEo9Z
         nPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNQHhK8tEoe3fu02DcV4ozCRfOEuZVzwqvR3ArHjqPKLVZazGibNdMEwOtYuBvGwzVVeUd6Ik=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbU+LHZhU6hybtKN/9Ti/HoBdgciBNSUnOEa8vKn2bM196cNur
	iu8O5y3weWZdCCvbhL3uL8P294ZKwxMv4KW6iu8RMQe4zq3qEWITBwplLiRzTYk2MBhhs30EcqW
	1syNwB//9P9tcXv+hNmEo6aA1PWrxCdat65jjf5Nn+AWLGYjxVdm+/Ips+3b2yc+k
X-Gm-Gg: AY/fxX7fXcB3X8jHLH/maCU9d2/wGhXOLYHR1ixwz+2kWv2PzF+v+oCgatlix8P7Y8s
	THFZZWQ07yUv4b2uH6o06yMf9Y+5N2J06X5Ui7n9ciHdRhvPzQ92iFOTVXdpt2OE815/mT3ttZC
	9z8wiS1i3CjDHK+KaxPpZGDNGVXnXBHE7W+9TTv8FaBwwfdm6QAoFDd2CLNI1SPW3LHH6H62pnF
	7fJDWxRP6SgXs8fZbrHYJ/n9wP6CwO0BDGcVdpvFgvsUbj4NPCaLgRAphYBGgbku9R+aXbfahvv
	heTFk4cuewYDyc7PNgKLbwfT4jVxkk142anpwrUGlUlWcYRdiMznaUDh5CTyhjs15oXTGP+d1fI
	qHnN4aecOvaT8LJZcju270rTAii42M2X05boJutHlFGcyQ8ctz0p3hjNyUyasbap0cem53YyD5G
	h2Qf9fGdg=
X-Received: by 2002:a05:6a20:12c9:b0:35d:d477:a7f9 with SMTP id adf61e73a8af0-3898e9e80d5mr4609681637.12.1767836870284;
        Wed, 07 Jan 2026 17:47:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3YWCfADrOOCR6wSpPCnOFTVPAXH2Gn5pZYUOzeQCeUu3TbqA5IghAJc48TLXd813ZABX+Ng==
X-Received: by 2002:a05:6a20:12c9:b0:35d:d477:a7f9 with SMTP id adf61e73a8af0-3898e9e80d5mr4609662637.12.1767836869808;
        Wed, 07 Jan 2026 17:47:49 -0800 (PST)
Received: from [10.133.33.194] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb4c8186sm6034787b3a.29.2026.01.07.17.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 17:47:49 -0800 (PST)
Message-ID: <6268b094-5a40-40d8-8461-9c9b0f9e1ae3@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:47:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1
To: Ross Vandegrift <ross@kallisti.us>, Jeff Johnson <jjohnson@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <wj7o2kmb7g54stdjvxp2hjqrnutnq3jbf4s2uh4ctvmlxdq7tf@nbkj2ebakhrd>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <wj7o2kmb7g54stdjvxp2hjqrnutnq3jbf4s2uh4ctvmlxdq7tf@nbkj2ebakhrd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4tmXxhCqhsy3HSICG_QAXNdjsqTVBNx-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAxMSBTYWx0ZWRfX60MxfIUNVBlV
 /K3ocewgAj5/3+yWx/DbwP7fcaWpWHByYqSFIAj2xvHuwQN+hdWi04P3QzQ3UcHydVXGVIxU8IG
 mD3s0tazNWVq7e+imiGyn3XmPvcgfnCQyKSbOorwHRbVf+Ct7refsABVeoZxSneu8MEClHCzFkR
 LDqXfUZ6wp+8XgrYUumrht2zVOBNVpG0peg9CKrYr3/9uFSrS4j9itfYRSLPapDSypd2oUJU9Hz
 uxxljsHsN49QgXJE6cwzrYws3crB2a969Vvfm8lG0EMwBY/kZMW67VKDT3jRiw6oDwH4msCzAMN
 dayhmx0qcxlMlFDBnfxkXiXfbpX9W4H8gf4falAcQnJK4e97dHlGipFQpuc7phxyEkkTSjh/DHl
 lhL4I1t7ybbWa091ZnaeNUjhURu6yN57JZSa8NkLCz+Pmu5vEFZMrtrZQdF3i+cxUmVC+2HYsBk
 gmTniQSGxy27baj3pNA==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695f0cc7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=aNK6nAb2l6YIsMJANWAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 4tmXxhCqhsy3HSICG_QAXNdjsqTVBNx-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_174753_098161_A106666E 
X-CRM114-Status: GOOD (  16.94  )
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



On 1/4/2026 9:00 AM, Ross Vandegrift wrote:
> Z16 Gen1 has the wakeup-from-suspend issues from [1] but was never added
> to the appropriate quirk list.  I've tested this patch on top of 6.18.2,
> it fixes the issue for me on 21D4
> 
> Mark Pearson provided the other product IDs covering the second Z16 Gen1
> and both Z13 Gen1 identifiers.  They share the same firmware, and folks
> in the bugzilla report do indeed see the problem on Z13.
> 
> [1] - https://bugzilla.kernel.org/show_bug.cgi?id=219196
> 
> Signed-off-by: Ross Vandegrift <ross@kallisti.us>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 812686173ac8..03dddc1cd003 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -994,6 +994,34 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21F9"),
>  		},
>  	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* Z13 G1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21D2"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* Z13 G1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21D3"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* Z16 G1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21D4"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* Z16 G1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
> +		},
> +	},
>  	{}
>  };
>  

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


