Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16595606D805
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U0zNhofa;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egQ5n8cr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M1XeE38Mc/cVpYmW5RNnNlS+SbEdl9mIUShJZ37Q3BQ=; b=U0zNhofawA/GIoiap7Td1btnB0
	txea+qJT8P6+qTbvzHwEpdij/YtAMiro2P1x5KK75jwBcWJD/onWrepMgOV6L/1TscE/qeQqSuD0Q
	6U3MZdfDp3I5kL1VpjRccn0q4Bzt8wscxSwhV0zBboNltlSVCZZUkIo+8kReR8KIgsyvmrbJ3xK6t
	loPh/VoFmKPyykvWb7oPnrPlI1MSa8Rse6+DP8bYAkvZ7B62OBr2cFG+MCA5zG8pt+9Xfh1YOUpA7
	y6+8gqhfsabIOGAUabs1WWMyH5Nmz72HziWuulgPJuD4UzQKT2Glkc5GxB2I1dGNwsUIfaJLtZOEE
	CZA/xZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1wH-0000000A59a-2uMu;
	Thu, 05 Nov 2026 18:11:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1w5-0000000A55J-3w3D;
	Thu, 05 Nov 2026 18:11:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF8F143EEC;
	Thu,  5 Nov 2026 18:11:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793902301;
	b=wmCg1xapTAuDwxTw7yZDr3vAXsUrHrXzjJBUUoFJQW0XwFL+XY/7ykWOU8PaiYAlKW3F
	 JihITGqiTWdau+k126kf2y2yyald5sXr27X2UApRTzH6d23dWDcgmxGsE/W2Y3TMZhXIz
	 jbmg5m9bviuf0qwFHLuv+xhzXRbbiF0D36QdXPqxSQNaR/xcsoHxA6K44uz1GF4AlRUBC
	 W4Isu4UBFilagb35o4XuSGLOba6zqtZXUVsHNZjINi1tcEK/No4J6dFH0FqDmm0+fzCnk
	 +EAnCzggtDf3AVGt2xyff+WC/II9YhJUnID/nTHsF+6HcEpSgPGO6r/ffvLoaLGR2Ig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793902301;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=M1XeE38Mc/cVpYmW5RNnNlS+SbEdl9mIUShJZ37Q3BQ=;
	b=JGt7vEf5z127jZ4OWotIgjR0J8P+VG0eMTgIBStFMwClpOAcUC7iquWZO1Gvne12hl+G
	 RJH+flMvH86FYz/v9r5Oi8Lpnrq2Guv/gIGqLKkgC1B5ZPvbZAl2+V14Lclr7oPN1EvgF
	 j+H9VrUabTo8kDoKYlwSJAo2OkAGNmzYBIN6Phwa+Rtnz8cKnFUoJpuksusAuTdx5XA+p
	 LXE2NoYWunOT0gBv3Bemq5MGUFYm7z5pxr4C3WpiUVU4csYGnDiDiW2u7UbeI+k9S37ij
	 1NGKOozV69c+Ld8VsQUVWOCU98gSyFHFssC5LH0stXh0ASnCOb4HdhK6EkGF80YLsdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CC8C1F00919;
	Thu,  5 Nov 2026 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902301;
	bh=M1XeE38Mc/cVpYmW5RNnNlS+SbEdl9mIUShJZ37Q3BQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=egQ5n8crYGSsOkn/Lhq3jl05GcmhL3gI7ZCLY+U4JguDKnLXjLC9W1CL+pzzxMkWf
	 PrcH2YtPyapidf/4liapeFZDYDVhBGpa3avr97UUUK9l9Hxzg1/cKJoniw4BlwOsyY
	 XQEqi+ddqZX1iOHbm+mJ2JI5H6XuEb1gysXcQPn57SQOGhmcycXFIEUwdJSJ0sUPOM
	 aV27hi+gYE9LDDwmWY15KtmKULdHxLIYLtfr8YxOVPViqH2b3CZBeNOyzhj10zBhlP
	 2PNXHWJ7wTxwkxQXpM9AfqEojv+RwgT7hIOW5NuBZKDYP292GB2nFzG6ewK5ADhZTy
	 VDPCZE9f1zf4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0197E473A6;
	Thu,  5 Nov 2026 18:11:40 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 12:11:36 -0600
Subject: [PATCH 1/3] wifi: ath11k: don't hold conf_mutex while waiting for
 recovery
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-ath-recovery-scan-timeout-v1-1-99a70d89e114@gmail.com>
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com>
In-Reply-To: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
 Hari Chandrakanthan <quic_haric@quicinc.com>, 
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 Anilkumar Kolli <quic_akolli@quicinc.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, 
 John Crispin <john@phrozen.org>, 
 Govindaraj Saminathan <quic_gsamin@quicinc.com>, ath10k@lists.infradead.org, 
 Wen Gong <quic_wgong@quicinc.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793902298; l=2653;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=1kehi+2vZf6P3L9xV8V0iKWZcplS1y+mhbwhClMV9fs=;
 b=UDI9djzv23u66x3aY4rEAvva7PSjSvaDNe5Vym41K6nCM8EKeDoolDxVnQMojqQ2QKiusFYSz
 xFM3ewGhjuzBs80CAlmyc608QIa7Fgnq69Y3ACAP8WVWTkH4SxnNK+U
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

After a firmware crash, mac80211's restart calls ath11k_mac_op_start(),
which waits in ath11k_mac_wait_reconfigure(), for up to
ATH11K_RECONFIGURE_TIMEOUT_HZ (10 s), for the restart work to finish
ath11k_core_reconfigure_on_crash(). It waits with ar->conf_mutex held.
But ath11k_core_reconfigure_on_crash() calls ath11k_spectral_deinit(),
which takes ar->conf_mutex on each radio where spectral scan is
enabled.

The wait came with commit 38194f3a605e ("ath11k: add synchronization
operation between reconfigure of mac80211 and ath11k_base"), the lock
in ath11k_spectral_deinit() a month later with the commit in the Fixes
tag.

So with CONFIG_ATH11K_SPECTRAL the restart work blocks until the wait
times out. op_start() then sends WMI commands while
ATH11K_FLAG_CRASH_FLUSH is still set, they fail with -ESHUTDOWN, and
mac80211 gives up on the radio. Recovery never succeeds.

Seen on a QCN9074 after simulate_fw_crash (debug_mask 0x1060). Firmware
start, the restart work's first step after the deinit, ran only once
op_start() had timed out and dropped the mutex:

  [  146.881170] ath11k_pci 0001:01:00.0: qmi firmware init done
  [  156.651121] ath11k_pci 0001:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
  [  156.651173] ath11k_pci 0001:01:00.0: failed to enable PMF QOS: (-108
  [  156.658853] ath11k_pci 0001:01:00.0: qmi firmware start
  [  156.663443] Hardware became unavailable during restart.

Drop conf_mutex across the wait. During the restart, op_start() runs
with the wiphy mutex held, so no other mac80211 callback can come in
meanwhile.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1

Fixes: 161c64de239c ("ath11k: disable spectral scan during spectral deinit")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..5e4bb0ad057dd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6645,7 +6645,12 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		break;
 	case ATH11K_STATE_RESTARTING:
 		ar->state = ATH11K_STATE_RESTARTED;
+		/* The restart work takes conf_mutex (spectral deinit), so
+		 * don't hold it while waiting for that work to finish.
+		 */
+		mutex_unlock(&ar->conf_mutex);
 		ath11k_mac_wait_reconfigure(ab);
+		mutex_lock(&ar->conf_mutex);
 		break;
 	case ATH11K_STATE_RESTARTED:
 	case ATH11K_STATE_WEDGED:

-- 
2.43.0



