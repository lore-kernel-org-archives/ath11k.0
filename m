Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE3D606A332
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 17:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ICqVajEC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lyrx1joA;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fL5Qr21G;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dl5O/fEP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=; b=ICqVajECNKLiTP
	5V66TyDG+L5b43NZWWft2p3K4MvLyALYbjqbnXahmV8NKcSpQvOtpvArd8edzmpWKXKVaYtvArXFf
	jLBe5ZaFP5ZoGRforYXIL2SsPPBe+J56uIYyCU23QI4P/Ekv8gwhz1hm0qzve+rmKfx+KcUpNiBLw
	Ou9n8VdyCuidV7HLQvGI4eyVtJjfPFWLRD3KkKtJqkvDDpm7IxMGgtN+3TXXF4n00AR1XLPMbKkk2
	kp3kywTKnmGYD9vtsc4gbyumL9g2XySyz5VP/Rs3dIyANzI/35ZKXU2CaH7TmA/V8j0i5JEhg6EGZ
	Kas2MSQA1DfYKNMcknXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP12w-00000009pSA-1ATK;
	Thu, 05 Nov 2026 17:14:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11V-00000009ojO-2CVi
	for ath11k@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=; b=lyrx1joAoGxdzdRy1eSujzPTua
	2cffZk1ZXiTajlmxh/p4IbhXYrK3iVfj8mIslX4nNKPVC8knBbd8C72TnJLghntDjQjUxgFX1RKBZ
	Z84WaitnANbaP3Dfxmt12g9h+SqQpSTd/5sHLg1NlbO9O+hTsbx3YL361y+JYF8qFIAaGfNPjS6Ma
	qY0JOD2Do5Q8H7aqwJtbJeLWARwb9l9UPrVozmS9BD4WnwjX3PAfb+GAh7pBMPvZQG1VOtwx32qqC
	x4jrT4t9jwdHUB1+ePx1VNRFqHuftG9iQ/u8YQTPKt/zJKY9MSuL5BvWZeUZnvhJxHTloTETBmLx7
	7BR7KgdQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11Q-00000003Jo3-1Rps
	for ath11k@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQBL23644462
	for <ath11k@lists.infradead.org>; Thu, 5 Nov 2026 17:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=; b=fL5Qr21G6LvfgZjW
	zB71fq0ilSJSJDDYmahlqNJAn47iJ4Q8KOAoADIZWv8ENVqZ0QHoNeV5gpcotNkK
	BQogGF8D0g5+09WrN4YZQrsq2MkGSvrkCmQ6CWWR0h69y3Wq1qizJWXI5qoXWBTH
	Z/qY1NGBda/BhFm7uREiIhjqOn5LBlgcdgg6BSZKpvl5aHNf1G+qcHkvyRtYEp/z
	IzGN1QiTNkniGgw2Woc2olaLOVXXEK4MJKTQB4wl29N4k0+hpncmdDpOr/PN755q
	l/ya2RNKt/E4gBIAMzwpIN+MbjuuraIyGodoxxEXyFk56/tGv/miyX4jpdPIoNXm
	1mNeFg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdsmc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 17:13:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so7076879c88.1
        for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 09:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793898783; x=1794503583; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=;
        b=dl5O/fEPplxHzA8UwMQ2cHAvxjdDflu+Oe6f/5eS9F4LnK+wYiU1BTvFO3FysZsjjt
         LgHLsZrgXNvSePRHpb8tQe74SG+F8Y9iDfWymMwdbNPjQRbbmEJ40r6LDnuUc4LHXKvh
         VOiPHpZh5RA7EsSSlCnD/zi6W7u3SzHWmFBsSQ01rCwjqWbtTfdQ6ngs3VfyTYIZgl9a
         d0Y9zaYS3Otv4KvvFt7UdahlEIShMhb1m5X2LeQE5MXfRvL5F0foLJdQDMaBqXJwUUGl
         tzVeiiqEZuC3fOAok5uwtxq5W+M8EHlOBSOP1f4EXGwf4oCliEPspVsBM4LzdYHEOKE4
         MWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898783; x=1794503583;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=;
        b=xhuGHFHzfirIe3MXVXWSrZ8LSq5R8k5R+uX+QrKNoBjUaYiMgIVAiLmuJO/DQT3lKl
         +VSIJZb3JwLDSpG5eYMxwCovLdLyxeQ85cu5VZGl2b6gyJ7KT3ZyunBvU9fnyqt+CUuM
         l2beZv/bBpWGlaybZ7AApfcU2mNLoeZJ1GySABSeKI1Wi6Ukn7yoC4cPELGrDtElQpZM
         /kV3PFEgwlp83MdEO46vr699QkNJQPQRYkq47wWpb/fZepxjNuFmkm3VrgW/o8w6fFLJ
         utE1r7YZVFAKLkdLpYuCkCDM9cIzz6VFryRKO0acmCH5SQeF8Q9BNgSw5fssec5GhxqG
         baUg==
X-Forwarded-Encrypted: i=1; AKwUvBy4sMUN+UsB0yBvHSUKEwBlGFl6SPc6xsYdBPrqykHnC1rEeJ2KYe6SJcF72n0MaU9BYVoNMxQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z86VJSz4Xx/upgL5GtR3j9FSBnzGCm7A2XUF0/d2gbsQyrtYk+x
	cJ7xlMkNhLjz1DDs/P1jdEBWGWDymeTGvmx8D81260gd/GD5FdCxvHP4Hq5dvu5CeN9q1uXu9sE
	kaCcAK4zziSvyiSfzechiHMXuoNF1IdR/2Oinh5wMaigZeoxZPlxpZcnJGZ/0kGeJwKx8Fios
X-Gm-Gg: AYBFou3kltfNyuwbWv25vjgtOk6m2bwWnLEQb5/1yqv8d5LcCUpxTdbWVjRqsSJvyqC
	ZE0roBK9a61FodBuprhlRTYpM0mpM8lv3QCYaFECz7pizfIyyUidIAVoAI+Ql/rwoq5h7V6Ie3H
	naFfIbxEDzRId6ceT2TgzZ+DGdfwM+7rjMgKU/r9C3hpRJWAi/w27qKgn5ixLabRkmUy3y24x1C
	cpa5o5Uu/VvfypQIkGOZjixffocLlO6PTdkjr96/a/aJl4VYjmddcgzZbv+msYJmlxyAmnjYh57
	c02vaSBTR6yQREJ0pH9Ls/jmkhrMz/4u51GCCiZsfw+zbcSMms7i/BBHoqwoVdzQZa8OhlceSq9
	De1/pEJqBlvIXrjLQCVOwVD1HcVlQ/MgganBCKyGM4NfTnIbJ8GsyE2iWoN7TDbBhESzxU0hUC9
	E5IqM3939yzgzfhvg=
X-Received: by 2002:a05:7022:ea51:b0:144:c112:5f24 with SMTP id a92af1059eb24-1ac5b028d82mr27782440c88.25.1793898783359;
        Thu, 05 Nov 2026 09:13:03 -0800 (PST)
X-Received: by 2002:a05:7022:ea51:b0:144:c112:5f24 with SMTP id a92af1059eb24-1ac5b028d82mr27782388c88.25.1793898782603;
        Thu, 05 Nov 2026 09:13:02 -0800 (PST)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25100667esm9541181c88.19.2026.11.05.09.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:13:01 -0800 (PST)
Message-ID: <d9da4f14-4f13-4cec-b519-2c848894c35c@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 22:42:54 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: don't bit-reverse the
 firmware's PPE thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>,
        John Crispin <john@phrozen.org>, Kalle Valo <kvalo@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang
 <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        ath12k@lists.infradead.org
References: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aecb920 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WwoKhXFDXbz0SCtfdboA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: FkJAnNpnFKnaEUl0vH4P_bV5w52X4c4t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfXyqsN+weuXv5h
 d2EYWjBjNVYCYU+ZZxCzGySrXPPchkrbQHARFLowomhYHy7tbomXA0Tox0xiIOPmTTAkLKr4esB
 MEewv+TrUpTABSMyqtQrwI7Xk0FI4c8=
X-Proofpoint-GUID: FkJAnNpnFKnaEUl0vH4P_bV5w52X4c4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfX4sjTQQgpFP8z
 xgO2F7GMhraaliC1qH40MtcVHcm1LyFxsYvB20AommlzBIQhRc2PUQSN1iOUKg22UFxt/zp4Jn/
 Vkr40qy+f5AzruXh8u3MXtRSHu/DrQzuSq6+q+B2cM/oNniA1yiw+605Ms7dQzM1OXBAGdFnHXK
 QvsUrMfGm62VaVOTcnjlwenaH/7AEGd/ekO+EKb6v8nCPLgrjvTMFKsCBacPtEwzr2+IiiuJGXV
 bmR09ukFWR+7+KsXOflpD3Z2/wxtiDvDUf92OSgkf5B8c8MToOqniMCi9j/g1cPc0le1GLbM3DJ
 kDdttq7W0Slx+ewdDHedQ1TwTh+T8IMIMILXkpPrEmbULXRl+Oo+Qg9n0QCbsAB8j7Rq6iaqlKV
 BcgWlnL2q1CSc1y4LTN07+M3Vz+zlbw8AFglH8CnQ4Chhx9Tprxr8HVCDwwCZ6paELmnR8UPjEM
 E0DqP4eR0eIlD8yfwLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_171308_535529_AA5EE226 
X-CRM114-Status: GOOD (  11.20  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 10:47 AM, Christopher Griffin via B4 Relay wrote:
> ath11k and ath12k build the PPE Thresholds field of their HE
> capabilities from the firmware's WMI layout with each 3-bit threshold
> bit-reversed (QPSK and 256-QAM swap places, 64-QAM becomes reserved),
> while a peer's thresholds are converted the right way. Firmware that
> reports 0 and 7 only, as IPQ8074 and QCN9074 do, hides it. One patch
> per driver.
> 
> ---
> Christopher Griffin (2):
>        wifi: ath11k: don't bit-reverse the firmware's PPE thresholds
>        wifi: ath12k: don't bit-reverse the firmware's PPE thresholds
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   drivers/net/wireless/ath/ath12k/mac.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> ---
> base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
> change-id: 20261104-ath-ppe-thresholds-bit-order-436ac99c5745
Apart from Assisted-by Tag nits,

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>



