Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A057BE8B364
	for <ath11k@archiver.kernel.org>; Wed,  4 Feb 2026 02:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tr+t5bMF3u7DM/Ka94SAerU8RPbxh/i/CHucN58wf04=; b=cpEPTwEH14EFHJf7h2FsQzqe1C
	e9eqRe87umkkPT3QyRg3GR9VCvFK8linSAb9mT69nZBvFoHoNyc4CMiobtFvjQ5YCKXO1QRZm69fN
	1EaJajL4y28uCwVLmLJ7NFMbOeFblV4LpLNScPSa1A8/MriaUBsTLyhPjc9W8ukoF+wNajvqr2gZn
	JAclkmtb1sWwHbf1plVgyTEMDX79Ry/Qiid96e8gtdTrgk9cWj9tsX3ciM4LGuoIG7Mjk+4rAqtH7
	fviZ7/4MLNcja6GOPIppt76kPAlgbHianTmNF+qXK9hEiQAzap4paSB/nbO1bC9RN+j6/ATrgqZ5c
	GkWdzi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSyX-00000007nN9-14Sz;
	Wed, 04 Feb 2026 02:50:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSyT-00000007nMo-2XPZ
	for ath11k@lists.infradead.org;
	Wed, 04 Feb 2026 02:50:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlmLx4122735
	for <ath11k@lists.infradead.org>; Wed, 4 Feb 2026 02:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tr+t5bMF3u7DM/Ka94SAerU8RPbxh/i/CHucN58wf04=; b=hGAytLqU79jfEJ0h
	KV3Ioqy+Zoui38t0DXUK04gRk+fUJoH+a0wnedq78tjKF+cpg28Owz3W/1c0w8f9
	4DOP2UlPZ5GqFgOJTdumJRGDVp+TrKftCmGDTId/8JVjepspSMqxdGxfrEGQqzvv
	34Q52M/meDtbn0nLZamiv0y2QeFMez/MgdHiV4nXi820hOvSS28NXXMtqgVFE7VE
	pCuYE+1qFnhcKgIeSCzFnVShN6YvT8pIaZrs57Qe1DUuzcQW4cfdxOvBMM4fD+us
	iz7ZQy/I0YZGVeLcuL2M6HKKmK+c4BnaMLT8fk/LshP4hmQ5SioEJobId9irM372
	Z5n90g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3kbkj895-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 04 Feb 2026 02:50:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a79164b686so64067055ad.0
        for <ath11k@lists.infradead.org>; Tue, 03 Feb 2026 18:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770173435; x=1770778235; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tr+t5bMF3u7DM/Ka94SAerU8RPbxh/i/CHucN58wf04=;
        b=IgMV9MWbGvtoK8ue+MAfZZY/ChadW+bVLU1eE3iIM5DomOiJYwBmL5suA5LmvX4LBC
         80HQW4bwFbuU+ikohFBK3lpkjvQYfBWg62UcUFVIY7uhH90jXYUtnhrOcemPFZx6uEQX
         rX+kKkuxNOXgnu/57onUJKDmM5d6rUeR1WHsgq4oXMZSRalWYvLpnS9W/NnkFZvIh3Jr
         gigixtS46S7r8FjtoD2HJqi9AKKYYMURh27lekmk2IAopB/RCcePnW/e1kQqYM1iokxh
         TvTBMznf9tOi6AmIfmhyPp/Fndoq2z3Qfb/DLmMvA6SdD2IeiXTYNJPuqVyVgKxi0Fzz
         Fh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173435; x=1770778235;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tr+t5bMF3u7DM/Ka94SAerU8RPbxh/i/CHucN58wf04=;
        b=dh1sECpGd/8mQOR9aBgy6dp8KlwiXwQtzhzQF4I8wXbs71T3uhnAwu+dcnbtiYkZlp
         FVBYnhA/oiBAryhrwJD3Sd5f8eETpRCFxZdOb05c50K/pPYxl8GvzrOygreLBrlHIcSu
         1c356jRTOHQKNxEhfrj0XnSs1zl6/K2ugLC2wkMsNwdCaXHUMuZ3l8OC03t4W9Q9gBvJ
         AIFdPcKeAfP2c9eHeRFPULVRr51Rmf4kEX32VOqIyx7GvkbHGtmSoXOLcL9ghnE05tE8
         otxonIg6KeKuS4XS3063jcyvbFl5u/eJAGa6tzww1PuzOczakx8gBmqqDeDyzgIPCbFJ
         Um5g==
X-Forwarded-Encrypted: i=1; AJvYcCXWvGYVIj0xxsg1T9z+KjeqCyJIYxJCAgeHyPShwbI9Tf2SHwuiYhs0aK41TGq/Vt3BExYVcCY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ78z84YYcoJ+WFpHZyXak6C2rHLF5ru++ifBTPJbiZlv1UfmF
	kZJajoArH183sCIquKzE5cUp6woJkk2PEvUmZpISOvh7A3xJNp301iYfM0RH1i3r2C2ucgzIgtN
	cCrTbTpR7rZJZwKmaikxGUt7jKpYQ/TZouUZlSYDcQOgYvWtbUar6WeThYDj3Ejxj
X-Gm-Gg: AZuq6aI7CP/MTe8HnHNCEr0qRewlWe0t6YSND+/Bf2dRq9MKTeDGTpTWZ8mFHbltqgl
	gM1d7LuKzDH/NQ/YNV6LImMGnRwBYKe+ZWCqH5O+fr4LloEbvkMqE+5Tm0kacBBNyy7PNavn9Py
	9R+AHwxrJEWlBjabGf1HyK12QKw5Ce2qI0H3txvZlngMRAK6OrG6TM9iqcY3XTOgjACbKt3RK+Q
	MB9x7eWR7N2XWuQBPS+8aH5izVfeiYKqtakvnJFYWp99k0NJIWeKqefV/03624+ZDjcDLePOOfu
	87KMX6dVfgWpeib1qrqI6JmWQXBu6cHCwct6GODuux3f7EAgxQez0U1R2URqn/9QGNLEVNk+UFb
	6tAOLZLyZOP0wPSukYKwNWAXkWQ5AwENfP05D8Vgdbl9LGRZt0ExVGAE+CM8cvkez6nhvAj//97
	vwtcpvSw==
X-Received: by 2002:a17:902:ebc4:b0:2a0:be7b:1c50 with SMTP id d9443c01a7336-2a933bb19eamr16540735ad.14.1770173435413;
        Tue, 03 Feb 2026 18:50:35 -0800 (PST)
X-Received: by 2002:a17:902:ebc4:b0:2a0:be7b:1c50 with SMTP id d9443c01a7336-2a933bb19eamr16540555ad.14.1770173434727;
        Tue, 03 Feb 2026 18:50:34 -0800 (PST)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9338510c9sm7989535ad.12.2026.02.03.18.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 18:50:34 -0800 (PST)
Message-ID: <ca73a571-5ea1-4149-b9d6-8ad0875454eb@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:50:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Potential firmware selection issue with QCNFA765 on ThinkPad P14s
 Gen 5
To: Mohamed Sallam <sallamx99@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <CALOnm7APGpVWcx45O78fa4hOCUGDc0-ywGoqicr51YtpxNueLg@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CALOnm7APGpVWcx45O78fa4hOCUGDc0-ywGoqicr51YtpxNueLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OTKbCenDIqlOExwyrVz0LXpslmglkTpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxOCBTYWx0ZWRfX8AcNdcZgR+Zw
 ANa1TUJTBuwrLL7pSnUKHt/uhri9hzeIjx+uCoo0uGM23LU7HcYXVRXKDSWXoh0s59RA8D/gN84
 ofmIFUrXSyRms8ZvWpOD6W9nCUI8T0BAL4heT1iP4ri9FuheCWjq6CYgGRB3Jp4/QH7/RA/yAix
 6g37tvykvj2E/krmFDtKA9x0eL4XD4CfSwlx0vu63rrt+5QCEwEQRH00vmc0KRyzzpX8gpiszgD
 8FUgK0M7GKHi4gdvyRUkC6OQ075SgBEgs/zTtGqrxbL4ch9EjnxBy+lpUZ5uR5iXL42SdYMr+tM
 6wMEJz5fABuVfVk6rLpU9P7fLESjapS24Up1BJzYmOw1KlIZ/SNTtjbF0tmHcbMzufV1IhSieu+
 /eLYmj33Ij6okTRISiKdHrw86Nuk8alhMm8B54HNGeNO72QOZkTXHNITqesln4+Njh5ypiY/qHz
 IRKgi/vwNnMOK1/2wIw==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=6982b3fc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=YCX_753iAahT_6zR1PwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-GUID: OTKbCenDIqlOExwyrVz0LXpslmglkTpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_185039_513007_58F49BA8 
X-CRM114-Status: GOOD (  38.51  )
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



On 2/4/2026 2:54 AM, Mohamed Sallam wrote:
> Hi ath11k maintainers,
> 
> I'm not very experienced with Linux - I'm an end user who noticed something
> strange with my WiFi and wanted to share my findings in case it helps others.
> 
> Full disclosure: I used AI tools to help me investigate this issue and
> understand the driver behavior. If I'm misunderstanding something fundamental,
> please let me know.
> 
> WHAT I OBSERVED
> ===============
> I have a Lenovo ThinkPad P14s Gen 5 AMD with a Qualcomm QCNFA765 WiFi card
> (PCI ID 17cb:1103, subsystem 17aa:9309). I'm running Arch Linux with kernel
> 6.12.68-1-lts and firmware package linux-firmware-atheros 20260110-1.
> 
> I noticed that channels 149-165 in the 5 GHz band are marked with (no IR),
> preventing me from using them. This happens consistently on my system.
> 
> WHAT I FOUND
> ============
> While trying to understand why this happens, I discovered that the
> linux-firmware package contains two different firmware files:
> - Generic: ath11k/WCN6855/hw2.0/amss.bin
> - Card-specific: ath11k/WCN6855/hw2.0/nfa765/amss.bin
> 
> When I manually create a symlink to use the nfa765 variant instead of the
> default, the (no IR) restrictions disappear and all channels work normally.
> This suggests the driver might not be selecting the optimal firmware for
> this specific card variant.
> 
> The AI analysis suggested that:
> - The driver looks for firmware at ath11k/<chip>/<hw_rev>/<filename>
> - There's a "firmware-name" property that can override this, but it seems
> to only work on ARM platforms with device trees, not x86 laptops
> - The PCI subsystem ID (17aa:9309) might be available to the driver but
> isn't being used to pick different firmware files
> 
> I don't know if this is accurate - it's just what the AI told me based on
> looking at the driver code. The key point is that the firmware swap fixes
> the issue for me.
> 
> REPRODUCTION STEPS
> ==================
> On my system, with the default setup:
> 1. Check channel flags: iw phy | grep -E "5745|5765|5785|5805|5825"
> 2. Channels 149-165 show (no IR)
> 
> After applying the workaround (symlink nfa765 firmware):
> 1. Same check shows channels without (no IR) restrictions
> 2. WiFi works on all channels
> 
> TECHNICAL DETAILS
> =================
> Hardware: Lenovo ThinkPad P14s Gen 5 AMD (21ME001MUS)
> WiFi: Qualcomm QCNFA765 (WCN6855 hw2.1)
> PCI: 17cb:1103, subsystem 17aa:9309 (Lenovo)
> Kernel: 6.12.68-1-lts
> Firmware: linux-firmware-atheros 20260110-1
> Firmware ver: WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Logs from my system:
> $ dmesg | grep ath11k
> [    2.845632] ath11k_pci 0000:02:00.0: chip_id 0x0 chip_family 0x0
> board_id 0xff
> [    2.845778] ath11k_pci 0000:02:00.0: fw_version 0x1019B0E1
> fw_build_timestamp 2024-12-19
> [    2.845789] ath11k_pci 0000:02:00.0: fw_build_id
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> [    2.845806] ath11k_pci 0000:02:00.0: qmi failed to load bdf
> [    2.845809] ath11k_pci 0000:02:00.0: qmi failed to load cal data,
> fallback to 0xff
> 
> $ lspci -vnns 02:00.0
> 02:00.0 0280: 17cb:1103 (rev 01)
>     Subsystem: 17aa:9309
>     Kernel driver in use: ath11k_pci
> 
> With default firmware:
> $ iw phy | grep -E "5745|5765|5785|5805|5825"
> * 5745.0 MHz [149] (14.0 dBm) (no IR)
> * 5765.0 MHz [153] (14.0 dBm) (no IR)
> * 5785.0 MHz [157] (14.0 dBm) (no IR)
> * 5805.0 MHz [161] (14.0 dBm) (no IR)
> * 5825.0 MHz [165] (14.0 dBm) (no IR)
> 
> With nfa765 firmware symlinked:
> * 5745.0 MHz [149] (23.0 dBm)
> * 5765.0 MHz [153] (23.0 dBm)
> * 5785.0 MHz [157] (23.0 dBm)
> * 5805.0 MHz [161] (23.0 dBm)
> * 5825.0 MHz [165] (23.0 dBm)
> 
> MY WORKAROUND
> =============
> I'm currently using this workaround:
>   sudo ln -sf ../hw2.0/nfa765/amss.bin.zst \
>       /lib/firmware/ath11k/WCN6855/hw2.1/amss.bin.zst
> 
> This fixes the issue for me, but I understand it's a hack, not a proper
> solution.
> 
> QUESTIONS
> =========
> 1. Is the driver supposed to automatically select card-specific firmware
>    based on PCI subsystem ID, or is this working as designed?
> 2. If it's supposed to work this way, could there be a bug in the firmware
>    path selection logic?
> 3. Is there a better workaround than manually symlinking firmware files?
> 
> Thank you for your time and for maintaining this driver. I appreciate
> any guidance you can provide, even if it's just to tell me this is
> expected behavior and I'm misunderstanding something.
> 

Thanks for reporting. This seems like a known issue and I have notified the dev team to
look into this. Likely we need to upload a new firmware to fix this, but I am not totally
sure now.

> Best regards,
> Mohamed Sallam
> 


