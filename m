Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF2BC4451C
	for <ath11k@archiver.kernel.org>; Tue, 21 Jul 2026 07:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5u/F8c1Z6uNv+y3K8dxZbgvRMHAOcVf9LRk7KX6thM=; b=SWeQwg5puu7DK/4efPTR/vQlAE
	P4Ht/OwlbDo6iUCz5uH70xxTiFwbry0LKL+xh/GiQgn2KKAJtlW8Yfkqb5Gv7iwiHpyBETpmNuxcV
	LtuoKNwWcjCxw9rIhkSJuKXc3Nrx/5Qfd2wolFeqjqLE82JbHjBt116BNakflzFgKG/+P9GQvf14P
	NjbGpKbqxmy0M1EbsLuZrZrCqpwBJRE0BMuLObeIINSoVIy7V/kXXWyJy/J1w1QkjYwJ+LTxDtlY/
	uoB1S5OEdStO4C8Pl8ILOmCqazQSbl7W8RsQWDSM8lg8SYc2ruH60Rz5DI53fwF4AoGlS1Pfeh6MP
	i7WKqkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm56A-00000008fr6-17YD;
	Tue, 21 Jul 2026 07:41:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm567-00000008fqN-12JD
	for ath11k@lists.infradead.org;
	Tue, 21 Jul 2026 07:41:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6HsUR4150259
	for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 07:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5u/F8c1Z6uNv+y3K8dxZbgvRMHAOcVf9LRk7KX6thM=; b=j73ce9BdE8wIZNnD
	eOl+BQ2TQ7bAhWE7Ob2vEjBLWYp+81BWg+eMbcHmq7uNjtTHuMqw+vBHF2fFnYZy
	FJFXcDlJnMPTY8AZELYgsH2tNHPelWSjy+lPmAVid34A3WDsMXxkdInr6QlsCQBB
	pTyfk2Mb42Qnmw3xcdBN9I06QE4014Pb9EcS8IqfZK4geE1WSCcPvOQE1K5R4dj2
	+2b6H1euqETYnRuFfCyTkml43ZOqklHZbEXpkISG+sDTpxYVC+O9PsvEEgjjOK7z
	Mf2MjvPPgDq/M3xeJ6RpMBezCwKTSnCGoPBeOl1fXtLvU6TcQS8tlrYVhHgWlL9k
	tplpMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff35r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 07:41:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cae455cf6dso158098725ad.2
        for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 00:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784619661; x=1785224461; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5u/F8c1Z6uNv+y3K8dxZbgvRMHAOcVf9LRk7KX6thM=;
        b=IZjP/CFANPykhThTLIcAAG1AOoqLmPjuJ2z97FJcz0KAgok3E5xwP/9ToNNZ4zM4ox
         IXBhoqA7I7OJW1UYvHkPyZuYAmrrrM7pa7ZBsEGcncTOqVH2tZCvyh3fenkGvb7i4wZv
         L0RnZ30gxlJQvfHQ9yogNdsxYQyAmdGgl/Kt4JMjq90Q4sbI5NWznEsj+bzIIGcW7xD2
         3P/xKRLxplBxAeeCLON8KTN+g0K2sNb+uN1I1Q2oPR/K7P5o6kJXWCYXh8hrAqe0yaIK
         tgx4tqc8GK70KuHFpElv9DkOhoaeShbyy7zW5floJH6c30gTTQpNBQMHAFKa3lPbYt40
         FlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619661; x=1785224461;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5u/F8c1Z6uNv+y3K8dxZbgvRMHAOcVf9LRk7KX6thM=;
        b=XYwor+4NpjSm6pabrSq4BHE7OpEcMwMb7hYTvU5Y5nW35nBadfFn4iTSswKQZ3CImw
         430i/CnJhaR1GP2T1jhicSmP1TGXHztSvzy04xjW0v+iwQBeV+8bC+aP94Ku7CxfyP8P
         GvXYdnZWSvbkhTFyWooPvttOFY8eL2aJRqjKO0I9pYjxU5vRi5J1j4hm/+B3IrE6Qjao
         /rQZuksLC/DMJwUL8i1zL+AiEmOLHE8UldZnwd4DS9k1FQ69zU6FxHXqtatitgMTnzwm
         WIPD11+dikswBJ4jr8TWBGoPR5WpscIyf5rt8OF2Izqwoz8PRT8NN1ym0e3X+fn5Z3qM
         NNAw==
X-Forwarded-Encrypted: i=1; AHgh+RpoR70oIL0QqXf0KZtdvflN9XR7p+PtDwkjZHITfQOIZ0bKoUQQNsV6UVOPW5L2Ac4yBP5b3g0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxutTZmoruw0GblX5cbCwJnUtLgNwuDsfBiJw749OlsvPxiyv0H
	4KLTBZ7De7jkaehO5daMOekcKc6YvP7QBa1VXKtIKGWIJ+zDBZlR9drGBo3pOFl0bJtfjKKscw0
	emnQ92atVgjhgVShoCj16OrRfHDZE3H1w7FV6gaRyJRtasQAkjdA0h68mbnDKcQOY
X-Gm-Gg: AfdE7ckuAtjxALMjcbbu8hFa3edWUF/4Cp/QYH6yK7ipbgxC28RqVzFl5PBVs7lEBgZ
	wX3D53T0n3Cu92akvoDn8VUW4SUx1GJrVYRUw/wB3y7PilkKDbUv1RUVKSDIluA96TUHpk0LU3R
	nyVk8gtTw6dyGKHTHWNrKcQ0gBSt0ppLcN5YfUBLuBGEcBRnH31X3AHdBIMp/mIeSZPt6siLZmx
	vvho8FIQ3kEPFFnggiQPWakbY7ewVuM9ykf1pHj42L0bristOTa3AYVvEn2E9dyMqjFGjMmhUMz
	ETmeWr6SP4jiU5jdgnFydURmlLax3cWVvQJeIx8vsJRzuVj53PFX+w63aFvFTTTkDktupMUAL+N
	08KQyG22siFi9c2K/+ZtHQU9GJymL3CdacNEGOH7i+pnZDb5oGv2/c3hMZfRKDLDAVojUJbDq
X-Received: by 2002:a17:903:3b8f:b0:2cc:d192:50b8 with SMTP id d9443c01a7336-2cf34a31907mr193526585ad.47.1784619660935;
        Tue, 21 Jul 2026 00:41:00 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2cc:d192:50b8 with SMTP id d9443c01a7336-2cf34a31907mr193526385ad.47.1784619660474;
        Tue, 21 Jul 2026 00:41:00 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm70879125ad.3.2026.07.21.00.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 00:41:00 -0700 (PDT)
Message-ID: <6ef27e6d-4313-4655-b166-987185e67ae3@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:40:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <181b5ee0-f002-4f5e-93ff-49b6aa0a6e61@oss.qualcomm.com>
 <20260721072128.142668-1-zhaojinming@uniontech.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721072128.142668-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3OSBTYWx0ZWRfX247myAdb8lT/
 HCZl18kt84sZtaXauPJucmuAcYtzJkccLzMpmLxDzzViIbr7dDEeP5O7Hqj3CXmHoMkdraTCFx8
 VerUvmkcYUZqO3+k+jiKVR4ZBtsAg1Y=
X-Proofpoint-GUID: APg4CiMtSXX--wl68wZfDWpVCfNRcwDd
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5f228d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=iHwBjlyiAAAA:8 a=EUspDBNiAAAA:8 a=oLTilD6pKAFhNrx_43MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3OSBTYWx0ZWRfX8wBApdskTSO4
 ub8rlhFTMFXHDILjs10/AsHOSeGQgq0sYikK9T2F7I8tcrLpXlKqv0f1v3f1KbR6PXGpGmTEDga
 7s34sEYDxM2reb+BCN+X/9qymXkMbCAeO8ctL/I8Uejh4uqxyr6qRltQLAUdooEt5QjnKX+A+DL
 OOmHjKiZhG1BV7g8LOdyxOmhAADADVVwzt6TWnzz4WhLX2Lrc3jl97fV5tZhkjSp+aSvdkQp4Jn
 jwJu2YrDD3kR17eZ0Tt3wceljWcVW+HTbCZq1kzzRXVMu6kmdKFyMYt7KyVgMA6EzG+8Yzh3b5M
 HM7yhYGxFLyiQreiiOQ2Dddoz2MMG/nKirsM0lEEbYrs+lwuc0I2P1Ry68o8NdccG6YgKc/hTwu
 nr23yO4/FP64MreYR/vw+Vg4qEn8WOKnSSJZhk3X/HZwDbpn1BXtWeTqzXNUgSA4igSsgeKOlzM
 j2A2VxhXm/rYMdmlwTg==
X-Proofpoint-ORIG-GUID: APg4CiMtSXX--wl68wZfDWpVCfNRcwDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_004103_437318_5F7AA5FD 
X-CRM114-Status: GOOD (  13.85  )
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



On 7/21/2026 3:21 PM, ZhaoJinming wrote:
> In ath11k_ahb_config_irq(), when a CE request_irq() fails, the function
> returns the error immediately without freeing the CE IRQs that were
> successfully registered in previous loop iterations. The probe error
> path does not call ath11k_ahb_free_irq() either, so the previously
> registered CE IRQ handlers remain attached to the interrupt lines and
> are never released.
> 
> In ath11k_ahb_config_ext_irq(), when an external request_irq() fails,
> the error is only logged and the loop continues. The function then
> returns 0 indicating success, leaving the device in a partially
> configured state where some external IRQs are not registered. This
> causes enable_irq()/disable_irq()/free_irq() to be called on
> unregistered IRQs during runtime and remove/shutdown, triggering
> WARN_ON(!desc->action), and missing interrupt handlers lead to data
> loss.
> 
> Additionally, if alloc_netdev_dummy() fails for a later IRQ group, the
> function returns -ENOMEM without freeing the ext IRQs and napi_ndev
> that were successfully set up for earlier groups.
> 
> Fix all three issues: propagate the error up to the caller and unwind
> all successfully registered IRQs and allocated resources on failure.
> 
> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


