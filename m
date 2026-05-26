Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8184BCD5BC9
	for <ath11k@archiver.kernel.org>; Tue, 26 May 2026 01:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Fh0xI/akadKdHGqjpzwLwoqTYEfvzgu7R3F3IHIVXQ=; b=WosQ03i1zrUH3s7eHwNMT24L0r
	GbFBuNb+yzz7Z8b6fmpXNDBo3ljxJvIIUPDbPMwoEZov9fN9IysKncXOQQN6o9ZEv0OU9lV23aX1K
	WR7SXVLl0dIOSOO2Grj+HKkv/45VBHnuDlVpHTZN/CFBPlKlEfq/yCGSRE30Mmm+UO5FRaAYzpos8
	hEkDqd+stMzaBdD5rxG3lFpzkOog8gi8kiPVIEBLEhfch7mDXZD6rICy5p/jGM5cCsRnCXnqO63q5
	BxgHKMHPVgui/S9tM/gXaD7+pwI56T+Dva9sToVKTnJrmON6wctnlCbvLBSLsl/ZPmwT18yJeAQ5B
	8uTnxz7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRgwv-00000000o2I-2gj1;
	Tue, 26 May 2026 01:51:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRgwr-00000000o1p-49zq
	for ath11k@lists.infradead.org;
	Tue, 26 May 2026 01:51:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PE0fwn3063411
	for <ath11k@lists.infradead.org>; Tue, 26 May 2026 01:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Fh0xI/akadKdHGqjpzwLwoqTYEfvzgu7R3F3IHIVXQ=; b=GuwtwK6gC7qBfHLb
	XAqsYWOGewW89Ywik3IDaQ6XxyiuJacK2Wu0w/+N7rsiBQ+U2gLXXThuQqmqJWKG
	CeW24pBzi6UNW7mUX+bNV7+ekXg9HjkJguhYbIQ8e6bJX8nG9ex4KyBc/G1taiky
	QPQI/Oqg5pgfSo5IN7YEG1ivcp6EGiSsMAi9b6csPfwSpBkEZm9mWnc7HXHfH4zD
	42XSh2STcvD0a4bLo+Ls8YK4a5nab07tPyOyiWLzeqlM91++sxsILumJEA8uqoH2
	PyPLYNOmDBvU7WS39FuTpHZTaWDmdNEYvQpGasJhlgFSQNst0o7rzRpmOXZAxkkX
	TFfqog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gk035-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 26 May 2026 01:51:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-836d0184333so11434759b3a.0
        for <ath11k@lists.infradead.org>; Mon, 25 May 2026 18:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779760271; x=1780365071; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Fh0xI/akadKdHGqjpzwLwoqTYEfvzgu7R3F3IHIVXQ=;
        b=aW+CDYkqkcvzJKCkA2/MMdlDVl+f+EYsqDo1qUz1FiS309zfpgmQD3NUjL8bPmm31v
         ei2HgPSxWYLBAVtiexOq9cr7Jr48QtpyCt/j9KcoRDtUWC6kVpz/4tDVk6VN/oPjlNrU
         yzIxGYg4QFSnsxA2jpJW6xs5graxF0re3BogOlv+ptj56C3JuC3/kBMoaBEMBjl0kJzA
         UxF3GVCNESj2CvtrqrvOIcmNIZqgGP0Toz2kHpYxKxbYa4+RPIHYz6ZYC8j7OrBZuJYu
         a4Ugxk51s0/6L5fdZMrHK5nNb6iwqUjraGR7Dj8rznFYT7MEhW1elbpbUbZ3myEhPLBh
         S8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779760271; x=1780365071;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Fh0xI/akadKdHGqjpzwLwoqTYEfvzgu7R3F3IHIVXQ=;
        b=opVMjZpAyxbn2ZR6lL5l3MwKKHox+lO5+jsVCoqbxWrF8rbxzhcIoJXbXsRqAicbgH
         kjmYNWiTbng2i5oOf+6EmclpilmvEsYXp0aimT2YvcXNb3FTgarEzjnWsODojXJn64tY
         0JapMhMw7mej3BqskwPkdfZjRLtBTGVOtrQHmrgp16vlC5/LDVY872sdNvx1Oh+s9bgc
         m+YKf1qWJNMt0ow+6c3oCPHWmm5moWzh4rSLbGmtmboSiuPxcxvFKwjnmq+XZQRzLVPJ
         gSIV88OnjjSgDA0DedGxINYPZ4EcEVZLiO7upb0GZ51MFIUCG1KGFCoy7wVeW6+7QJKh
         m/qQ==
X-Forwarded-Encrypted: i=1; AFNElJ/q5sE5gQwkSZkflwMHim7ou/VgA/PuO2b9nuWoD3tOkcx314AVbpBmM7O3jQMSK/eJrf8R++s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJMYes7mu7NnHu9H9OJ141Lz2AYI0OBzIikg7hP10HHZ/Qofbq
	SBa+9p6uDm6DQC+o7AJU/fMG91hMX5Tz5Y3UCY3pjvcUpqoSJjwHWzjr9FSox78zEtsUYr1i6sd
	XNAih7VuRdkl+Drx4Lg8wgCmR2kkiOrb7e0/KmVHMGjJzBu0uDlyC259pFJA+XBNR
X-Gm-Gg: Acq92OEhNav2bHMcGkJbXTjGMz2nxOyi96ot1gOq7faKEmkmv53DdbUjEMS3kZwLDrO
	oB6s8jtIoFCDO6gAjR4ZKdE4BB3COGSLtRygTj8ncIy3FtUIHre6h1u69v0Xp1NwA5Z1lviJCuy
	W/rXOQEbUR027+YC47upLDjnCsmj2fMEySsyrYxMnYxU5q4KU7vJbcFS5NJwU2HT+a+jI+gwJHl
	Xgdv4h24KozOPnOTHWthmAxu8s7iCOiMZPh6CNcSzFWKSMTlrZTn8qSm0vPkTJo3v97EPyWsm6F
	kgF5k1QercAMIUsRMRIzKgRbiSxffyk63+UALZZEXe4cpj0ahcLziXbL0y4DGiRn9FduugqtjfR
	FAV022sF/UUsndZxnw9Vdy7ArEzh0+Vq2MKObC+evNY4LEcc3+LrT4AwcgYN8YKSL51o7/g8swI
	vPee7GP1mQJB80po9wON0=
X-Received: by 2002:a05:6a00:882:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-8415f1591edmr15754986b3a.14.1779760271228;
        Mon, 25 May 2026 18:51:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:882:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-8415f1591edmr15754969b3a.14.1779760270718;
        Mon, 25 May 2026 18:51:10 -0700 (PDT)
Received: from [10.133.33.194] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164afe338sm10980936b3a.18.2026.05.25.18.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 18:51:10 -0700 (PDT)
Message-ID: <9e71acb7-38dc-4207-aff5-618abb7b92f3@oss.qualcomm.com>
Date: Tue, 26 May 2026 09:51:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_ath11k=3A_WCN6855_WoWLAN_resume_leaves_RX_in_unreco?=
 =?UTF-8?Q?verable_reorder_state_=E2=86=92_TCP_collapses?=
To: Hauke Mehrtens <hauke@hauke-m.de>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <0fbb0b6e-c849-4e26-9c46-2ac4986f6b52@hauke-m.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0fbb0b6e-c849-4e26-9c46-2ac4986f6b52@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FDPJVCcAXYJdWmxL6Y24203_V7tq6vqf
X-Proofpoint-GUID: FDPJVCcAXYJdWmxL6Y24203_V7tq6vqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAxNSBTYWx0ZWRfXzuuHGJQ/qgK/
 gdFiMPtMOYUv6tEPsINeg3DVMnkUkMLpydBATddZNIiRAjKXOG5fR/eXlBFV68/fzfkIU6DJIf2
 IXK1NdHA7XDXs9mxS5hI0klBvvgfdPiydgQGubj9u5Xc8RAlV7fipmTOGhgpB3FKSwpSweXRbzg
 qE+WU/cbLOFRwn7+XQJaBR7BgODHvbtJpTv/vbCJW202AmmszUbVTXsrgNYgYujzlaRBvNZdbYw
 uR+CSROR2Gje+gX533aYVIV4XqYtfdwTtqyh2b3+7inXcuVl2UsUr/7Zi/RrCG94ucd6nn4gE6z
 gK/KHgUcYWV4LvMQH9ESbpebODj+4aJBsTA3ZYLcbwluqJnlbLV7JpYVW7HN6tvFLBjpNBTeL+i
 srjQ47cPln/rKyB+P5hRxAt2XFul7wOQS9QnCIcNs7oAB2HNR5n9/AwA4uviMFxHLFxmWaCbWS7
 RqKcwQwIdV3DsGLhWmg==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a14fc90 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=CAwv5vQtPF-BgKyaUxQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_07,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_185115_038700_AD4833BF 
X-CRM114-Status: GOOD (  20.42  )
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



On 5/25/2026 9:24 PM, Hauke Mehrtens wrote:
> I used AI to help me debug this problem.
> 
> On Lenovo ThinkPad P14s G4 AMD (QCNFA765 / WCN6855 hw2.1), ~1 in 10
> suspend/resume cycles leaves the ath11k RX path delivering MSDUs out of
> order (~16% of TCP segments). TCP cwnd stays at 1-3 MSS and goodput
> collapses to ~3 Mbit/s; UDP on the same link in the same minute pushes
> 100+ Mbit/s.
> 
> This machine is in the DMI quirk list at
> `drivers/net/wireless/ath/ath11k/core.c` that forces `ATH11K_PM_WOW`.
> In WOW mode the firmware is kept alive across suspend; the WOW resume
> path does not re-initialise REO HW or per-TID BA state.
> The PM_WOW quirk was added as a workaround for unexpected-wakeup bug
> https://bugzilla.kernel.org/show_bug.cgi?id=219196
> 
> ## Affected components
> 
> - **Driver:** ath11k_pci
> - **Chip:** WCN6855 hw2.1 (`17cb:1103`, QCNFA765)
> - **Firmware:** `WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41`
>   (fw_version `0x11088c35`, 2024-04-17)
> - **Kernel:** observed on 7.0.9-arch1-1; also present across many
>   earlier kernel versions over the past >1 year on this hardware
> - **Machine:** Lenovo ThinkPad P14s G4 AMD, DMI `21K5CTO1WW` (matches
>   quirk entry "P14s G4 AMD #1" at `core.c:961-966` via `"21K5"`
>   substring)
> 
> ## Reproduce
> 
> 1. Associate to an HE AP (characterised at 6 GHz, HE-MCS 5/6 NSS 2
>    160 MHz, -56 dBm, using MT7915 with OpenWrt 25.12).
> 2. Suspend, wake, test `iperf3` TCP. Repeat. On average within ~10
>    cycles, one resume leaves the link broken.
> 3. In the broken state: `iw dev wlpXsY link` still reports ~1.3 Gbit/s
>    "bitrate". Ping and UDP iperf3 look fine. TCP iperf3 collapses to
>    ~3 Mbit/s with cwnd stuck at 1-3 MSS.
> 
> ## Evidence
> 
> ### iperf3, same link same minute
> 
> ```
> AP -> STA, UDP -b 200M -l 1400 -t 15:
>   sender:   200 Mbit/s, 267876 datagrams
>   receiver: 102 Mbit/s, 137290 received, 130585 "lost"
>   (not real loss; iperf3 UDP counts out-of-window arrivals as lost)
> 
> AP -> STA, TCP -t 15:
>   3.43 Mbit/s, 521 retransmits, cwnd 1.41-5.66 KB throughout
> ```
> 
> ### UDP run: no real loss anywhere
> 
> - `ip -s link` delta: `+267,953 packets`, `0 errors`, `0 dropped`
>   (AP sent 267,876).
> - `/proc/net/snmp` Udp: `RcvbufErrors 0, InErrors 0`.
> - ath11k `pdev_stats` delta: `MSDUs delivered to HTT +267,985`.
> - `soc_dp_stats` entirely zero: no RXDMA / REO / HAL / TCL / backpressure
>   errors of any kind.
> - AP `iw station get`: ~1.3% retry rate, -65 dBm ACK signal,
>   `expected throughput 1049 Mbps`.
> 
> → Air link clean. Host data path clean. Firmware delivered every
> datagram. No drops anywhere.
> 
> ### TCP socket reorder (`ss -tin` once per second during TCP iperf3)
> 
> ```
>    t (s)    bytes_rx   segs_in   rcv_ooopack
>    0        1,291,653       895          158
>    1        1,717,365     1,189          210
>    2        2,060,541     1,426          274
>    3        2,519,557     1,743          335
>    4        3,050,973     2,110          397
>    5        3,446,277     2,383          450
>    6        3,906,741     2,701          513
> ```
> 
> ~60 ooo packets/s out of ~370 segs/s = **~16% out-of-order**, sustained.
> 
> ### Packet-level pattern (`tcpdump` on wlpXsY)
> 
> Seq normalised to 0 at flow start:
> 
> ```
> 22 ms     2896:4344
> 25 ms     4344:5792
> 27 ms     1448:2896           <-- late; fills gap from 5 ms earlier
> 28 ms     5792:7240
> 54 ms     8688:10136
> 55 ms     10136:11584
> 57 ms     7240:8688           <-- late
> 107 ms    26064:27512
> 107 ms    28960:30408
> 108 ms    30408:31856
> 109 ms    27512:28960         <-- late
> 156 ms    57920:59368
> 156 ms    59368:60816
> 157 ms    56472:57920         <-- late
> ```
> 
> Fingerprint: A-MPDU subframe lost on first transmission, retried, retry
> arrives 2-5 ms later. Working REO HW would buffer the continuation
> until the missing subframe arrived or the per-TID reorder timeout
> (`HAL_DEFAULT_REO_TIMEOUT_USEC`, 40 ms) expired. Here both continuation
> and retry pass through unordered.
> 
> ## Diagnosis
> 
> - Air link healthy; host data path clean; REO HW error counters all
>   zero — REO simply isn't enforcing order for this peer's TIDs.
> - dmesg across 3 days of suspend cycles shows zero ath11k re-init
>   activity (no `fw_version` reprint, no `wcn6855 hw2.1` reprint). The
>   firmware instance is the same one from the most recent `modprobe`.
>   `ath11k_core_suspend_wow` / `ath11k_core_resume_wow` neither power
>   down the device nor re-initialise REO.
> - `rmmod` triggers full `ath11k_hif_power_down` + chip re-init on next
>   `modprobe`, which re-runs `ath11k_hw_wcn6855_reo_setup`. This is the
>   only reliable recovery, so the corrupted state lives in firmware /
>   REO HW that the WOW resume path never touches.
> 
> The non-WOW path (`ath11k_core_suspend_default`) does power-down + full
> re-init on resume, re-running `ath11k_dp_srng_common_setup()` →
> `hw_ops->reo_setup()`. The WOW path does not.
> 
> ## Related
> 
> - Bug #219196 — unexpected wakeups; the WOW workaround was added to
>   mitigate this
> - `ce8669a27016` — introduced the WOW quirk table (2025-03-28, Baochen Qiang)
> - `0eb002c93c3b` — added `21K5` / `21K6` (this laptop) to the quirk
>   table (2025-09-29, Mark Pearson)
> - `4015b1972763` — adds Z13/Z16 Gen1 to WOW quirk (Nov 2025)
> 
> Hauke
> 

can you please try below fix ?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2a2451a34afdf563b3102d36a4b6cf335cf813e2


