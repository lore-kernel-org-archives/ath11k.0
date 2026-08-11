Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51414C5AC67
	for <ath11k@archiver.kernel.org>; Tue, 11 Aug 2026 06:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx478Qbch/yLjgvZK04UJFjXCxOjVm027z1gNvRhMz0=; b=Mqih3HjtBnkXNkR6ArmTPg2+ee
	pYn3syPrPsCZUckkePPojBuKvWTlaw5wESFEmXVAABAAYY3+B0oyyA+AmvgYP2hTGJ2c1wrJqhgBT
	lmT4qqaOFr5mXNTl3BsbKVegcFUZ9YFLaL+EEIsyHNoqfe3N4PEjwvrN7w67Oto4x4EcQwv8bYgiq
	pej6Fp6LlOlP8nuDK9OaGQYVbqdrzdK5mtKgxciFyPEe8kv38E1xsBmfRKbXD3co8reoLv5fWxzN6
	rBqVOJmrG9TxHiiRG/N5fMajs8CzstVQk8GsYZN8R+BXHoH5muWUK2TeGdspWkw80WM93aP9fwr3A
	QnayL0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgLq-0000000DSXi-0rDV;
	Tue, 11 Aug 2026 06:52:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgLn-0000000DSX9-1u24
	for ath11k@lists.infradead.org;
	Tue, 11 Aug 2026 06:52:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMplOH4156898
	for <ath11k@lists.infradead.org>; Tue, 11 Aug 2026 06:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yx478Qbch/yLjgvZK04UJFjXCxOjVm027z1gNvRhMz0=; b=KsvkSiOvYJq46dfu
	ttX/BOWyEhMUDuyjh3zOiJz7ZWqfB6TqWGllb6aS+PCNHCmXPSghIIGOy9fm40DK
	1pCMg216PtdtCRPyvk3da3GRr5zYMczLHWfQZELQ3lGPamcl3Tq5PwGeOWItnpe+
	jhEgmmUVpeu00siSCNAW6rjTeTWyfjOSqSv8KLKN7lxoQxwh3dVzKXGTFPm8kC2b
	LyxPsorq3cOC6WFdGgwIyrWwvIZTsn+pWvgI0PfGv1Jg+Ci79oaqdtlrjWEO0cHo
	9aSAsGjWYN6iug6kvbpRLInk3DSUkP4oXsz3l4V2hNEbzJ6cBCa7i8Yz+2vJJR2v
	l3KKTw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyhp8k4hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 11 Aug 2026 06:52:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-392cf18db8eso1320113a91.3
        for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 23:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786431157; x=1787035957; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx478Qbch/yLjgvZK04UJFjXCxOjVm027z1gNvRhMz0=;
        b=c/2fS4FH+5prAilCx9Aj0dpZP694bDGdWBzNNEGhpg5vZcjcxshFgRgtlltB/Pey2L
         J002CpcRQw2eUy3lW1YBNMnnc/cj7k/JJyNFcp5X+cuo0juwj38RiNbscxzRsETJxEYd
         fH0m/NcVNLM6nKBFNWCy46xOiVTtAcF/gAOyuoLL/3ts01gHLzF5RA5aSwoAkR96PAQ5
         DpWrwI9F8YwGtvFXozZlJbwwepDxWZqoOoTLgV1qk+ooOhfYlzDEMeFmHYL5RzUlEv9R
         xnfIankZCxM883jTC/HEQFNgC8nxN6MMSxvMVtRuxdF9cwxZqceNHAd0pJuYDGCbNMGD
         UCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431157; x=1787035957;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx478Qbch/yLjgvZK04UJFjXCxOjVm027z1gNvRhMz0=;
        b=VhML8kjgd1Fddz66laeD+1LZXOvrv3jOuJWfFNY3ijiPIMccprrA+N2o+/zIiwsAZr
         SsoANYELdkxht9D/vwH5NHGidK1bL1Pwh8C9DxC7gNWfn0yHmuknMO8/nYHYeys372BC
         25K3b6dCBqcu+BWg5bBUJtnLoZMyy41LGrNU2kNTZuqF4feC3r3FiZ1NCwhi51XzzoTT
         uqvxUo4lfIEzIkpRHNgHBOji/E0/6uGTgt4LwIFbhz0odedWx15cWMS0PjQ93q/gO9uB
         vZVNnSXPMBsueVLzi3hawYPp4gT6UZAYwrHtAGuLJ6dnlOUz1EI+pYPc9nQQ7y9wgTQ5
         H/pQ==
X-Gm-Message-State: AOJu0YxGrZbQBxKBOt/HwaGOQqnFZz1yyVwk+IayAyHVvZOlJGyYYolc
	Rx6mnzfnA+OHem40NDgRfOaufz50zNli4VQLM7tcTxk7QTM4+666CM+NhlyPuHJPaQ/zyBnRD3g
	kxMi+bGGPt+u8UTAP8oeD9YjdKhBqvLqbFj5CaAYHzlrafRkzoMO+os64m+xzlgMGByWtsgZt
X-Gm-Gg: AR+sD11rFSN+tMPArlszaWCMX0+IvLtPYGhE+TfZ/vfU5pN0OPa9bfjJnTAb8+uoy3g
	85yT67HBcaufsA0+4MQXJS3Ed0i0aimnF5zoCi9KcrjRQdAj9OA0QphnCIYLR0Ypeuwsb7PuHsJ
	xM2u3yj2WuK655Pgoz130FWD9JxK4o7hgLCvAUtWoXbbD4Jqe/lIf5ci1FpDIA9CP8NcJloIKi2
	P1nXG0GBfCuJfwjoGLhJ+lSXhByQO1gjaEb527Q1OKpasTCIdhrS3/c04bFMvHz9bYoTFLmwFup
	YoROHcdeF3kjVvN/GZxw3j50lnbpOMZoBau5JeNMp5QSsbJz9WSXLpKdddTWOMofx7ibFjmisYn
	BxlwfEWqqD4RNbPWZBeUd0E7mUGcVFOipUt1Z7MgU
X-Received: by 2002:a17:90b:3fc4:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-392ec2fbc12mr1333816a91.3.1786431157398;
        Mon, 10 Aug 2026 23:52:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc4:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-392ec2fbc12mr1333783a91.3.1786431156948;
        Mon, 10 Aug 2026 23:52:36 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14120299595sm3320113c88.0.2026.08.10.23.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 23:52:36 -0700 (PDT)
Message-ID: <2a0d9e86-65d7-490b-aaa3-c89a1bdcd1b9@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 12:22:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2 0/3] wifi: ath11k: fix QRTR readiness
 related WLAN initialization failures
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA1NiBTYWx0ZWRfX2/ZR9/Cwcwmw
 CV/gwCjpfIFFEZ8w1p/xhnKSej1/OSyo7Afzx4aKirUjQeCVTicQYBKWk3D5OmJsVqoIgjM7KjM
 JcW+YPtlfOcpcTpiShr2RcaG1vseqiU=
X-Proofpoint-GUID: TvZR86tPQhk-_ffIGqBwK2mUeh7VdQ2e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA1NiBTYWx0ZWRfX7YdOn51s4tn9
 CO4FlO1oug/XMDhsG+GmfSs3oh2oI32jtb9HbRUobGckz8TNzKqLH7OVlzrkMoMhptoAlYzPTEe
 KxfrGGY9fYRSML9r99oy7iPuMNU/ac/7CpYhgvaojApuKjbAdxx18X1W2gfCdgkMd0Y05kRlXNh
 sHteAbARCaOFmcAjpIYQCqQ5h28fVwi7S1FAg26RVmY6pdrb9favRnlMfa8orfBZSj0bwzvF533
 yfXnaVrtNDRbNmWSFNYrVLi8HEuK9vMOsFM0I4NyYri1SKGYLB6bSZ5GHz6c3UBoLMfZhg/Z3h4
 QVb4MVtwbk6zOiKYQgW41TFUC+QMXXH1Lqrsu9iu6Nms/ZU3YYOPEyYxM/CXzZ/wKDkZ4JnD7yb
 fvthMaHV+5ZCgirTa5tc21dH3UPuSr9kT922LbS8S//CitDSR0ckY8GbGqVt0HnvoQVnTMg0q2g
 gmBtJsPxVj53EcEVHcA==
X-Authority-Analysis: v=2.4 cv=RM+D2Yi+ c=1 sm=1 tr=0 ts=6a7ac6b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TU5Yaf3rhOhou0YHztsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: TvZR86tPQhk-_ffIGqBwK2mUeh7VdQ2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_235239_531498_F82FCE39 
X-CRM114-Status: GOOD (  10.96  )
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

On 8/6/2026 3:43 PM, Miaoqing Pan wrote:
> On WCN6750 platforms, QRTR SMD may not be available when ath11k starts
> during boot. If QMI messages never arrive, WLAN initialization can stall,
> leaving firmware running but no wireless interface created.
> 
> It also hardens the cleanup path to avoid crashes when deinitializing
> partially initialized devices after QMI setup failures.
> 
> ---
> v2: Replace the ATH11K_FLAG_QMI_FAIL guard with !ATH11K_FLAG_REGISTERED.
> ---
> Miaoqing Pan (3):
>    wifi: ath11k: fix sporadic WLAN initialization failures
>    wifi: ath11k: fix NULL dereference in ahb remove when QMI init
>      incomplete
>    wifi: ath11k: unregister PM notifier on QMI init failure path
> 
>   drivers/net/wireless/ath/ath11k/Kconfig | 3 +++
>   drivers/net/wireless/ath/ath11k/ahb.c   | 7 +++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 0ece44d394570806e97c8471a50dc9f584516ef6

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

