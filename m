Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60698CD4F3C
	for <ath11k@archiver.kernel.org>; Fri, 15 May 2026 02:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GG4jPt4PsiOv78ZDySQX+4PT9DNiaDGHP2Yb7bOsOys=; b=NfzvH2aIepIVnQ1FMA5NbWEInC
	lOqAbECgRkhbk78QRyAEdoRgxYSedZrSLNIj57u14g01Im3PFm/vOUw0ToWq15yXT7au6h2+8eOyl
	lR19iDwby0TZmYtsE3t7+0GH4AocJe5BWr5MEBiReLtWa3cTlCSTKvr5iaW8ssMnBCEtobPJ2cySK
	s/4OCWkw7Rh6gU+/WcYR5ZdknsjH8vz1kxWVCjsuAtzZWcFZCjAu4tKtDRem/rHQJtfHhhsS5Nxlj
	GJ19/hIE2/Bb7UDy1FQn3FKYiBXmUrGEByCHpXL7Sjevf+/vqMqPsZYZc0d8lyI1L/PiRaL1YE3wk
	DpjzEgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiHG-0000000776j-26ce;
	Fri, 15 May 2026 02:27:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiHE-00000007768-0Gzh
	for ath11k@lists.infradead.org;
	Fri, 15 May 2026 02:27:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpjlt718701
	for <ath11k@lists.infradead.org>; Fri, 15 May 2026 02:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GG4jPt4PsiOv78ZDySQX+4PT9DNiaDGHP2Yb7bOsOys=; b=HVpdbuqq6AIg0+Cc
	DdYjfeJU5dVxaT1HZfXj+0xOOuRgc2blLDzJNnE7u0XVk/RQuaHS7xdBoqJTf1fY
	DTNL4n6bCIjaWpeP12UmoI9Ik44nf+JhXkRGp5MpoPHfYlXkFQyOsiuKGFUCnOC/
	seQroQ68j4hP9+Ze4idscchpY9iIJt5Zi4O9JP0mS4et9EPj5Er4x0kK+dMksAZd
	9xXR22Zp8ZKG2YdjVT8xEnruzKvO0GpnakQUL7iswRaNkIhAGApfvC+7iX49a4js
	YAYG9YrCKUvFcU/oA7K45eSdM1UJI0byXliZC/qTsJ6Ch5s9rq59AGHhED5iDYd4
	da2rZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1x159j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 15 May 2026 02:27:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso92707755ad.3
        for <ath11k@lists.infradead.org>; Thu, 14 May 2026 19:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778812066; x=1779416866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GG4jPt4PsiOv78ZDySQX+4PT9DNiaDGHP2Yb7bOsOys=;
        b=QJ2GwEw/0/H1Fef+VqSwhjIVOOPaI37fwb17leEef1ITvRglCIDtl+wc8MMup3x0B6
         Vj4VjjddEE4ZgN0xWqU4ZUTWmkESd/bK65vrjygTCgiMPF3WsegCOdzrYwpC3HDH02PQ
         PYutyMJeGm+OFvdVZ/Pb02zwrknhvN4q3vPOMROqsTfT14ddSKGt9qZx3/VS7FJ8LmGp
         1AViGuBWVIen6X1vTGZ8kaKP3S6CLSxVULbyYE26J5kTBKZG6VnuwU1Lz0gJncctS+iZ
         G2BBxcUEjTG+i5eUOIAUHg0fTlXPo2HkTk5VOu99kTgtd5V3Rg3YbrJaEm4N4EdCWbye
         68iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778812066; x=1779416866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GG4jPt4PsiOv78ZDySQX+4PT9DNiaDGHP2Yb7bOsOys=;
        b=mSV/pinh8iOXVHI26z7YsOe8fW4wYbgr3U6bbznYlG1fjYZuWmOnzwD7JZ/KNlkzNG
         H2gbDXDWZ8XKLcfEGLK9I0PXQnqO1HNG49uySLqNrbWWZz18FigjkLZ/EUTnVcU+EJlp
         P8s2URQJsFwlwujUDCHPm0iBPbzuO7ArFGpXHQ5YLOvzsfn+vlHUUKBiad4atEWUiQLn
         el4bAweAIQsVCINsn+tgE1xsot1XMQr9YD+VmxgwJgl1e7fHaRP6ndlzPr36on8cIkv1
         DvOx6mf5wlYBKefy5ZWHIgLIVJ+ZjltGUC8GIu0p5EnnIhtjuZqT55XdC/jiaCs89pFV
         UenA==
X-Gm-Message-State: AOJu0YxYLnO0H4Y1u3cDW48NM25Fnh3/Ek3mX9Ve7COdjnsrHKGJEpcY
	d5CJQlwzru8Dt7I/oYVl4QfqeVO9X1mJEJh7junLCT7r1hdXGV0zIU3tzLH9PJwTH7OBZ7yPDZE
	TWccMAFl3PJ82CjJ8UljjJweDqO4LsIXAjhWnV6TVm4KNNqcjviDgInb4SuU6redh
X-Gm-Gg: Acq92OEct8j00EUGbzBScoxxnr1kJrAQj0s3yOmEM0hZnGgxKbW5ysDunTJZW4kVKrW
	PPUE09d+I5p/jRe+zCn3SI+NB5WmfKGKTnbkHp7M420awpEZNYC3Ud6M2UlQPgmGEbRqHvHPZ/T
	Rkhlh7XL362qODLAZlpew+3fZqNaCx1ZlaRrIZQVMeTbkuZ2dEImPqOqD8aVS+DPn/gIDC3pg8e
	xQPD5AZLZZw2yl1Jle84n2n6Z5bBU89YQIlX8W7SrUy/x7BYRdHHew4GSM7Eug6GuQ0EdoLI4yr
	WmofvGWIagQpH6ISUUx3FAcvxkt9zJzf2CFHJMvHiyi2D4xQj6X79H3Q5SfGoRB1PT8h0b39+H8
	KcLkBTasBJiPFuOieMAJDSkpa+KqfXFc1nmldp0iJsqO/VYHj7eJDcRUQOFQdIutr0+fK
X-Received: by 2002:a17:903:240c:b0:2bd:2439:25e9 with SMTP id d9443c01a7336-2bd7e9e263emr21145115ad.40.1778812066418;
        Thu, 14 May 2026 19:27:46 -0700 (PDT)
X-Received: by 2002:a17:903:240c:b0:2bd:2439:25e9 with SMTP id d9443c01a7336-2bd7e9e263emr21144885ad.40.1778812065866;
        Thu, 14 May 2026 19:27:45 -0700 (PDT)
Received: from [192.168.58.30] ([152.57.206.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe44sm41884845ad.11.2026.05.14.19.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 19:27:45 -0700 (PDT)
Message-ID: <fdff6264-9c35-4c77-bab2-6db9125d77af@oss.qualcomm.com>
Date: Fri, 15 May 2026 07:57:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        stable@vger.kernel.org
References: <20260507070808.367442-1-jtornosm@redhat.com>
 <20260514061841.9517-1-jtornosm@redhat.com>
 <95bff017-3554-425f-ad8e-767f9cbe1277@oss.qualcomm.com>
 <c2523379-ab12-47e1-a0d0-ef6073deaf11@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <c2523379-ab12-47e1-a0d0-ef6073deaf11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAyMiBTYWx0ZWRfX2gxmtAazQJS6
 bWqZCU4PRRIzsM0OkvBx1Kxd/bhwY+3D4kayYuuH2ECW13Hrv7gb6416slYD0D44EL6jvO9GX6Z
 +ZJwZZmpvdZl+j8v8F2aYZnyD62Jz3THBrPn40TkKMkQZRofgXsygrOy4jNzRyAhSxqM0JJJxWY
 INzAOrWJ16BBGbQop4jGgZCajPXmLtnnLvAUJ8OAcfRKQuQQguhiIk86s6DXyP/xT03qZmq9qvP
 OhJSOVnSwha0n8xmy5YlWkmUMdKrngcZ6kdc9vqVOmYih2tHVbRpk2Y54earK2kLhBPeyD4Lpgd
 a2R9SKW3+E/2XOHSzVn73zsuQ5IbLh+Wl1ZBVy+9xzJhS+T/aG2rFBpj86WV38xSc+uZT6I13om
 z259sJ6g8hah/lRQ2herqz1kwcZm3X0HnUm2TSprIiGybSD+BbODsufyLOLtkkHjR40ByfZLK0/
 H2RKXjAkiSMw3lnOfdQ==
X-Proofpoint-GUID: w7cbn-iwdCNJ04kiTSBK_L79jkgPuG5C
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a0684a3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=YxPPAu78v9FaI4eag4rAcQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=eGHVyj3czf8DJk7V1mEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: w7cbn-iwdCNJ04kiTSBK_L79jkgPuG5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_192748_109134_82833F80 
X-CRM114-Status: GOOD (  17.32  )
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

On 5/14/2026 1:45 PM, Baochen Qiang wrote:
> 
> 
> On 5/14/2026 2:55 PM, Rameshkumar Sundaram wrote:
>> On 5/14/2026 11:48 AM, Jose Ignacio Tornos Martinez wrote:
>>> Hello Rameshkumar,
>>>
>>>> I agree that setting tx_status to NULL makes ath11k_dp_free() more
>>>> defensive, and it matches the ath12k fix.
>>> Ok, I agree too.
>>>
>>>> However, i am still wondering how the second ath11k_dp_free() is reached
>>>> if ATH11K_FLAG_QMI_FAIL is set.
>>>>
>>>> In ath11k_pci_remove(), when ATH11K_FLAG_QMI_FAIL is set, we take the
>>>> qmi_fail path and skip ath11k_core_deinit(). So the normal remove path:
>>>>
>>>>       ath11k_pci_remove()
>>>>         ath11k_core_deinit()
>>>>           ath11k_core_soc_destroy()
>>>>             ath11k_dp_free()
>>>>
>>>> should not run.
>>>>
>>>> So if the double free is still reproducible with QMI_FAIL set (with the
>>>> change i proposed), either the flag is not actually set in this failure
>>>> case, or there is another path calling ath11k_dp_free() ?
>>> Let me try to clarify the issue more.
>>> There are two error actions:
>>> - First the previous error. I reproduce the situation as I commented: running
>>> in a VM the default upstream kernel (with this card using PCI passthrough),
>>> since this is always failing. Let me show the logs in this situation:
>>> [   15.906564] ath11k_pci 0000:07:00.0: BAR 0 [mem 0xfdc00000-0xfddfffff 64bit]: assigned
>>> [   15.926520] ath11k_pci 0000:07:00.0: MSI vectors: 32
>>> [   15.928572] ath11k_pci 0000:07:00.0: wcn6855 hw2.0
>>> [   16.984192] ath11k_pci 0000:07:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id
>>> 0x400c0200
>>> [   16.984351] ath11k_pci 0000:07:00.0: fw_version 0x11088c35 fw_build_timestamp
>>> 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
>>> [   18.186971] ath11k_pci 0000:07:00.0: failed to receive control response completion,
>>> polling..
>>> [   19.211036] ath11k_pci 0000:07:00.0: Service connect timeout
>>> [   19.211815] ath11k_pci 0000:07:00.0: failed to connect to HTT: -110
>>> [   19.214181] ath11k_pci 0000:07:00.0: failed to start core: -110
>>> [   19.531989] ath11k_pci 0000:07:00.0: firmware crashed: MHI_CB_EE_RDDM
>>> [   19.532930] ath11k_pci 0000:07:00.0: ignore reset dev flags 0xc000
>>> [   29.259157] ath11k_pci 0000:07:00.0: failed to wait wlan mode request (mode 4): -110
>>> [   29.259229] ath11k_pci 0000:07:00.0: qmi failed to send wlan mode off: -110
>>> - Second after this, I commanded the unbinded (ath11_pci) and I get the
>>> warning. Let extend here the stack trace:
>>> [   24.238198]  ? free_large_kmalloc+0x57/0x90
>>> [   24.238199]  ? report_bug+0x16b/0x180
>>> [   24.238210]  ? handle_bug+0x3c/0x70
>>> [   24.238218]  ? exc_invalid_op+0x14/0x70
>>> [   24.238218]  ? asm_exc_invalid_op+0x16/0x20
>>> [   24.238224]  ? free_large_kmalloc+0x57/0x90
>>> [   24.238227]  ath11k_dp_free+0x99/0xb0 [ath11k]
>>> [   24.238275]  ath11k_core_deinit+0x12b/0x1a0 [ath11k]
>>> [   24.238287]  ath11k_pci_remove+0x7b/0x120 [ath11k_pci]
>>> [   24.238294]  pci_device_remove+0x3e/0xb0
>>> [   24.238304]  device_release_driver_internal+0x193/0x200
>>> [   24.238315]  unbind_store+0x9d/0xb0
>>> [   24.238320]  kernfs_fop_write_iter+0x13a/0x1d0
>>> [   24.238330]  vfs_write+0x32e/0x470
>>> [   24.238335]  ksys_write+0x5f/0xe0
>>> [   24.238336]  do_syscall_64+0x5f/0xe0
>>> Very easy to reproduce.
>>>
>>
>>
>> Thanks much for the logs, that makes sense. The timestamps explain why my earlier
>> reasoning did not match the trace: unbind reaches ath11k_pci_remove() before
>> ATH11K_FLAG_QMI_FAIL is set by the QMI event worker as it is held up on wlan mode off qmi
> 
> how could QMI worker set this flag? the first failure happens in
> ath12k_core_qmi_firmware_ready() and upon this failure the QMI worker just break out
> without setting any flag, no?
> 


you mean ath1*1*k_core_qmi_firmware_ready() ?. Yes in ToT it breaks out 
without setting any flags, so I proposed to set that on failure case 
ATH11K_QMI_EVENT_FW_READY: (similar to case 
ATH11K_QMI_EVENT_FW_INIT_DONE:) in this mail thread.


--
Ramesh

