Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304A3CA0ED1
	for <ath11k@archiver.kernel.org>; Tue, 12 Aug 2025 02:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gut/ft3aHoInU2A8/wuAvlRFv2LhLxFrsO/zFlI9P/8=; b=NMwJs3v/KF/7tfa4WISv9MzJng
	AjVO8/QnkV3XKHwGDPjOvm16HDACAKbp/GcK5BW3EWCO1xsDnhwP06tsyA/iFxT4WJoLrzwx2/rZS
	D9OTuSawbcRE+OH6mT62ucDfgPJLtNsKqqv/aMJQPia4lLUuNmqV2fReJ/I0HJEnXj9V6lwthXFAc
	sWW1hE9o2Cirn+sDuYKBVat3LdfkOgzn+sYAjxfJ7GkeOJjxm80lLbMov1p9357xFOexNuihFF9vH
	Q/+8aoR0gK/Zr9L645NUkfQspMnt7CcPAU8LO3XUq3xOGAMRqZMNtuCBL1AzC9PPvTNAYSZ7o3BGT
	QBDc0eMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uledL-00000009bW2-2g2T;
	Tue, 12 Aug 2025 02:21:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uledI-00000009bVd-2uGg
	for ath11k@lists.infradead.org;
	Tue, 12 Aug 2025 02:21:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFXmjX019164
	for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 02:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gut/ft3aHoInU2A8/wuAvlRFv2LhLxFrsO/zFlI9P/8=; b=iLw/ecjl3rkE0QEz
	gGpS17Ig0f+wQ/kgbQkdH3kg/JG7vlwW56hE12Z5YtFvTiOY05rTN6gl+W/ubaGy
	uWTr8iBazTVFmBNHTgVhT2GZNpe6JHE8WIYifVSuzdh7eR8x/h+U+wsa7PsMcT3n
	kjzH+3M45NnjM5GQFPNzuRlBDn8kxns68wq6l1hVTV7smviGyLUG5VHipaEdfbOH
	SC4eLSrIyEUnkBRrDP1epk8pCvOSD0tLn6d92tYB89I5lKlysFwnkbRCcV4cAuF0
	E5M+QnVCD8CbE/hsrxPgdArfv3KLHn6OyZDb1ERym3TL62kct8CAEleyM9YQDUj5
	a0akfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduxeta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 02:20:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24004ac2ecdso79852805ad.0
        for <ath11k@lists.infradead.org>; Mon, 11 Aug 2025 19:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754965258; x=1755570058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gut/ft3aHoInU2A8/wuAvlRFv2LhLxFrsO/zFlI9P/8=;
        b=YdTJWjSUPR2mDAa5hTbhnDKfikyip+HDVfuceW1AANJuxiDKVf/58J/Qr1rgnIpHMQ
         n2XC5So9K2dZaOL7XJQ8Xqiz0QbOLDSspbttERgyG870B89pJKpKtGsFpujRSwZCkbEe
         2YYGtURRe4uKPQpSjAXVJnlUY/cXVXNF5MLsqjVv2JxGDSCYCRYgUS0IshXpSG+SJxI4
         YvHZ/Lo+xcRghKVHOftOD/XXp1WCNkPcURDY7bWRlo/PnrpZOlGsiIxnlHct8MRkNcMf
         NJwJwmayhVNqYciAav57VJ9dYaSmWksVIhleLjbOfivAVIoP0FYUq8sHS5WMtI/KhPaT
         Shzw==
X-Forwarded-Encrypted: i=1; AJvYcCXSgctq9YdVisdlQKyfSXoOKaoSAJw96/Z8M1ngWxnitO1QKsp8Fe0q6/ikH677uGrUqn4zGXM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+2evnRt6ufcQrTFmjKpVbxP0z/slycBURnfc+AMl31mFJI528
	wGxnWdtFyLGaCfd0GI30ax2uUm7xP4FZPU9pMaWTROWVpuA46XouJGhVyg1g6LYDv92NRE7VNue
	8SROcSlHA1aiY9b1HUe4xKPK5y7wD2t4gPycTdG4vGMMjpQ0TyAC8cV30JfnOt4j17ezwsPfP
X-Gm-Gg: ASbGncvz6FDTLsJr5PG5Q/XpCndONWABU93HV+X6QxSzohjhyH9uNJ2A8TZbeHh5QXI
	3Cb+lpXLV2IgPC9Nt+l0sdpeJWF/DzL+DhDn2wLs2fcX39VSRFYxoLT8zyXfC5Sj3a3J9rSF3ku
	whLgE2tVJpBNgFk5QTEMr1IxeMDMoPaGFj+loQXpoRRmeJ4iKtWN7O6CrbF/N+vJxayrE2FExqz
	9Vn8UONNFNL8PdaiP4ammErreCuX7VZOx1NRd8seg49dx5bGXOuE4zjHLJig6N5h609qrZHiNDc
	Ohop9RxkytCjx1PRbS5PIoxSuPsGDnk7uZxYjHEkxZNXfduCxzx12e15q6fkAfQPfbgrar6Po8M
	olQgafyiMzykF2ybmhraEE4MDGC0svs4=
X-Received: by 2002:a17:902:ccc2:b0:240:99d8:84 with SMTP id d9443c01a7336-242fc38ac30mr25762105ad.52.1754965257888;
        Mon, 11 Aug 2025 19:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0aDJamyaJIK5FPFXGhNqHuMQ1A/VFUVu25yg8dP+RbRHNNJ1SRkyaxpgjaSSwh1W8u/fOjg==
X-Received: by 2002:a17:902:ccc2:b0:240:99d8:84 with SMTP id d9443c01a7336-242fc38ac30mr25761625ad.52.1754965257265;
        Mon, 11 Aug 2025 19:20:57 -0700 (PDT)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6713sm284702975ad.12.2025.08.11.19.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 19:20:56 -0700 (PDT)
Message-ID: <0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 10:20:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
To: Balsam Chihi <balsam.chihi@moment.tech>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        jjohnson@kernel.org
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
 <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com>
 <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
 <ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com>
 <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689aa50b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=RBAklUD_ctNnKngjBk8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: IZwNNJDtvsdlzgq2VqZNDk1y0IyiQQpw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX9+q6JTBWuax6
 MKaFV67ABj8g2sNvVVbFxXVrlAH1Y3sVLHEh2a6qSqu67+ONsk3XY7S9AVEYwEVeTATLTdmK3pi
 sVN/frfZNy9DYdi+sijP/UYblo4rpUvRFyARX/Vw6TgGCHnHwY2wJGignzl+5FgQXglcVayUF1V
 zCDKuH9/e+FxAONWX2nTIMWG2mJOtvMzDtUVGdRCpJJ+iHVqfv/WOdwKBOA9xdRGb8Kci37wlAY
 XQ3YATdrlM2A2/30lULKMamn9YtpvPFCH5Yk6Frt7eBfqfq6PWtJbD82ClMbmKCURkoncRL4cKB
 e9N5ZO1T6i9jkIhuX725ujOQDkzsjsXLGmu51P7x1hfQ+qe9eCCvvWvuAdvF+A5QKk1G5wvRha0
 BVdenjds
X-Proofpoint-GUID: IZwNNJDtvsdlzgq2VqZNDk1y0IyiQQpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_192100_874030_4EC469E8 
X-CRM114-Status: GOOD (  34.21  )
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



On 8/11/2025 8:26 PM, Balsam Chihi wrote:
> On Mon, Aug 11, 2025 at 1:00 PM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 8/11/2025 5:08 PM, Balsam Chihi wrote:
>>> On Fri, Jul 25, 2025 at 5:25 AM Baochen Qiang
>>> <baochen.qiang@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 6/12/2025 12:40 AM, balsam.chihi@moment.tech wrote:
>>>>> From: Balsam CHIHI <balsam.chihi@moment.tech>
>>>>>
>>>
>>> Hello, sorry for the delay. I was OoO.
>>>
>>>>> During system reboot or module removal (rmmod), a crash was observed
>>>>> due to a synchronous external abort caused by invalid register access
>>>>> in ath11k_pci_clear_dbg_registers(). This happens when the device is
>>>>> already powered off and the driver attempts to read debug registers.
>>>>
>>>> What does 'powered off' mean exactly here? is WLAN powered by an internal/external supply
>>>> that will be removed during rmmod/reboot?
>>>
>>> The "powered off" means that the wlan card is rmmod or reboot.
>>> It is not powered by external supply.
>>
>> OK.
>>
>>>
>>>>
>>>>>
>>>>> The crash log shows:
>>>>> root@OpenWrt:~# reboot
>>>>> [  343.663492] Internal error: synchronous external abort:
>>>>> 0000000096000210 [#1] SMP
>>>>> [  343.670992] Modules linked in: [...]
>>>>> [  343.842432] CPU: 7 PID: 9435 Comm: procd Tainted: G O 6.6.86 #0
>>>>> [  343.849746] Hardware name: LS1088A
>>>>> [  343.856969] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>> [  343.863933] pc : ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
>>>>
>>>> I don't see any relationship between ath11k_pci_clear_dbg_registers() and this PC pointer.
>>>> So how did you locate the problematic register access then?
>>>
>>> I tyied to look for the problem based the PC pointer but I was not
>>> abled to find it.
>>> So, I added prints in ath11k driver to find out where it stucks,
>>> classical debug method.
>>
>> Yeah, classical and always work.
>>
>>> Then I found out that any "ath11k_pcic_read32()" call fails on rmmod
>>> ath11k_pci or reboot,
>>
>> I worry PCIe link is not stable on your platform when rmmod/reboot. Can you try with ASPM
>> disabled?
> 
> ASPM is indeed disabled in the Kernel config.
> I will also try with your patch and get back to you with the results.
> And in the meanwhile, I would like to let you know the following information :
> Other PCIe devices are working well even with ASPM enabled in the same slot,
> and the issue is present in all PCIe slots.

Thanks, the info helps.

> I have many board variants of the same platform that showed the same output.
> Maybe it is only related to the Qualcomm QCN9074 WiFi6E chipset?

I think so.

> I tried 2 wifi cards from two manufacturers of the same wifi chip and
> the issue is the same.

Do you have a WCN6855 WiFi chip to try?

> Is it related to the SoC Freescale Layerscape LS1088A?

I never heard of such issues before. For now I am suspecting that your SoC PCIe RC behaves
differently from other platforms, like X86.
 > It seems like the kernel is accessing a freed resource or no longer
> existing memory address because the wifi card is turned off.

WiFi chip might enter a state where access to some specific registers could not be
completed, hence the 'abort' error.

> 
> 
>>
>> --- a/drivers/net/wireless/ath/ath11k/pci.c
>> +++ b/drivers/net/wireless/ath/ath11k/pci.c
>> @@ -605,11 +605,13 @@ static void ath11k_pci_aspm_disable(struct ath11k_pci *ab_pci)
>>
>>  static void ath11k_pci_aspm_restore(struct ath11k_pci *ab_pci)
>>  {
>> +#if 0
>>         if (test_and_clear_bit(ATH11K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>                 pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>                                                    PCI_EXP_LNKCTL_ASPMC,
>>                                                    ab_pci->link_ctl &
>>                                                    PCI_EXP_LNKCTL_ASPMC);
>> +#endif
>>  }
>>
>>  #ifdef CONFIG_DEV_COREDUMP
>>

Anyway, please try with above change. In addition you can manually confirm ASPM status in
LinkCtrl register with lspci tool, on my machine it is like:

$ sudo lspci -s 02:00.0 -vv
02:00.0 Network controller: Qualcomm Device 1107 (rev 01)
        [...]
        Capabilities: [70] Express (v2) Endpoint, MSI 00
                [...]
                LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                [...]


>>
>>> but they work fine when insmod/boot ath11k_pci.
>>>
>>>>
>>>>> [  343.870125] lr : ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
>>>>> [...]
>>>>> [  343.950800] Call trace:
>>>>> [  343.953241]  ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
>>>>> [  343.959080]  ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
>>>>> [  343.964671]  ath11k_pcic_read32+0x30/0xb4 [ath11k]
>>>>> [  343.969477]  ath11k_pci_get_msi_irq+0x528/0x1900 [ath11k_pci]
>>>>> [  343.975230]  ath11k_pci_get_msi_irq+0x1460/0x1900 [ath11k_pci]
>>>>> [  343.981068]  ath11k_pci_get_msi_irq+0x1750/0x1900 [ath11k_pci]
>>>>> [  343.986906]  pci_device_shutdown+0x34/0x44
>>>>> [  343.991004]  device_shutdown+0x160/0x268
>>>>> [  343.994928]  kernel_restart+0x40/0xc0
>>>>> [  343.998594]  __do_sys_reboot+0x104/0x23c
>>>>> [  344.002518]  __arm64_sys_reboot+0x24/0x30
>>>>> [  344.006529]  do_el0_svc+0x6c/0x100
>>>>> [  344.009931]  el0_svc+0x28/0x9c
>>>>> [  344.012986]  el0t_64_sync_handler+0x120/0x12c
>>>>> [  344.017344]  el0t_64_sync+0x178/0x17c
>>>>> [  344.021009] Code: f94e0a80 92404a73 91420273 8b130013 (b9400273)
>>>>> [  344.027102] ---[ end trace 0000000000000000 ]---
>>>>>
>>>>> This patch adds a `power_on` flag to conditionally skip debug register
>>>>> reads when the device is not powered, preventing invalid memory access.
>>>>
>>>> why is only 'read' concerned here?
>>>
>>> Good question, I can't explain why only the reading fails but not the writing.
>>>
>>>>
>>>> You are skipping several 'read' in this change, could you help narrow down which
>>>> individual read instance causes this?
>>>>
>>>
>>> All read calls fail on rmmod/reboot, when
>>> ath11k_pci_clear_dbg_registers() is called.
>>> But they all succeed when insmod/boot ath11k_pci.
>>>
>>>>>
>>>>> With this change, the system no longer crashes on reboot or rmmod,
>>>>> and the driver continues to function correctly when reloaded.
>>>>>
>>>>> Tested-on: QCN9074 hw2.0 PCIe on LS1088A
>>>>> Tested-on: OpenWrt 24.10.1
>>>>> Fixes: crash on reboot/rmmod due to invalid register access
>>>>> Signed-off-by: Balsam CHIHI <balsam.chihi@moment.tech>
>>>>> ---
>>>>>  drivers/net/wireless/ath/ath11k/pci.c | 36 ++++++++++++++++-----------
>>>>>  1 file changed, 21 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
>>>>> index 78444f8ea153..0c1b55957557 100644
>>>>> --- a/drivers/net/wireless/ath/ath11k/pci.c
>>>>> +++ b/drivers/net/wireless/ath/ath11k/pci.c
>>>>> @@ -203,16 +203,18 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
>>>>>               ath11k_warn(ab, "link down error during global reset\n");
>>>>>  }
>>>>>
>>>>> -static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
>>>>> +static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab, bool power_on)
>>>>>  {
>>>>> -     u32 val;
>>>>> +     if (power_on) {
>>>>> +             u32 val;
>>>>>
>>>>> -     /* read cookie */
>>>>> -     val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
>>>>> -     ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);
>>>>> +             /* read cookie */
>>>>> +             val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
>>>>> +             ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);
>>>>>
>>>>> -     val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
>>>>> -     ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
>>>>> +             val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
>>>>> +             ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
>>>>> +     }
>>>>>
>>>>>       /* TODO: exact time to sleep is uncertain */
>>>>>       mdelay(10);
>>>>> @@ -223,14 +225,18 @@ static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
>>>>>       ath11k_pcic_write32(ab, WLAON_WARM_SW_ENTRY, 0);
>>>>>       mdelay(10);
>>>>>
>>>>> -     val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
>>>>> -     ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
>>>>> +     if (power_on) {
>>>>> +             u32 val;
>>>>>
>>>>> -     /* A read clear register. clear the register to prevent
>>>>> -      * Q6 from entering wrong code path.
>>>>> -      */
>>>>> -     val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
>>>>> -     ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
>>>>> +             val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
>>>>> +             ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
>>>>> +
>>>>> +             /* A read clear register. clear the register to prevent
>>>>> +             * Q6 from entering wrong code path.
>>>>> +             */
>>>>> +             val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
>>>>> +             ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
>>>>> +     }
>>>>>  }
>>>>>
>>>>>  static int ath11k_pci_set_link_reg(struct ath11k_base *ab,
>>>>> @@ -368,7 +374,7 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
>>>>>       }
>>>>>
>>>>>       ath11k_mhi_clear_vector(ab);
>>>>> -     ath11k_pci_clear_dbg_registers(ab);
>>>>> +     ath11k_pci_clear_dbg_registers(ab, power_on);
>>>>>       ath11k_pci_soc_global_reset(ab);
>>>>>       ath11k_mhi_set_mhictrl_reset(ab);
>>>>>  }
>>>>
>>>
>>


