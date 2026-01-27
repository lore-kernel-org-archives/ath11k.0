Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C24D2FEC4
	for <ath11k@archiver.kernel.org>; Tue, 27 Jan 2026 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIoUAWMTJE5rpivtR3W6H7oj3d6jWxH+8YOVX25OZr4=; b=pIgEWvbyWL/9p1JxpJXF9Pbfb/
	rFs5jUHKlfWUT4q2SxKJv9wFLo7vvLFbpaWxEwduq5EC6hBza1QqFdzC87Gxjhk0iRQ4ykleFxEhu
	eqFkjghHUj0knAvwvnWyNSnqSuB7H0tpqK01s2cH6jZJqtvvqfkAf2TV+Uij61dkm3ERFUHpVwsJb
	m15Z2l7QrvriztohWGexBe5n42bbbHogMY+fLFpHjgZAr2a0QvqX6JV2zqXmHCinvefr7Rx8og6ur
	AhPwwOqKRBz/L1WZGXdqIdszPd5Q/Y9gvUpvJFqnyZLikHgPXXdigtgGTlAeFWhGFAbd81Z7FR5CX
	6PtSb+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmv2-0000000Ejpe-1FuE;
	Tue, 27 Jan 2026 17:32:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmuz-0000000EjoB-2e8O
	for ath11k@lists.infradead.org;
	Tue, 27 Jan 2026 17:31:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RH5NEn171390
	for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 17:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIoUAWMTJE5rpivtR3W6H7oj3d6jWxH+8YOVX25OZr4=; b=D9fkkSqVE3eV4UlG
	MGHnrILEzSAsWdT3eG0y2kd+fJVmRLOzstpOrq7Y/fE9x3PtLxmImHv40BvwEQ/Q
	jV9gLDs/P8G956dO37G/p49LkgSSnfWcfEhuBWUGk2WAwBFgEZyQg9l0SpWNsQ+n
	iDA2mIGTE0ayZr9T/vz578I2IFp837fbIRyTJRfEAEHcpSwm1bgANKFIlQMZUoMT
	ob7xqBAdKGhl2hn5NLpWIGjsOaEhzocsQ7f/TIT9AhwXI86+gfYpem/RrFNeZTWY
	L9f1yteD6+gq5DbtWbfBmc+NASmpCzGvywS8ERS9QndYOYyxQFbUW2gEMQOHjzkX
	cf14lA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a3vjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 17:31:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b71c5826fbso6360253eec.1
        for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 09:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769535114; x=1770139914; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIoUAWMTJE5rpivtR3W6H7oj3d6jWxH+8YOVX25OZr4=;
        b=h3mUgA5/t+jRpStxukvazZxrWepSbrzwLS7ztCcEjG+WBvIbV7aIKQLbJClAt/qxVZ
         BK2Dy65teNTxbyOa1aKlniY/wiPpaQbKkqU5beAiLWwMpGVwJe/EAa0Vy2UlYiBCCZfD
         Nai1ixdI0mHsb9Bzj60WuR+W79bhDRBoqxSDdoSUSYHHpntlvtgqVqmeT6tFk0MvFfFZ
         n3iWuUhJ12FROFEA48N/HBIqbuLfVzt1zVoIlzn8G//cf/wCSUSyPz2+gTquj0DKtlG3
         m+tkhy0Bu643ASNNwCo3GcsslD9u6CwkqbAUatd4NBBYLJ+jEsJWrvg9/KCxpVu77Knv
         /5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535114; x=1770139914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIoUAWMTJE5rpivtR3W6H7oj3d6jWxH+8YOVX25OZr4=;
        b=q1SBM3QpLwBQqZq1qGYuDxCnDHYiV5phm0Ak/Fiv0c45dXQgl677/G1ON/jpOYenKE
         t6q7bvyrdp/wOLJaiEz81heajlKmBIQSx2t7RXd7VR9Mc001KTrwc2MXhNjuXZB5C4g/
         iyUeJsEhgYOxuY3EYTkbc8lNK9eMUOmFBHQFEcdea0emLhB5TtaxV1b4XMM8efJYJh1D
         X52vPOU3X9X/+CT3oRxX52IbFXZhq5QrI+m2lHLmanFjIduajiqjtz2UxaJETKO49Ftm
         7Ykr/42IKweP7UCl3rWYhcEwc0CnNZHm5fQlOSnTeTHVcunoy9FmgLBzOZGCO6AxbqfF
         Q7HA==
X-Gm-Message-State: AOJu0Yx26gImgHNqox1YuxU0jYmTWGWU/47EyyBGiiLhFKmNfgMMLEEN
	vvSmdWeQtZoEkKgG1boxH1jpfQ7EsIDsEc7Qq3BAmSmIiiJXz0ZEfOvqf3IXu7AlEf1GRD39X9n
	ZK5OCX8jDAWbMEgA3w/Msiw6lhlFewVlf5S5fhUWxBKZsgX7M+UDNMzf4voCjTBgi
X-Gm-Gg: AZuq6aIxRRLKhOfk73WLvQfxCXP9ioqYs2bgElq7Fn5PNMr7fSCy2a2CKFmylf7TSan
	Pv2UKVfvgnznisNm6oeLUrI7motyRNWT8f6n5V7FkxsYcTiJiZ+n5LMTUrJJd0/mDapmAuTQIaz
	IfnXoYFGc5kuF2mo02Lv1c9zURhXw5/XVygs3fBuvpz4FkIy0iHKpNR+I+NV9Aqh52IAxkdhV5F
	GiHn87sMthIWhTnKnhZX3BFyLTAfjIueaTo847NpEHYumw9of0D7dioxOcmWsgEv7/Kon1VZn+d
	CKOhIYrumkNM+J0AXH5ZUGpcqfjjWqwrYsiF7g8ORui6YQ2WziYqRjVqAExso2lurguf39Ma5ZS
	42z9ZK8G8T9CKbcID/FiqhIl8yA2zttfgiH5xqbcBz2wU3wPj3ieawc+xEQ8vRWE817ctoQ==
X-Received: by 2002:a05:7022:6286:b0:11b:9386:a37d with SMTP id a92af1059eb24-124a00e8ae7mr1238389c88.44.1769535113965;
        Tue, 27 Jan 2026 09:31:53 -0800 (PST)
X-Received: by 2002:a05:7022:6286:b0:11b:9386:a37d with SMTP id a92af1059eb24-124a00e8ae7mr1238370c88.44.1769535113332;
        Tue, 27 Jan 2026 09:31:53 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a7c73c7csm287709c88.13.2026.01.27.09.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 09:31:53 -0800 (PST)
Message-ID: <74176aab-03d4-4095-890d-7ef1739b914b@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 09:31:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 ath-current 0/2] wifi: ath11k: add usecase firmware
 handling based on device compatible
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, krzk@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jonas.gorski@gmail.com
References: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0MiBTYWx0ZWRfXwcbl8S3BQiOl
 6G1KuyqT/QWCtu6hJKJejgXg3jkQ0lMr5BtAsjfa/RWH1N6nOU172+fk2y4DumdHen1OdxgzMiV
 8DdE0je+rfuvGsl8f2ziyP+E/cP0RuyxOpgO6aSh+CkKfbBakgAx0FM0UfbMcYGxEigRFprIq9+
 P7fh0fv9Ek4VQ4Qnw1uzP07FLtmYjO+IzlsUNZsWSH5MNJggCwr+KDJLgqnst0Zl28J3jBP4xpx
 v/Y0VCl0RfKLGAzwQ3UuwMUnj992W9drxdEu3A7A4H+pL4hsJBxwJWl380Oc7I3rEFR9gX4PZ0r
 xlDxvah4Qm0ege6iIQajcKiNTAXJjfiK56cbz0p9KenNmSXgmWSz7c/Kp34niDjhQBSmzeogoup
 bEmzT8eP5TWiug3UkXfMZBEbL1ykzH/NkzOhLgIy/S5IPsQYnm8mE7TA/lCf+TszH9lNMDgZ/NV
 RSFrlO4lQnIZmnblJuw==
X-Proofpoint-ORIG-GUID: WxCKB00iiKV7DN_o3wIRGGfzhCL7WpYx
X-Proofpoint-GUID: WxCKB00iiKV7DN_o3wIRGGfzhCL7WpYx
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978f68a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8cwfA4bTiwTnQ3FzGgcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_093157_893645_C63B14DC 
X-CRM114-Status: GOOD (  17.39  )
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

On 1/21/2026 1:50 AM, Miaoqing Pan wrote:
> The 'firmware-name' property was introduced to allow end-users and
> integrators to select use-case-specific firmware for the WCN6855.
> But for M.2 WLAN chips, there is no suitable DTS node to specify
> the 'firmware-name' property. In addition, assigning firmware for
> the M.2 PCIe interface causes chips that do not use use-case-specific
> firmware to fail. Therefore, abandoning the approach of specifying
> firmware in DTS. As an alternative, propose a static lookup table
> mapping device compatible to firmware names.
> 
> ---
> v2:
> - Drops `firmware-name` from completely.
> - Updates the commit message to clearly state that the property is
>   obsolete and the change is ABI-breaking but safe for upstream.
> v3:
>  - Deprecate 'firmware-name' property instead of obsolete.
>  - Keep the ABI backwards compatible.
> v4:
>  - Use of_machine_is_compatible() to simplify the code.
>  - Add back Acked-by tag. 
> ---
> 
> Miaoqing Pan (2):
>   wifi: ath11k: add usecase firmware handling based on device compatible
>   dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name'
>     property
> 
>  .../net/wireless/qcom,ath11k-pci.yaml         |  1 +
>  drivers/net/wireless/ath/ath11k/core.c        | 27 +++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/core.h        |  4 +++
>  3 files changed, 32 insertions(+)
> 
> 
> base-commit: d8e1f4a193101a72235416f189b01131a57e26e9

Krzysztof,
Since you previously NAKed this series, can you confirm that your review
comments have been addressed?

Thanks!
/jeff


