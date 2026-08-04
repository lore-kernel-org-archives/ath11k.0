Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4629C55822
	for <ath11k@archiver.kernel.org>; Tue,  4 Aug 2026 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rT+BsLlkR/V58zorm9wrpxTZPVaRDittlmHkMjcYSLM=; b=Gjx4PN53dzk6B4wQmoWBK8kShZ
	f0AACz5wDSBXz7KhqF8m7BZBS5FVAGf+XOo6aP2UaPh16poP0yCGG7/CYQhHkUJMCnITyuSXz/BK4
	VgwYkaCX0+lpKF/DQRUC4KSd+iriQf7N/q+9o3fUa7bN03M4JBt1c8JWjSse5X1OoUFdRVKhqhLkZ
	+ok16RyOY/hHo5NzDeqdSIp4bbjWFuy3RSsYGwfIzxSxpUOYTia6haW5mN0O4iChK8k/AcZJhnaWg
	6rSByPxMLmewjs3NEhj4/IUc6K3KqntetXyviP/2LCxNJd+O7e0x3DaH3qfZ8GOZ5ZTPsPDqTUJXz
	KnqsvAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHzj-00000002KOQ-0h9a;
	Tue, 04 Aug 2026 16:27:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHzf-00000002KNS-2zK6
	for ath11k@lists.infradead.org;
	Tue, 04 Aug 2026 16:27:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Ffmk3069845
	for <ath11k@lists.infradead.org>; Tue, 4 Aug 2026 16:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rT+BsLlkR/V58zorm9wrpxTZPVaRDittlmHkMjcYSLM=; b=dCJrnxHxJYm92/tz
	70aOahKT8FaXTtQNf9jIEKsvVuHrEwBxNrz7S+rJEoGUFJEUh7oGjNwn9SWYfk3j
	7KMq7FkgsgWbblADVzXhrfdG8e2FNJRHj/Qm74uWj6bg/peV4ocE3b+A/dxL3BpU
	RUMdZ7D3HT5nrbb4z+lNIagfmIznKU2nL0ZxvnkR6FsvGc4ibwvIVEgHKojLJbwV
	00Dmm9PcucUs0ET3JRHdl4BxQcRhEVrMQLNADktrWMFnSmakoL2UBo5YRvELsAY2
	3NYBjQSiyLUwhwfR2w4xS1eY/mr6s96In6cUlVhXmL5E/LNy1JUcCNbOe9JgpDdl
	GiVmcQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hquq2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 04 Aug 2026 16:27:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so25101a91.0
        for <ath11k@lists.infradead.org>; Tue, 04 Aug 2026 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785860872; x=1786465672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rT+BsLlkR/V58zorm9wrpxTZPVaRDittlmHkMjcYSLM=;
        b=hQyWFi6KqUJ56n+5R1hjtZDjPsJk6OkJw8jUb6phsszUzQmDL6a/JP/Q7VfrROnfjE
         EdGeEq35RhuO+YKSQiX47luE4Pt1ds+v+dXBb0cZj0AKfs8r6wpugZS5rwcqnLweYtek
         b8ktQgRTvycuq7Nde+r2rJ7YVjzOyZL0JVFmkVcrAXhepH8BXk0bVRtmQGi6UZS/rdd8
         /mt66iUsIa62F2wL29MjOIHA6fAOWX8VAF9Kid284AX0kD0cOOE1SdzcwkfveO24HNzq
         VxzZMB8icOJTLdgmM8ln7RYrXx11rCwrvOvZGeBCWkaIeCf1MXkuuUZ2S2JXyj15XpCX
         EjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785860872; x=1786465672;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rT+BsLlkR/V58zorm9wrpxTZPVaRDittlmHkMjcYSLM=;
        b=Lp7GBospwCLQ8mDm8qNwXqRLkiyGWAyCTphuRTjgZKqlgVhYIKdw07gzzb1eEP1Sez
         NtFzA/Wkz4Nb68LZmUqSL6PLrouXzguBtEJLHD7AvaEXx3xkye67wQwXV0ZwFs9zy0mg
         ZhaLeR69UdlNp86NGnGYHpgVVHbW/MVR7Ti7Zi7VJeEp0Ktj5n292wV38+zGZnwo/p1Q
         8Y7pnDea2uCg9BV++U4XMGLT/ck+Z9YAb0omEp8j22O3tffLKPhTS5wPno2MTWtpOg+P
         XdgmCzzqetPBO0HKVcx2EaSNpv0SOsMCKihLsjW2VVwlaY3wnfv9DHKJkV95GCrz/DLN
         j9IA==
X-Forwarded-Encrypted: i=1; AHgh+RqnEvlDF99pJ0XnvOi/fU3eLya6XhkiTV7gTZGorDjv2hDDA5cRuBbR6OPEoV3kqnJ0LNd5Ktk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk2YpqKcLvskhifvS/nMu/NN9IURlLkhVHLTHj+PIosO9hvJg/
	DjXGNDNlHerRx6GBarBIbwXxuz7LCKUNJDLj0kxZm70+Bc/XpMpd1rFmL8LoBOAJqff5Gkbvzb6
	zdmVUZHfphoLrgLH6T3+r2GA5YK8YByvtlRdqoymwvwLHUSrZnIcYMmgm3z878jub
X-Gm-Gg: AR+sD13Vcz+ablVkDDbdWY82ieJGS04APkQszr5jjiu33YNY+P0AP2WzbwVuL8AyzGv
	JODeIWMFtYrmoemV1N6NPHKjSxF4lmQ0l5zSkjyipxr/v7qbStpFXUoo5w/pChmWW2eSwDCFDZp
	UfjjwRvrOxnqUeM6gWmJsm+JdWqehlwMpJGx+ysjdgHbD4HsRrZh3rwgkGZEBgrOenO0GyuEUR2
	jCpliARCUAHKyneeaiT2AZc/SYkhZyssuApweofrZzT5/l+y4/ZGqn7HFuaL5gcnMr3S50n/Uui
	iOexpBvkpo0rtZ3nviOJetTAiKukueXJbm8S4ID+/hyJ3lIKN5IAtkfqH+vW/TFGWVRrNizMTV9
	5VxRDY/N+09WblKZMVj/chgKEs63w/s+705Y0wSY=
X-Received: by 2002:a17:90b:1b42:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3903c5433e5mr263025a91.1.1785860871718;
        Tue, 04 Aug 2026 09:27:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1b42:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3903c5433e5mr262987a91.1.1785860871212;
        Tue, 04 Aug 2026 09:27:51 -0700 (PDT)
Received: from [192.168.1.5] ([116.74.42.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm10301595eec.25.2026.08.04.09.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 09:27:50 -0700 (PDT)
Message-ID: <d32c45b3-f430-4f8c-9d6f-724d95ec9c29@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 21:57:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: modify null check logic in
 ath11k_ce_rx_post_pipe()
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Miles Hu <milehu@codeaurora.org>,
        Sven Eckelmann <seckelmann@datto.com>,
        Rajkumar Manoharan <rmanohar@codeaurora.org>,
        John Crispin
 <john@phrozen.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
References: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEzMiBTYWx0ZWRfXwtp3IpbHr5tE
 Rqz2GNpdSvxKtOwdV1FwI5kXQpQ+O+24+G0XqDZ1qUjXpRTMOuTDGosc+O4yqJQjf2MryzKf2Ap
 mMQqZJWp9zx/Bo5uWVHzMzP2zbYDtnQ=
X-Proofpoint-GUID: 5VUNOmP3DcM6tTzjjMMYQ19TUFMpHJpf
X-Proofpoint-ORIG-GUID: 5VUNOmP3DcM6tTzjjMMYQ19TUFMpHJpf
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a721308 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=1uVfqaZqOROvog6V8p7mZg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HH5vDtPzAAAA:8 a=he8YDqbjAAAA:8 a=EUspDBNiAAAA:8 a=eE1TrZLfpK1Q4X-vsd8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=QM_-zKB-Ew0MsOlNKMB5:22 a=lRF3faHqDRKgy28aj_NN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEzMiBTYWx0ZWRfX1fon5X+EYTyy
 O49g+OAnPXxrpOBIMf3on+K9jB8+kSml0j89z4gPl9pD3PaHPchJAshpGRX1/casn4zW4mj9iCO
 /6/CJHnu6f98lk6ZCuY9pYjv0kI1JR/lNyWTVLe5mFfPH1bGGFuaNc61OXYWo1jNOpvzXXFnksL
 r0b56jb+xeYd2GCzhZjlLWHltAQZLm0GpHWPCSPCtXv1QBD4EmVOONAis+ioxlI4r2dZXsTs0NX
 xDYVD+1fb+TsqeRzHm4fIjP+9DD6R0lC1am1vfxQxwt4fNucHXP/m1OMImfZAvFj76Va2nfI92n
 +JY3b6I0W5xWWE8Z8I0yJ2Knc9G4ICIibJvMRmpvA107sezSaoEDtnKTw26EI08tTOKRGi4xNqT
 WMWGsLkqugiQshWxsinRxBJZz6Xi45FXFJx6E59XL2toRLtBNMKS+ucSRch5fIlWh4whlBZqbrN
 ITtTvbPhYQO6j9pZQpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_092755_869772_CDCA91B3 
X-CRM114-Status: GOOD (  10.81  )
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

On 9/9/2024 8:38 PM, Mikhail Lobanov wrote:
> The previous logic in ath11k_ce_rx_post_pipe() incorrectly required both
> dest_ring and status_ring to be NULL in order to exit the function.
> This caused the function to continue even if only one of the pointers
> was NULL, potentially leading to null pointer dereferences in
> ath11k_ce_rx_buf_enqueue_pipe().
> 
> Fix the condition by modifying the logic so that the function returns
> early if either dest_ring or status_ring is NULL.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


