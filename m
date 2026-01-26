Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AF1CF65E2
	for <ath11k@archiver.kernel.org>; Mon, 26 Jan 2026 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yf1eR3D3wjW05aK+sD0oy7D2kJEgXG+NVJDJ1InbAMI=; b=fGmvX1gf/P0m9V9FA6m351AVYl
	GeLqRW17jnKG1vaM+RxY0z0ru25IVYjuCjEz2gZ+yk8Yfxq5PaSA6wMzMXNNFlU2ABFBIaen3bNs+
	g3EVWqTatgj0tTMQjYlVYeRN3MgoDzFaqLQMQHtg8TdLDvW5JKhRIeGXYwSjf3E7+OsMoLEl81oe3
	VZbUMws64dwswRBIvpeWDWjW5JO5Ej+z7cYi14tqsz2oULdom3xWdQf2vr1nYY0S4dRqHFzHy0QRk
	plVCD6Vu/dtEj9YlefXSzEFIaaW826zTMuwSJLU+fUSgJGBhp7efzGroYS6xRO4y2YMC8cyLWd1aX
	dQ7JYAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKzX-0000000CQKv-1DN5;
	Mon, 26 Jan 2026 11:42:48 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKzV-0000000CQKX-0lns
	for ath11k@lists.infradead.org;
	Mon, 26 Jan 2026 11:42:46 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-432755545fcso3204020f8f.1
        for <ath11k@lists.infradead.org>; Mon, 26 Jan 2026 03:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1769427762; x=1770032562; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf1eR3D3wjW05aK+sD0oy7D2kJEgXG+NVJDJ1InbAMI=;
        b=lb+q2Se2HjI/nx24M4xeWNDj9SFixW707QCG6P/VgmkZYko3/bWUWuWofGzOvnxTOi
         4nfKNeaeRNONg2L9QfRmDog77MzW1brKzGyUdQZTEU54WNjclMkcOVqocv8uqwguioUM
         A3nZxZFBVAcwVZqRTCYUcXz3+pYS2Plp0lv0c2fVcHWj1GT2JUnQS0biBUsyTQKfZjmq
         eIi1q5RretKg5us1HjYT1SDpSV+zooGCezhgMLUtq+I5U4P4YMoE2H/I3QdhnyIHt8hv
         oM0SHEtTuhAMIoYEU0he4h0LfbVGF7yY76u/7YsqVjV39K2iiqntH75LHAVGiq2QOKnL
         v9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769427762; x=1770032562;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yf1eR3D3wjW05aK+sD0oy7D2kJEgXG+NVJDJ1InbAMI=;
        b=vicGZLHGLDXvQi06n/xmSyI4v+4Qc8RC26fa7VcOagavS02ixbtHfMIjQpwnAGK5lz
         l/zH6SWVtHuEk6HdA1vDQ7YbxOVb9kU1pZOZWYSTSORddg9Ewr3CvFeyBShKALOZTUkR
         PL0PfEJTO6GWP2BYz1y0cZfP8jNRrj6gkomQrK1SFdGaNa3zRQmRLZ6kKFg32xhk41YM
         WNXPcEhX2vnkg3MY/vDZCAJqR2W0xw857/d1VJ7i7EQSSHlfrJiCXflYGwe+5GEyzQGL
         0ZI6/VLDrMFqYSs0WUP2AzolGnYn3Aa9LfvJ822NjNWtndspW015HDV8rcMgA4ptnvrG
         rdDQ==
X-Gm-Message-State: AOJu0YzdKU8+43mxm/G5WS6SXNirI2gtWiBP65DNEcEY0tAJUMkx82Gy
	eueZuIGvHX/573KtULvJ0suRB8/3s/cJ0MFId4MJfgVZjIyqVBXTY5Rvy2IR9UStAaV+A+8BB4I
	IUOTTiq0=
X-Gm-Gg: AZuq6aJIhQWxhCgBt+aGgytk8031+Y3wpSPUZH95YaFsdcG62/5+BV0blT+ENhTT2Ov
	VEXi1TaAtqAWzomK/Y+Y6hmOH61fQ52CLFQvbzHkRC7QzsT/Bjns1+zonb3KozqKJS9AIB1WcGr
	9smTi1qeo0hSBnHqK3Kp3OY/9BDh/6hUdgXrSmbfsDBtnYDMbkJtOHgy1v/TMXIKoopyt3Jn013
	yNRHhR0zRIWU2BJOISiHhwy/+c8OGtcR8GL0A/8o4nlSuqYMlnonDnNHOZQ74Ht2uBnIyV92KEa
	tBAfq3e6dJuGAI775Fh8qNtK88QeOMaa7MUkYa/UZaQb2DURJEfnziDg6mzLUvyjDPprlL8boQ5
	mZ0rlxZFgDyTGP7qr3J17xtUWEyt7gxOH2N1hhVxgySTIMDQXFHHbd0JokFlp4AHpdkcS4p15mC
	0iwsIHJsEnXQdRtpkx7mg6AC3EltxVHqUrTfBOw0ljCA==
X-Received: by 2002:a05:6000:22c6:b0:435:bbde:e050 with SMTP id ffacd0b85a97d-435ca1a7979mr6735706f8f.52.1769427762416;
        Mon, 26 Jan 2026 03:42:42 -0800 (PST)
Received: from [192.168.108.101] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02dd4sm29259132f8f.5.2026.01.26.03.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 03:42:42 -0800 (PST)
Message-ID: <3a663eb1-2419-4289-b706-654c032512c4@freebox.fr>
Date: Mon, 26 Jan 2026 12:42:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ath11k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
Subject: [PATCH ath-current] wifi: ath11k: fix wrong TID passed when stopping
 AMPDU session
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_034245_307008_7E0D11BF 
X-CRM114-Status: GOOD (  11.20  )
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

When handling a DELBA request, ath11k_dp_rx_ampdu_stop() calls
ath11k_peer_rx_tid_reo_update() to tear down the BA session for the
specified TID. However, it currently passes peer->rx_tid instead of the
entry corresponding to params->tid.

Since peer->rx_tid is an array, this decays to a pointer to the first
element, effectively operating on TID 0 regardless of the TID in the
DELBA request. As a result, the BA session for TID 0 is stopped while
the intended TID remains active.

This leads to incorrect BA session state and may significantly reduce
RX throughput, as traffic that should use aggregation falls back to a
BA window size of 1 on TID 0.

Fix this by passing the correct TID entry:
   &peer->rx_tid[params->tid]

Fixes: fe201947f8bd ("ath11k: update bawindow size in delba process")
Signed-off-by: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
---
  drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c 
b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b9e976ddcbbf..8db04c38dfba 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1132,7 +1132,7 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
          return 0;
      }

-    ret = ath11k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, 
false);
+    ret = ath11k_peer_rx_tid_reo_update(ar, peer, 
&peer->rx_tid[params->tid], 1, 0, false);
      spin_unlock_bh(&ab->base_lock);
      if (ret) {
          ath11k_warn(ab, "failed to update reo for rx tid %d: %d\n",
-- 
2.43.0


