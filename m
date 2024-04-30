Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693D4C4345F
	for <ath11k@archiver.kernel.org>; Tue, 30 Apr 2024 01:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGrzfqPqchMapdL6Phzj2yvpVGYfEkqPSxtPv6iRqpk=; b=uDjHgbIpsVN1zeru2jWzRc4Cbd
	wuF4isVB4Q0dvhczDqZCL2gitarmUNoCHsDhAqYxA/PSJUnAUFJ08EtMRJHCSOIkAJe+kWuJGbL2J
	0O3/XR4heIWrk2h8cq+gKhveGgp4gW8+NXJKdpBHm88DViS1O+6DCJkKbLfzhBljkfCJwdMElsz/p
	FB5Qfe6Nl/om2IjhCRl2POqlXt8Vk9bFUxGhqSNJldCg2XUwm4Em2eXJmDvg2NaSOYYWGPIA7s9JV
	M6sMLouM+OR7R11AgmFF2lTW13w4M+kpcphr5OHwZvePrBOIlUrkbr4gflmzVHnJui5Y2GtRCjqLn
	Gu/+jt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1chw-00000004jiz-04cr;
	Tue, 30 Apr 2024 01:55:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1cht-00000004jiY-1W3Z
	for ath11k@lists.infradead.org;
	Tue, 30 Apr 2024 01:54:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43TLuv7r015419;
	Tue, 30 Apr 2024 01:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=VGrzfqPqchMapdL6Phzj2yvpVGYfEkqPSxtPv6iRqpk=; b=Sd
	vg/hQ9HZv86w/7LHdg/JrU1+EQ2gD00RJ8jhskViFYH4DnfEnO8RFw2HLxRjl9lI
	oBj928lwEyyeOc5ebdbWjOLbzNT7Gp4KMgjaOzYxA5gc2vjtK3LZVcWrIDZYMyTY
	I8r2yDjJh2aAj1ByvjVuDFpPp3iot05cXoewjdDlUbso2C3IXCU4EZRVpSxX3Uag
	a+8NQMEZ3z+XFwlw17XwK1O5v6U6VrABp5+PECB/GAzFGAgZmRr98HTF9yXclDhc
	KUlM7fj3j3XM/ha2EdqffNbcQhEqMhgeWJN7CyXLEe7tCjDt2eEy/9KW3x8/KLut
	VkBgPXS8lS2hhXQqXXrg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtg51ssfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 01:54:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U1skDE022118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 01:54:46 GMT
Received: from [10.253.75.138] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 18:54:45 -0700
Message-ID: <43b0cdc0-f489-410a-a702-5a5092b9bc18@quicinc.com>
Date: Tue, 30 Apr 2024 09:54:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k
To: "Lindner, Frank" <Frank.Lindner@ghmt.de>,
        "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
References: <FRYP281MB0160287D5A3D8F7130707BDAEB1B2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <FRYP281MB0160287D5A3D8F7130707BDAEB1B2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wByF_meNLSM7Alh-uNy9kIYcUIhILJ_c
X-Proofpoint-ORIG-GUID: wByF_meNLSM7Alh-uNy9kIYcUIhILJ_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_22,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 phishscore=0 impostorscore=0
 mlxlogscore=521 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_185457_434612_A7BA1963 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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



On 4/29/2024 10:53 PM, Lindner, Frank wrote:
> Hi dev-guys,
> 
> QCN9074 mPCIe-module with ath-next Kernel 6.9.0-rc1 (Ubuntu 24.04) causing Kernel Crash, when setting device to monitor mode. This does not happen instantly, it make take some time to fail.
> 
> [Mon Apr 29 14:17:57 2024] rcu: INFO: rcu_preempt self-detected stall on CPU
> [Mon Apr 29 14:17:57 2024] rcu:         0-....: (15661 ticks this GP) idle=9394/1/0x4000000000000000 softirq=26961/26962 fqs=7499
> [Mon Apr 29 14:17:57 2024] rcu:         (t=15000 jiffies g=78093 q=1070 ncpus=16)
> [Mon Apr 29 14:17:57 2024] CPU: 0 PID: 15 Comm: ksoftirqd/0 Tainted: G             L     6.9.0-rc1-ath-next-j001 #11
> [Mon Apr 29 14:17:57 2024] Hardware name: To Be Filled By O.E.M. Z590M Pro4/Z590M Pro4, BIOS P2.20 06/06/2022
> [Mon Apr 29 14:17:57 2024] RIP: 0010:ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
> [Mon Apr 29 14:17:57 2024] Code: 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 55 8b 46 60 45 31 c0 48 89 e5 3b 46 70 74 08 <48> 8b 56 10 4c 8d 04 82 4c 89 c0 5d c3 cc cc cc cc 0f 1f 80 00 00
> [Mon Apr 29 14:17:57 2024] RSP: 0018:ffffba0e80113b90 EFLAGS: 00000283
> [Mon Apr 29 14:17:57 2024] RAX: 0000000000001bf8 RBX: ffff924e4a81a3f8 RCX: 0000000000000000
> [Mon Apr 29 14:17:57 2024] RDX: 0000000000000c0a RSI: ffff924e45347088 RDI: ffff924e45340000
> [Mon Apr 29 14:17:57 2024] RBP: ffffba0e80113b90 R08: 0000000000000000 R09: ffff924e4a81a1d0
> [Mon Apr 29 14:17:57 2024] R10: ffffba0e80113ae8 R11: 000000000000ffff R12: 0000000000000000
> [Mon Apr 29 14:17:57 2024] R13: ffff924e4a819fe0 R14: ffff924e4d575c00 R15: ffff924e45347088
> [Mon Apr 29 14:17:57 2024] FS:  0000000000000000(0000) GS:ffff926d1ee00000(0000) knlGS:0000000000000000
> [Mon Apr 29 14:17:57 2024] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [Mon Apr 29 14:17:57 2024] CR2: 00007fcc86d166e0 CR3: 000000082703c003 CR4: 0000000000770ef0
> [Mon Apr 29 14:17:57 2024] PKRU: 55555554
> [Mon Apr 29 14:17:57 2024] Call Trace:
> [Mon Apr 29 14:17:57 2024]  <IRQ>
> [Mon Apr 29 14:17:57 2024]  ? show_regs+0x6d/0x80
> [Mon Apr 29 14:17:57 2024]  ? dump_cpu_task+0x75/0x90
> [Mon Apr 29 14:17:57 2024]  ? rcu_dump_cpu_stacks+0xeb/0x180
> [Mon Apr 29 14:17:57 2024]  ? rcu_sched_clock_irq+0x572/0x1330
> [Mon Apr 29 14:17:57 2024]  ? raw_notifier_call_chain+0x1a/0x20
> [Mon Apr 29 14:17:57 2024]  ? timekeeping_update+0xf7/0x150
> [Mon Apr 29 14:17:57 2024]  ? account_system_index_time+0x9f/0xc0
> [Mon Apr 29 14:17:57 2024]  ? update_process_times+0x75/0xc0
> [Mon Apr 29 14:17:57 2024]  ? tick_nohz_handler+0xdc/0x140
> [Mon Apr 29 14:17:57 2024]  ? __pfx_tick_nohz_handler+0x10/0x10
> [Mon Apr 29 14:17:57 2024]  ? __hrtimer_run_queues+0x10e/0x290
> [Mon Apr 29 14:17:57 2024]  ? clockevents_program_event+0xae/0x130
> [Mon Apr 29 14:17:57 2024]  ? hrtimer_interrupt+0x108/0x240
> [Mon Apr 29 14:17:57 2024]  ? handle_edge_irq+0xde/0x240
> [Mon Apr 29 14:17:57 2024]  ? __sysvec_apic_timer_interrupt+0x5a/0x150
> [Mon Apr 29 14:17:57 2024]  ? sysvec_apic_timer_interrupt+0x7f/0x90
> [Mon Apr 29 14:17:57 2024]  </IRQ>
> [Mon Apr 29 14:17:57 2024]  <TASK>
> [Mon Apr 29 14:17:57 2024]  ? asm_sysvec_apic_timer_interrupt+0x1f/0x30
> [Mon Apr 29 14:17:57 2024]  ? ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
> [Mon Apr 29 14:17:57 2024]  ath11k_dp_rx_process_mon_status+0xc45/0x1190 [ath11k]
> [Mon Apr 29 14:17:57 2024]  ? idr_alloc_u32+0x97/0xd0
> [Mon Apr 29 14:17:57 2024]  ath11k_dp_rx_process_mon_rings+0x32a/0x550 [ath11k]
> [Mon Apr 29 14:17:57 2024]  ath11k_dp_service_srng+0x289/0x5a0 [ath11k]
> [Mon Apr 29 14:17:57 2024]  ath11k_pcic_ext_grp_napi_poll+0x30/0xd0 [ath11k]
> [Mon Apr 29 14:17:57 2024]  __napi_poll+0x30/0x1f0
> [Mon Apr 29 14:17:57 2024]  net_rx_action+0x198/0x320
> [Mon Apr 29 14:17:57 2024]  __do_softirq+0xdd/0x319
> [Mon Apr 29 14:17:57 2024]  ? __pfx_smpboot_thread_fn+0x10/0x10
> [Mon Apr 29 14:17:57 2024]  run_ksoftirqd+0x31/0x50
> [Mon Apr 29 14:17:57 2024]  smpboot_thread_fn+0xe3/0x1e0
> [Mon Apr 29 14:17:57 2024]  kthread+0xf5/0x130
> [Mon Apr 29 14:17:57 2024]  ? __pfx_kthread+0x10/0x10
> [Mon Apr 29 14:17:57 2024]  ret_from_fork+0x3d/0x60
> [Mon Apr 29 14:17:57 2024]  ? __pfx_kthread+0x10/0x10
> [Mon Apr 29 14:17:57 2024]  ret_from_fork_asm+0x1a/0x30
> [Mon Apr 29 14:17:57 2024]  </TASK>
> 
> Any ideas?


Add 'spin_lock_bh(&srng->lock)' and 'spin_unlock_bh(&pmon->mon_lock)' in 
ath11k_dp_rx_mon_dest_process().



BTW, next time please use an appropriate title instead of 'ath11k'🙂.


> 
> BR Frank
> 
> 
> 
> 
> Vorstand: Dirk Wilhelm (V), Wulf Jannsen
> Aufsichtsrat: Ron Scheepers (V)
> Handelsregister: HRB Saarbrücken Nr. 13201
> Ust.ID Nr.: DE 153807627

