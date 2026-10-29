Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3961C606A31A
	for <ath11k@archiver.kernel.org>; Thu, 29 Oct 2026 00:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SbNcSFV3;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nS5l03fE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8ZGb+5f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=161wcd9EPFoe3fJhGneKDOtD4VA/F1JbIvr2VPER94s=; b=SbNcSFV3fXVWe+
	a31ZDyMhz4POfKCU/0LHFVFVv9kmogfLSxypHs5sVHMIRBzRjMI6jCV7lB3DfOClVM8tGLY1ZcOHn
	zXFiVXwAAiVKyyPB588eUE1lZgd+X0YYZgOua9NcA4CTjGoWzt0Gf8yMiIaOmdpYl2WmJLtmfVRxg
	SMphJ6Y3miNmlaSveoAoBkT8tRTJBA2UKB91+plm9Uk4Sxltwq7REBINPDcvrQ7c6Vwn4+A/C3Xvb
	mveXS7G4upPXJNatWqCpCjXlW4r9sJRwbAFYkYTKGxq2yqWQVzc9qSqEiYWTXmczdZX8ZbsTVnIbv
	YxXRygcY/aWLU4SmH3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xME09-000000085jC-3NJB;
	Thu, 29 Oct 2026 00:28:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xME07-000000085iW-0RT5
	for ath11k@lists.infradead.org;
	Thu, 29 Oct 2026 00:28:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SMAS292428620
	for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 00:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	161wcd9EPFoe3fJhGneKDOtD4VA/F1JbIvr2VPER94s=; b=nS5l03fEVUvDe0RT
	cRhgGB4bxhYdd7GkTwMJ7APOQy6+oPJIUncnlhygtyk2VY+KPgalb/hnlMeBr0hs
	4i5IdqnU8daYm1b6lyJk/lv0UBaNj3pmgIxPFp7m9s7hwcepVnmOqj8TNmKvgVML
	RJs35MV1YQYdbAK/yaZGukQ1XcJq8Vkve4uHk4z4z9LDomtMoh/qSwaOBwkNpxWl
	LSBrTkJzsVoT+LrKH8zoApgwRfLOOlQKqcK7d5DtO6nuj6yGMq6PYSpfdxS342ZE
	TYDG+H4Jipn1F1JSTY7fwWtv2ow0Cc8m6h24lebVt1gnGqHtRnwYAOB5qaRhiAeL
	H8j2jQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwc55m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 00:28:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so4622529c88.1
        for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 17:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793233693; x=1793838493; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=161wcd9EPFoe3fJhGneKDOtD4VA/F1JbIvr2VPER94s=;
        b=R8ZGb+5fLc7fLJcEa20X4RjVBAzpr7MNMrl6YcdmKnPFiWDrvS0EWeNpiBc3+ztZPU
         gWt0z9EmAdgVA9rNZbj8+mX7+MfxB8K+17sED5whSD3zmM7rnX79ASZtnrQopfdAo5v6
         Boiwf/UmDStMfgnGUYpVpQOSEzoTQ+nreL4NEZsu4gBMw/wiFMda9Sd493eKu5wIbg2l
         g/w2PRN9MCA6XfewrbxFBqRlF87aCPTx43rgpVf+oxnjtvOPJgkcPxb9AvReIx3LcvQc
         2vjmlsrYIn8EFGDS1ajDZKNHEYWQ22OPkAteeaP1t6H/VSDHX9S/MlyD+DJKtnyTLC9E
         Z51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793233693; x=1793838493;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=161wcd9EPFoe3fJhGneKDOtD4VA/F1JbIvr2VPER94s=;
        b=Pd/c2ysZcGBOUYsES6i85l6pPqleeversjDIeAEY7Zo7S4uAZ006z1N7VarYRa7m87
         2AOhj37qm4PYvaAaaGzcwZ2l8sJ9xPaX/6BbXeexFJA3bOmsxPAyHOUJxr+F8l1/WWQ4
         pD4vpp4VSZzLrJcmbAW6dcEHk9NQmlqdMeW5Ww3xPcSdUDRkcNmfWETjYuHjw2ko8rMn
         zhb1uso19GfALECOi2RPylVjIHKhwuHu1WmkII2PTm8Fa0Lo3emZR+fxWR6gP3kR9nhw
         ROs5gBAQYGPIXCx7XtbZHZr3z85CBA5UmslCVSr8MCHFjzuc9dWzqTDMMPraGvmr6rhf
         hh5A==
X-Forwarded-Encrypted: i=1; AKwUvBxHk5EZSoY1n9BV2a1JEk8o8YZbgL83muwmhRfwfJUskhIrBhbcpSIp/2BliKEG+mKmBDNCBsQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYIy3qZdgZTsDCVFLrCMGTm2fcQ9S6khPwq1GCNrH8qLBCJQTNXA
	OP7Y2Hn0R5+kRAq+c/EZqefd4sUj3VddDL3fyNNVK7hc2iUDx5pMkyGH063XY0qc8Owwf3/LM4U
	oVZlI/P532wbnpbk1gXwr2/q8C9NHr2xj24tyQtwXYMNljPYgq/ueAx55V09uHsC1MJ4ERJ87
X-Gm-Gg: AYBFou340QVRqk4zA6QNMSxahhYQ5IHhGTh9CfYVbMaYkxfLPJeJ+WSZflreBoqvgzM
	h6Gqis34IT/6k8X64P7xuHakjPUYsz3lUz1YBtPYJuL+Bh+7sUSZ+1DJBxziw0q3SxrY1PTI5QW
	NJiCgcCxCHGEOz2bcH73vAETmmReEUX2Jut/Qw3nMuvR72iFjyffQTyJNN9sq2UdI4/sVvxiOzb
	Bm04Y+iuo03epsU5RQmcmyVIIWzzy16jT0Yw8bkihmN5ZqofLzOwgpUBJhH361UPWGsPO8BMT+W
	lcOjqdqbNnovo9qMvVuAqis8QbIorXBW4k0qRGstzhQ3V4fS9P7mWPl9mP5SakoPCbf66FZPk2W
	1TOu6fTxkuXVMuhQY099bYK1xCuLzQXG6Q1GKDhX8b0Q/eZDvO77GYpr2FU3RsIA3XvM6ydj6o8
	k4fWOIp/1bCuDWGpRgRInl2NltuRlhUMg=
X-Received: by 2002:a05:7023:88c:b0:167:d73a:e994 with SMTP id a92af1059eb24-1a6cd779e67mr6125339c88.24.1793233692774;
        Wed, 28 Oct 2026 17:28:12 -0700 (PDT)
X-Received: by 2002:a05:7023:88c:b0:167:d73a:e994 with SMTP id a92af1059eb24-1a6cd779e67mr6125313c88.24.1793233692158;
        Wed, 28 Oct 2026 17:28:12 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76056a001sm13527135c88.22.2026.10.28.17.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 17:28:11 -0700 (PDT)
Message-ID: <35ec209a-a62c-4fd9-aaba-edeed86dedf5@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:28:10 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] wifi: ath11k/ath12k: validate capability TLV lengths
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261028051254.147628-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028051254.147628-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XfIKDQz2ezpZ4S7g5Ze96Ma0czUsq7qU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwMSBTYWx0ZWRfX/S+jouezbkjX
 8lMRbyXo00XFY2u+8iLAPZNslJbGb2M6LAYYiIsDS3wd6XafDKNgnQYnKBsEXgIGJDjaLdsuVny
 e+j/ltez7BrEUZAHk1vRnbHvFmGVgp0=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae2931d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=zf6acwKC7uJQSQTK7isA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: XfIKDQz2ezpZ4S7g5Ze96Ma0czUsq7qU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwMSBTYWx0ZWRfX7gtVjaZFm+mO
 6FpLmSTn7T7H53kTrtvB90mTH6GIR6S2QI/9SanozhOr62MZC0Lzp9vXoDrLEHBYO6IbuSt0x3X
 7fkgZ2byYPv5TE5dd1jvjg8+KL69EhkV3tdv8LluobbyTIuhSARKugrzVhkmkHcu3t2vmvqnr29
 0wUKQLM7dTa3ntNq5a3RMIVy8MO7Yng1iSt25BSANqziMEoYyD00awOCCxxlgYw8HJt/E5xaBSr
 VhYJ0jFUGpf1U0UN3CMP2nBXKyuxRLL/qKqjycb5wFBOFK8aHW8tSvgd56HYhsovdcroVDQfBFR
 4GJymxPaf9bwSI55wgr/QPx96LA5nACmQclYWH862nBuf0ZhH6QJPVuqkYqX+dMHvuNIlrkhccs
 DihWKurRtuWnK2WNke8hUdplo2CRgaGiGTVPyqrri6IdEqZx1qS0DOl4eP4rbN6VL+2qAOAJLcn
 l6KGkfr9FnK5534u1ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_172815_173739_4FB1EF49 
X-CRM114-Status: GOOD (  15.12  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 10:12 PM, Jiale Yao wrote:
> Several ath11k and ath12k WMI parsers count firmware TLVs and later
> consume them as arrays of complete capability structures.  The generic
> iterator validates that a TLV fits in its enclosing message, but these
> tags have no minimum-length policies, so a short element can still cause
> an out-of-bounds structure read.
> 
> Add policies for the DMA buffer release, hardware mode, DMA ring, and
> extended MAC/PHY capability TLVs used by these paths.
> 
> Jiale Yao (5):
>   wifi: ath11k: validate DMA buffer release TLV lengths
>   wifi: ath11k: validate hardware mode capability TLVs
>   wifi: ath11k: validate DMA ring capability TLVs
>   wifi: ath12k: validate DMA buffer release fixed TLV length
>   wifi: ath12k: validate service-ready capability TLV lengths
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 8 ++++++++
>  drivers/net/wireless/ath/ath12k/wmi.c | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 

I was surprised by the asymmetry between patch 1 (which just added validation
to the array entry TLVs) and patch 4 (which just added validation to the fixed
params TLV). After a session with an LLM we came to the conclusion that both
are incomplete:

The DMA-buf-release event has two independent OOB sinks in each driver — a
fixed-header copy and a fixed-stride array walk. Both drivers are affected by
both. The series fixes only one sink per driver, and in a complementary
pattern that makes each driver look "done" at a glance but leaves each one
half-covered:

- ath11k: patch 1 guards the array elements (_ENTRY, _META_DATA) ✅ but the
fixed-header memcpy at wmi.c:4669 (16 bytes, unconditional, from firmware
payload) is still unguarded. Needs the [WMI_TAG_DMA_BUF_RELEASE] policy.
- ath12k: patch 4 guards the fixed header ✅ but the array stride reads
ev->buf_entry[i] / ev->meta_data[i] in dbring.c are still unguarded. Needs the
[WMI_TAG_DMA_BUF_RELEASE_ENTRY] and [..._SPECTRAL_META_DATA] policies.

And since you are playing in this area, my LLM thinks that
WMI_TAG_HAL_REG_CAPABILITIES_EXT has this issue in both drivers, and thinks
that WMI_TAG_RSSI_STATS may have this issue. I haven't verified that analysis.

/jeff

