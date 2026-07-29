Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25F5C53219
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 06:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTMHwqggIxKmBk/ZqIK+EKpy4F9qFVTkmu/t5ndrmo8=; b=11QSx+rv7wCC9q/2Ouj0FYRmYg
	jxi+2JJd7BLTb+y1pYw6zGWfhV3vgdGa+n8CKYLemXDHG4Z9zJoDDpZRYbFJ6tT8PHlsGRGG+0hNW
	84xs7aiOylNRCC+GsyEip99NdUltXqc1iSe2UQQfdbPb5XWYYxnmxZcb5SAI6Zc2/+WPya3K6CD24
	zZ0Bgsi65hQ8tTPa9jy/urlT/HkCPGk3X4Ur/c3eX+H4Ufho6VNaM7p63rwVmPp74afRdOmSA7Unk
	YYKVByBKPHFGI5sV3QXZ14HJa1/6amVKxtRChTf40qiCu+QzeLjRtz7jneHIRNMB30saA13mtKkWZ
	ytB/Ka+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxl9-000000071If-0onf;
	Wed, 29 Jul 2026 06:27:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxl5-000000071Hs-3Lyc
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 06:27:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T4cI8P897795
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 06:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTMHwqggIxKmBk/ZqIK+EKpy4F9qFVTkmu/t5ndrmo8=; b=Ay9AY1LM5rXsxWZH
	YIwyTUra5icda87Z3FSZkzkQ5g4xofJ4vttIodQsgtfG0UHLdXw8W1QxJiOKJWdT
	+dY+H/PySer7xzOIMsxTK14RRC0iS3WE3dPzenOVcxB6enTOcdADfLTZc+90ChjP
	HnbvmX++/eDVP15cZN0pxDA6m6jhYsW/Q7PXrhHn+5W/+ALKYre6ufcpvOeAfUKZ
	VOPU2De7kvMzwqKVJ+29kTzsmDm8TRGMGFycMksRZ1JfsnPGXWp5NMV8MR8tariK
	1ftWfDapuX4WTjx7nGjXJQCIYgHF7IDEIx9Hw4hN1diXM5YrttBxZtS3neDGAQjp
	OkV+Mw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa330f1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 06:27:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e024d2129so1240821b3a.2
        for <ath11k@lists.infradead.org>; Tue, 28 Jul 2026 23:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785306433; x=1785911233; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTMHwqggIxKmBk/ZqIK+EKpy4F9qFVTkmu/t5ndrmo8=;
        b=HG+KwQisB6RUMI216xD0L1bRmALlOeDWQ1jNWiIVB+IftDzMLkqtqnympltm9ZSRtq
         OmZjNAVOiDII64+4MsaT93XPCNj2Qm0d86gGjRF2HDjNP9P5vMgZ3Oe1bieGXr5t5jTM
         mFdY/VPHYTmet5wGAI9qe4Hs0H8Bzri/SsVugqLy9OEhzqfsaWpivFAXM0/8aKfddaGx
         2WyxktaR9HeLXLNLOyZHQFottTMtGva1iz33CH0cKgkLOZeD6HKjCIDCBV6dpQjtycRC
         toeb0Pv6aY/HWtM+ed6c4eGoAbcyJwzdsdIL35B/8ZSGvQgpIpEHPRpiyIiCyrjF6aJB
         enOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785306433; x=1785911233;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTMHwqggIxKmBk/ZqIK+EKpy4F9qFVTkmu/t5ndrmo8=;
        b=T0vSxkYYsyBu/xlBhdzUSGe9xIWrKxiH2aD56voQxKHSA0Qrlwes4Z9XfiG+rvX3sG
         hGMtvrnNtM0xgdKALrNUaZrhkWi9bgwoWGmxibjtQdybcu6158pNwpXcQ5S0Pkk7DT3K
         P1Lwkll2VbU/0tUKyXIWW1w1sY8ls5RPTECMTc1p5Ch0SuTaH9PSf4gMcL4DYD8WKIsS
         vT8r8lyruNV3+KXh04p9M9vQ8rMuZ/N80ea9cHh7ai2rzks5ckY1llXAB3FPBw4OLv0e
         KbxBs4oZZijeE85bhe5OJG6yQoti/oauazq4xtumWRUTMLykSasRdWOpr2+sFE822GHs
         uQ1Q==
X-Forwarded-Encrypted: i=1; AHgh+RowBcG6mul5N08nnsMhP+uvOFMKv3JdeZwfPxt3nUP7M9cUwgzhHd/oOOtON6EALokoTnPkia8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEVjaNncnw3Rf1BFFRRvD+uWdxik6B4KXo6WCX3lotbIsXwG8i
	68DxNiRXSGJApgUxKFJLBps30jSpeJ6FYMTu70GO6K7MZFB1tjSzHlGkacbdys4GPADZvPNnGW/
	SVMQJQ33idXorqhleq0KzRTMDoujKKh7l5gIfpIacW4dSjVeSCuwbwOh2qToYyYu8
X-Gm-Gg: AR+sD133ir9LfTsJwn21SjFkY4DbzdwaN0D+VhDiX3sadXZgs8HXqJCs7H4YY3Q0piV
	0pusoo80rCinAP1Ieml5zh2oH+2qqalUT96M9sep5sNxRCa/2FIKe9QDCU8GH8XfnuphrVpb+Bn
	4Qcgz+QGP7lL65i2HDGQVZJzHNCPRXJgptPjYRRSfPz6qGPQo2dLqf166Mdo/fN5Fg7l/Zq80fX
	/76b++FSg8MaCibg0zU7CRlXFoPrYrdw39NuNzsCamSWoSMUtb3sWYm+thaySPIhU5gvilCD/7S
	al9wrFz9cRWylW8wkpSQiVWeFZS5KCUcxkJalSIk5bS5l15+4TOod85MBV4Z3xn6orw5ATQ71ML
	a6SxzrGfPPNOPo3tSOPt0g8mpjQaz2fDMriXkZH+klEeP
X-Received: by 2002:a05:6a00:4c8d:b0:847:8250:2b2b with SMTP id d2e1a72fcca58-84e93348ac6mr5706363b3a.52.1785306432917;
        Tue, 28 Jul 2026 23:27:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8d:b0:847:8250:2b2b with SMTP id d2e1a72fcca58-84e93348ac6mr5706339b3a.52.1785306432537;
        Tue, 28 Jul 2026 23:27:12 -0700 (PDT)
Received: from [10.152.204.133] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe24e6csm852274b3a.5.2026.07.28.23.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 23:27:11 -0700 (PDT)
Message-ID: <907535d1-1d0a-4174-9513-11ef27002f36@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:57:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: karthikeyan.periyasamy@oss.qualcomm.com,
        Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org
Subject: Re: [RFC PATCH 2/3] wifi: ath11k: make external IRQ control
 idempotent
To: Mark Ruvald Pedersen <wabsie@gmail.com>, linux-wireless@vger.kernel.org
References: <20260719215817.2468580-1-wabsie@gmail.com>
 <20260719215817.2468580-3-wabsie@gmail.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
In-Reply-To: <20260719215817.2468580-3-wabsie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1MCBTYWx0ZWRfXz204L8oH0ulf
 JREv17VnSCo/mjSaWmF8i03wm6prIvrUolG3acEroFINBxcCqxbwFwrDi2XhF9ZfgpyZ9x/Q6zR
 y9BCiw75CqbrGl0vfAJz1GZa+ZQPS8MAGHiGxxAKeOKCd3Tz83FpVZMdlFLRF5WE2+6FcgvkUPh
 xqtnVuMaB5dnOilTx6tA8gGgDwfQevUCK6T2/ts+Pip2qrYDlbIeIZFbYmfv0wRbzOOX46sYu2M
 8WGK7AxnE+GpaMr4GwUIYwi8rsfyqap9W5mhP2nBBqfzdJDYjBWrWE44Q13JQZk0fq2bLZIhNKn
 7QcgaQAgwVVLUZGxv+spwohS47kHfPxLxkeNczdlQEFVlVnuOoyrsKlUH88QU0E+z9/3himNTzK
 8i/Kyum5dlllOZn2bQNPOzuFTdZI6OHFFPhK1dSfwPYaZhHgLceJZPQxDGLOts4EukdaJXGglqJ
 0UgDz7iAUdrIHsdwd0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1MCBTYWx0ZWRfX+MjD2F/ARQUS
 pMC+Chu3ZFNNK538yD+eVPOuw3bTAeI45nk2aRbec5erWfTc0qgkXsCE/iDNBpr2qyIRTV1sN8z
 tyJAn/lLiB6FUUIYQf8Hqdx8td0mbbA=
X-Proofpoint-ORIG-GUID: EBtTZmsWFtoz4qYDKH-KlEQvSWWF-fEp
X-Authority-Analysis: v=2.4 cv=Ap/eGu9P c=1 sm=1 tr=0 ts=6a699d41 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=g0inFw8NqRCQxjTZg7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: EBtTZmsWFtoz4qYDKH-KlEQvSWWF-fEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_232715_961729_1B348C08 
X-CRM114-Status: UNSURE (   8.50  )
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



On 7/20/2026 3:28 AM, Mark Ruvald Pedersen wrote:
> ath11k tracks each external IRQ group's NAPI lifecycle with napi_enabled,
> but calls the physical IRQ enable and disable helpers outside the state
> guards. Repeating a lifecycle disable therefore increments Linux's IRQ
> disable depth on AHB and multi-MSI PCI even when NAPI is already
> disabled. One later enable leaves the IRQ masked.


can you elaborate the scenario where the repeated lifecycle disable 
happen for better understand ?


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


