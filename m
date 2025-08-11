Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E593C87FD2
	for <ath11k@archiver.kernel.org>; Mon, 11 Aug 2025 11:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HS/ta4yBGkpVoS3ngifx4E5rBvLp+figUU3W3HlrwZ0=; b=uxPGzXEgBFUnawQW2qZFxNp7v4
	RPTTFvBQ4EhW3XW/N1gahVXe7AitlXwmSWjnKUqYm+lBuPW+PxnjNCYTGoALJNUIUlUoeAeiX8Klz
	eCwMgsh7O0W5Y2TApgajHPwFJzg0WM2CEJSrwLDfIi0rMqi4+vFUt1FiESfJgNnyQrcBKGLshJ7HZ
	lPjwu6UQDi+f9I9XSaxj1dmvQNEs1ebfXxplUao2Kg7Bl/ArST2gKGDtUeDnCcI7N+s71Np2WOnZi
	/OT/+X2DdDxe8eijmc/GnbRAK5NzeH1VM7qpVinxL5sdRT72GekpNqkVJ2sF8NOJnA0hZxgbEx4C0
	IF7RmRCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQcX-00000007V5N-3hmy;
	Mon, 11 Aug 2025 11:23:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQGE-00000007RXR-1e8m
	for ath11k@lists.infradead.org;
	Mon, 11 Aug 2025 11:00:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dBXc029232
	for <ath11k@lists.infradead.org>; Mon, 11 Aug 2025 11:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HS/ta4yBGkpVoS3ngifx4E5rBvLp+figUU3W3HlrwZ0=; b=kD5B9S0EjM4VQRHk
	ciGdsW+LVK1WruIeIYDRqPvMIEQpjfo7mWRNOdXXSTWK+2eRAmvDc20vZ7Jc2lzo
	QkJKn/CtzCIAx+3jFcegENAG9MCJtfefGBHh8LDVcqzwlWyHkfneOxfqbODNQg/d
	imY5aLCYg8N2N/quPkzCVMgLItHlB7Ji05cn8eFs4Cnfy03jbJFxjW8O48D9jebA
	ccsvKqAA7ZSHw9a7vujQ5ojwSOTS5DdlVIQeKv9FdSHiGJ7VUOgqUwlXmJZ8DqJ6
	wZUU847EDkI36/XFWrbKYyHkRnWHywBur+2pybExoJnBcHcM5LEdtTbz/t8kUfge
	0QmIbg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmc1xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 11 Aug 2025 11:00:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31366819969so5189459a91.0
        for <ath11k@lists.infradead.org>; Mon, 11 Aug 2025 04:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910013; x=1755514813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HS/ta4yBGkpVoS3ngifx4E5rBvLp+figUU3W3HlrwZ0=;
        b=iNcnG70zJcv03jwDQsHYZ5ENM2A9z9ndUX4/qva+ly6N/n7omA9a0oGd7LF55KrN7W
         T4BPvgH/W3YnTRUXvr/144SJ9VuyanPahTDGE+WCMxD+5GBMokWwu/HEnyiSd7lAnHc8
         xeMMSvVAsj5puDLhO7/TN1Twi/mS77NZRdR9i1Ao6r5zA298F5Ek5T/6UJHK2x1ZCZsv
         J1XZg0U1wg40u9ZLJC/NFEYSqpBVB+hWNlYV4SwJCwNuBqKh618UxT+zDAg1347E3DtB
         ngMiXUGeuPk8mbhotxFbuHCLYsDXOFmiVZrChno8uiO/I+myybe3uiO+RMr5je80gYaO
         k2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYUIdnUvavZBSVMS1IMv/miISjPUTp7y6yV483xOkOw+RLJ6yxl9RYhblvJH9rGLIwadVOBi4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXR17mn793WjnorQrIQQN4sZlraH4THgixSrzCCmvrXTUGd9/I
	WWEFkAOoPUUYejyJB8nlFphXyWo7rcO9To3aLUzRveFftI90N1L54VTIHNT4xyakegeLvc+DfKY
	JfQahXtlNxlqukPL5SIN/v+wl2QXbAZREzRDMQhjB7G7x57tW3mgvATkbMByi+4Pu
X-Gm-Gg: ASbGncun5GYzzfK5ucNjo3XvOmHnBOVM88B8mWAyWGlHF05mYPEKuK8NVngsorgHGAL
	2rVL8KVor7vqAg+CNjrP1DgDuZTVgxmEBLS3BGAH5tyatlQmSnD8cTCW/td2NQ7A0lmqo3KkpoZ
	BchnvhKByvdyVnbbWbLgl1CNgI9JVmvLVLl36Yj8wwpmCyc0MD6TndVWAn2VnCnyId949lDXK8M
	x4ZPvgitIfYXgB1iP6FPDSZ77xV13yQ3pCn9mNIpkR8mckaz5Qckf9hzUyXz1T4jCOzYt2IEsZU
	MrOYpzD4L2mLO6QnDMvh3IHTMtzVX2E1rfsWeGZgRkSEbql6RQb2HJNoRylkQJWHi/BUspPYP1Z
	mbVzf+nfh5RAbhA8Oo2zBClbmAfplu24=
X-Received: by 2002:a17:90b:3941:b0:31f:2fed:7867 with SMTP id 98e67ed59e1d1-32183e56240mr15994680a91.34.1754910011716;
        Mon, 11 Aug 2025 04:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsLCOX4Ei5OrlcZWraE/0NqWIq2ts/bbBOVsc0SwETdejjjh/qiCjX+YWrOY5C8hc/ZvW/Ig==
X-Received: by 2002:a17:90b:3941:b0:31f:2fed:7867 with SMTP id 98e67ed59e1d1-32183e56240mr15994561a91.34.1754910010413;
        Mon, 11 Aug 2025 04:00:10 -0700 (PDT)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32161282ab6sm14756303a91.26.2025.08.11.04.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:00:10 -0700 (PDT)
Message-ID: <ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 19:00:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
To: Balsam Chihi <balsam.chihi@moment.tech>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        jjohnson@kernel.org
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
 <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com>
 <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXwpFyiLyBKUy7
 zfxqcxgLrMebDEFyCHjbnnCzzydw9fG9htA3zapszPvl2/QMVsME7qm3DYIMpZlvmFTKPTvpmkp
 VSP4mPP0rD3CuRy56iA1newDhNmEnPE6fIodNPHQn9iq7YPCF9dCoU/2tk652v7IN645W08C8z1
 OdO0D3ERlRED9liAXBbBsyOKPCE/weAs2LujrzQK7L8Y05AQmTv1EU2lw26/UcHXbv7dpTeZ0T0
 pdyoGpv9dshk2TKIei/QYLibElEotJ94XaZ0P/PIJM0gJtAPBNgvN5H+JgAg7HF4+NBU4Na+XQr
 LUNPLkT/k7Z7k3WS0wQzxH4ouLMmz2co0/mieCXQ4gck2l4gyTVreGy+hchjaeZtFY3ZqUPEzrP
 BVHRW1Jv
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899cd3d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=0tQjBkgDMsDxDV5ERwMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: gBRGnZVKWnn4j7lmKtFzuH9HO_zF22s1
X-Proofpoint-ORIG-GUID: gBRGnZVKWnn4j7lmKtFzuH9HO_zF22s1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_040014_441273_94D8509D 
X-CRM114-Status: GOOD (  29.50  )
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



On 8/11/2025 5:08 PM, Balsam Chihi wrote:
> On Fri, Jul 25, 2025 at 5:25 AM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 6/12/2025 12:40 AM, balsam.chihi@moment.tech wrote:
>>> From: Balsam CHIHI <balsam.chihi@moment.tech>
>>>
> 
> Hello, sorry for the delay. I was OoO.
> 
>>> During system reboot or module removal (rmmod), a crash was observed
>>> due to a synchronous external abort caused by invalid register access
>>> in ath11k_pci_clear_dbg_registers(). This happens when the device is
>>> already powered off and the driver attempts to read debug registers.
>>
>> What does 'powered off' mean exactly here? is WLAN powered by an internal/external supply
>> that will be removed during rmmod/reboot?
> 
> The "powered off" means that the wlan card is rmmod or reboot.
> It is not powered by external supply.

OK.

> 
>>
>>>
>>> The crash log shows:
>>> root@OpenWrt:~# reboot
>>> [  343.663492] Internal error: synchronous external abort:
>>> 0000000096000210 [#1] SMP
>>> [  343.670992] Modules linked in: [...]
>>> [  343.842432] CPU: 7 PID: 9435 Comm: procd Tainted: G O 6.6.86 #0
>>> [  343.849746] Hardware name: LS1088A
>>> [  343.856969] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [  343.863933] pc : ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
>>
>> I don't see any relationship between ath11k_pci_clear_dbg_registers() and this PC pointer.
>> So how did you locate the problematic register access then?
> 
> I tyied to look for the problem based the PC pointer but I was not
> abled to find it.
> So, I added prints in ath11k driver to find out where it stucks,
> classical debug method.

Yeah, classical and always work.

> Then I found out that any "ath11k_pcic_read32()" call fails on rmmod
> ath11k_pci or reboot,

I worry PCIe link is not stable on your platform when rmmod/reboot. Can you try with ASPM
disabled?

--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -605,11 +605,13 @@ static void ath11k_pci_aspm_disable(struct ath11k_pci *ab_pci)

 static void ath11k_pci_aspm_restore(struct ath11k_pci *ab_pci)
 {
+#if 0
        if (test_and_clear_bit(ATH11K_PCI_ASPM_RESTORE, &ab_pci->flags))
                pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
                                                   PCI_EXP_LNKCTL_ASPMC,
                                                   ab_pci->link_ctl &
                                                   PCI_EXP_LNKCTL_ASPMC);
+#endif
 }

 #ifdef CONFIG_DEV_COREDUMP


> but they work fine when insmod/boot ath11k_pci.
> 
>>
>>> [  343.870125] lr : ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
>>> [...]
>>> [  343.950800] Call trace:
>>> [  343.953241]  ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
>>> [  343.959080]  ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
>>> [  343.964671]  ath11k_pcic_read32+0x30/0xb4 [ath11k]
>>> [  343.969477]  ath11k_pci_get_msi_irq+0x528/0x1900 [ath11k_pci]
>>> [  343.975230]  ath11k_pci_get_msi_irq+0x1460/0x1900 [ath11k_pci]
>>> [  343.981068]  ath11k_pci_get_msi_irq+0x1750/0x1900 [ath11k_pci]
>>> [  343.986906]  pci_device_shutdown+0x34/0x44
>>> [  343.991004]  device_shutdown+0x160/0x268
>>> [  343.994928]  kernel_restart+0x40/0xc0
>>> [  343.998594]  __do_sys_reboot+0x104/0x23c
>>> [  344.002518]  __arm64_sys_reboot+0x24/0x30
>>> [  344.006529]  do_el0_svc+0x6c/0x100
>>> [  344.009931]  el0_svc+0x28/0x9c
>>> [  344.012986]  el0t_64_sync_handler+0x120/0x12c
>>> [  344.017344]  el0t_64_sync+0x178/0x17c
>>> [  344.021009] Code: f94e0a80 92404a73 91420273 8b130013 (b9400273)
>>> [  344.027102] ---[ end trace 0000000000000000 ]---
>>>
>>> This patch adds a `power_on` flag to conditionally skip debug register
>>> reads when the device is not powered, preventing invalid memory access.
>>
>> why is only 'read' concerned here?
> 
> Good question, I can't explain why only the reading fails but not the writing.
> 
>>
>> You are skipping several 'read' in this change, could you help narrow down which
>> individual read instance causes this?
>>
> 
> All read calls fail on rmmod/reboot, when
> ath11k_pci_clear_dbg_registers() is called.
> But they all succeed when insmod/boot ath11k_pci.
> 
>>>
>>> With this change, the system no longer crashes on reboot or rmmod,
>>> and the driver continues to function correctly when reloaded.
>>>
>>> Tested-on: QCN9074 hw2.0 PCIe on LS1088A
>>> Tested-on: OpenWrt 24.10.1
>>> Fixes: crash on reboot/rmmod due to invalid register access
>>> Signed-off-by: Balsam CHIHI <balsam.chihi@moment.tech>
>>> ---
>>>  drivers/net/wireless/ath/ath11k/pci.c | 36 ++++++++++++++++-----------
>>>  1 file changed, 21 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
>>> index 78444f8ea153..0c1b55957557 100644
>>> --- a/drivers/net/wireless/ath/ath11k/pci.c
>>> +++ b/drivers/net/wireless/ath/ath11k/pci.c
>>> @@ -203,16 +203,18 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
>>>               ath11k_warn(ab, "link down error during global reset\n");
>>>  }
>>>
>>> -static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
>>> +static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab, bool power_on)
>>>  {
>>> -     u32 val;
>>> +     if (power_on) {
>>> +             u32 val;
>>>
>>> -     /* read cookie */
>>> -     val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
>>> -     ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);
>>> +             /* read cookie */
>>> +             val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
>>> +             ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);
>>>
>>> -     val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
>>> -     ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
>>> +             val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
>>> +             ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
>>> +     }
>>>
>>>       /* TODO: exact time to sleep is uncertain */
>>>       mdelay(10);
>>> @@ -223,14 +225,18 @@ static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
>>>       ath11k_pcic_write32(ab, WLAON_WARM_SW_ENTRY, 0);
>>>       mdelay(10);
>>>
>>> -     val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
>>> -     ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
>>> +     if (power_on) {
>>> +             u32 val;
>>>
>>> -     /* A read clear register. clear the register to prevent
>>> -      * Q6 from entering wrong code path.
>>> -      */
>>> -     val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
>>> -     ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
>>> +             val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
>>> +             ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
>>> +
>>> +             /* A read clear register. clear the register to prevent
>>> +             * Q6 from entering wrong code path.
>>> +             */
>>> +             val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
>>> +             ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
>>> +     }
>>>  }
>>>
>>>  static int ath11k_pci_set_link_reg(struct ath11k_base *ab,
>>> @@ -368,7 +374,7 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
>>>       }
>>>
>>>       ath11k_mhi_clear_vector(ab);
>>> -     ath11k_pci_clear_dbg_registers(ab);
>>> +     ath11k_pci_clear_dbg_registers(ab, power_on);
>>>       ath11k_pci_soc_global_reset(ab);
>>>       ath11k_mhi_set_mhictrl_reset(ab);
>>>  }
>>
> 


