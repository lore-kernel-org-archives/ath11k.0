Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55652606A31C
	for <ath11k@archiver.kernel.org>; Wed, 28 Oct 2026 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XSavPKA2;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRoUfoPb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GKzMxKui
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BbfM4q1S2eDcLx5Acrn8FFVA4Ky/HliaM3KoNkQCYTA=; b=XSavPKA22oF71z
	T7mx4O6XdxTENz+OFOQpXgESvVlsGFoot1oY0jZ9Bpv4J6DZq8d4hpTtXDtQZF3Slnu/Qs4wSBHV4
	tYFfbZkAo4zO+XvjzSVPLulmYgXVLX78gPUo/zgeAZdN3X5tbIfrZnE2WszKhrkShMeg98r0fzbmL
	y+5BKW3wLaSUX3b+/NLLEzg1rP3aLviGU/ykgF7po3iEKQSgA8BmFD/v08lRKGCM/y0Mpg7VTAVjo
	Q90T9a7M+rsLcURM+RUQenKISU9Y9JG3WuxZ84iPJAaQggIqK7sF0fOORbRm9Ozvh74bbhl/MK5d/
	4wEYQporgfzIqUFgnJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM53W-00000007Gbh-02Ih;
	Wed, 28 Oct 2026 14:55:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM53T-00000007Gax-0rAF
	for ath11k@lists.infradead.org;
	Wed, 28 Oct 2026 14:55:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2pS2082599
	for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 14:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbfM4q1S2eDcLx5Acrn8FFVA4Ky/HliaM3KoNkQCYTA=; b=ZRoUfoPb2xD2dHH2
	5Ipt4+HVjNs3iEEgG+EcDE+jVtBM6CgX4YzMoXr/Ropuys5PKBPN6am/TcC44H7g
	OEekrV9gR3yl+/pUReerZx2x1OOAYyjvMeBuc5vGBayL1m1bZQLaKRp3EQ9Y3HF2
	XdFRxQIXO+NXyDukzgbx/AbD6NDrVXrOum43tpcOhrD1SC3VVGwn8R8OAWpxYsn+
	LfedsIO04wP2zFDTCBxZnd2ShTih9HyoueRYwr5SmzqUU2EOCcYJcUU5934/YCuL
	LHi1D3L/sNZ/0BY5cL3n28SAzaEEjtYeW4utjzwX7X/v9CndC2XH84Y4yNYdoqKN
	9uVG2A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpvjra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 14:55:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c0f73807eso15008196d6.0
        for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199305; x=1793804105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbfM4q1S2eDcLx5Acrn8FFVA4Ky/HliaM3KoNkQCYTA=;
        b=GKzMxKui/EhbWqFTDfF1+UqhwD6ONitm6hQOsYbGFVAHaMfC/y3aUpOo+biRogmWN2
         aVfPnuY/kbY83VXQu0i1EgVLhsqgiJNiLtwZgpn03UhjkvSPDzb3T+03pUAf9kcLOtQL
         v82XUTfB5kZdu8iaWKBZ09bPGfr4nSDcc5uNtU2DDdLqVOmmwQdR+22a2XhzqYeXZ4Cs
         oLj6nlxXWU+Y6L+tmDAzxbugPYrXBruAHrSvlszZ0dLYQ3NIoiiDAHP9CWZ8WOliPFsW
         M8WpTeDfcfQD5qH+cRcczD7fkyK1sSWGenXsKuwM6GJUdhzOOqHi8/XyBmP4yHiT44pI
         iVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199305; x=1793804105;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BbfM4q1S2eDcLx5Acrn8FFVA4Ky/HliaM3KoNkQCYTA=;
        b=p9Fcg2j+0P6QYAjKGyUm/tSlFee/pCequPX6yh2ktat/Omurw1viWyBZYJhebUL5vo
         mPoeRKFHcQ6+HW38tTsQeHlUcjwzneLfojQuaQqS+YnZ1vDNy7xFDzY4em8LioZBYoWD
         ooRe1yfaiYI3qgMXW8L1cSbAn25TjKFAP8Z4d19e0Pp8KzMcYR2SXJJoBNhIcqEJxubD
         qGdBUEVNKd/3f3lpDdYTWVMEkSDJJ5jLlFxcc+1UsvIzr+s+CwyP8NDiCPVAAXJpDR+M
         IlhInI36/8mx+YJFQDL9Yqas39KtLcFQ3jWPSOb9vHE20KawzhT4iDrDEj2YiwZ+S7Vu
         ncBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxch6H5vKY3gaOHxapJ3MDCXp5u3BrUnZd/9rItxDNNTcPuDe47gsWkx6cFF5fhTGydgDspmwI=@lists.infradead.org
X-Gm-Message-State: AFq9FYIZc208pC64D78McwfqeoSe6yU4P+Gtu1PKkTVRvdahasKNPIBG
	Coga1p+mpY3Mq33UhkPdLZrOJTskcc4Zjd0uqK1s9ATRO5hIEXxxDWg4BzSG7Em8cN8ngk4Ge1+
	3ocmXzbfkhKSwatYqMYgdozX40klovELQLsAnzrImJW9QG0Ov9rx33pDS1AY5bcTtQHSgMuGx
X-Gm-Gg: AYBFou3FXpH4jB5yA1d9cjJZbM7nmY4jwa11Kbi38o7p5picDDjUZZvGS9QoPxbbLDE
	fx8BNwGX2W6fvMgfyp7QJ33B64SNtjXQv4b4G0Mfusucqb97xnSdzzSeOyO7M51FVTOK7HP09Pl
	M1N3QQ3/2URqwOuAFZwfzm6FsY+asW6zNPXC8gFB0CqR0yJ0oQMaWj5MRoQIRU4N1aIL90wF4ro
	Jeg3qZ2HK0QtuxY1EQGSVK78BlM/oYcPlnhZ9iX/ODYqOrxT0dRSDV5eRumjBMRigUo7SoxhEeh
	D44la88Eq8AMLi7HcDr29zS8RfrVcYGaGGkJaGr/5zeCd9vWh5CZbv4wP8jR7ERkwTAAq/J1lA6
	wglUtazUGSOUETXpYVEQLX3/Z2A5bHVniW+H00y+iGu5P0mndXC8ub/+l/mX2QQK4lssBTisViw
	goVgqA+0NcyKM12o4ujjn/G+u5vWFc5IUCgQ==
X-Received: by 2002:ad4:5c6d:0:b0:91b:827d:841a with SMTP id 6a1803df08f44-91c7cfaf4bdmr38275396d6.41.1793199304778;
        Wed, 28 Oct 2026 07:55:04 -0700 (PDT)
X-Received: by 2002:ad4:5c6d:0:b0:91b:827d:841a with SMTP id 6a1803df08f44-91c7cfaf4bdmr38274756d6.41.1793199304200;
        Wed, 28 Oct 2026 07:55:04 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c6bc95b66sm64155086d6.43.2026.10.28.07.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:55:03 -0700 (PDT)
Message-ID: <d7388ba1-926c-4a2c-b79b-0fcc0759d4d4@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 07:55:01 -0700
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
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX6y28DX/HXpv7
 /RbPsjx+aMNvMJH9bxXPJa8NEcIMbgC76Jv139r0Oma8c89cAJ7Vh+2zzswQ8/R6FRM5lvDZLZG
 /2khU3J3/l8PSzN+kn0Hvkt8F/bB3vQvI4wb4Awh4FLUg/115ZcFrKGwqhYK7nsbgIEq1gfR03W
 CBhUODPfnT4ne+/kjYX5s8PMzQX5s2fmRLZXdD3/3D87hkqSnCto+ioFhf88/uJHBrJ69hIFc77
 sCpSAwYebfxetd8PvAkZN8rAssJSD2Oc7wC1+vcz75M6enjtC73k0mI2bLLB0OlYzsv0Ir2hPjC
 dVb8MN7sekA/hSyyxtcaGzFf7MF8JzhqSoT/eJ4S2CA/p+rHHHRgPfwgyARt4H4Rd0YwD7n/wDh
 n+4nOTtmVW2O1gyk7sJVy2MOkWnxODvK4a5b/89e44FRpK/+AP8rpHfAY5MpFT0wZM3vXQYK4ri
 WJrK5FyHE3omqyW1OEg==
X-Proofpoint-ORIG-GUID: 3i14dyeYSGoIL7f__hu1z8BFgB6Th8RL
X-Proofpoint-GUID: 3i14dyeYSGoIL7f__hu1z8BFgB6Th8RL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX8ObACoSGtIXJ
 j04gJOtXIkBrUL8dYrRcz8qkxaULBwcnYlMLOCc75SuOjl/pFJASl1niAgIh8JlzQpUBUfSWK/h
 JlNqrJ2zAbOe7CUC4Ckn4gYAli3Zwz4=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae20cc9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=7uwlnTk8OcoAl1f2pbkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_075507_275541_ED750A3C 
X-CRM114-Status: GOOD (  11.51  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
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

-all codeaurora.org and quicinc.com e-mails since they no longer exist

In the future if you fix multiple drivers with one series, please send all
patches to all affected lists. Alternately, split into separate series, one
per driver.

It messes up my processing when a subset is sent to each list.

/jeff

