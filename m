Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F8DC53200
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI/t43mfQ0qzruQ5TObcMZyGLP55nw3pV4Y1yJ3MdnM=; b=HmzMSZqHEJAtTDXIJMQP7THo5N
	w1vHP++lD5HwTxAYHk7jr6eGAtRk+z1IFkfIug10vlYLZoZkKgWOwIDlXOywR4YE5yZDCMVAvnpUQ
	VO1pZVQd+QQnxUBMghQp0gT8XPiwdsfA4Wy/8/rsnIEnpIjeWNKr8Hm03MPKPcvkycvjKcC9cel3a
	W7vYpxuNDMwhO3bOxCceHDqryx+YMlf9aloOuPZNv7Ghln0C4htdUlbHD7WKp/nWoDdvhnBmKOqOl
	0PnnaKofkjwc44C9PW2SfUHkun6mLP6xip/hrRisxEl2QL62yQTKYs/sThSJQ0pcMMrGI8mvrTLw9
	BhmaeIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6EI-00000008PiZ-15vh;
	Wed, 29 Jul 2026 15:29:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6EE-00000008PgY-2WOV
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 15:29:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2N0l3341135
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 15:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OI/t43mfQ0qzruQ5TObcMZyGLP55nw3pV4Y1yJ3MdnM=; b=ekq+x5+PkVIAKXk5
	Ok9wOh+zzBtq5i5G3kTcLafs32k/PasA0bYyP1KXpWGiC1+xMz2aFe3oRZyztt9G
	0xJ8WswWonSQ7YN9RFfJiA5IC+GpMUFOoynZcZfmqQBZPcVtYcRB0SjeGGeNpeKT
	BSLCjy6p9BwiXkNP7/kpFub9IRvswg/xoBg4ydVBzQlNM2tPXrJXWQ1/WDAxku8o
	9N965dY/TJCNDylEUSVcUPhlbwcZRuY0YW5D2N0PSR4VQJl2jiCclPvNostA93vv
	BnuCjYZWU7HpRoBxtahMWeCl2rSLWTJseFVCzoIV0mp7ekHMyhtZA1H6aPI5DVo4
	oMit+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3ms1c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 15:29:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e667368f0so1736156a91.2
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338983; x=1785943783; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OI/t43mfQ0qzruQ5TObcMZyGLP55nw3pV4Y1yJ3MdnM=;
        b=RwhDthyuI+J+m+2Gm8GU+xht+f7VlLtA7DLN73wwp5B2Fh/DXWrBSEJtIky1QCFTQm
         ccnAiaBx47riJ84DRhKCeU0cKdNyjnlx+dmv4SOe9Ac2aPlFWgzwvFfrVGO/TjNiFYf2
         uCXnGuyAt33L4exal9C3SizNEysLICJxLchngPV2b4Qa4MsFgmmlnkCCavfpD1X77Mbn
         CmGov/qG4wZCzSTeODJCZ+1R4prcUA4T3fdQ0aSTLMZy0aeV9liosRAhwn8NkznYEm7X
         +Q+6UvHvxOGgjZZ5gLKnnF3BnjOt7YQUUihNc2O7MDzQ3TQ5Z8cHNaxDhaH/SkFbSCMR
         OJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338983; x=1785943783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OI/t43mfQ0qzruQ5TObcMZyGLP55nw3pV4Y1yJ3MdnM=;
        b=tYRjDZzjbcp2n9fX9v0u6Kz+Gs2MLDWnuDfXMWvPkis2MQ4EvpjFNiaGhB/s0B6CFK
         MvvMI5XdyuczRqxxhn8gaA5fGiSbHHZa7v0DxgEhdIOzpNRHgBOB2DQ5fzcKjsa+EZ1U
         f2FpeybhWG9o2L0UxgX50w+E97q2vymu5+w5KC4XEgJIdR+0U6KCmL8sbwv8WrN8kCZu
         IiLdSzzRSYBRxOzTOXsO/8kEBPKIQ5q6cKmeaYKVOhpGxSHFF2d7CYSzYIYh6q47wiOO
         ebyfpcX7usnTvdpC7z6c/YSwFSse62J3v5z2gHXzPVBBbglrzzbNTpKW2vMleRbj8iTU
         mSlQ==
X-Gm-Message-State: AOJu0YzNmcXsz3OFNhurcmeB3VCeIiU/AtV5wO0CiHlWBdQ0oaa4N99r
	761THkCH4WiwW0CNnPn5lOrO1PXwWNx2wTc+XVeFBUvWV7NF9G4gJG0aZGDrj8xVd9GxbxOWFtB
	+k7qiCqpUdCpd08wXNMMQadjLFKtmO1UG5Dt1DYAuxS7U2/phlu3WMvIKazR+UPmW
X-Gm-Gg: AR+sD12xD2zO+TuFNGOt31Pzn5wuI3ZuIIe/lSZRuu2xLSj8yqbA7oqZ1nX8399I43k
	AeHWk9hwLlMGV3N5q2Wf+UDtNEnkNM/3lzJtB0zytvjw767mreBPD7E4mP7d+BWvZCpdhOh5JFq
	2QqEamFpwyGzUURJmpERvorZ5tqM08+U840g7JVUkBGTkpJyHQLLUzV9yL9P/W31YyLp4CfqZ9g
	+8Jm9q/GKXHDEyrdK0ZrcXWtDywoTR4Y/3gYImkRrqXESEy+O03Ss1HTzebA21bPtBfzNAt/02c
	djh/gk1rpjYTmkgb90sKOOCQaQwbubGeESzejWSXTvEfZkBzlM4CDIuag6Ia/Nr+c13+SB31KR9
	xM5AsiX+EeP8fuPwErycGzjx0Gv2ZK8nLno2rorUeEQCYGX00+q1VRVpAgXEw
X-Received: by 2002:a17:90b:50c3:b0:38e:408:9d7d with SMTP id 98e67ed59e1d1-38f6a4acbe5mr7105057a91.36.1785338983012;
        Wed, 29 Jul 2026 08:29:43 -0700 (PDT)
X-Received: by 2002:a17:90b:50c3:b0:38e:408:9d7d with SMTP id 98e67ed59e1d1-38f6a4acbe5mr7105007a91.36.1785338982417;
        Wed, 29 Jul 2026 08:29:42 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d2ec2asm13082804eec.21.2026.07.29.08.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 08:29:41 -0700 (PDT)
Message-ID: <a0cc20a1-82c6-48bf-922a-dc7470663574@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:29:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX+p6Mu7cIncUc
 4zuaBKj0rgXxxM/eHz2kOGrNuF9BOTcSZmztfxQ099hvluY0YiCQ0/Bx1xCAOcPNN2jzVV8o6I2
 3ZjEWqEofZugTBdOjCfe4FLX4jFk90R28uTfLb+8bIn4PmMyNuZk/V/ujjSCdTqSAK6ZAtOHZMI
 CarifCTOzrbcmneCUZXBDFcz6ApqS2ZbENbG0ja/j0LbU5Ey8lVvSAghTJTjT56gWFBRODU2DGg
 1dmTaGduri7DiyMw9/rdcu8X4g6dIRtBTrLSC1mt4WW6a/j4rtqZNkbroZilyzW4EhtBfEzIGyP
 bdwZ3oKhMpcWgDpd2AjyXW6JmF9F/xP62qlVuYhS8hUkwBm8/VkatU6MLu5yYlaD8SHXQm4Y1+M
 oF+sYWQADrK4zN+rsEJKzn63Q9JQhm2Ee4xHqlXchQ1NwP53TzjblYIzMnFDUyiMgtyBv4kfCAq
 bvS4IqsOZI2fbXdYUeg==
X-Authority-Analysis: v=2.4 cv=F49nsKhN c=1 sm=1 tr=0 ts=6a6a1c67 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EYLonMWaFkCW3L4CGEIA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1ZgRYL36bM4FCI2O1xV5g8S1dyMM8DvS
X-Proofpoint-ORIG-GUID: 1ZgRYL36bM4FCI2O1xV5g8S1dyMM8DvS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX9tWGUYl2Zfp4
 FSKPt8xn7i+FT0urIuK4NSlgv4i1Jwlz72QQzrvj4mmnW7WbZEfRl5xW5tWce3qJEll8tZJnSkh
 58vOoJSrezyH42VU8qWamM5OJ9NEKmI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082954_669968_7D1B6A03 
X-CRM114-Status: GOOD (  10.99  )
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

On 7/29/2026 8:26 AM, Jeff Johnson wrote:
> Both ath11k and ath12k have the same issue.
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
>       wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
>  drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
>  2 files changed, 10 insertions(+), 6 deletions(-)
> ---
> base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
> change-id: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072
> 

<sigh> ignore this repost. invoked the wrong maintainer script...

