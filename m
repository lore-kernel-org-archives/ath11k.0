Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEC6CD5BC9
	for <ath11k@archiver.kernel.org>; Mon, 25 May 2026 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9aNWWpQ+16cskdRqLSNbL+nh+J/jH+qNm9U4np8Wsd4=; b=ktt6CjQe6Oa9Z0OmGSp/hdXr7V
	64g4Hzsh3IOiR8cDSF4ji0irj4kogDGk1Qc+t8Xl3D+lyNDCOhYPh0nkak7lZ8/+rtosr2JGOyUAP
	50++leo9pmFq1BUQnoG88OTeN2B2FjX4txXXyLXbIYbmds6bJtdT4+Tt7o8nmrgVLq12VbdEBqCh8
	pMH/+0qUxtSybEnbnqyZ77ZlK+MmJnYSLRbjWDtqW7uETljLUtqOkMa2xPZs5boLt2aVFCS43dbB5
	CjiG/j1fQytgOIh/BFFaq3rkU9q5qwMyLhO5Q3I8enqskRJiX/DVLMYxbWiMz/jWnQx1u87NtTdPU
	+9EiomSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVHx-0000000HJ4Y-1w8x;
	Mon, 25 May 2026 13:24:13 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVHu-0000000HJ3W-0JQK
	for ath11k@lists.infradead.org;
	Mon, 25 May 2026 13:24:11 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gPGmz624hz9tp1;
	Mon, 25 May 2026 15:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1779715443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9aNWWpQ+16cskdRqLSNbL+nh+J/jH+qNm9U4np8Wsd4=;
	b=rWwdl9DzOMQiwVWE9f/I4nFw7g7gjR+CCINHQFSf0e+yJ2m1ZJYhIeYSdY2rPPVI7cXTpM
	MXrPd+VoObpz7gT396192/PHv9ZuaLedUVQ0wQUe772JiGcrxAIbQxk3pQlvMtDnak/bFw
	ZqNMygcpv1ji2/+y7yJ0COx/dFyPdUTYqEzvBUtBeugskusb2SwTnbIBruf1NpSTl9haPe
	ZDhjRLme+BVApMY8L2hpNzjowN7PsRGrccFzHWreIu+Oc3wGtxLeXQgM0jGx2bKRIeNBFy
	K07q382vBbyw7vB5qx7f4gIXA0R7FK5HNhNQMZgf1E3X1P279UVAQWivvUpm7A==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hauke@hauke-m.de designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hauke@hauke-m.de
Message-ID: <0fbb0b6e-c849-4e26-9c46-2ac4986f6b52@hauke-m.de>
Date: Mon, 25 May 2026 15:24:00 +0200
MIME-Version: 1.0
Content-Language: en-US
From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: =?UTF-8?Q?ath11k=3A_WCN6855_WoWLAN_resume_leaves_RX_in_unrecoverabl?=
 =?UTF-8?Q?e_reorder_state_=E2=86=92_TCP_collapses?=
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, Baochen Qiang <quic_bqiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4gPGmz624hz9tp1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_062410_264609_CFBD7C57 
X-CRM114-Status: UNSURE (   5.40  )
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

I used AI to help me debug this problem.

On Lenovo ThinkPad P14s G4 AMD (QCNFA765 / WCN6855 hw2.1), ~1 in 10
suspend/resume cycles leaves the ath11k RX path delivering MSDUs out of
order (~16% of TCP segments). TCP cwnd stays at 1-3 MSS and goodput
collapses to ~3 Mbit/s; UDP on the same link in the same minute pushes
100+ Mbit/s.

This machine is in the DMI quirk list at
`drivers/net/wireless/ath/ath11k/core.c` that forces `ATH11K_PM_WOW`.
In WOW mode the firmware is kept alive across suspend; the WOW resume
path does not re-initialise REO HW or per-TID BA state.
The PM_WOW quirk was added as a workaround for unexpected-wakeup bug
https://bugzilla.kernel.org/show_bug.cgi?id=219196

## Affected components

- **Driver:** ath11k_pci
- **Chip:** WCN6855 hw2.1 (`17cb:1103`, QCNFA765)
- **Firmware:** 
`WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41`
   (fw_version `0x11088c35`, 2024-04-17)
- **Kernel:** observed on 7.0.9-arch1-1; also present across many
   earlier kernel versions over the past >1 year on this hardware
- **Machine:** Lenovo ThinkPad P14s G4 AMD, DMI `21K5CTO1WW` (matches
   quirk entry "P14s G4 AMD #1" at `core.c:961-966` via `"21K5"`
   substring)

## Reproduce

1. Associate to an HE AP (characterised at 6 GHz, HE-MCS 5/6 NSS 2
    160 MHz, -56 dBm, using MT7915 with OpenWrt 25.12).
2. Suspend, wake, test `iperf3` TCP. Repeat. On average within ~10
    cycles, one resume leaves the link broken.
3. In the broken state: `iw dev wlpXsY link` still reports ~1.3 Gbit/s
    "bitrate". Ping and UDP iperf3 look fine. TCP iperf3 collapses to
    ~3 Mbit/s with cwnd stuck at 1-3 MSS.

## Evidence

### iperf3, same link same minute

```
AP -> STA, UDP -b 200M -l 1400 -t 15:
   sender:   200 Mbit/s, 267876 datagrams
   receiver: 102 Mbit/s, 137290 received, 130585 "lost"
   (not real loss; iperf3 UDP counts out-of-window arrivals as lost)

AP -> STA, TCP -t 15:
   3.43 Mbit/s, 521 retransmits, cwnd 1.41-5.66 KB throughout
```

### UDP run: no real loss anywhere

- `ip -s link` delta: `+267,953 packets`, `0 errors`, `0 dropped`
   (AP sent 267,876).
- `/proc/net/snmp` Udp: `RcvbufErrors 0, InErrors 0`.
- ath11k `pdev_stats` delta: `MSDUs delivered to HTT +267,985`.
- `soc_dp_stats` entirely zero: no RXDMA / REO / HAL / TCL / backpressure
   errors of any kind.
- AP `iw station get`: ~1.3% retry rate, -65 dBm ACK signal,
   `expected throughput 1049 Mbps`.

→ Air link clean. Host data path clean. Firmware delivered every
datagram. No drops anywhere.

### TCP socket reorder (`ss -tin` once per second during TCP iperf3)

```
    t (s)    bytes_rx   segs_in   rcv_ooopack
    0        1,291,653       895          158
    1        1,717,365     1,189          210
    2        2,060,541     1,426          274
    3        2,519,557     1,743          335
    4        3,050,973     2,110          397
    5        3,446,277     2,383          450
    6        3,906,741     2,701          513
```

~60 ooo packets/s out of ~370 segs/s = **~16% out-of-order**, sustained.

### Packet-level pattern (`tcpdump` on wlpXsY)

Seq normalised to 0 at flow start:

```
22 ms     2896:4344
25 ms     4344:5792
27 ms     1448:2896           <-- late; fills gap from 5 ms earlier
28 ms     5792:7240
54 ms     8688:10136
55 ms     10136:11584
57 ms     7240:8688           <-- late
107 ms    26064:27512
107 ms    28960:30408
108 ms    30408:31856
109 ms    27512:28960         <-- late
156 ms    57920:59368
156 ms    59368:60816
157 ms    56472:57920         <-- late
```

Fingerprint: A-MPDU subframe lost on first transmission, retried, retry
arrives 2-5 ms later. Working REO HW would buffer the continuation
until the missing subframe arrived or the per-TID reorder timeout
(`HAL_DEFAULT_REO_TIMEOUT_USEC`, 40 ms) expired. Here both continuation
and retry pass through unordered.

## Diagnosis

- Air link healthy; host data path clean; REO HW error counters all
   zero — REO simply isn't enforcing order for this peer's TIDs.
- dmesg across 3 days of suspend cycles shows zero ath11k re-init
   activity (no `fw_version` reprint, no `wcn6855 hw2.1` reprint). The
   firmware instance is the same one from the most recent `modprobe`.
   `ath11k_core_suspend_wow` / `ath11k_core_resume_wow` neither power
   down the device nor re-initialise REO.
- `rmmod` triggers full `ath11k_hif_power_down` + chip re-init on next
   `modprobe`, which re-runs `ath11k_hw_wcn6855_reo_setup`. This is the
   only reliable recovery, so the corrupted state lives in firmware /
   REO HW that the WOW resume path never touches.

The non-WOW path (`ath11k_core_suspend_default`) does power-down + full
re-init on resume, re-running `ath11k_dp_srng_common_setup()` →
`hw_ops->reo_setup()`. The WOW path does not.

## Related

- Bug #219196 — unexpected wakeups; the WOW workaround was added to
   mitigate this
- `ce8669a27016` — introduced the WOW quirk table (2025-03-28, Baochen 
Qiang)
- `0eb002c93c3b` — added `21K5` / `21K6` (this laptop) to the quirk
   table (2025-09-29, Mark Pearson)
- `4015b1972763` — adds Z13/Z16 Gen1 to WOW quirk (Nov 2025)

Hauke

