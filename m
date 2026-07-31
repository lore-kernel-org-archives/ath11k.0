Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A09BC55173
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 22:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djLiBrCrntR2/g21yzu3z+y0eymgeWBUmxdBpdNDfug=; b=Wmxoj6Qtm5DZale3N7RhnNbUxz
	b51dqrKMooqGY7z5jjycC92y03Ttj0j7F6HgKDus9t7Kf8rjirDIKv8EOSjIBLKa7BnQh+xHtJ8v2
	mUIpIgIIAjkTOyLI3/I71rX+c1RSFDpaQU8U2IFFBG/N/TmwmKFnli35hoL56CaTWDd+MVr/GTkGv
	iiumeWW08sBIWbEOZbGIX1LreXqcPWxZuXFMwER6wt2DoJ0MgLcBEAgkbgbKIn1so+XsXyYBcoNGh
	gMzXWnwBNQqS7Ob/TPpN5g8b2DqwD/Tvag1tzf6pjZmOKQ1cODriUhWRRCLcJ6M7uGJVfTrlHIceX
	FDvpPJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvKq-0000000Depa-0JY1;
	Fri, 31 Jul 2026 22:04:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvKo-0000000Deoq-0DwM
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 22:04:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VM0rQ7910113
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 22:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djLiBrCrntR2/g21yzu3z+y0eymgeWBUmxdBpdNDfug=; b=kU1raL0rs+7Krbr4
	rYXNg2OZfV+iaVADXFJ5vs2lOpu0FOApn3zvlhKWoyFpPeIuOEGMTXCXmphnyxpa
	bHEOLNiZBQaB2uZ6GgWY1AWMzzHojxBqeRUl6KVEBwyZ2s4FmKY7nMXctWzPBy5H
	qgBkU7ytWCvP5MHVlUL1/7bKS27FM3Q835/do0Ra0WHHfArak98kD98A/qOXkD5Q
	b0LAcqlqJfl3p2yVY0bneAWqa9YchV36H3pMPkUCMJZmPa5tYkyJ1qcGxr1bw/ka
	vHKWK6Jw6Q/KCsMlrJ+tdmJauJHYJDtXLgp16dQ+fNigSSuUEe6po3W+vWbY/cDg
	C8M6tA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frugh2ft4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 22:04:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1667860a12.1
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 15:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785535445; x=1786140245; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djLiBrCrntR2/g21yzu3z+y0eymgeWBUmxdBpdNDfug=;
        b=U3a0WVlR8sXImSb7aLbEgG2Dr4lCu26NJR6+PTvJoiQvWfDzZGbNQ66koszu6T90s8
         QWL18m09eBtblDsP6HgYqwUHFtvI5VVN2bIMUoE3htUnGJ61VYs/jnljNUhWf7s+U2GD
         TSS2ZbLqa61lG3tqjZeHcUyHdZRJCjakCPVA9i4wVpoH5dnR/2Twkmm9edAV6On8Zc0e
         tseiUHiJSerkdcrHkUjfKAD3x8ib1HKzo8vhgfW6W7loNjkEnJbXMeBmFuTCduFPoswF
         SLpT6hlLVtOqg1oYwi1+uvo/t3nqqNqDqZsFDSDBZdVPA6QAkQcIPCVz6GA0Dva2/xNZ
         3FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785535445; x=1786140245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djLiBrCrntR2/g21yzu3z+y0eymgeWBUmxdBpdNDfug=;
        b=n6lkovmj6cCR8V0Lv9okwNhEKl/qg037w+m3Tas5RMklYMJWl1WgHqj1CxO5EAX2DO
         c3imLjr15w6oneRK4KENYQv5ylrUvD5sR9JFYgoXIeM2hImax/cwLKR+Q1/PXITz9wnp
         zNEo85kDvmd1xymnz+nKGzj9ExBjLs+0wQ6ErL4sqTbwPDA4seG9N6DbKmMLvGCJBtXA
         obDL/t1ZKvx6x7DJe0uYI0ZnKRMyKx1UYqZ+IB7EdheCxJqkEHgkS5JUWRsHTDDAh29T
         9MkF5VB/OxHGDejsAVOoBgDVsMx+SsLjStsgOzd3hN/CiKnaO7BQC27zoKbTs1KebPIR
         DrsQ==
X-Gm-Message-State: AOJu0Yw/GKoqOUTyZtDXPg/r79qGcj0c+Nm2POQrf1Vl1sTlbUJMtlGm
	Zvk8aSdKjXtFvWCBCmNMfZZgCQ3rShsMW/02GpRDMR0JBsDhz7CzdIBRe8ASzkRJyMqEZtGgjE6
	OAwdzONdbll4Ho+d4tISnYBzTAhokRvwG/DTiQQWbASHQ6LTqxiPgcY3ew9exF01X
X-Gm-Gg: AR+sD12OixIQxXIbdB89wZI9yubZNz/YW/chcA0eQHRzblYTx1++i1Bbemw9qinVO0Q
	YcCh5t0BujMHbQeT4W7zNax1w7cgDOjkb8nCL4oTVfP3VwV09Oj6qjmutiXL4BCnic65AzguZHW
	tNWvzsb9hNgCogVMfcfl3xbnelcloDPfwCNP2q5TrA4Ujs7m6cDpWHwm4+bMW7d0c4pnt0u4WM5
	uNYrfAKqiKqahAFgkOxiF6DA+5qJEnGxGIbccRtGv8Uqf9u+16q7RhT5ksRqDghglREO2i45vdE
	O/O5io4Tfws1zv1MehQCBF1hB9GyG6VSW0njKgGHbNiZvTYYms/LqQ2UMCIYC+qSVa6wmHJpoqi
	RfttYuTcDdVUNpeJZAKzl/DrocYQ0KG1C63wbj44wuU8nXCPq4kteNFKfIzc=
X-Received: by 2002:a05:6a20:4499:b0:3c0:9c19:65ab with SMTP id adf61e73a8af0-3c92a9054e1mr1240316637.67.1785535444655;
        Fri, 31 Jul 2026 15:04:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:4499:b0:3c0:9c19:65ab with SMTP id adf61e73a8af0-3c92a9054e1mr1240278637.67.1785535444178;
        Fri, 31 Jul 2026 15:04:04 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm12966664eec.16.2026.07.31.15.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 15:04:02 -0700 (PDT)
Message-ID: <a9565939-0ff0-4672-a733-20692b9f9f26@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 15:04:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] wifi: ath12k: fixes to improve MLO station stability
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260727162748.963275-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE2NiBTYWx0ZWRfX+u75Tm4p3RLQ
 YEwNkd+ywWOi6tOHFve8awhMkzNdeWJBEnTfCvPh38vu5kYiFNvfHFJUqeHUhGe9/8yrlFkuYyw
 od55yrbeKuwxvkoP5UpVkcQEZp+dxenvTU/wTb7TYQ7YeAXKpQCxvkXoTBl9C0OS/zDpDVn5mcB
 QQeBR4BZAMkf9NIXFrvnDkOR+JucvSuugTlGOHS7Gdi6u2MzqQMHGPJBlnHLaRmUnTTg7rHDwiQ
 P9lqo7dWWsDEx15IaSNMpIyCcDwo3XjGxqFZsEUYEzLfQ43Iildwbbm7xNU2JXI8IrVjVkVR8OV
 /A5xuFmwVMJb20RJXROD3Tt5MDIOuNSf09jawGKKZD+O+QUHVxpn0qS37ZurL3F1o7WlwhbckJ8
 vnVbfLBno2RZN5ebt/2MbqpoPSv888l39332FQtv+dC2zZOVXYBBhn4ITrP7B0QvzIBsGZKhmk4
 DUgIZgCIXv7rh9bsaQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE2NiBTYWx0ZWRfX/QPeSGbtW86G
 sis34m48btnjWJfAHBa5zfxiThEVf3j9sIb/3WvunwAZsvtUtpxRJYdnId353Bft/RR+0L3VkUc
 ZHAhA0quF/glsEWMsvolYkQIHM5uCwg=
X-Authority-Analysis: v=2.4 cv=U+iiy+ru c=1 sm=1 tr=0 ts=6a6d1bd5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=vNYMOvrsSQ6qDk_1z1wA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: eGmbrQGNrXMSgBetkqkHTBWmMcGbrEyH
X-Proofpoint-GUID: eGmbrQGNrXMSgBetkqkHTBWmMcGbrEyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_150406_103930_913C7CA8 
X-CRM114-Status: GOOD (  15.49  )
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

On 7/27/2026 9:27 AM, Jose Ignacio Tornos Martinez wrote:
> This series improves firmware crash recovery and connection stability
> for MLO (Wi-Fi 7) stations on ath12k. Both work correctly for non-MLO
> (Wi-Fi 6) stations, where the driver handles the full teardown and
> reconnect cycle without issues and maintains stable connections. This
> series brings MLO to the same level.
> 
> Without these fixes, a firmware crash during an active MLO connection
> results in kernel warnings, NULL pointer dereferences, 20+ second
> recovery delays, and periodic disconnections both after recovery and
> during normal operation under heavy traffic.
> 
> Patches 1-3 fix firmware crash recovery:
> 
> Patch 1 moves the RECOVERY flag clear to reconfig_complete and adds
>         CRASH_FLUSH guards to prevent operations on dead firmware.
> Patch 2 prevents scans during recovery to avoid NULL dereferences.
> Patch 3 fixes ML peer ID desync between host and firmware by syncing
>         the peer ID from firmware's actual value.
> 
> Patches 4-5 fix MLO beacon miss handling:
> 
> Patch 4 fixes beacon_iter to iterate all MLO links instead of only
>         deflink for BSSID matching and connection_loss_work
>         cancellation.
> Patch 5 complements patch 4 by skipping connection_loss_work for MLO
>         entirely, since its cancellation mechanism is unreliable and
>         the mac80211 probe triggered by ieee80211_beacon_loss() is
>         sufficient to detect real AP unreachability, as done by other
>         MLO-capable drivers such as mt76 and rtw89.
> 
> Tested on WCN7850 with MLO (Wi-Fi 7).
> Firmware crashes were observed to occur spontaneously during normal
> MLO operation with intense traffic testing, though rarely.
> The debugfs simulate_fw_crash interface was used for systematic testing
> and reproduction during active MLO connections with traffic.
> 
> Note: I will have limited availability from mid-August to
> mid-September. I will address any review feedback before then
> or promptly after returning.
> 
> Jose Ignacio Tornos Martinez (5):
>   wifi: ath12k: fix MLO station firmware crash recovery
>   wifi: ath12k: prevent scan during firmware recovery
>   wifi: ath12k: fix MLO dp_peer ID desync with firmware
>   wifi: ath12k: fix MLO beacon handling using per-link addressing
>   wifi: ath12k: skip connection_loss_work for MLO beacon miss
> 

This series doesn't apply to ath/main, please rebase:

Applying: wifi: ath12k: fix MLO station firmware crash recovery
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.c
M       drivers/net/wireless/ath/ath12k/hal.c
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/peer.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/peer.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/peer.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/hal.c
Auto-merging drivers/net/wireless/ath/ath12k/core.c
Recorded preimage for 'drivers/net/wireless/ath/ath12k/peer.c'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: fix MLO station firmware crash recovery


