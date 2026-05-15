Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C127CCD343F
	for <ath11k@archiver.kernel.org>; Fri, 15 May 2026 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOLE131bcicG5PKOMByp2XiRYzJK1mHFyKZYnU5OtAY=; b=OEBs5gCMY6mQRwMB9ImndCYysn
	VoZ9jYguWRckmi3uQ68S43MyujsPMeWMVoNG+1YqdZY2fz60b2kg/qUgLDIWZYvzqIK4/fX1uVtQC
	5/k+RN72bzzhqDmk4j7M8vNVKAtaC6OD34yjUuYyP0bHnHdFn8/IP3GmN/+iD5c++na0lmZBZmukl
	+VfMnXz8C03cdQ/iDrwCu9fWOKRGKoLOaONv1z+kCiJlstW2Syon/LJOcRaTrZLaKlSWkvWxJ2v1f
	AanNYxah0Xz0PFqU+pAmeiBkXx/kzqv4Lzs/JgWBUwOO8fbRwyGyOMKDmgBolp8QWNF67indDXoHn
	xnJy8PVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmCw-00000007Wg9-3Ibb;
	Fri, 15 May 2026 06:39:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmCt-00000007WfP-36RJ
	for ath11k@lists.infradead.org;
	Fri, 15 May 2026 06:39:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4rcBa3197662
	for <ath11k@lists.infradead.org>; Fri, 15 May 2026 06:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JOLE131bcicG5PKOMByp2XiRYzJK1mHFyKZYnU5OtAY=; b=fY5KILLGfYghV3uj
	0i2tmUarTPnr3T73M2VXyN4diQy1+JbyorwKkbd/zeTM7ATeA0QOQqFfLxGHiLiu
	Dqp1dc97RSV4D+Y5OICmgGlUWWxPA4uCJaAcvuHN3myRv7emKQ8okJaXWDaV7aYx
	0ARpUeNZetORBVN1UKFm1ZFkyAt1wH9YHF6uA0UEWICJ7Ra9ZoewOtUG+u4au+WJ
	KW4mYff3/zv2fjXM9XJhLp0qkRbnAd0E1cCRlGwyxUotDXzX/rOox+qmx65zbf0j
	W8gjw0WFWYlZPSUliHXd3SOwkLWRUauKv857/RGqNaaEUed/y5cSzgueVoUTnRau
	RXg5RQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1q9xe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 15 May 2026 06:39:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babbeff9e4so7255685ad.0
        for <ath11k@lists.infradead.org>; Thu, 14 May 2026 23:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778827173; x=1779431973; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOLE131bcicG5PKOMByp2XiRYzJK1mHFyKZYnU5OtAY=;
        b=UntQtaGx8oxQF4Tc9GOx+KdQCfclR4IOCxja+05LiqNB5VdOEmzfeQ1k+GAJdgIgQa
         UYcqzCQOXhIFHHPv0p0ZJgky1GoxWYjgGdq9RPOK6lnklUx+LpyGPGx8cRbn3u0b1O9B
         U5VV/ZeAMyVZo6TY0EOz0yaGvD2JDfoYKJ+YbZaY0n9eB5dOjzfDkjSYBYXUD0ZhlGw5
         g9w7fkiCzzaRXYWlf9BP1h38DyjWbmuDOlmLOZAYVlTXd8YjiVX1BKyTn2FvCSVC6Yrs
         GxNLbv+N4cu+ti5Y+SerSM3nPGg0shbtX8Ed/2+C9njDf68FKO4cuBof0Gg/EWBbX1Io
         CB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827173; x=1779431973;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOLE131bcicG5PKOMByp2XiRYzJK1mHFyKZYnU5OtAY=;
        b=mcoUSmuyK1ITctohT4U//7WkRjLHYSf4cSridkSrP1zfnWovd3TeMJMlKljFoz86ki
         D8VDZhqSO80Dr5Ek3tkdy8MSjxvsJMt28G7kBMR1WJ8VVZzDUpsGeSztu9IxKjyHlmSf
         +RBkX76wTp1dmEthb1AmTQHKhRRkwKVFbFQVtLszhnevxc/7uEzCKFwBt7I+ISX/XzGn
         iTn5G82kTxTT/2JoQt1Dz49RIic2NQusu39ngUTjnyKuesgO5DvyKac6zFTKPE1MEFlT
         D67SqqHcI3JaDUGNJPY+BnnV6xXV211Ki8y+QDTo6L+elv9S5okmNd7DYObpaXpxCAQC
         1C8w==
X-Gm-Message-State: AOJu0YzprWsA02CFXySIk+hiYi/fSEkWEFh8N2T91n7KPCmEvkUP2d3l
	I9K7bK+/siSawf/e05/is7wylITgl4F9vGLR1IZZlJbUX7mSTajh9gWj9WPgPhsp6b8yv0uW03u
	K5zDEp+OgdSZirgDbfULLvo7gKXm6w/PHa89cuZvJ1qh5zt6Igmkqh2TeCyHMhW5n
X-Gm-Gg: Acq92OHxRwkCG/hU+YCUdzpow6IoID6Vg6a7YEzhL0CARuRCHU4laG5RIIZDA+oNvfp
	hQ6gEN6QM8t5NFP/bWC8lAGgPgocjWFc9ZC20+Oj0Rrmvt3CBa0EomD0VKvivAtqzFN4DowPPaT
	qzPGTvg4dKHuJDr/ZOsjW2AHm8v+WaeiL7Gb01gabHRf3mkhEWJL8ogiH0kHTgUXmL5Xji1qHQt
	3agY5jVNlRPO/CyikEY9T6zPDHNcH8SoiAK1Nxg/mneaqmzd8vc0oEngrdkNjqCEsKxcUVD3obe
	48Xgy8SOHZeGcfRBt/vSCTM1DSNWIblajdg6xg9zz9ED9RpyKJ+unXQYu+LZcdHpC6iTrh4NEc6
	tTCMN2m2GuQHDOb2gY2Hy/1798a3pb+7Ad6/dJDtb2GN28vJwgokpgsvxNo/jnM6l4yum09bGSK
	gCdnre113co3Wb6TiNHA==
X-Received: by 2002:a17:903:1aef:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2bd526ce672mr66930485ad.2.1778827173104;
        Thu, 14 May 2026 23:39:33 -0700 (PDT)
X-Received: by 2002:a17:903:1aef:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2bd526ce672mr66930195ad.2.1778827172576;
        Thu, 14 May 2026 23:39:32 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd60275sm44600585ad.7.2026.05.14.23.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 23:39:32 -0700 (PDT)
Message-ID: <5bb180ea-d970-4cf0-8d01-620cbdb7be9e@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:39:28 +0800
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
 <c2523379-ab12-47e1-a0d0-ef6073deaf11@oss.qualcomm.com>
 <fdff6264-9c35-4c77-bab2-6db9125d77af@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fdff6264-9c35-4c77-bab2-6db9125d77af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WnPnzAUE4pww72KOjV1b3R1W-NkKjxwg
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06bfa6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=XMJksOS74nNapH2Mx7QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA2NCBTYWx0ZWRfXwPBWS/qkkfsY
 VzXH+GfkCIL13O7sJpVtaA4IXz6trQxiSIQXcq0jZFyfGODP15viL2oTUzajaslx3GzQedN2rkV
 Zx46EWEgHiKLyUIkf5v70NoLWdh3TOnkc8sipAPabVBdbQhntXqmbz9wsQfROrKDozJvAjCnsAy
 Of91/w398yVvfQORX7/x+BDAoWI7uUGqpkIVR4idZlRShJ3DyauW88+a+VrKuuGzRRWuwAKz984
 46jkyjbHWz1U060hxlKM9KQUKfzj+QgzZN/OqDx+80KzunDvQrv7i/zZm0B9I9fHkC+pgNSL5fc
 7rq9CkpjNUXP7Z15nNzndI7PD+jzy/5jRJYf69ycKjPiBLJZyYTIou4dVJaT+gOgNBrow/MlIJ9
 oC8WG/r4F1Lrtz/ks1n3KcAlv7+kDfcd4bYbqGdmN5ID2w1tJDtvqeGVeWZCwViiaVN3f1z6ouf
 DrL5KI1XEXIsiLVz26g==
X-Proofpoint-ORIG-GUID: WnPnzAUE4pww72KOjV1b3R1W-NkKjxwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_233935_896878_859147C7 
X-CRM114-Status: GOOD (  17.02  )
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



On 5/15/2026 10:27 AM, Rameshkumar Sundaram wrote:
> On 5/14/2026 1:45 PM, Baochen Qiang wrote:
>>
>>
>> On 5/14/2026 2:55 PM, Rameshkumar Sundaram wrote:
>>> On 5/14/2026 11:48 AM, Jose Ignacio Tornos Martinez wrote:
>>>> Hello Rameshkumar,
>>>>
>>>>> I agree that setting tx_status to NULL makes ath11k_dp_free() more
>>>>> defensive, and it matches the ath12k fix.
>>>> Ok, I agree too.
>>>>
>>>>> However, i am still wondering how the second ath11k_dp_free() is reached
>>>>> if ATH11K_FLAG_QMI_FAIL is set.
>>>>>
>>>>> In ath11k_pci_remove(), when ATH11K_FLAG_QMI_FAIL is set, we take the
>>>>> qmi_fail path and skip ath11k_core_deinit(). So the normal remove path:
>>>>>
>>>>>       ath11k_pci_remove()
>>>>>         ath11k_core_deinit()
>>>>>           ath11k_core_soc_destroy()
>>>>>             ath11k_dp_free()
>>>>>
>>>>> should not run.
>>>>>
>>>>> So if the double free is still reproducible with QMI_FAIL set (with the
>>>>> change i proposed), either the flag is not actually set in this failure
>>>>> case, or there is another path calling ath11k_dp_free() ?
>>>> Let me try to clarify the issue more.
>>>> There are two error actions:
>>>> - First the previous error. I reproduce the situation as I commented: running
>>>> in a VM the default upstream kernel (with this card using PCI passthrough),
>>>> since this is always failing. Let me show the logs in this situation:
>>>> [   15.906564] ath11k_pci 0000:07:00.0: BAR 0 [mem 0xfdc00000-0xfddfffff 64bit]: assigned
>>>> [   15.926520] ath11k_pci 0000:07:00.0: MSI vectors: 32
>>>> [   15.928572] ath11k_pci 0000:07:00.0: wcn6855 hw2.0
>>>> [   16.984192] ath11k_pci 0000:07:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id
>>>> 0x400c0200
>>>> [   16.984351] ath11k_pci 0000:07:00.0: fw_version 0x11088c35 fw_build_timestamp
>>>> 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
>>>> [   18.186971] ath11k_pci 0000:07:00.0: failed to receive control response completion,
>>>> polling..
>>>> [   19.211036] ath11k_pci 0000:07:00.0: Service connect timeout
>>>> [   19.211815] ath11k_pci 0000:07:00.0: failed to connect to HTT: -110
>>>> [   19.214181] ath11k_pci 0000:07:00.0: failed to start core: -110
>>>> [   19.531989] ath11k_pci 0000:07:00.0: firmware crashed: MHI_CB_EE_RDDM
>>>> [   19.532930] ath11k_pci 0000:07:00.0: ignore reset dev flags 0xc000
>>>> [   29.259157] ath11k_pci 0000:07:00.0: failed to wait wlan mode request (mode 4): -110
>>>> [   29.259229] ath11k_pci 0000:07:00.0: qmi failed to send wlan mode off: -110
>>>> - Second after this, I commanded the unbinded (ath11_pci) and I get the
>>>> warning. Let extend here the stack trace:
>>>> [   24.238198]  ? free_large_kmalloc+0x57/0x90
>>>> [   24.238199]  ? report_bug+0x16b/0x180
>>>> [   24.238210]  ? handle_bug+0x3c/0x70
>>>> [   24.238218]  ? exc_invalid_op+0x14/0x70
>>>> [   24.238218]  ? asm_exc_invalid_op+0x16/0x20
>>>> [   24.238224]  ? free_large_kmalloc+0x57/0x90
>>>> [   24.238227]  ath11k_dp_free+0x99/0xb0 [ath11k]
>>>> [   24.238275]  ath11k_core_deinit+0x12b/0x1a0 [ath11k]
>>>> [   24.238287]  ath11k_pci_remove+0x7b/0x120 [ath11k_pci]
>>>> [   24.238294]  pci_device_remove+0x3e/0xb0
>>>> [   24.238304]  device_release_driver_internal+0x193/0x200
>>>> [   24.238315]  unbind_store+0x9d/0xb0
>>>> [   24.238320]  kernfs_fop_write_iter+0x13a/0x1d0
>>>> [   24.238330]  vfs_write+0x32e/0x470
>>>> [   24.238335]  ksys_write+0x5f/0xe0
>>>> [   24.238336]  do_syscall_64+0x5f/0xe0
>>>> Very easy to reproduce.
>>>>
>>>
>>>
>>> Thanks much for the logs, that makes sense. The timestamps explain why my earlier
>>> reasoning did not match the trace: unbind reaches ath11k_pci_remove() before
>>> ATH11K_FLAG_QMI_FAIL is set by the QMI event worker as it is held up on wlan mode off qmi
>>
>> how could QMI worker set this flag? the first failure happens in
>> ath12k_core_qmi_firmware_ready() and upon this failure the QMI worker just break out
>> without setting any flag, no?
>>
> 
> 
> you mean ath1*1*k_core_qmi_firmware_ready() ?. Yes in ToT it breaks out without setting
> any flags, so I proposed to set that on failure case ATH11K_QMI_EVENT_FW_READY: (similar
> to case ATH11K_QMI_EVENT_FW_INIT_DONE:) in this mail thread.

Hmm, I mixed it with ath12k. You are right, for ATH11K_QMI_EVENT_FW_INIT_DONE, the
ATH11K_FLAG_QMI_FAIL is set upon failure.

> 
> 
> -- 
> Ramesh


