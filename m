Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12B0C55162
	for <ath11k@archiver.kernel.org>; Mon,  3 Aug 2026 07:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uylxz9VVZchrtEvgB/E7O4hO2qJgkiTSZerKRLMUiYw=; b=16dlT1Mp2IR9ttdpevBxk1SlyK
	tRN8t+0Wz8z4FzU61iqa6mac4SZax6O/PeWsvWtToNMKtBt54XNhU6c+8CwVSD2Rpf8OQ708DyMXc
	h+EGZJ49XroLDKxzPSTreekGSNk0XhxPfvbF9chmZSNdyufsHvHi5KqtDTURaJhtcLzolgxFZ+QN/
	9sc3AX18UekkXRFSsoFMksjVl+xWSB4xYiMF+15aSInHRxUk8B1dHWQQ62V/9oJzhu0f7OyNugbQ9
	Hqo561nRGndLZ9aEKoalPWvon7qC18uZlxRUJCGeMTy1H85yePg+KIxAMsvq+6upt7WRpIKsDf6J3
	FaNOd8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmm6-0000000GUif-1aSs;
	Mon, 03 Aug 2026 07:07:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmm4-0000000GUhb-0GBA
	for ath11k@lists.infradead.org;
	Mon, 03 Aug 2026 07:07:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736FFvg006542
	for <ath11k@lists.infradead.org>; Mon, 3 Aug 2026 07:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uylxz9VVZchrtEvgB/E7O4hO2qJgkiTSZerKRLMUiYw=; b=JC2q4HjEabbStTrn
	IbeO1rcatNdDLZK+K/2ZPAmcKzeLjvZ7bVGTobWVJZFTvw67sRaDvIxNGK8QZQRO
	v6BDYP4GkmpqNXjeicHw7sdH52EjhEtrB6pRf3pR3uQG8HRpJVwB2OqMeUD9QF1/
	0Bvkg/t+sR+GtmY0imDQi0kKb5uO5m0e3KDkSf01vBSY7uQbZBgrvfi3pNq3ptQq
	RYLSycilFKCEJahIvk246zk+Czo22f5ERC3me8lVPOp2DhAqVjTW0Ff9lkYMDQdq
	w40mZ/jhEHjeFzYdhr+u8gakNf5ixZsPVRpcWRSmQ5xXQCnVCC/E7ko3e8xRqN0z
	gxCc6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj786p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Aug 2026 07:07:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d004f13426so41837985ad.3
        for <ath11k@lists.infradead.org>; Mon, 03 Aug 2026 00:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785740866; x=1786345666; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uylxz9VVZchrtEvgB/E7O4hO2qJgkiTSZerKRLMUiYw=;
        b=enOup/IoxU8e1cg/PAVtgnEjez5u69/hXh1hl0j6dajsao5MgBEnXSuqClK4NQHBMG
         OCl2IIAdq3g5ObiHs0loPBqRZhqAZkfEqGTrWDnYJuD4QQ1+pkU1R8WQOvOU7CModUcc
         93QZj+xRYGX5Eg3DVRDifAvwHYpbwsOKtnWJctT2rLFs72e1bHkRWgYffdr2D+Nz6DCb
         SejDfDsd5uNtr3jJX0Vqcj2GJKxy+j9qhLlgihj+1nWaI1cX9ldQJgZWriA1fhrIzGgk
         tvnRpvStvEACRH6JZ8MyDdePhjQFuJPlM/9zNpXygoshWIcPAVtmiVdK2rElZdgwsjr1
         seag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785740866; x=1786345666;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uylxz9VVZchrtEvgB/E7O4hO2qJgkiTSZerKRLMUiYw=;
        b=UZVG3jutJERyUIskPbySmmzMHabw7kcP3o5yDs0RORBxVA5jZ6NNx0JAj4L9DG1irK
         9fjtugDAYN7+DfGGbsX3EdQs9pfLtWqZmn5DYrj/gTz7CV1GSt3MJMKeAjUPh8g5xJiW
         zYQkivMp49eg3bkqvFwJ5XXRp+WW6CsyutTwM95LatVkTrr03DreRPzq8MmW3+m3LhkM
         WZoRr4N+bpPxSqWLJodU3XqB8Bk/pJKLUbJ2eHtmWG1ciHOY8F1PMJHyhLUuZJyuBdOK
         w0ZfKK+KZoY67WRBy/wam1G/ZZX+Vi5nbSP+VzIym5i7TFHwShQldnmouJNqd6/BpPfk
         TV6Q==
X-Gm-Message-State: AOJu0Yz5qvXEO1iznGHt1A48nTKOeju1554UK4hWKtuGkp9spDsgMne8
	0rdXQJ3xRm+kTTmK5U3E1OII3/VS64h7LtRnGcs97p5iQCtFv4laREEmY0biMdDjCMkbPUxWrwJ
	QYY0SbmP9+6OacVKs9vyCANIlR5DLyp+D9pTGIRgohEMcOh6OsibbjZzZ2kNyig5g
X-Gm-Gg: AR+sD10nkzt8nq1hJhZbMz24+gG9uFA1XJPJ254skr25r/bBBRh4TiLb5/Q6Euk9ZDb
	Iz7OlYHU89TGlch2JBZMAcMhwJ/HvrpjxYsMUv6UiRybsbEujmy1b+IUrWI4FACQxclg8N5wMxc
	JqVfDBRE8ZNHjWTKkTVt9AioKM1Gx2zoxpsKRtGYdHYlaZqPdBG3RvCVtP9RlebBHSofxzmSuck
	vwC15ukkFTxValgBdiH77+RRP2NqSM51GpnkKQwmxm1ZEBjx7fvdXdiJKKsNBUsxQRLaSlx05PK
	HSK7COwKtVGC6FPT91n83ZcLvF4Z6cXyPsN8KsT20ZpUh6UpTtkCWb1f6JDv7mev7/Gf3X6oDkm
	6vqUij5P76xZdV4HiqqU9VBHGP1y1GctJ11LsTScpuKA5Dt8Vxy+jiiJgz6oyRLwWSfkIlz0=
X-Received: by 2002:a17:903:3883:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d0522023b7mr86121775ad.12.1785740865948;
        Mon, 03 Aug 2026 00:07:45 -0700 (PDT)
X-Received: by 2002:a17:903:3883:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d0522023b7mr86121465ad.12.1785740865561;
        Mon, 03 Aug 2026 00:07:45 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19411sm33697225ad.8.2026.08.03.00.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 00:07:44 -0700 (PDT)
Message-ID: <58cd73d5-d7b2-4259-9936-9c6a55492d53@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 15:07:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH ath-current 3/3] wifi: ath11k: unregister PM
 notifier on QMI init failure path
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
 <20260730030948.147892-4-miaoqing.pan@oss.qualcomm.com>
 <f105a3df-6769-4a61-ba37-a6b874a918b6@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <f105a3df-6769-4a61-ba37-a6b874a918b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XJ9EW6Q-z6CoAqo8XfZk8B0d6z_G9RwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA2MSBTYWx0ZWRfX+5yVOHi24LGn
 zFYbfwgBvCCw5O0U8EzOSDOBxVoNMGDVo6xP01hInF/I++LbDZSJWo06bKAQsI0vAz2y7Fn9z85
 lNfBAdteWQEuDq2CYrS5Y/rP1x6WdUaSl1vC7CMZjEbX92sosgcZR/NIhxX9xin4Gf93OVE9MWS
 X9bPcaD9yLyAWlC8yzyRkSvU1GJbcNXrycO0lWIKNVeSFXzX4p4grpjnFuwqGCMtjj8PTcAUFKR
 J0K4Hjabv03jNNxQOFDPlsWWHyCT7/rJROvzuS/MDbCDaDjbJLpTwLWrY0Q95PDV+MscQY9gTrd
 2NETUPRCvnn7M8zlm24Vt6SBBn30B5GCdFE95sLASNYXB7sY/sqly7eTAFH0Ya9GkZv/L3h/xzh
 OwlIQbxu6HqCSa3ROqor/j044k108I62u5gMVuE0TWdnqKYF5l9f4z3LHcyGcurQnSw6f/FMkzw
 NnCwtWSgFxrBWs18z2A==
X-Proofpoint-GUID: XJ9EW6Q-z6CoAqo8XfZk8B0d6z_G9RwI
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a703e42 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JNLNxjGKG8KZZL2vac8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA2MSBTYWx0ZWRfX/fETU8auGaB4
 XV++GuHYbNHEL7KgqGeioCxbT1F9XD7feU7qumoCW5EADqinIvtIrMitIkxz6vEQmNeNcMgzWXN
 DUtb3JWcmdfSjF5l+ANgDg3xLfnx6gE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_000748_234797_BDD38814 
X-CRM114-Status: GOOD (  32.41  )
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



On 8/1/2026 7:06 AM, Jeff Johnson wrote:
> On 7/29/2026 8:09 PM, Miaoqing Pan wrote:
>> ath11k_core_init() registers a PM notifier before the QMI server
>> becomes available. If the QMI server never arrives, the device remove()
>> path can take the early-exit path introduced for QMI initialization
>> failures, skipping ath11k_core_deinit().
> 
> This patch felt wrong to me, so I spent some time with my buddy Claude.
> 
> I asked Claude: in the last patch the commit text says "If the QMI server
> never arrives, the device remove() path can take the early-exit path
> introduced for QMI initialization failures". where is this device remove()
> path code? I'm trying to understand why there needs to be a call to
> ath11k_core_pm_notifier_unregister() in ath11k_ahb_remove() as well as in
> ath11k_core_deinit(). since ath11k_core_pm_notifier_register() is only called
> from one place it is logical that ath11k_core_pm_notifier_unregister() should
> also be called in one place that is symmetrical. the proposed patch breaks the
> init/deinit symmetry.
> 
> Claude said:
> The symmetry argument is well-founded. Here's the actual structure:
> 
> ath11k_core_init() registers the notifier. ath11k_core_deinit() is its
> symmetric counterpart and unregisters it. That is the intended 1:1 pairing.
> 
> The problem is that both ath11k_ahb_remove() and ath11k_pci_remove() have an
> early-exit path for QMI_FAIL that bypasses ath11k_core_deinit() — but still
> need to undo what ath11k_core_init() did. So they replicate the unregister
> call directly. This is an existing pattern: pci.c:1188 already had
> ath11k_core_pm_notifier_unregister() in its QMI_FAIL early-exit before this
> patch series.
> 
> Patch 3 simply extends that same pattern to ahb.c's early-exit path, which was
> missing it.
> 
> The symmetry break isn't introduced by this patch — it was already present for
> PCI. The fix for the symmetry issue would be to restructure so the early-exit
> paths all go through ath11k_core_deinit() (or a new partial-deinit function),
> but that's a larger refactor. This patch's approach matches the existing
> convention in the tree.
> 
> The commit message claim about "the early-exit path introduced for QMI
> initialization failures" refers to the QMI_FAIL branch at ahb.c:1301 — the
> goto qmi_fail block that skips ath11k_core_deinit().
> 
> Thank you, Claude.
> 
> So I guess this patch is OK since it is replicating the PCI pattern, but is
> there any way to have ath11k_core_deinit() called in those early exit paths so
> that we can keep the init/deinit symmetry? It just seems wrong that if
> ath11k_core_init() did not return an error that we would have deinit logic
> that would skip calling ath11k_core_deinit()
> 
The init/deinit symmetry issue is a pre-existing concern and not trivial 
to solve. We can address it separately in a future cleanup/refactoring 
patch.
>>
>> As a result, the PM notifier remains registered after the ath11k base
>> object has been freed. A subsequent suspend or resume event may invoke
>> the stale notifier and trigger a use-after-free.
>>
>> Fix this by explicitly unregistering the PM notifier in the QMI failure
>> cleanup path before releasing ath11k resources.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
>>
>> Fixes: 32d93b51bc7e ("wifi: ath11k: choose default PM policy for hibernation")
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/ahb.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
>> index 7f5f5c8d7c56..bdb8c99f10fa 100644
>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>> @@ -1272,6 +1272,7 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
>>   		ath11k_ahb_power_down(ab, false);
>>   		ath11k_debugfs_soc_destroy(ab);
>>   		ath11k_qmi_deinit_service(ab);
>> +		ath11k_core_pm_notifier_unregister(ab);
>>   		goto qmi_fail;
>>   	}
>>   
> 


