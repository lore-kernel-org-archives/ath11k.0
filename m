Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31D1CD4F25
	for <ath11k@archiver.kernel.org>; Thu, 14 May 2026 08:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DQezXlwgxWUm8Dw+7AH5kOEuiqxY5oqs/GcaOSPTjw=; b=rtUxuvVFKGtPDyWcPFVKWtfAar
	PJSDqSm34pi7llrL/SNA3x+c1tb/L35myLv6tpuLo+GrLtPcdWbanXhkcPOWGSRX7o7mF8rtI/clV
	hiMycJHYubnrF1kPICX8KnCqYzzC6QDL/C3cesF1DEAA26Kp6Wc69aMgPB4AWuoTmhEN6Pzvbh93U
	EHUTyS3kN7FhK+VFg00CF47Knum1agCRcosI9AzbC2sM6Y77kW57NpMn+Tf3VXYl9UKUghVTiXFRo
	tY1yCyjihJcPUqjbDwoKQIOlK8zOwjY+bwsFfRZZiMe+erdYLQZWk8GJ4+NWR9leYrEsLanant7Ig
	/knVS1zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNREH-00000004uud-3o6E;
	Thu, 14 May 2026 08:15:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNREF-00000004uuC-31X4
	for ath11k@lists.infradead.org;
	Thu, 14 May 2026 08:15:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0tC4l1622524
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 08:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DQezXlwgxWUm8Dw+7AH5kOEuiqxY5oqs/GcaOSPTjw=; b=oY5nvkQ61UO6cd76
	a9nx/IFmAUAz+p9ecYcZD4lFCrftdX/zxXk8k1YZLMyqg+ZG1wSlVHgfDHOCmwin
	J+0ajIbPoC88+G3jJFbvwZN1N24+JErWJoTLM4CQ7mvtFl1vEoABE3/HmYdtZpcp
	gQ1/JH/vr2mKOz8WquChf3bGbo+7h88lNJZq2Jf/tIB+jVxINgUJnm1x4U6e6cDt
	l0N0ZY3q+kqUMvlG4U1/lCbnhbhTrGBcvEzs+haTtLHwmQvcBOI8EbA2oRmSLUjP
	tC++sDO1LtWv53L8+QZHxfxviolES6zgQLhb0CHs87/Bn2cnK4/gHDOuBLFdcZ55
	83NpDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492s8bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 08:15:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so4778549a91.0
        for <ath11k@lists.infradead.org>; Thu, 14 May 2026 01:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778746533; x=1779351333; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DQezXlwgxWUm8Dw+7AH5kOEuiqxY5oqs/GcaOSPTjw=;
        b=BEPDx4qNRmD38O0y8V92a7nNA9yoOpopVZKqC4TmOl5vvw1HsFqtmq92+4cm5gs0cr
         QDrRwzk2oIbt9G+14vdjOXR1df/BH5miux8vEo2hegBKuHBas5UswWZU8TAM8CeKRiBb
         /EHIOLb3rDXnlRiwcq9uyoBqINPGLkrPbpoH18oUd5BNI6kJKwqe/5ruFXFEwqIXNXnd
         I/73GiYVOHXSVAEH/eMdPLTeFJl+X1Y3snTQj6ebWNJYxksHBnvpOw+I2D3ebaJD6ee0
         /Ha8SaUGMn4CQXjXuPnUXtPHI+ioQIVc7/XcudBBm2MOcntwgY/GovmJYjhXVztb5FEa
         SqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778746533; x=1779351333;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DQezXlwgxWUm8Dw+7AH5kOEuiqxY5oqs/GcaOSPTjw=;
        b=jWwtRePeoD0nflSYF4lBUCvUIxod/HN5gpO3MRfpL+3vP1ldMwqA1M4s0k6ea3u5gB
         J/GgIXdFTa9xktgaZj89ApIdIv62OXQJHu9jHj+4R7y9/B9xhm63B6LBZXek0XLArNeO
         QMuUaIaR+IIwFH18DJCYqh97cbJXV7eZKvTm2hAhdmOVUT9cM8jO414w3eYzn6xbyhzM
         ckljbiOcmqk3Q/6yycB/INwfXgblYwUagSyBTuaINgur6J3hpypuoIGQcbsuaHbDbpkS
         YUCWh8bJjakkdYaDBf/mjUoroZHN08ZBDNImW1p4l1q6QPQDqIy7hmDuCjWZIqFZ+C2k
         gJdA==
X-Gm-Message-State: AOJu0YzIgaD1CxtBSTL5/c8lODcpzKZfPq590xCZzXN3WfM1UUVkgiU+
	dWS3BFDcdzc4Y319XTaPAZ52pa5YSWPRyPNNeNjtqOA1z5sNmvveJ2FwZH6NnS3OMWx9zaYXDYY
	cNwgJQBdHED743KhAQYQHhuhHqFOJVVpO4HiNQutDPneAUJF/dRcdcH9DjRFQ30RD
X-Gm-Gg: Acq92OFweXyU9GafvvKkiB7qOl/L07uFiZ5kYKKvWd6xNCjRFDpY2eyIoTwm01RaBTc
	D0Lzy7AZ/QDV8nprlSjqdV9g1WdCh20sSYGuJ6qAZL9jc87s0BdXUNTmjvhJ1MjHsjZbknIg0Ct
	G8+6rpK8sN6d3GtpfvphQPZBbLnLDyasNClZnY/RrEJSAtUSJVVFmHprYz4VM5t+CC+t6FjATL8
	Xfs6MPpYMkmRaVfkwf4nb8oUS3d2hb4nPB3ej4iKL5afO31D4g0ET5CAYVumxHHliV/gXgY6nPL
	6+W6Bq0ggMuGBr1wr4o3np2UsFv+8T7NEzWT78PJRgzCNklCFS6tNKVi44fZqniWOSq0y9QTluK
	gEkMVGzRkrjsc39UtdLd3Zjqm2P9vvfHr5RSsaR2AU7wcr7XOcwEnVKxFXmc5tIW4IQlCgFyGyS
	at+Eo56VfrMMiCLf3z4aI=
X-Received: by 2002:a17:90b:3c0e:b0:366:4f8a:9847 with SMTP id 98e67ed59e1d1-368f3e681bemr6821441a91.17.1778746533328;
        Thu, 14 May 2026 01:15:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0e:b0:366:4f8a:9847 with SMTP id 98e67ed59e1d1-368f3e681bemr6821390a91.17.1778746532608;
        Thu, 14 May 2026 01:15:32 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb100706sm1613791a12.17.2026.05.14.01.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 01:15:32 -0700 (PDT)
Message-ID: <c2523379-ab12-47e1-a0d0-ef6073deaf11@oss.qualcomm.com>
Date: Thu, 14 May 2026 16:15:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        stable@vger.kernel.org
References: <20260507070808.367442-1-jtornosm@redhat.com>
 <20260514061841.9517-1-jtornosm@redhat.com>
 <95bff017-3554-425f-ad8e-767f9cbe1277@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <95bff017-3554-425f-ad8e-767f9cbe1277@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sWkvWJYc2pvMtbEd8KOy4PILZBtsOc73
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a0584a6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=kMbTGvAQcfItPFarCmoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: sWkvWJYc2pvMtbEd8KOy4PILZBtsOc73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA4MCBTYWx0ZWRfX8MEiXhHMYCFh
 ai1WfBOSy8JW6tXVEmxwlUYMQHmkx9Y4iueYuvFCW9qgBmaiz75zjqndJzT9+s0RIYv08bNfVz8
 3I8bqS9ZBTYlSZAxygGfP0o7t71f6WGWixjT/LtwlP5SkVqu08a48dQmThAw32XgHDJ2Putvr4O
 wMvbix13xi99xuabDbo13ThUD6uLhTmgZTrGlhodY3IWR/tVDAFcsJeAOQwUMdklxZ0wAp5eMnj
 PeB8pXjRkYAF/eII0QFjJtahuQfV28pRg5b5ZcmmVOsThwVwUWyTF64pJ4sUA5tLFgLD5Mdk5RB
 h9WRZ0kNImeEnNs2pFwS8/nQU+7DOktyvMfPV6LTCxvA6LxNBV4nJjSmTARfCiGonKTtRWWKC4r
 kfBlyCzEiE5w8WDnzvzEAtFhgyLVTwGHgGhVM47UENJmD6YST0PjLwMMYDADnoCdVS+qxD0IoXL
 EOYb2jiiAwXDwzUyTDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_011535_893752_DEE51199 
X-CRM114-Status: GOOD (  20.08  )
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



On 5/14/2026 2:55 PM, Rameshkumar Sundaram wrote:
> On 5/14/2026 11:48 AM, Jose Ignacio Tornos Martinez wrote:
>> Hello Rameshkumar,
>>
>>> I agree that setting tx_status to NULL makes ath11k_dp_free() more
>>> defensive, and it matches the ath12k fix.
>> Ok, I agree too.
>>
>>> However, i am still wondering how the second ath11k_dp_free() is reached
>>> if ATH11K_FLAG_QMI_FAIL is set.
>>>
>>> In ath11k_pci_remove(), when ATH11K_FLAG_QMI_FAIL is set, we take the
>>> qmi_fail path and skip ath11k_core_deinit(). So the normal remove path:
>>>
>>>      ath11k_pci_remove()
>>>        ath11k_core_deinit()
>>>          ath11k_core_soc_destroy()
>>>            ath11k_dp_free()
>>>
>>> should not run.
>>>
>>> So if the double free is still reproducible with QMI_FAIL set (with the
>>> change i proposed), either the flag is not actually set in this failure
>>> case, or there is another path calling ath11k_dp_free() ?
>> Let me try to clarify the issue more.
>> There are two error actions:
>> - First the previous error. I reproduce the situation as I commented: running
>> in a VM the default upstream kernel (with this card using PCI passthrough),
>> since this is always failing. Let me show the logs in this situation:
>> [   15.906564] ath11k_pci 0000:07:00.0: BAR 0 [mem 0xfdc00000-0xfddfffff 64bit]: assigned
>> [   15.926520] ath11k_pci 0000:07:00.0: MSI vectors: 32
>> [   15.928572] ath11k_pci 0000:07:00.0: wcn6855 hw2.0
>> [   16.984192] ath11k_pci 0000:07:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id
>> 0x400c0200
>> [   16.984351] ath11k_pci 0000:07:00.0: fw_version 0x11088c35 fw_build_timestamp
>> 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
>> [   18.186971] ath11k_pci 0000:07:00.0: failed to receive control response completion,
>> polling..
>> [   19.211036] ath11k_pci 0000:07:00.0: Service connect timeout
>> [   19.211815] ath11k_pci 0000:07:00.0: failed to connect to HTT: -110
>> [   19.214181] ath11k_pci 0000:07:00.0: failed to start core: -110
>> [   19.531989] ath11k_pci 0000:07:00.0: firmware crashed: MHI_CB_EE_RDDM
>> [   19.532930] ath11k_pci 0000:07:00.0: ignore reset dev flags 0xc000
>> [   29.259157] ath11k_pci 0000:07:00.0: failed to wait wlan mode request (mode 4): -110
>> [   29.259229] ath11k_pci 0000:07:00.0: qmi failed to send wlan mode off: -110
>> - Second after this, I commanded the unbinded (ath11_pci) and I get the
>> warning. Let extend here the stack trace:
>> [   24.238198]  ? free_large_kmalloc+0x57/0x90
>> [   24.238199]  ? report_bug+0x16b/0x180
>> [   24.238210]  ? handle_bug+0x3c/0x70
>> [   24.238218]  ? exc_invalid_op+0x14/0x70
>> [   24.238218]  ? asm_exc_invalid_op+0x16/0x20
>> [   24.238224]  ? free_large_kmalloc+0x57/0x90
>> [   24.238227]  ath11k_dp_free+0x99/0xb0 [ath11k]
>> [   24.238275]  ath11k_core_deinit+0x12b/0x1a0 [ath11k]
>> [   24.238287]  ath11k_pci_remove+0x7b/0x120 [ath11k_pci]
>> [   24.238294]  pci_device_remove+0x3e/0xb0
>> [   24.238304]  device_release_driver_internal+0x193/0x200
>> [   24.238315]  unbind_store+0x9d/0xb0
>> [   24.238320]  kernfs_fop_write_iter+0x13a/0x1d0
>> [   24.238330]  vfs_write+0x32e/0x470
>> [   24.238335]  ksys_write+0x5f/0xe0
>> [   24.238336]  do_syscall_64+0x5f/0xe0
>> Very easy to reproduce.
>>
> 
> 
> Thanks much for the logs, that makes sense. The timestamps explain why my earlier
> reasoning did not match the trace: unbind reaches ath11k_pci_remove() before
> ATH11K_FLAG_QMI_FAIL is set by the QMI event worker as it is held up on wlan mode off qmi

how could QMI worker set this flag? the first failure happens in
ath12k_core_qmi_firmware_ready() and upon this failure the QMI worker just break out
without setting any flag, no?

> transaction, so remove still takes the normal ath11k_core_deinit() path.
> 
> 
> -- 
> Ramesh
> 


