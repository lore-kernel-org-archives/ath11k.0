Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06981606D80E
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YBV1kR2x;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SU6Cafza;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qia+1SCZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=; b=YBV1kR2xI2Bt6S
	W2woXcKNdcy0DpK9O8fSVnNua63+9tRLZFyULwxn3t0JzPQnnrL7MFZik4pyCKQC1BbMT2wqjraC+
	wZHAw648i1totRACsdoqXLJkWiWfdtRfCSugj03ESIlttKkW9p+0eFVnIkJthGMThIvxPpqW0E6Ee
	Gs+TUOs8FyZAS22Un2QiZ3Y7JXjEL7vSh7kqYx6POBawCwoQQXTWbLamuDoxmWg7Bskjsiipa/Wfc
	HugWrGoEFQ8E2eMgAYfv1SxRn0ePSVlyxYvDsPBJmPNQA4AGHL15Kuw8nKzeRIroWnZzAljMy+Y3a
	BaRSntsV7GPNsYd5l7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzku-00000009SUY-2j59;
	Thu, 05 Nov 2026 15:52:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzkq-00000009SSj-2UB4
	for ath11k@lists.infradead.org;
	Thu, 05 Nov 2026 15:51:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQBvT686818
	for <ath11k@lists.infradead.org>; Thu, 5 Nov 2026 15:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=; b=SU6CafzaJUVRtnA5
	pFTLGbVhd67aGS4mk+XjjE9pYfdBXf1FB2jB7PKf1AIcSsOHxaHMUvDphUe9B3De
	X2fyp+awX++0LQCf+B5judTxia9K5H7Ey5u13q/NcjOAG5NPfQGukQ1p7FdvxX3L
	nGUto40dL8y6CzF+xYTrSa7SUv0q5SKNNNHvrA5u/3IkjwTmNm6cU89t5q3jVrWa
	EmafBGunumXmce+1Go5Ep7WTesWeZrsjO3Ue3sJ4Y9PhjIK/p1YTqLcm54ghbIFC
	TltEI3/XRIXZVRFdFlRed3uUkb91RHlpwBn2erYlYpT3/UnIuVfrX2wHa1pE+D4T
	Bomcdg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p1p3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 15:51:55 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-82274137201so2510943a34.0
        for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793893915; x=1794498715; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=;
        b=Qia+1SCZHdwupGo0bcyksnBQXP5FtkmvO4rXqqKgYW5PbCXBGrjdy7Umky5EV/UnAg
         lHcpWhle5lGNEVeVqy3JtN/elALlfANB52lxRZEIa1L1SR9x+GUiIpwsVFRBpGN6egRu
         P/s59/80xvCmwUoIAKm4qJ3Xc8z/XK6gXarldbgIpGwLsynX7ONRYcjzT7gtDN+no/C6
         AuyTIBwkFNuUuP9dACzePafEgMcu6KLNRBqkzWcGl2LWzYHRqts2kx++y6YyHTZZAMpd
         UmoT7c7bcFIyw39jKdkefshyzM8J6zLXNEWXR3B2/tXpARy/bc6vO4L4GKsJfzNodWif
         bNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893915; x=1794498715;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=;
        b=CIKsxcOBPrFVPCerqSnN+XMkA/BAjgWGm0YbAH0LT1jJdtNkADI9rjsiZUy12mUlFg
         6IPIL5SqmfOzFWVe+4bkFRtnuT7eG/TVnTdOD+H4n9QhgnnENWykoPl/yzojgesnRzRL
         D0T7/b4ibIrQLiVALyh2UCVkaLbzWJTzXWhKtW29OQvSHoFTJJXqvQl+74A2S8OYQnaD
         S+UT4VgpZCvpNCu0eQ2iV6Jo8SXrOnycfxJr9/tawfwthSIUdX3p0fS4mXcTNU+NKqTG
         /xcDt3N7ELsPwEN/YLMCnBorP+iKpb/ODcE11inqtOOdyU7kwhbldfdL5OEizdbmfuEv
         Z6TQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1B1ReWxm6mB3vqR0i9K8Ct1aEapvz+20iYRhZa0SGKESMFldtS0NkTeZ4+jTgJA/RGhaMSL0=@lists.infradead.org
X-Gm-Message-State: APuU4Z98BdMqT+o1q6nHIsOtqSDalI0fNKE6JozOq6DpT4Sx5Hj/4Ch+
	A2FgUG9cdTfcDDnJlaC+bNdMlEMyT9v+h20quF6yqW/ZUkjbwBbLsituOEfZo/P5+NT1s+oohbR
	nvrlL2ctftw4rQbTBwZpkGddaZBbSacp7sfVkMh08mb4zZTPFYy2/2ymEau3L6Baa3P79o16b
X-Gm-Gg: AYBFou2TJOKNskg+QQGl/Sru/zj/drHdVcHthjuKJ9Fwf3xvud52gP0jdd4yjefXEE+
	czIEteDunvBqkSz/vMg4epEgEEWuchGGhb4yZ6P9S4YqwlzovQ/bT/CtC88ufQgYhjhq6sa2elk
	E8Xn0zW7Ov3Iop+CagiUZk0qkRNhdtpHx+Ugr27CZiEa2JGRl5NQayyHfmUueOvkW8p/KXyJI3S
	V6pHOOMIL309uAEAFKGYKIegLWbfJ/SnZvaqjTipF9l7KuFpt5qUzDwRKqGDPtYMULNjqvTVKfN
	kfasl6F+0bCDELpTiJ0yvvKuA7sj17m/2RmFvQDoEbS0uEafk5L+e/aDQfjs/pBPC/ZoJ3EJZ24
	CfYKG3U5rKwFMg8VLDCuW3OpnM57gkR2H/OZr+qPNCT+ynX81sZ7cRN7t2BCbcXDQ1zEuJeojKL
	hliP+toOBm16WKUAgE68jYSMFEOoX4gA==
X-Received: by 2002:a05:6830:640e:b0:819:1804:d208 with SMTP id 46e09a7af769-85d3650b7d4mr16481905a34.13.1793893914693;
        Thu, 05 Nov 2026 07:51:54 -0800 (PST)
X-Received: by 2002:a05:6830:640e:b0:819:1804:d208 with SMTP id 46e09a7af769-85d3650b7d4mr16481875a34.13.1793893914117;
        Thu, 05 Nov 2026 07:51:54 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d7617asm4814965a34.4.2026.11.05.07.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:51:53 -0800 (PST)
Message-ID: <18053a92-36a3-4d02-bb73-25e9aacf976f@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 07:51:52 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20261102
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
 <61e49149-5096-4440-b261-ffe2d250f6f4@oss.qualcomm.com>
 <6792cdaa627ba4755fd0836a74474977496f9670.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6792cdaa627ba4755fd0836a74474977496f9670.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aeca61b cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=5KJ2qN9qyuHGAc2nJd8A:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX+BejXPA+k3D1
 7eqyCgaBcu10QeVI+cfdfEfgfI2cw15q7ePmIKMGnbrKkGTcfg0R+F8/sL6KYQSdyL/pfLuPblF
 TvdmPlH8K9ZiMCYyhaR8YtBg5g0RACcfGyNbqk23rSWUA1OpTP2EwzsGN+jrMFI07pPHMHgDDXl
 xdWR8GDdXUWWy3Av/sl6Rcjvw1Aif6xK0P57toi1sPJVtDOnzgg1Y6vrrsOzuLJ7+boiP7mu58X
 nUrji8FmZK87bdiqOsbDY8U2na6HKcP6uLbY1aCe6FmpmUGsZbT/SwliNSEWVUHjdb3V8qDNCrc
 0b53+keLWvZOxnC751L2ru5ppF6emSx92CqAAl3fASqK1trpVUxayPesQnSzxdf/sDpoi9WQ6Dy
 FO87Hh1O/E3wPLme6SCC47y2dp0kUBy+qunVCatZpBZ8Guqrhzlc0nmLhMmd6f9ieqwSqpUk/5M
 b3wAAnGdMBHQdDOpJEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX/vpfWoc9ka71
 HitKKspNrDtKFIBPj2Ex43FnMfXC3gWnlE3gTcWBEJn2qPb5wxIw/s0q2u19/L/slVtBEi5TEf0
 tM+hNMRiDXP8CQO6zIVjiBMwqsly16o=
X-Proofpoint-ORIG-GUID: EsgPzeKYZsrv2w7ot-ObUmJSogL5N77q
X-Proofpoint-GUID: EsgPzeKYZsrv2w7ot-ObUmJSogL5N77q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_075157_441276_95BB1608 
X-CRM114-Status: GOOD (  11.75  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/2026 11:29 PM, Johannes Berg wrote:
> Hi Jeff,
> 
> On Wed, 2026-11-04 at 17:11 -0800, Jeff Johnson wrote:
>>
>> I missed the window for your wireless-2026-11-02 release.
> 
> Very narrowly too ...
> 
>> Since you have now
>> fast-forwarded I hope you can pick this up so that I can also fast-forward. I
>> have a series that depends upon a revert that went straight into Linus' tree.
> 
> I did, but I was also going to wait until net lands in Linus's tree,
> which should be soon (today/tomorrow) and fast forward again, so we're
> really aligned. Hope that's OK.
That's perfect, thanks!

