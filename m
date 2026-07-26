Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB8FC53209
	for <ath11k@archiver.kernel.org>; Sun, 26 Jul 2026 22:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z6N0boIWyU0J5K0rc/NgMjVGoZ83sDuVKA9GvDpL6Ug=; b=ai5LBCXBZlRYSchyIcINBpbxdi
	LynFny0FyJfuCEqdEbSxJrEtBpPiFTdtl9m436V6ltk87FpE6CI0oGXZ9JW4Up+Ao2UBVqCveFgLK
	zCRbBdpdb/t189XRKmklYDe6aNqdKpRqLyS8dB1+SVd/Vd+tBjLugS9dlEy80Vvdv+GhlziogXu90
	aXJXaKfH5Jbkgk6WP6BLuWKt/w7lRWKC0vTGrx6+Wv37S1bLNiLWuKPZnGMhipex/IAebezLMdyRe
	xAChDPIQd3r9vcTTxdtXghTdv7n8Tjl+z9uVaG/DK4MhE75CWsg5aBoH4tnJgMfLbnrZVW5oniR9K
	R30z2qMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo7CE-00000001ggG-3Y7q;
	Sun, 26 Jul 2026 22:19:46 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo7CC-00000001gfM-0f6q
	for ath11k@lists.infradead.org;
	Sun, 26 Jul 2026 22:19:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso268127566b.1
        for <ath11k@lists.infradead.org>; Sun, 26 Jul 2026 15:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1785104382; x=1785709182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6N0boIWyU0J5K0rc/NgMjVGoZ83sDuVKA9GvDpL6Ug=;
        b=IICSFTpiGcS9l5WPh3i4WUt1w1H7GNLAPha1Rqj/uP51kv//lcn2tAbwtQ0MF/XkZX
         SRuB8lkv6vN+odBKo3E5ZQv8hw/4aLJKD5OeGds8at+hCzPIsixRVnzeTlcOumoCxV4I
         Y+LinMJPzH6xxY/2STBrrn7vh8Bp8swpRoc0spRJ9rQEjQYGzJJuDw3MebAcEamMOSv1
         mP7bpI/wcn0Au4Vw0jkOaWGAc9CEXoU95ivd9G8bJCk958ti6Cp1eSSHLSw1Dc7hjhI5
         43uAqp/7JWdBHsMgCiyDtjyi3cMmReXwLFTLqp38ALitRCv1wQTe04WiQ44Q0pRSUBMX
         HUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785104382; x=1785709182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6N0boIWyU0J5K0rc/NgMjVGoZ83sDuVKA9GvDpL6Ug=;
        b=MeLTwC3vpkJQhv4TwDN7JgvMNMmCC96TSPQJI+3sSgZG+voVuph+DQVRIQDTtUVYWv
         1DV00NYWYytRyE1fCUI7BpYpSRo6tKnys5Jb9wQX7fRceYmASWUAxLAp1dcj10vvaAli
         Ds/2ty+sBgr1bdmRNWN47DCnhEiUj/pqQPSxPns95L0U7kqM/PWHmfMM/cK1eRPhABdu
         ACeqFJIQahoPUYebJjSx//TyxrvKTt2N0GwVq0p4pH92mtr9gFPAcXhKAj5yJnORsd7M
         ZKetM8wz2pqSZq8JGFCSbOutDpv8WlNEyPXoWYJ2T2kWZepF79ijTc6NcGXKyE7ZmZXx
         p1sg==
X-Gm-Message-State: AOJu0YyOCdWdG9r2ScBbqF63tuE4+SWvEjBYIO6kvgzrba3Zw/PWJj9t
	9j28ldnNO1YAGVyB2bWS8uUVOB5PGHDT9oUX1+JEK36wMnbKaEao5REzvPEzULYWkA==
X-Gm-Gg: AR+sD11k8Lvs/gxhRYtaSB5fDpFhTkNYKO2gv1FVZqTPI3X0i6D4Z5wDpMoR6r12S8D
	tgbQDPvIVLmOgMunxitB26ZE4UAeNmQOZd0pfDkEdCvBkqNhcAEymVO9L5UjE9nQ9dh5aZUVoT4
	1s/znthoM2u+ml/TgRSYJtVvTa93g8HNCCVn9DdsUjsxtPN5sn7iMC7cT0uLeSlOSiJyNJPFkt6
	zoJgP8rPr+UIEhZp/6uYtGf+f5irjxlpdL/tb255zPBONfALFDNz06OO5qzGs3hOXRLNRrXj4oq
	cLujpTrFrZQsUksewmwwaStH35TZBGU0JoOa9N67LD5nGqV/sZRQ53TlDIEG7KTx4/zyn/D6eqE
	+b7veUIH+5JwTArGBIPFgyVQOQSMzich1/qBLLEzljprsU/x1Fq2tVxpt4eyIXPYSrkH3l/zHgq
	hR7xAcO+pyfq/cOI++WLIq/LKN8Ta274Qj1zMFl/BLH+/oPXN0rUW2mY83H8W9VFcvfeTfTB00Z
	C33HcVE/ETE4zBgD9rQE/5LBXTluQgX9mw4gXttoS8lQKq2gwKJZcXyDw+VNZgvjnd0A2YuEZVP
	8zPapX+N2tuHtyEI6VBlfi0LM7ecRZbRlM2QGIYBV94ypL3Tgz++xx6yARgygYYERQvxIAOr98m
	1T2DVcG5aeruNjcbYz2soOSr9gxALkho=
X-Received: by 2002:a17:907:72cf:b0:c15:abe2:e1df with SMTP id a640c23a62f3a-c1f1f07e1d6mr239191166b.43.1785104381647;
        Sun, 26 Jul 2026 15:19:41 -0700 (PDT)
Received: from Desktop (p54affe4b.dip0.t-ipconnect.de. [84.175.254.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a76fecsm561599466b.8.2026.07.26.15.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 15:19:41 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com
Subject: [PATCH ath-next v2 0/2] wifi: ath11k: fix SoC reboot on firmware crash on AHB
Date: Mon, 27 Jul 2026 00:19:06 +0200
Message-ID: <20260726221908.104873-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_151944_224617_267BDBB9 
X-CRM114-Status: GOOD (  13.05  )
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

On IPQ8074 every firmware assert takes the whole SoC down. The DP NAPI
keeps polling while ath11k_core_reconfigure_on_crash() frees the data
path underneath it, and dereferences a ring the teardown has already
cleared.

The interrupts used to be disabled at the top of that function.
commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
moved the disable into ath11k_core_reset(), which AHB parts never reach
on a real firmware crash: reset_work is queued only from mhi.c and from
the debugfs hw-restart handler. Patch 2 puts the disable back on the
crash path. Patch 1 is a prerequisite - the CE half of the quiesce is a
no-op on AHB today because the bus never implemented the hif ops.

Reproduced and fixed on a Xiaomi AX3600 (IPQ8074 hw2.0), with no
out-of-tree modules loaded, using the debugfs simulate_fw_crash
'assert' trigger:

  before: 2/2 asserts panic in ath11k_dp_rx_process_mon_status() and
          reboot the SoC
  after:  3/3 asserts recover, 5 firmware boots across a single 397 s
          uptime, no panics, both radios stay up

Note the debugfs 'hw-restart' trigger does not reproduce this, since it
goes through ath11k_core_reset() - the one path that still disables the
interrupts. Only a real firmware assert does.

Patch 1 is by inspection: it makes ath11k_hif_ce_irq_disable() take
effect on AHB, which also fixes the existing call in
ath11k_core_reset(). I have not managed to trigger a CE-side crash on
its own, so if you would rather see that split out or dropped, say so.

Changes in v2 (no functional change, review comments from Jeff on 2/2):
- separate the ath-specific Tested-on tag from the upstream tags with a
  blank line
- use the standard kernel block comment style, with /* on its own line

v1: https://lore.kernel.org/ath11k/20260725141757.1316877-1-julius@bairaktaris.de/

Julius Bairaktaris (2):
  wifi: ath11k: implement CE interrupt enable/disable for AHB
  wifi: ath11k: disable interrupts during firmware crash recovery

 drivers/net/wireless/ath/ath11k/ahb.c  |  9 ++++++++-
 drivers/net/wireless/ath/ath11k/core.c | 10 ++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.53.0


