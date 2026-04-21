Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269D1F94CB5
	for <ath11k@archiver.kernel.org>; Tue, 21 Apr 2026 23:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQZP7gTwR4SY+QJKGb719xKlN345DJF+yiTx3Ot0K6U=; b=RK68HLM61oTOFM6WzBv+78pinZ
	tc2um3ORwL/4yVBLa1GB1/qUFVpGyXk3BTLG/p0njDIKmO9LXGEmdeO+QnXZAgocSI0Ecu8gA6AVb
	xC0V5Mt/c2X2lFCpD2KzFy1X9NiwRLltxgmEHfzD0zx30uC996r+OMFsDKajPO0XTD4ESk8N6YR5I
	WvTLg/LA69dZsw2Pq/VnRrOUff9bhyyUjukA6QwSJcKgJ1KyyiCew+TTe/316uSBqhSvMpQjXNRO+
	JeXpYgWha0FHpuF3x0zptCpQrRX212F1Jln2Cfy+x6hDDGAcOaHogpTq4RBX1WXCikCyrugieguwh
	pgBmO8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFK87-00000009Oor-1KLz;
	Tue, 21 Apr 2026 23:03:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFK84-00000009OoQ-1aYI
	for ath11k@lists.infradead.org;
	Tue, 21 Apr 2026 23:03:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZxg6728041
	for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 23:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQZP7gTwR4SY+QJKGb719xKlN345DJF+yiTx3Ot0K6U=; b=C08Wgs/D5BxxsDTG
	uPClNrUhhIVtPGrJtfKL2LUB588QQ8kyDjstsGbE4UXFhsASAYMSh+JZHy5SJ2vB
	aN5NgCAvsYOpIN8NCVVQzct3pAQ6vgiek9Z1JozcJ4v1qU4JsVKQLRYSeU3J8OJj
	ogfCl5FopAB4xHRwv1y7e6G2RHwTOjDVwMeqSxAnBbWp+Qkc+Vg100pm0li5U+cD
	GfDOUcO316dvWAgurOWU/ivbbLjhlvN87AS7Vv486IVRmd99WnnqUzdKGsGnmg+A
	vIPW8FiDoTl6FTo5i1+5q5iWah3MsWL/kOkURIBUNY9g42wysoGYnOlCF5dQrzJ8
	GD2Gaw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenh8q3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 23:03:39 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c21dbc9c1so13917835c88.0
        for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 16:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776812618; x=1777417418; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQZP7gTwR4SY+QJKGb719xKlN345DJF+yiTx3Ot0K6U=;
        b=doedeRtNkrVcMr+rlALEmLkv62BoKfmiaTztP7Ksi9KQ7i9ErlJlL8ryVEmwuJCpRK
         oUc7c0M2SVcRIsLtzyPw82B0G+JXVZv6qk45VLUJ7x5Rpa2X7PLcsvVfY/PbC2ag9i2/
         3wsd6ZO60Bdp2hT/seEnd1ET22BqRJdYObn1ohndq05pOWC9U9/h7FSkBt+yb50Q1acp
         N4rQ/m1C7gEaFap3dV9jRhDYcYPraqnBHxo9ORLRnXVsKpDooRmFfFDXRrfLXCuSr3VU
         ACLTztE1jPzI31wiUylXY+lnSeiCLyYxzCBAHdLI3iBft70YRjb8+V3P3xqI0Cd8HFNg
         SISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776812618; x=1777417418;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQZP7gTwR4SY+QJKGb719xKlN345DJF+yiTx3Ot0K6U=;
        b=kzj2X6WuL3lUiYeypajfRg+OySjngUXUBrbihs6Lh3YYIpdQtzfMf0oxmEO3BSQICP
         JUWCBdVDsrw3uCplLJev+v2oEPqFBfDq0kKxWqDpX8ForAcuFrcc/cLdhRuwo409EkhG
         8oZXHFmhpKDHzNk9Wfeggoxw6r62QtQNdgPzYEb8GWBAdEYx0G2R1AzfiyEKUqbCCHIa
         gLWppEgPW3pstZkcakp5oviuC6AdTRye402/bds6yzMOzSj7AQaJHLmpAB+LChvn+nX/
         SxKPqIRWsORGg29RoDoNAdnUfZnBM7jABw0l63MXVFcPiBiQIE9K/0HXHCs57btUvfQx
         K57A==
X-Forwarded-Encrypted: i=1; AFNElJ8TOoCVTcSI5Ldy+aUjM3RUPUFzGdUypS27gS5NgGdrk05vkp73UJ2U1ZBCstX/F0fzCcaUN1U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw56TpxdSYO/QIKlWBPXbIb/fVww8hrxzT48UPlGIz9Ruw2H7l+
	+N15Ex0QBl/eNBR3pqRIDyQNIxQwrKDNfGEZpP0+9IbW4VNGhQaUyFsn/aVBOnsRlhgbDfOZLUK
	TFb+3mt/QTvRdVE25zgKuiwvkd6MtqwWZ6Z/7mv6Bpa3k3kXl0g6k8LCygvv2mx+d
X-Gm-Gg: AeBDiev6g56ZZ/ElQMgnFhXO1uKV1glhCDw2lpnnQp2PIsPoXO3unU088IsiuzWolUH
	hZ8kVP70k67CwnaplbyqyUu8wwDjNAI2sckv/6XThWHte4EYQY/hWD8mOEK3y1MTdHLGU19V+2Q
	y9lcyxOs+X3iL4y7oop4GJY6Dmlq3m9nIxY5LDPrS7DNfs3St1y6kh8f10rcmgLEB9/3iVNUETM
	XZ/md2HrhdmgBgz9SMDwkQ12FhHDRYyrxwQVHHGzDS7Iu45HC06/UYXFYiqpn7zaN96efq4e/ZW
	Stm5tLvRYuvSGsXJ1RAlCBYr7GQwFel7315l0OjWKzW9gZX6uhjRLFD/mrG9JWONKLEA9gZQr9H
	po+uhHfcUFPljh8GqoHaxGjjbQO/MaWMZHW7EUVjfLLj2HskAbhd+IKWvvXUyngJ7BwZa0CfAmN
	bhKY0QGphp0Fqwgbx02xuF1emT
X-Received: by 2002:a05:7022:4586:b0:12d:b7bb:4f54 with SMTP id a92af1059eb24-12db7bb5581mr1624404c88.3.1776812618058;
        Tue, 21 Apr 2026 16:03:38 -0700 (PDT)
X-Received: by 2002:a05:7022:4586:b0:12d:b7bb:4f54 with SMTP id a92af1059eb24-12db7bb5581mr1624380c88.3.1776812617542;
        Tue, 21 Apr 2026 16:03:37 -0700 (PDT)
Received: from [192.168.1.47] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b944bsm21141603eec.28.2026.04.21.16.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 16:03:36 -0700 (PDT)
Message-ID: <ebca61af-7873-4a6a-aae7-151e81b328e5@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 16:03:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260313001608.118294-1-rosenp@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260313001608.118294-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e8024b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=rJ_IYOnZYG8bJ-BjWygA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyOSBTYWx0ZWRfX3DDp3UIXIkfJ
 o6vWpnoRhnT+aZOrRHPkyaAeAfFHnq+05BO1vpzHKuHTytaCBPAjZmYo78kvRu+rQYpOeaITzxU
 2aCBc2MRmxqrB5k3MaYgs7FxZAaS03aA965ijsA5VGYgAPBJ5wMtPyGju9FLlW9Lr0p2FsEZG7d
 iauEQpWqdhrVzHvP+KyYJSeHloEF1a3wU02Xy8rxHD5Re3nNhFuELAsvizfuEOLYYVO0oQsKzH3
 OueJWabTIG1IfmS1tvc6aPkO7hFi4X2L4TtrlGPp9kiBCee9jnItAaqngDTt2aaVNdFDgLnQ316
 7tYrKPNOE0Ac2A/5YWIVhMcuWUsDRgnO4mKk+7Xt32l3+LUv3XH4/FGUyc2jad2ktrmPKgNNcAU
 uvJZJM3ZjeJayFyfykOCNYNYKHL7Sdj0fBWSW3S6z28qPtYUUYLTZTbxn0eaLqLu4leTSaSqTqa
 Wl5icvs+YAwijSe6WvA==
X-Proofpoint-ORIG-GUID: 3wcv9IK2khs54otu4IAOSzuuziiXdXZt
X-Proofpoint-GUID: 3wcv9IK2khs54otu4IAOSzuuziiXdXZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604210229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_160340_689990_6744D204 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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

On 3/12/2026 5:16 PM, Rosen Penev wrote:
> Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
> 
> Add __counted_by to get extra runtime analysis. Move counting variable
> assignment immediately after allocation as required by __counted_by.

can you update this like you did for the ath12k patch?


