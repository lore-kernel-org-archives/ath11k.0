Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812E0C5B559
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3iXBYgqpYwNLrOckttsb1krT363UJpW6TaGwrShnUjw=; b=HJI2sRluWiaMPoVbRVFeT+9aLH
	zqpdu9SW9yw1vweggITeEbU7jXGt0oT2inDGljdwHp1qttpt6hDtGYMw7PVoH3UkiMH2PyKMtOAZj
	WZ3XzOLbg00O/qhY4uQgC1bCnxoNgH2C9cP7k/9Pz4cQjPU7CGoauERsTvPexlI6xUhxgeMhq6Oul
	7UUmEfqN3NDDzQ53saGyjt8jgKZ7TLuCD9Iv7QLvzlONt71FB+eBBX9WyAcffGcM8zugiVKakKokt
	FQYAnHMmjAhClwcWFAhBkqakYwqWDlCZmMYwCygG0sZD4gM0ukW5UzMY1PhSa+PIfbz6sp4pqY+/R
	KZkApwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpFm-0000000DawC-4BpT;
	Wed, 04 Jun 2025 14:38:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpE5-0000000Dae3-0ljE
	for ath11k@bombadil.infradead.org;
	Wed, 04 Jun 2025 14:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3iXBYgqpYwNLrOckttsb1krT363UJpW6TaGwrShnUjw=; b=Fuh6cX+q49o7JtYqKGZmLlPKJR
	lP1nbTRHsUwHkXM7t1L5PELEEufulsqf+9QLZxboM9Br9RXcdqm3TCXUWh49K4BmrxCgUJ1/TNBtZ
	2wUekr3UZebeozYCEAXZAsxZEFJvOtwteAUdY+qEMW5nHolNH/Z0gfC/Rv7xaEGqpt2JtfzM49N/6
	KHBSTCviktPDI6v5AHUQh84XJ9FbORUVBsPgrcvo4j6u5UafXYf4QsYpkiapCtmFCOY6inaeSznG/
	OB+rvEeTHzfRLIgBzyBkPJOEX61w6d4/fVEIQC52GUP+3o6Hyjow6LFugLxg8nG35HqkkdRAbWRlV
	p5pRHnyQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpE2-00000000uML-0tg8
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 14:36:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55CDCA503AC;
	Wed,  4 Jun 2025 14:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B409FC4CEF2;
	Wed,  4 Jun 2025 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047771;
	bh=bBea28t9w+SP1kNsex5/pyeXu82UeQzcQARI9RSlSM4=;
	h=From:To:Cc:Subject:Date:From;
	b=dUkq26BsEXCfX18Btfq6dPJlC2IbQpDL6jXDEumT+Gx5glJFMW4x2LqrNW14t+eHT
	 tV4OvgxC83dt1vyxXUPBVby5KIq/++XnNQkef+xl2b2D7OpbGzVLV5QCINhYHW+ABI
	 maXCX+aRn0SMC4+g+zLGOS/1k9mAKHooFCMI+dnCrjWhEkOS0NCbMZzaeFzHkOvVgc
	 gQjgUy1R8GxDImMQHcjYwetRb2r1a7h9ELMZqeSH3itKuoMekmfxI9GenySvWtNRwg
	 HptPzz/9psi13fW39DOc7rqArk5EtJajnjIKbYPG8O0c8a9a+U/T4j5LpqRo17X5Bc
	 i9aRyVIgSesPg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uMpDs-000000006nG-3IZb;
	Wed, 04 Jun 2025 16:36:09 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/5] wifi: ath11k: fix dest ring-buffer corruption
Date: Wed,  4 Jun 2025 16:34:52 +0200
Message-ID: <20250604143457.26032-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_153618_423501_4F66F6B0 
X-CRM114-Status: UNSURE (   9.56  )
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

As a follow up to commits:

	6d037a372f81 ("wifi: ath11k: fix ring-buffer corruption")
	ab52e3e44fe9 ("wifi: ath11k: fix rx completion meta data corruption")

add the remaining missing memory barriers to make sure that destination
ring descriptors are read after the head pointers to avoid using stale
data on weakly ordered architectures like aarch64.

Also switch back to plain accesses for the descriptor fields which is
sufficient after the memory barrier.

New in v2 are two patches that adds the missing barriers also for source
rings and when updating the tail pointer for destination rings.

To avoid leaking ring details from the "hal" (lmac or non-lmac), the
barriers are added to the ath11k_hal_srng_access_end() helper. For
symmetry I therefore moved also the dest ring barriers into
ath11k_hal_srng_access_begin() and made the barrier conditional.

[ Due to this change I did not add Miaoqing's reviewed-by tag. ]

Johan


Changes in v2:
 - add tested-on tags to plain access patches
 - move destination barriers into begin helper
 - fix source ring corruption (new patch)
 - fix dest ring corruption when ring is full (new patch)


Johan Hovold (5):
  wifi: ath11k: fix dest ring-buffer corruption
  wifi: ath11k: use plain access for descriptor length
  wifi: ath11k: use plain accesses for monitor descriptor
  wifi: ath11k: fix source ring-buffer corruption
  wifi: ath11k: fix dest ring-buffer corruption when ring is full

 drivers/net/wireless/ath/ath11k/ce.c    |  3 ---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 25 +++++++-----------
 drivers/net/wireless/ath/ath11k/hal.c   | 35 +++++++++++++++++++++----
 3 files changed, 39 insertions(+), 24 deletions(-)

-- 
2.49.0


