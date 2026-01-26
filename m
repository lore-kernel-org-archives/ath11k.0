Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD475D19502
	for <ath11k@archiver.kernel.org>; Mon, 26 Jan 2026 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/LJkjl0M29U6XjMWaR4NN1SXpHq9BdU5oG5ebxqQ4ok=; b=cbS45MjwTdoLnt4SokKuzVVGDL
	/pfvhHz69swRq4KXJ3Pqsydn5N6NauTimFishIQAJWPK0YORrc2pq1DkLdK5u3Vyei46S9/LaNJy/
	ibWQZOd/mW7es4skEp3R2Gvz6zqXq/mP5vzlWdfyMH6UDqYuGDYw2mRJxCXWyg60zwnFj1RASko4e
	VQi2VX5j3Xki449oDxMJEWumiToPJOlZAejyP5LLiy1mQnkHYOWMJaPRaZRZGzKIXgk++s9qUpCrl
	KS8+UzY4Hs31vyoVwRTxFffK5ztUiitcADcoR6f7714Mk3S7YgukxDJB1zV2vAcd4HPUBZAcqcRGT
	OVsgOIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQa9-0000000CzU7-3paG;
	Mon, 26 Jan 2026 17:40:57 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQa7-0000000CzTk-3EUN
	for ath11k@lists.infradead.org;
	Mon, 26 Jan 2026 17:40:56 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47ee07570deso36899995e9.1
        for <ath11k@lists.infradead.org>; Mon, 26 Jan 2026 09:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1769449253; x=1770054053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/LJkjl0M29U6XjMWaR4NN1SXpHq9BdU5oG5ebxqQ4ok=;
        b=eQQBCYNJ5W4e7qxkrCmbmcpeVbQT2Vl6cHExnk2gbYkZy+K5aSTLgRa1OmhuPIYMMo
         Z7SRPG1AyDDB5DN50033mYHsjCIg8i8xeTWMxPVhKLexxXoMelvtt7x3TJZ27abAF170
         K1WLmzp7AVqVzGixaPnEnv7BYLWi3eJKNIon5xI3o6t9/v4GC5PQQxUD2Z1TFST/9w6Z
         7HIvajB3ptcm0S1YYdNC8MJO2zS8eqNrBVHcqH1CWqCV+YoQpDnwidN8UnjjRHR8ksf8
         eJDhVc6/us5sDkcy4U1FIfLkEHQTiBXoLrDPpQ1kARephpWB4J9gwj7fST2FrwaDFxTS
         YXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769449253; x=1770054053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LJkjl0M29U6XjMWaR4NN1SXpHq9BdU5oG5ebxqQ4ok=;
        b=R0tLK5LD2vzryrKSfxa1lwznHxroEUTDpjYxtRtVWX+dHke4VxSoWnezOHTWAAyrPP
         mieDVhjwERNAJ5NUvKHF8VoITzHsV0CCAjFhVp2v5u8IxELiGQtix0l3kO+xN4D5/xeB
         JKfQzQFHNK7K35/M9v+djLMuHWm9znGT7ZL4KjLS33dJG0XgccymKAxUa0xb2kA5eNIC
         J1HT4aH1k4ACs9MEg/LI6sdAMwL5rTxhGa69c38mdSot2LgNITNsq08hSxW2O9/HRFFK
         EgVKBZrcuDU0rWmDRqSUtg/nHN3LknIdhrV4fvc8jdP/S/2zDgpJJ//ukOGdxYWMiN4X
         Dfcw==
X-Gm-Message-State: AOJu0Yz7J13Ut3lWt6IsYHXKzfftw/3sf96eJMknCNWvQE7HwgH0AVzq
	9Hh+Kcf/GkrNjKRZEWpsBdaeM8yGSXHOzTbMBwVOljxEXMen79+tuWPzpNN8LcAwpSlY2KtUJUp
	KGgwLzI4=
X-Gm-Gg: AZuq6aIDq4YLkq9n3yBN5v7u08HGZCqxSK1DsV9vswgaRFCMar7cM5upmsR8SrVRdur
	SMj9BuCuiY74RrKqBvawxyLiF6NEtZwcYGLFUU43rk2aR0qSUOoBUPXXT/D9FbtMnBwLASZ0Fy0
	IdShXzuL44J5PQ62X/TFBNK9fPWdff2wpqVbcN8c4iDqzAN3tTi4UrklIU5rVXUVdCNqt9an7Gw
	2AuQOh+eEFd/7UHey6BmREF0bYNcPLu/DuBR9eh/Ca7trKlm2T5eYbYJ/Li8gna6Zo7e3pJrYL4
	bf3BWaTluadhPinFSd4RkeTfvRl9tY8M5txLPYI8SH4Uv9TXh3YIuuDI/0DWOGiFsVhsMnUjd6b
	JtDphyMF4ojObEEeV3uSbsO9PhOVI1CWcmFDMmE/GVn7/JwfqEpHXmQeYjfESKO3nX6YO1Micc/
	K3X0PeouOGF0ZdgI0fb8RtNr9mU6dNB4zOsXdx/uCGyracDiJePKWtoV5rihyiAtwwyCNw
X-Received: by 2002:a05:600c:b96:b0:47e:e2b0:15ba with SMTP id 5b1f17b1804b1-4805cd407a7mr76500085e9.8.1769449253594;
        Mon, 26 Jan 2026 09:40:53 -0800 (PST)
Received: from pablomg-ThinkStation-P620.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c05e5csm4057015e9.11.2026.01.26.09.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:40:53 -0800 (PST)
From: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
To: ath11k@lists.infradead.org,
	jeff.johnson@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org,
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
Subject: [PATCH ath-current v2] wifi: ath11k: fix wrong TID passed when stopping AMPDU session
Date: Mon, 26 Jan 2026 18:40:49 +0100
Message-ID: <20260126174049.1370659-1-pmartin-gomez@freebox.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_094055_817520_7B196349 
X-CRM114-Status: GOOD (  11.80  )
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

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b9e976ddcbbf..8db04c38dfba 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1132,7 +1132,7 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
 		return 0;
 	}
 
-	ret = ath11k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, false);
+	ret = ath11k_peer_rx_tid_reo_update(ar, peer, &peer->rx_tid[params->tid], 1, 0, false);
 	spin_unlock_bh(&ab->base_lock);
 	if (ret) {
 		ath11k_warn(ab, "failed to update reo for rx tid %d: %d\n",
-- 
2.43.0


