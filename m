Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C73CC369A9
	for <ath11k@archiver.kernel.org>; Thu, 10 Apr 2025 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnrcxTo06c9o2oy9wzzrpk++e7CPzYP7UWeWvj6S8G4=; b=zDKS5ZBch/7AthcCsTHYJvMAf3
	CFx6TQlD8su7x0LyQl1N7yQL65CDMurOSfLGsgabCJDYL13DUv3erryTP7r0nxkqF21POD0bXmcuS
	sdeM4ct9VS7C7n4eOBKGKlDqjt+K4nWJ2qfTtipaj/uHu6kEPOcksUDfbbnHtlk8eTlVeSCQdjYQt
	8egVE/564/V7M3I3dpw1u6SSs6RE9+5sbzV4D1dx20ejmLm2h/5DjnFaRu++Ln74uymp+70U8xDK1
	w9tkyvZwZMmA1p3Cv8n5JDbnxxv+bMRpYNARbgobnzVPrqwHyzrWu+97P9MIARWO6HCvBBgJQJ9Je
	cVx8+rtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wgK-0000000BWMu-0NuT;
	Thu, 10 Apr 2025 18:31:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vij-0000000BNca-0y3z
	for ath11k@lists.infradead.org;
	Thu, 10 Apr 2025 17:29:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFhKwS032011
	for <ath11k@lists.infradead.org>; Thu, 10 Apr 2025 17:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnrcxTo06c9o2oy9wzzrpk++e7CPzYP7UWeWvj6S8G4=; b=C+lsCRxtFti7Vumn
	C95rPc9YApR/ZUmR436xvuRitZOH/vdbeydPy8l3CeSVXyV9d59Kp6YBaLRZqTS9
	Y7r2+8BKqZYYf7Och1+yXNpNmZvSv9+PL3Oax0p1PG2l3sJJEJXYvFrP2+eD9znE
	Op449UmSpC6gKiGP1IqkiJE59l/kKbUaoCv5LC2NNV6+//RpsJ4+URCF38u67ec4
	gHaiDc7BV5yXXXIjvYx3jkMQ/bfEGgAwWl+qjc6RuIfe/WLpETZusRgl7GPMpZPd
	yl/e5pWSn3fPlyDNegu77ly6G6hVLVkk1JEkmJa6lnEQNARN4RhHC7REfPggybv0
	zoDOjg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmfr9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 10 Apr 2025 17:29:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af534e796baso732729a12.3
        for <ath11k@lists.infradead.org>; Thu, 10 Apr 2025 10:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744306182; x=1744910982;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnrcxTo06c9o2oy9wzzrpk++e7CPzYP7UWeWvj6S8G4=;
        b=f69j7aRJcdg2bpsjV9XKUTge3prHZw4yX2EYKobeycPVa6FnbJws9MxgIH535T/wV7
         WEOwkkinGI7pQ37PLpgbb8SCyIvnGt/oGuapiJK6de2suBkCLwSi+7YhWgJgj8mq1ChK
         FFMS6LdxCuOBvSUDLACbT85B1EC94WH6PRdF8LuDQioGwOKjuYcQiDLlYe7bPM18wmRd
         zPK+TC2WHWR2dgH7pz+3EEUSd9OW5qxQdeRs4cJQNfDUTeJnyHC6zomsMgkjl2Ztoyjd
         MciPhRBUIzF4n58nTVxejyOXqU3Q+UZHl4lXenDzLimot1xiwtaa8P/8FYE1iJSKUpD/
         1T3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUX6OJkxosSCVr97d50d9KRg48yJxO1cAiLFrAtmY2d8NpZzqUG3b9erHNu5dYksFI/6utQWWI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxeZ1PQ6+3HuQRi4eQb2NVfsRlthwSjcEzSo3fB68fO18Ds8IK
	jlAhjcI4Ta5DR++D3yKdDlZa2SiJkDO0Nv+tK8/tIgaKymaK+5cdp5Z7mg9Vi2mqnRO+hPLtsgv
	zgHeYx4e8guCwsT3eRFpKh6Rkof22Hogjg4huOazWO8SJ5U+92bsGvjj817Bn
X-Gm-Gg: ASbGnctGfyopv2AwdO47jpxq9007r9GYI1pmjJIfrA5Q5VHeXcSVLY2cnQw2IJQRTGc
	HON+QW0js+41Oue+kxyJ9q0M52gf+qtCxD/PisKWGehWe+5A40V+lW2RiSyLVyDMzc/lqaplQsT
	Pk1qJ+tx8AV2NHogeB3uwiYiF9cUbjqP+ogpnUnY//sG7u4HiAvJm/iHK1ADvubglB9rQzepc3x
	FyErPD1aXXyISKEPD3/Ek4CPATq74I8FFZzV0aEOr92BRMFPVWs8N9I6y9NEjGbZ2KCRWru/uHI
	Ma2EATyhcwLgPzaQ0PseeHHJWqP5PkfMJDzAyuXorrjCIkNB7sekoETTjJ/jd9Raq79lI+d+eeh
	FOVkH
X-Received: by 2002:a05:6a21:4a4b:b0:1fd:f48b:f397 with SMTP id adf61e73a8af0-2016cd5ec16mr4314591637.23.1744306182271;
        Thu, 10 Apr 2025 10:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWtPsisoIv6XSliwjGzBZFHr5cpJYt0ZyuLeyZu9YaURO2s8l9gPgZySOZTq6mo1UvdTVi1g==
X-Received: by 2002:a05:6a21:4a4b:b0:1fd:f48b:f397 with SMTP id adf61e73a8af0-2016cd5ec16mr4314567637.23.1744306181848;
        Thu, 10 Apr 2025 10:29:41 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d39624sm2809763a12.59.2025.04.10.10.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 10:29:41 -0700 (PDT)
Message-ID: <171e226a-eddd-4841-9672-b81b6b5a3038@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 10:29:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Use of_property_present() to test property
 presence
To: "Rob Herring (Arm)" <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250408190211.2505737-2-robh@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250408190211.2505737-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GbMJW2z-uz7VPIy_LmNGeb5BPUKYosBT
X-Proofpoint-ORIG-GUID: GbMJW2z-uz7VPIy_LmNGeb5BPUKYosBT
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f80007 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=no2ZJX3K_zlcQ_1UBIIA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=882 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_102945_278148_DDE5A569 
X-CRM114-Status: GOOD (  20.26  )
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

On 4/8/2025 12:02 PM, Rob Herring (Arm) wrote:
> The use of of_property_read_u32() isn't really correct as
> "memory-region" contains phandles (though those happen to be u32s. As
> it is just testing for property presence, use of_property_present()
> instead.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> I'm assuming this should still go to linux-wireless list? I had to 
> manually add that, so looks like recent MAINTAINERS changes aren't quite 
> right.

Yes, it should go to both ath11k and linux-wireless

Johannes has a fix that needs to make its way through the trees:
https://msgid.link/20250329220135.8bfaffbad97d.I946354c2395f4a30b8c435857a92553b1b58df5b@changeid

> 
>  drivers/net/wireless/ath/ath11k/pci.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index 412f4a134e4a..87ef7f321065 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -929,7 +929,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>  {
>  	struct ath11k_base *ab;
>  	struct ath11k_pci *ab_pci;
> -	u32 soc_hw_version_major, soc_hw_version_minor, addr;
> +	u32 soc_hw_version_major, soc_hw_version_minor;
>  	int ret;
>  	u32 sub_version;
>  
> @@ -955,8 +955,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>  	 * from DT. If memory is reserved from DT for FW, ath11k driver need not
>  	 * allocate memory.
>  	 */
> -	ret = of_property_read_u32(ab->dev->of_node, "memory-region", &addr);
> -	if (!ret)
> +	if (of_property_present(ab->dev->of_node, "memory-region"))
>  		set_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags);
>  
>  	ret = ath11k_pci_claim(ab_pci, pdev);

LGTM, I'll pick this up


