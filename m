Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747E7C71136
	for <ath11k@archiver.kernel.org>; Wed, 18 Jun 2025 00:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgLNj6bkVSN/WMao3i5lLQfbulXqaWbEHyt9/MPlHok=; b=oEgbdEn44FwuR6n7/EP9TJPduu
	3LpnHBxt1h8v7IH4x3BvI9ws4Ggu9hjawbCMbtO+iPpr4RiDyYpvQ+dKBxc9Iub+tEUuIr32TGqw/
	qHY7q+J2SkAcdb9c2zIE2Tzth/ZNAegfalYVvraJyOtcmAbz2+N81Q6GyZY6+Nk34pxeTErhjllK4
	iURGtLfmRAWU2OfZFJRNOsQxU/REBJV2N5c/uyUhPFcQrZNeIr7sukbnAt8MXSJibZ9UD5I8LzuPy
	tQ96fhBUTEZYeLMU2jy2FcL0znTZurS9YaoIr7/3JPYFJWXr7tSoeBlLYJlrxEjTi7S10Tktnd1Ti
	lAL4EuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRgSO-00000008fdM-1EdM;
	Wed, 18 Jun 2025 00:15:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRgSL-00000008fcy-3pRQ
	for ath11k@lists.infradead.org;
	Wed, 18 Jun 2025 00:15:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HJrTVK030379
	for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 00:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MgLNj6bkVSN/WMao3i5lLQfbulXqaWbEHyt9/MPlHok=; b=DUL+bzaG9d1WoYEE
	Ws1g4FvgfO+UtdJ6Cr833UZLVCUCFxm6hJ8bKaFnUkBEE8Vbo8d08lfAr2Q6b1gJ
	cy1yURbZratX8M2Md6AN8HCfWYD9MzPdw8a0lapB52qnD3/vg9fbwaJ78E3zOifV
	1+3YTYPvWtvZ8hoLhwor/QuHSsRnct1EesIri8PrVMCZ98/TlxBx2WHFQMpaYqha
	pWT5feVbhzc4vHn6Lx8NioIg3kMUaX4E4YJJYTRN6NjDG6wzlPxHD8dY5M2HRM+p
	KjrmhgCgKpW0426151woP55AW27s0HcdQnJ0Hg3NMENSrOxeSSZn4YoYfLp8sFaq
	XsHqkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag2366c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 00:15:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a5a9791fa9so14673631cf.1
        for <ath11k@lists.infradead.org>; Tue, 17 Jun 2025 17:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750205707; x=1750810507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MgLNj6bkVSN/WMao3i5lLQfbulXqaWbEHyt9/MPlHok=;
        b=YUFLDdYED0p6tkb42+2qATE/rwEB/RNUGIpfzSK0j9dbTJH0KjiYf29DS7gdYEu+DQ
         vrlvlMQY1qzurjpPQXlYbZkXnRZ1doV+iIUXGJEG+JEVoniZkhkEtNfAQbDGQGas4gVm
         CaMexwUA2nYNV5/cJjkB7fG/VatxO+C8P/3824WC9c4bN+smoShdAWU729JNiiDbzYZT
         +HYJVtqeqFR8dbJu34fYqCx6FyZfT3bjzZAfy+Xgut8lyAsodWptxQn2GrnirkR5h6oo
         t83mtdUq6oMj+llLNXFY1Xod95R6tamvawRZMfjb8XlONydGBId+/ra/PoXUorJG2nOX
         yI1g==
X-Forwarded-Encrypted: i=1; AJvYcCU5nSDZ7j4JqWNIsQDcPHg49hnNN1A7bhagiPEN7hMq+Y+e3vw2YMkZXsFUrjLUdNkvYy5kE34=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBb+RfiBT4y+M/Faxd5/2FNt3KWnUQf5923jP+6WqL5+8GvXr8
	tM1tlKfESEeHBTXOaGBJrQvLvguny8cvSi44078hyHA/RcXCRVLDAfIJ0EzC8rTVDuB453AfsFV
	iWSkOz5RYd/gDIVPdQ+0iqyHM4op8oQs3TSXFQ/Mb/yzIX6Qiih1wetA2IY/PuwmQ
X-Gm-Gg: ASbGncuAsYRYG58hHtMALoTOClxJu8lj/Hb11DqHwSOk95PfmhscsbxgUISGyW8aSd7
	YKWTseg42OJsLvgKZrmO/CBFpNF0aJVFpcFRLnIsDC8KbldJsZS/ZZBdidLXyY6tGAk3N3Ba2jQ
	sSeS9tI8OudbdfLT2edRb738b9Ca7q8sBKyMwXV30HLE7KCjKmZjGKEbGAOs7VAmfwmI159DhGU
	DUBhjgVXkRZ4Uv80jtMDWN+6l921hmDHX2iMYJWl6eDRhlbRgpi+WJHWAeiKpVEXIosdanp71dE
	2UcIPonM1LYvDtZMKQnFJjgeiqB8ckhYAI6UehMk0AaDlNZD8RAvKLfiM6metXpbC52xzXWBX0f
	BKIE=
X-Received: by 2002:a05:620a:240d:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d3c6c0514dmr873630985a.2.1750205706563;
        Tue, 17 Jun 2025 17:15:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIK+CPXxzG82QX19gNTVqz5a33l0jThlIMCopWj3tmHTu3IVIZXQDnrc8rrTNDOgn4ICOgWg==
X-Received: by 2002:a05:620a:240d:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d3c6c0514dmr873629285a.2.1750205706160;
        Tue, 17 Jun 2025 17:15:06 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159e54sm943350966b.12.2025.06.17.17.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 17:15:05 -0700 (PDT)
Message-ID: <d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 02:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 5/6] wifi: ath11k: choose default PM policy
 for hibernation
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
 <20250328-ath11k-bring-hibernation-back-v3-5-23405ae23431@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250328-ath11k-bring-hibernation-back-v3-5-23405ae23431@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ifCOVNrTZoJ7VcFHVJTUaaDVwtWAWEC_
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6852050b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=5O6acbNQFgkbtOqiNj0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAwMCBTYWx0ZWRfX439smyrv9zYJ
 xdNAs/9k5yuWqz0sfIXDbCyIMnspKhUXOZs4/t4W/fqKJ6zGfmUSDHVWq2UU3bKjZ8/KT3q1Ev2
 +WjhbB5nUlrFND23XgpHUfnuq7tfQkjA5eBAJEQhmOj+VIoB5wKiIzc/KIOiipXIgZj4fT+gmCI
 OeQXf42AEpGAKDPUI3AkNGciSpRKMfK1tkO3SyrOHR2sfo+YlNFZIaD6IGfVbtuZCmvfzVc93ep
 tXwKNzTSWpaJOP6VTCEAROvziMEeh9IILX3CpkaC7f5Ya+zTZQ07YPlQo+WGEXSuWjUnsRUr0/j
 I4gYubMDHlUQx+7TZOM9/CqFSHtVF+h2sJLRh2aX1AOtGtYKq9QB5onvZHjXYyOGdPo91VKeAHH
 6wBFCznXA1Hs/1z9bUpXuSh29ngfwkVLRahrZo3ETetwDRwsk5hr+id3DinypyMi+LDVLBh+
X-Proofpoint-GUID: ifCOVNrTZoJ7VcFHVJTUaaDVwtWAWEC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_171510_102760_2B56E7D7 
X-CRM114-Status: GOOD (  16.27  )
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

On 3/28/25 6:32 AM, Baochen Qiang wrote:
> Now WoWLAN mode is chosen for those machines listed in the quirk table.
> This works for suspend (S3) but breaks for hibernation (S4), because
> WoWLAN mode requires WLAN power to be sustained, which is not the case
> during hibernation. For hibernation, the default mode should be used.
> 
> Register a PM notifier with which kernel can notify us of the actual PM
> operation: if system is going to suspend, the original PM policy is
> honored; while if it is hibernation, overwrite it with default policy.
> 
> To summarize: for suspend (S3), WoWLAN mode is chosen for machines listed
> in the quirk table, non-WoWLAN mode for others; for hibernation (S4),
> non-WoWLAN mode is chosen for all.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Tested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---

I've bisected the following splat to this patch, still happening on
linux-next/master, WCN6855 + SC8280XP CRD, 100% reproducibility 

[root@sc8280xp-crd ~]# echo mem > /sys/power/state 
[   20.267830] fb0: Framebuffer is not in virtual address space.
[   39.863070] PM: suspend entry (s2idle)
[   39.908067] Filesystems sync: 0.035 seconds
[   39.934453] ------------[ cut here ]------------
[   39.939259] Invalid notifier called!
[   39.939268] WARNING: CPU: 5 PID: 513 at kernel/notifier.c:79 notifier_call_chain+0x84/0x1a4
[   39.951566] Modules linked in:
[   39.954732] CPU: 5 UID: 0 PID: 513 Comm: bash Not tainted 6.14.0-rc4longbois-01215-g32d93b51bc7e #12177
[   39.964396] Hardware name: Qualcomm QRD, BIOS 6.0.230525.BOOT.MXF.1.1.c1-00114-MAKENA-1 05/25/2023
[   39.973609] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   39.980777] pc : notifier_call_chain+0x84/0x1a4
[   39.985457] lr : notifier_call_chain+0x80/0x1a4
[   39.990135] sp : ffff800087e63b30
[   39.993559] x29: ffff800087e63b40 x28: ffffb17be1150da0 x27: 0000000000000000
[   40.000913] x26: 0000000000000000 x25: 0000000000000000 x24: ffffb17be1723000
[   40.008261] x23: ffff529452a99ac0 x22: 0000000000000003 x21: 0000000000000000
[   40.015607] x20: 00000000fffffffa x19: ffff800087e63ba4 x18: ffff800083e7d088
[   40.022953] x17: 0000000000000000 x16: ffff529452a9a3d8 x15: ffffb17be1a81420
[   40.030296] x14: ffffffffffffffff x13: 0000000000000003 x12: 00000000ffffefff
[   40.037642] x11: 0000000000000001 x10: 0000000000000003 x9 : 88af25dfec9f7000
[   40.044988] x8 : 88af25dfec9f7000 x7 : 0000000000000000 x6 : 0000000000000000
[   40.052336] x5 : 0000000000000001 x4 : 0000000000000000 x3 : ffff800087e63818
[   40.059680] x2 : ffff800087e63820 x1 : 00000000ffffefff x0 : 0000000000000018
[   40.067033] Call trace:
[   40.069573]  notifier_call_chain+0x84/0x1a4 (P)
[   40.074250]  notifier_call_chain_robust+0x4c/0xa8
[   40.079108]  blocking_notifier_call_chain_robust+0x54/0x88
[   40.084761]  pm_notifier_call_chain_robust+0x2c/0x4c
[   40.089881]  pm_suspend+0x1f4/0x628
[   40.093495]  state_store+0x6c/0x9c
[   40.097010]  kobj_attr_store+0x20/0x38
[   40.100898]  sysfs_kf_write+0x58/0x78
[   40.104686]  kernfs_fop_write_iter+0xe8/0x184
[   40.109181]  vfs_write+0x2dc/0x308
[   40.112699]  ksys_write+0x80/0xe8
[   40.116135]  __arm64_sys_write+0x24/0x34
[   40.120195]  invoke_syscall+0x48/0x100
[   40.124071]  el0_svc_common+0xb4/0xe8
[   40.127853]  do_el0_svc+0x24/0x34
[   40.131286]  el0_svc+0x58/0xb4
[   40.134450]  el0t_64_sync_handler+0x114/0x130
[   40.138954]  el0t_64_sync+0x1a0/0x1a4
[   40.142747] irq event stamp: 17062
[   40.146269] hardirqs last  enabled at (17061): [<ffffb17bdd587204>] __console_unlock+0x5c/0x8c
[   40.155129] hardirqs last disabled at (17062): [<ffffb17bdeb6bd24>] el1_dbg+0x2c/0x80
[   40.163186] softirqs last  enabled at (15294): [<ffffb17bdd500a98>] handle_softirqs+0x38c/0x3dc
[   40.172137] softirqs last disabled at (15289): [<ffffb17bdd480204>] __do_softirq+0x1c/0x2c
[   40.180644] ---[ end trace 0000000000000000 ]---
[   40.186333] Freezing user space processes
[   40.192527] Freezing user space processes completed (elapsed 0.002 seconds)
[   40.199721] OOM killer disabled.
[   40.203083] Freezing remaining freezable tasks
[   40.209029] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)

Konrad

