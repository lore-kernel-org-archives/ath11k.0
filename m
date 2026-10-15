Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BE2CC6B2F
	for <ath11k@archiver.kernel.org>; Thu, 15 Oct 2026 05:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VByP+HgL4tMgo0fXnPHtZaEKMdZ3+L8eEwWP22mboo=; b=EZ7vxKC4qu9QTfvZbI39maNzyK
	oog4eOMh3hWG2rjUitXwOnlutB/xFpiB72vrwGcBrhA+Wygv+o7bIVeNa9zmcr/WjBgXqlUDX4xzh
	ZMy02enuHzx2r0r+J71l3BhzamafQJqSIj9eo8NCytn1+2puBrHaGeTCawlosXkaBFnDRtMWvL4m8
	KMNzeufLgJiSH6WyF1bYy9p5XFJsFKJBFzgOYP9TQHn4lZvh1ZEOIWrqMxRuxUs1PuIP59z+Z2S1t
	tKarUtefChme4siPs6LR/4NJGyeGVrFiqKzbNR/PIUYWuPh/rmSNkGL8ops7naLlv6Qea1PCSXK9I
	qquW5LOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEN4-0000000GtFn-0Q2A;
	Thu, 15 Oct 2026 05:51:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEN1-0000000GtEx-1Wx4
	for ath11k@lists.infradead.org;
	Thu, 15 Oct 2026 05:51:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xZlY2738642
	for <ath11k@lists.infradead.org>; Thu, 15 Oct 2026 05:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1VByP+HgL4tMgo0fXnPHtZaEKMdZ3+L8eEwWP22mboo=; b=cGOFA7OzkrW5dQ18
	1lt9QomyvLvWouWBXReJz9W7wn+QIIkGxIj9yD7Y478SS6XnH5nJYwmC5J/8itec
	1BcLVJu0rI7VgF5RN6o2Qp3hdo355KjQKCx1QI3VwHdy6zevlgbIZ91NQKv8K4IG
	bRRYKYDOnxTeRsQ83Oz3ynmOtd30jBM/nUO7YMoPKRvtpdtqfYQ7/4/0aXlnaPkH
	NDhH2YWdbe0OEck0mtANQ7tYythDM5rGgObRUw/k2AX1iURk9nWU+oO2LqgOmtPP
	crlxiQ4vCSHd8L3UV1AVQg5/9v+sGUI33GEGzczr1RP9AuJPuAwphnmBkV3+Wthy
	rRaFKA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds8b3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 15 Oct 2026 05:51:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso1055462a91.1
        for <ath11k@lists.infradead.org>; Wed, 14 Oct 2026 22:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043472; x=1792648272; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VByP+HgL4tMgo0fXnPHtZaEKMdZ3+L8eEwWP22mboo=;
        b=gxBtVUHlQ54xPCmKRwhHiPBwSRnAHSZso00q0jw/2UAbADwAArGqUOIgLkw3jss6ua
         bydihRmuZ4D6ng7yl5bkjxbWYY57pItgs+85U1VjB47+nQ1xBV/EzMy63Z6b00eQ7g6l
         nID/5mlEuWyR9PJIIJHv0eyhs37VSevyaHzDXjWtjFpfc2piV+SXhEOlStDJo/C5jqw+
         jCpzJ3oqg6MrCdCH/IUzXBl0Aa+mt5AAx7mapmP+Ah2/fU2wzzttWBPAJ/9jmzogBpCn
         HThyBDi8pY0H4eBHd4Or1kSR4GrM4hu77BqSqzFOO/K+FFKALa1puA2In3cmDeqluTp8
         BGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043472; x=1792648272;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VByP+HgL4tMgo0fXnPHtZaEKMdZ3+L8eEwWP22mboo=;
        b=smNxzaVpiTBuLN5L1i/XA1JmYf1t2u0QGvdRUUwQiuuVYOiS1eXfr3jjFmgBU7C0WR
         y6Zj9/cXrE2Qxtcxa89VbudtLKoOwB+8qE84VEYWP4lo/htTsFBfLlDJDR9ykWPDlQWa
         1kiPBNJ1jbBYBYNQ4B99JFjn/sR86e6SaqoOdM2Bbuzr67ZQTxmhSxos3Ity9ymdyR8d
         YrexB4EJhViQzxf7cecfxC5maeYh7rgc5y+p8C6D89vnze09lwzXWyBXULZMX7JUFpq9
         TdSNE3DogaNGELshqqaITSd3rJFkjW46PwfGRka4tvMM+oS8ltmh6BPuTKdSQxYpYTt+
         w3nA==
X-Gm-Message-State: AFq9FYKVkBRq53QL/oHdXv/6PZMkjBSi6vqeAcfBial41IyOlOtH83Mx
	UuDuT4aQePSe0FlQtcJktKYUe7oO0UiVh+THtoeBrf6jebjcG8Jy0m6LIPPMCCCUHmzahzyXwp/
	moTZ3t+UCm17SmZYSqYZaHf4O+EJRWHP0mZIBoc9zylsBRifEqfIYOeUEi1fBr8U+wWVESUOy
X-Gm-Gg: AYBFou1ybZRdMm3rvweLT7iMJ6vP30YTYkSWHhgFBuW5aGFoSRF/GBPuqA6Ll0ClR+u
	9Jsd+ru/8PABCx20bMUKpqu2ultWMcFwxU5QuAMRp1uzSP/JKDGAAnnI05TZSkkz+gpJSpdWvIc
	KgIQTsmg+unG7/285z9iHdiBFZBS10UTEV8Aw0yWp5p/JAY5ELk9zdUYmWspabK3s2vC99sdHOF
	HCUDmBKr78BwyR2ya9RWFNB7GJFSUKsLQZ9ksZci4N5C2I9AqfFjF/Mqau1/wmGshKa91Nxd0C1
	kP+6wVCcSHSKcIZE2+O/6KxlAc84OINymLDOJS0V34yswMFaFTsVuQIZXU7IR416shdF/jIqzaB
	f++SB+AoriQWbfcTw7CnOe3pX6WCTXhZLMD84Pyq3Wmm7NkehWF+Wpd94uRhxi9P7u0m5Ki0=
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15464778a91.14.1792043472114;
        Wed, 14 Oct 2026 22:51:12 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15464767a91.14.1792043471638;
        Wed, 14 Oct 2026 22:51:11 -0700 (PDT)
Received: from [10.133.33.32] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2614738a91.15.2026.10.14.22.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:51:11 -0700 (PDT)
Message-ID: <aaf175a7-86e0-4da2-a3fc-df87d906f800@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:51:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fix MLO station firmware crash
 recovery
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org,
        Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804175004.1761075-1-jtornosm@redhat.com>
 <20260804175004.1761075-2-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260804175004.1761075-2-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: frqR1n4AZ0UJxFiuVOV0ozMtULxnpMj8
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad069d1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=s5qa2rFyFl07KiwIxvkA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX954PRxgdJ040
 7i/y7jkbGvuX/vjTu+cDXobpzvbtyP8wvG/jpuvFgHeZzf2Gt1J4czyvfOxFe29ZtXgUkBoE/jI
 WE8IYD80NQddBi6TuqG7vFoyf+l1u508zt2N944kW9y5B85M8ZAHf65bBszWrnuWD0dudPsHx4U
 fuUqpWQRqdck3eU/U8Q83X6sYFD+poO23JF/1MXvQ5uNKvNQCrMRhYxsPvpDv9xBTZLkNNrrKXu
 LbGT68dDu9TchEwWcF3/FR5jLV5e62eenVK7/GV1HPVyvwJM3LISL7NowRwDUcn50l3DzqMrBKo
 J7cJ/cUbns0cCE+bPQW3Sw5KkOGLAC36Gqevcki0ZXdwTXX4IpcKw00IoL6PvKY1Py70cUKVuYP
 VutEEWtWb+u5HorQHZHdGN7Zlv0FQWvZKBhrTYFzf3WBZRlG/wEYsyAasMCm8NisjRXzM9obj+a
 UR1z4Hf+zfRqhUY59rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX70Nwku0BZuAc
 pllpdHM36CnnfosLVo7x23zSX/+/w/MH49SzOQdcG63057qZkeio4mFx0jHfI+7B/S35ey1jukJ
 Ejdm1B5pFXdBQnco+GYklLMsxe2xCok=
X-Proofpoint-GUID: frqR1n4AZ0UJxFiuVOV0ozMtULxnpMj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_225115_513799_1F52AF03 
X-CRM114-Status: GOOD (  21.62  )
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


On 8/5/2026 1:49 AM, Jose Ignacio Tornos Martinez wrote:

[...]

> Fix by moving clear_bit(ATH12K_FLAG_RECOVERY) from
> ath12k_core_reconfigure_on_crash() to ath12k_mac_op_reconfig_complete(),
> so the flag stays set through the entire mac80211 reconfig phase. Add
> ATH12K_FLAG_RECOVERY checks in change_vif_links, set_key, and sta_state
> to skip operations that are invalid during recovery. Add
> ATH12K_FLAG_CRASH_FLUSH checks in mac_flush, station_remove,
> clear_peer_keys, dp_rx_ampdu_stop, and peer_mlo_link_peers_delete to
> return immediately when the firmware is dead.


I don't think patches 1 and 2 are the right approach. Guarding every callback that can run
during recovery with a RECOVERY/CRASH_FLUSH check doesn't scale, whatever callback we
forget today is the next crash report. Besides, such guards don't help those in-flight ops.

The actual problem is that nothing stops mac80211 from issuing control ops while the
ath12k driver is in mid-recovery. I'd rather fix that than keep adding per-op checks.


---

Hi Johannes,

We keep running into this in ath12k and I'd like your opinion before I send anything.

Firmware crash recovery in ath12k (and probably other drivers too) is slow and async: we
detect the crash, then do driver internal state cleanup, then power-cycle + firmware
reload (total ~1.3s) before the driver is usable again, and only then call
ieee80211_restart_hw(). For that whole window mac80211 doesn't know about the crash and
keeps pushing scan, connect, add_key, sta_state etc. into the driver that's tearing its
state down, which gets us NULL derefs rather than clean failures.

The trouble is I can't see a clean driver-only fix. The driver knows the device is gone at
crash-detect, but it has no way to tell mac80211 to hold off until it calls restart_hw().
in_reconfig would do exactly what I want, but it's only raised inside restart_hw(), which
is far too late for a device like this - by the time it goes up we've already taken the ops.

So the driver and mac80211 are out of sync for that window and I don't see a good hook to
close it today. I see two ways out and I'm not sure which you'd prefer:

1. Do the whole recovery inside the restart path, i.e. move the whole thing including
state reset, power cycle and firmware reload into the driver's .start() reached from
ieee80211_reconfig(). Then it all runs with the wiphy lock held and in_reconfig already
set, so the sync is free and no new API is needed. The downside is we'd be holding rtnl
for ~1.3s, which I don't think you'll like.

2. Let the driver raise the barrier early, right after crash is detected, e.g. split
ieee80211_restart_hw() into two parts behind separate APIs: the first stops queues and
sets in_reconfig, the second just queues the restart work. That way ath12k can do the
time-consuming part outside the rtnl lock while staying in sync with mac80211. This would
also need a few op entry points that don't currently check in_reconfig (the scan entry,
for one) to be filled in, otherwise raising it early doesn't actually fence those ops.

Does either of these look right to you, or is there a direction I'm missing?

