Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262A8C53219
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 03:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xLplXp06MskGJnYJTS+C/PUBSsiZL82WCkaiM9odTA=; b=lxCof4zPvOddwaJr3zRfFCGR/p
	iUSARl49qUBM7+vgexw68GJSM+Mi2IBoeIHd8gAdim3WPRHoqpedKToqW2xHVvix73Hfzs8iRkB06
	i/I6cF2A/eoEFsDX7Fr3x2deEyaLpnyCM+1c2f0PEo9Sfgt9zW92ZxGTEbCO99DQ6u8F3MKvGhaOL
	uY9iCgjQ4oY18nLHzV/EPcKcTLry9fCNLvh1ADffTsLcSRwV/ZqJkg8/KJElxd2k1wjRCx4ZLnuqL
	haF3WfSWym/k4FUTniFKNXiVsXdg2bmbyRCgPRIDAbKkYFesNuq8f0Bkgvd0jQ3KK211mMGSwca8h
	MEnAkCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovQH-00000006mzw-0Yyi;
	Wed, 29 Jul 2026 03:57:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovQF-00000006myx-1Ylf
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 03:57:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1GjeK233978
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 03:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xLplXp06MskGJnYJTS+C/PUBSsiZL82WCkaiM9odTA=; b=Q+EV4mdmyLYlcrkA
	XjPTyD20Xx0agRpKXjikjErnK+COidStfjXta+OdPbUvkDFdVIcCZLn9YWBdKSTT
	vIKzAsCSByPCJMYchypqeBajBmRb66uYCWiGvEds/RdgjurLsEazdYXDlJIihYER
	jwLn/7O7JEko+bkZw10y/080TjztYnnrOxo6/aYnMsJoE/CgiWR26atwNVjcTozv
	cZGSM1RgJDvDRtIWIamc+haRY1NLnUIsviKS8HpokoHb7KboQ3pivn7ZcX2/nCDS
	ofnSaXTmKLm1m3zi1apFtKq6oLo26Fh9Cmm0Q5kHe3uZuQFx+iZIJQD7utBMu2Nu
	GOFEcQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sagtmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 03:57:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso866526a91.1
        for <ath11k@lists.infradead.org>; Tue, 28 Jul 2026 20:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785297454; x=1785902254; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xLplXp06MskGJnYJTS+C/PUBSsiZL82WCkaiM9odTA=;
        b=bwhGfoQFFRIxzFZIr94/QCYwpXFELsibDAGlqMYkWm0YG5X2nbQkUVJfJzu6deYriW
         Rvnke2/qRvfMmVp2Z4Y8zCQPVl58My/b1mR7SmpXIo/xUS5UE5wZKa/lBZvfguDXioIn
         4e0Q5L3JpEHOT6+z2GbL35XWAwJlc1n/Gb0B0Vl8xK8SyWULt02o4DJAi3kSVTwLdbcm
         CGNI+k5pcVMiyHmWCqNgkHfQjKL81HiML3WQCMLpuYhVVm+Pv/HB61U44xJ+84rNYtio
         k3esZep9ZEqPwzHPEr/IAcbWk4f7BstZzeIkvp4zw9TdKpTKpy0PDS4YcW8Zu4TBpyOa
         IQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785297454; x=1785902254;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xLplXp06MskGJnYJTS+C/PUBSsiZL82WCkaiM9odTA=;
        b=kOT+Ry4M+D3QO7QtMV6/Td4zMqxMrtjXTrlX1R2PEJIYJyWbok6N0Ik6e2FPLN+QMe
         l3RLcY96lVw+o+EBsONDObZIRy93qFqgVlKeR7ZVZvABvoupk7+6EpZMDYlm0zVSisl6
         88ueCIqnOgWqvzfrPulWLSrCPhgItz0DyNswvGHbvynQ72leUIfiZnnuNpTDk6kYKdef
         osOZn4Tt1wvhm7gGlRiP5Zc5HG5UsT8A1f/cUeEEftHUPOU52tBx7k0mrs0E3+c7WMaf
         paDHB5TDbjXbay8ygUedDuTVZxmh/whQmh17wiw14WmWrV2g9rBHc+8mgXMKCK5uERMR
         24QA==
X-Gm-Message-State: AOJu0YwAcjAhXu2c09hN/cbSvvEMsjFZUSpilJUjjVzW1sLMdZmfkKnn
	8QlsiObuFbdh00057qt+ZTDss6Uy70+fcJVr1BLczqH/cifPJaPfgkDERxtS5CS24Eo69z27Lat
	cx5CkzxtBaWVdocPi476sy/nVj5OVa1E6pSsjBhxZGHb75hvTFBNbFL9aIG3ZdlLD
X-Gm-Gg: AR+sD10qq8+hQGPQHkcayO4j94NLlzFTwSBP9PK4eqnkRU0fB5Sh0+DVHWeuqhUimt4
	e7SwYmKHH4SCDLDETLMtkLg2u/psYjWy3vz4crTTpnGqbchReOLp+7XRZo/YiuuIWptyNliegys
	VKqO9dGHsiTdla1pI0+bq0RjfrOIMu8VX+a/wTU6Vp3czswxQ0/wLkXQTbTvTip8VJPa1DVqQnR
	qrxCfu89AvgCWaK3YDaOQkb8JSOMvw0cjNirCtqtOlCls5crCh4VRTU8ZRqe12Gg618VlLQcrp6
	ofRz6EICqOdvv6bQPWCTyG4nIy2BxZOj4qIQfztPY5ZFl8qyLizURz0U+sk7o6+SStUmjj1HGEr
	uG86sfFn10dqk5sEZoEx+FtcVVfKjtOQteAUuh8Mr
X-Received: by 2002:a17:90b:3dc3:b0:38e:6bd7:fbbf with SMTP id 98e67ed59e1d1-38f6a46023amr5079607a91.20.1785297454073;
        Tue, 28 Jul 2026 20:57:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3dc3:b0:38e:6bd7:fbbf with SMTP id 98e67ed59e1d1-38f6a46023amr5079582a91.20.1785297453633;
        Tue, 28 Jul 2026 20:57:33 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b67063sm4983518eec.9.2026.07.28.20.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 20:57:33 -0700 (PDT)
Message-ID: <6309c972-0d3e-4b13-a65a-480aa4736095@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 09:27:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: csFfSeZc-ZfHKieT1Sd8Q-jSYWS5ZO7d
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a697a2e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I08Pv1SOXqSCRlEE_s8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: csFfSeZc-ZfHKieT1Sd8Q-jSYWS5ZO7d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAyOSBTYWx0ZWRfX2X8rSZjP7d5k
 nTbLUJgACGY5p6BHILMHQs+2cR77YnjPr1rHDaPnw3031sL22j23pxutG8+pe5duyTLnvsyJnVz
 /CSfOPnT2GGiGQV18mKHOTl9fH3DztI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAyOSBTYWx0ZWRfX9JSWaGRCOP8k
 PcAfHS0gLsZFXAztETsJu/ct1p37Su+foswHn4DzecK+fo/x2HNlgkDszQfJxbNCazsC2FMDv2n
 3vssN7L8LkPzfSEuiF8h8XOhWoEk3rn+WIwrDEbtuW5vmJxb/NujQ0NC1tGxVKSvs324ywg7CYq
 rlr3L3ceRm9QwgCUG43fqb/UNY9FzNfDdgtGi/xd3xFKATRpRbsRE0vUoXXTaAWEvGBHdZT3K2x
 ImPq1HNlcpMUA3bmpsBYggaCAxaUUU+Gn6kAeTK8Aueqk3FJnRdn8eEPs0DouGBhLNiUBf2WxxA
 C9o0ukGNZ0ohsvVT7s53RKIXZwmIWoVeUTq9YE07ZR4lCkvW76huA86UwcTvQWJ5eJyXF5I4olR
 Yk8X6cM0AsFVrbcA54WaKH/OpEyXEN+EhnMznG4QUnd8kIEonKE1TakF+w4CUtW2rao1bY9HvKJ
 Amd3651sNnmN4Ta5IIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_205735_434885_9CBE898A 
X-CRM114-Status: GOOD (  10.40  )
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

On 7/29/2026 6:35 AM, Jeff Johnson wrote:
> Both ath11k and ath12k have the same issue.
> 
> ---
> Jeff Johnson (2):
>        wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
>        wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
> 
>   drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
>   drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
>   2 files changed, 10 insertions(+), 6 deletions(-)
> ---
> base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
> change-id: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

