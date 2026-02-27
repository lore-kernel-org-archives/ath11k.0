Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859AAFEFB6E
	for <ath11k@archiver.kernel.org>; Fri, 27 Feb 2026 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99hJgsGdZclQ1d/g6UcsGElD/1YGzCJLcKw5fVo+U9w=; b=oHJkxJHMKRgLEsNs+9pzwu3omv
	l+qx9oEIaIH0achCTO7w4sqVjLP08iIThCt6h98VDqoRcHNchz8fglOyTVHh7P5TtvclVmZREawRR
	3AiQ2bLeH07IT0Rr1MGQffq7wXJibgoEBaWT8Yzxf2cyO8I3wQx6GSg4rsUnLi6+guYRYq8LGI6AG
	M47yO2Vs0XUIsMmtJS4mSgK0+f8iYV5wjSXycNWcoZGbcBzM72UR7WSRIlZbXEocLX4SBZFbeP+nP
	I1MDlec7GR5A/F+DHV6ukOj0VpbTFEorEc9QzMxLeOf1xKCPdwsKa5FQjihIOZCd0KkZ8OZvhDS6V
	74Zz9eEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1oC-00000008ol2-0HMx;
	Fri, 27 Feb 2026 17:39:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1o9-00000008okh-2U0Y
	for ath11k@lists.infradead.org;
	Fri, 27 Feb 2026 17:39:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0H5j1912494
	for <ath11k@lists.infradead.org>; Fri, 27 Feb 2026 17:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99hJgsGdZclQ1d/g6UcsGElD/1YGzCJLcKw5fVo+U9w=; b=EpRn98Xu1ZFYa5uS
	k+ovLEoB2g0QQru5Ymhwvv4oNmmraEW2PGj4+wI4CWv1bUb3aunuTo2OOdpdrV7D
	lLDFvQI+u3W+S3/FHidBixupJ1ipZoIVfSbXgteg81gRSA8P62JKprjReuSwWLYQ
	UNi8MVkqjO+gD0lBi4utsZ8M2SSnONk8WtwCRgvD4tZV6aTMFb1YP8mSMDZIkwa7
	BBomnT0IrUBjZ72vUbqlm74CfOO+PEjMGOSm44Jfgp2mUjYDTsdMHa08J7KODMdc
	VrpyLSXL3285dx1LRltBk3NWSXkMvJG4dzm/uN0pKMLkiNpsouNhqyz+AhSDlsqu
	ZqE53g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur3xyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 27 Feb 2026 17:39:20 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4639c5de2b5so30819738b6e.2
        for <ath11k@lists.infradead.org>; Fri, 27 Feb 2026 09:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772213959; x=1772818759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99hJgsGdZclQ1d/g6UcsGElD/1YGzCJLcKw5fVo+U9w=;
        b=ifu4UClPcWqKLiw2kEj5HuJRhBqef6SFzdYBcbR6AkxkFR9iqswQ2vCRi4QzamaBWC
         K+Ll8Cmv7nX3iu/VHBybBRiR/JPycKOuFRVTyDFKw82188t/8dh0RUL8rILz4Q6AnKCH
         mCT1XXyoXH5jAL51JG5rBtuybj/Uo/LAus/VDDVkczITmkHPc7q1j+hF4yU4cJ3G3slk
         Zv7e91c3lKvAIjEbz3rkfpTkB1giUNy++in8PO9WnGAx1YHQi0FJ13+/8ZHQK9adgTx0
         K3AoRaNtAwTXclsFY6yMHSrd41RU/mSvgPEKIZHABlIl+Hdkb2+VACbdZ1tFaIQ4OEZ4
         PzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772213959; x=1772818759;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99hJgsGdZclQ1d/g6UcsGElD/1YGzCJLcKw5fVo+U9w=;
        b=I8gZVXVVKviZakyt6/HLuPakMbQtbv0oirsTyGga3Bv4biYB/MzNZycGJFP5RTSR5w
         9tmxk8UP0NS+QjyYyqJw1AoUismLuj9AIthC6CBQnrW8kjzI/za25s0KqJkNkQ3++8KP
         NDcgmLKtyi92CSl6j6dOWelHmEg5f3ZXFkB3pdt1kulwa2vZ/V9qLhbqRDR+jbrOzrzJ
         AEis7hvtGQZCocUdt6QbLsTzH0Hn1021MzI9okVU08eG/XERLNqdBNjJWsvXoA0+qJ1N
         p7djKi/51qk46GZ1IkZlf9pxUguARXXqMY/sUmi6yXg6mD1ewssqGhzF0bdIHoSZbyI6
         1hwA==
X-Forwarded-Encrypted: i=1; AJvYcCVyWkUgFpFZHyW0BwqRFj9dKag/gEtwoDqWh9vXkWgTFa3gXLgcaengO6OO0GhYhR7wV1PV/hc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw95tNeEWyI4EvniySNPe6Cihr8AWkggyUkTlpVgXdD2vzbB+/S
	T0FlrminaowHfwZssNCt21ouaXBQCSIarIX4D5sBM7y3xX+wjC3AH2QAK8YhCNmwlxtPF1562sI
	dhZtkiwRH+W/y0qM8DXAiIEYSh6+6VvUCwR1bwkW0bunrSYpOE97D/903ucBA3P50
X-Gm-Gg: ATEYQzzKPWGFWfsR8+roEauPwnEVaXwVJmPqHDIJnPFtJ1Ex+5u7yECJmjGsncq+Z2m
	/L47tl/TUkeNWk9gnlCq37SIU1J+Gx0paps/NWARY6Z6e8T2OuX03ZijmB8VDdtuLNotC6lguN6
	HN5g8Z0GwGmGyNSTAlyQJAab7SXG8iEOPJzP4T6tVEDv8p7zGgrc/YDAaTMpBnEfXCria0Jdlu/
	PJY/ZqzzrxrdtdZniT9S8Vv8VwWUM+x+wAwU23jAPaDcylSHrTqlN60B6jCCa6HPyvNWGyJ52ig
	8VfJVPo2VlILDd7PE3OiNtrHNj0NT2742UwBXwPotr1YhLuHDiY4aZ4vhqed4wetwv23oWLoAOj
	uwkcKyX+fZkE8ThTEiLkvvn+iR91HPOP1yeJ2EyqVQfnSZddEuecl9wFrohSUuK025atTnUrjkb
	+XB/bmIOMa0Z+k3g==
X-Received: by 2002:a05:6808:22a1:b0:463:efb4:f9a2 with SMTP id 5614622812f47-464be9e59cdmr2134310b6e.28.1772213959512;
        Fri, 27 Feb 2026 09:39:19 -0800 (PST)
X-Received: by 2002:a05:6808:22a1:b0:463:efb4:f9a2 with SMTP id 5614622812f47-464be9e59cdmr2134290b6e.28.1772213959071;
        Fri, 27 Feb 2026 09:39:19 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb3a78b0sm2429245b6e.5.2026.02.27.09.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 09:39:18 -0800 (PST)
Message-ID: <ee1155fb-013c-475c-a403-0a46f4b3559e@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 09:39:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath11k: Pass the correct value of each
 TID during a stop AMPDU session
To: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260227095609.3691546-1-reshma.rajkumar@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260227095609.3691546-1-reshma.rajkumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2FWVGXX9zWzAoCDuN-1xi8QJraeZOJt8
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a1d6c8 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=vkfXM0Oplov9zySb:21 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HumaBrn5Rs-DvhBvfgMA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1NyBTYWx0ZWRfX8Md5NSGs/lBU
 yPWVU9Q95/tCLfp0CYLrHog0trLb132llEBZnNh5ohvO9KpasP6X9cf74RzlRpAo/8+lDAzIfj6
 mokOa68KMRCeU1r32AzPj3F1jPxJ5fNW+d/7NS4VuTkGASPwthnk6bbg8H4CbmzXftVTGl880Ln
 GYfLDc9bDhBG2na4MR57XjUY/e1PcYZSjm2ViJZ/I+IksR5bwaUF3DRSHYOWYJSzLRiHiUQUdo/
 4O2l+RFj59VHDy9yBlJbODg1cxea4IVQBow4LRqFN0GSGs+uSADVCM35U3AP5LAG0fHzzv6BakL
 wjXIxGPAVOA33b/J3RkVJNTo1ILS46O7G4gb9KPQi42lx3gtvbuya9CsmMPvF+0chsKCuJd60AZ
 jEhTgARIIv1aECSGTS0nIFgB/JmE8WLyVBMYV8Uo0OCG7iutsRUWEMcFNVbn3Smi7SEhmUaaSbS
 +j/FrBwE6SpciqPWufQ==
X-Proofpoint-ORIG-GUID: 2FWVGXX9zWzAoCDuN-1xi8QJraeZOJt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_093921_784096_0274E53B 
X-CRM114-Status: GOOD (  13.19  )
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

On 2/27/2026 1:56 AM, Reshma Immaculate Rajkumar wrote:
> v2:
> * Added QTI yearless copyright
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index b9e976ddcbbf..00d27e0053b2 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>   * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.

Per current guidance, which I shared privately, you should have removed the
Qualcomm Innovation Center copyright since it is now covered by the QTI one.

> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */


