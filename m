Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECBD606A331
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=axBHWftb;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SIDCbA0p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c+tJig5xb24t0XVZzwp57K8cfpDhjN9MmR0cfzYiA9k=; b=axBHWftbvV+moaEOPhYCI7DoLB
	3vQ+7mSO5/Id6bn8DyimKXFNc5jEm8L1EYFRXhjc5BmM61DS218UFli8lLHlfjDA0mRVaK0PzUjKR
	vi1/vW5y+KP2QtIPL+Icpd9vUElJDB08kONxE2jU5EWOBnu+s7yqmi8g1qciD3QC+SRSV2ya59MBx
	f+bYuL8O2nJmzHtD5uxbJXj4sI8AjVAL7SYHkgYvTEM8+9ok57NJxEFl2JqtKSzDfUv0QjMZDH+nX
	2UMHPKL5wM21D8/sxGxoAqObr92vYAtzpNLOFPCEf4QWTMB2NPrOUKkWxQeHVNLUKmZFw14ephtzl
	Ne9qR7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1wG-0000000A57J-1oQY;
	Thu, 05 Nov 2026 18:11:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1w6-0000000A55L-2VVY;
	Thu, 05 Nov 2026 18:11:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C8DB40E1C;
	Thu,  5 Nov 2026 18:11:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793902302;
	b=Ny0Gf+M8GbBe/xXqw9sIekWEVUxvxJO3pJ7MQT7igT+F9XQr3GXokyaUn4KJVge/FMRg
	 d8slm06BqsHEJ5c8Gx2pSrvnlnn05PEQ1vQsKa8MaZe121xTXkJJ+ttCeJFpFsZP7QvjV
	 /wrjaTIV0xbGpJTgTYVHX6isIy0Ljbx2FACGejr4ItVByiK1O1WcIhZDPPkkHVnmXqoCj
	 nikzB8cf3O3w5d1DELkWaH0DI8DH68p0BeTnSazcZnbXJACSLPn0nlmY+2AprwsOu0OIA
	 Sftd7CmpWmw/lZGsSUH1EkB/MR9TLD3ueMZQBipV/F6TDwBRumUF8vnH8KrBj85s1Xg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793902302;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=c+tJig5xb24t0XVZzwp57K8cfpDhjN9MmR0cfzYiA9k=;
	b=hHcuopev3WfpZa+97zWm1z2GrBULr/cWyjd7uIRGU2Jl2h8HBYTkLEAvevjgppyylxWb
	 RAPbHeoB6ZY17rV6W0D+bOvYrSqgzLYI46brFNjEgW1UuientEYi6cxjKCIok1/YW7Nxc
	 eZbiqX6SDXmTrcY35PMXe9DLicKSddKAgiD2G/9hW9mdOlGDxHZ6lLQLFvqLdgDtR4oiD
	 3Bp9e9xztfQMTdPtZXSKwe4rCUz2pxdBDwtGm2FBz+x0EJer5oxCvFAA2IvptMRXJ9A+t
	 U6EgCLNy2Q6ySBte8mN/t+P1gTxKKN+iCqUyxY1Aa0oNZPGt2aSGN1+LBau5ZH6HOHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 946A61F00A02;
	Thu,  5 Nov 2026 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902302;
	bh=c+tJig5xb24t0XVZzwp57K8cfpDhjN9MmR0cfzYiA9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SIDCbA0p3X4cLq3yGm5Ey8gn21t9YRlBbC2r1LrD96kWZNolqLBAqYQLcRQ30zMWQ
	 c7tcbd8G/MMIteCnmG77hQOlUs2SSCgR1BJuNMsiAfSaNAGguh4RDzrqjuyoVj3EkX
	 53aLDeeoSBqe/LSNNhpX6mdd4jyXYsX1YA2qf5oGBL7005RZujqIvVjvqnsA2V6u99
	 T+OmVBIAniiSFPa3CXubQnLCNEMTbAKGAenfw1wGS7dwdJJzQitr6L4f11pxy18EaR
	 BPh0fqc+JMJtl9HEtnVIYmQZa3iaRo4cvmp6RSNuJtMkT8czQCcNYlBULpG+izW8SE
	 08ayAVxWpq5ow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 20A8F473BD;
	Thu,  5 Nov 2026 18:11:40 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 12:11:38 -0600
Subject: [PATCH 3/3] wifi: ath10k: don't arm the scan timeout for a scan
 that did not start
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793902298; l=1474;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=8zbD+lVnCTk/jEl5MxoVBJ8ccaebPXe50Jkz06PSJ0A=;
 b=93y/2nl2YnFu6ut5Bipi9DZVLRdNz+4uwAG5tLNRkc+9yVtXFwKW2evOomIGBWZaD28W8JsoP
 soM4m5afM/6A/qZsSUC5/VBfZMLOzbkzBho8GVpxty70WnYk0VTebWq
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

When ath10k_start_scan() fails, ath10k_hw_scan() sets the scan state
back to idle and returns the error to mac80211, but first still queues
ar->scan.timeout. The timeout then stays pending for the full scan time
(20 s by default) although no scan is running. A scan started within
that time gets no timeout of its own, as the work is already pending,
and the stale one aborts it early.

Don't queue the timeout when the scan did not start, as
ath10k_remain_on_channel() already does. Until commit 634349bae0b2
("ath10k: move hw_scan worker queuing") ath10k_start_scan() queued it,
on success only.

ath11k has the same code; there, a QCN9074 firmware crash during a scan
left such a timeout pending.

Fixes: 634349bae0b2 ("ath10k: move hw_scan worker queuing")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d6c20..2fded15b61721 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6491,6 +6491,7 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 		spin_lock_bh(&ar->data_lock);
 		ar->scan.state = ATH10K_SCAN_IDLE;
 		spin_unlock_bh(&ar->data_lock);
+		goto exit;
 	}
 
 	ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,

-- 
2.43.0



