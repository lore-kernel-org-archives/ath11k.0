Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E77C27C4F
	for <ath11k@archiver.kernel.org>; Wed, 26 Jun 2024 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w6bHykmFpxm9lToAX+RDYxNiXrku/NfShteEDvucaqM=; b=oV2hIFab5DejzMFoq2XYEGs5Wa
	eaful8rU7vwlQvcCev45yNUCWE9O2oj4HNQF1abPMyhE+Vo7bUsuGmwqGKh1fEpEntzs9IyVnmDNo
	EbA3q4yYfKlYq3JLqKceqykKYBaJ8Alowsy3cY1WhLZH9rfbV0YCE1g0Oao17Up9PqbfN6IihkcS/
	LxKjC2JI6co5+7pXdKlX/UpAyWl61906O+6cRFNYEEg0Dl+SoGe6P0ILvzf/5rFj4ANeUutmUiiyN
	6EJh3S1ZO3cXLrMPnCHuBrfCmdNCH3pfYKdh4RRibpWpGmldxag5bbvSOeFgYPHohYzKcU/Jg3Gyd
	JGlM0BCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPrP-00000006JoG-1PIl;
	Wed, 26 Jun 2024 10:26:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPrK-00000006Jmd-1UV5;
	Wed, 26 Jun 2024 10:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51B01CE20FE;
	Wed, 26 Jun 2024 10:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C369C2BD10;
	Wed, 26 Jun 2024 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719397595;
	bh=wpLxNH25+HaRa7MjpsRH1I6HxeVwu5+Y08nX+fLKDaU=;
	h=From:To:Cc:Subject:Date:From;
	b=H/awx/1YmMEbnTyHDxRVuydFD0IfLgN6zc3jnBnJwEqAhboqX/8pVoKVAKglqya5a
	 G4nxLw+AMjDKycUxkHZ7zaSvKQ/G0PvmwwoWUHfvhKTAIwWeuL29Eklz0o932Ys6VK
	 VuJlU1MMjRXpuFCO155ZG8MIx6DRaPWt8F82013fYzwQ0/3LXGMyfb2FBkKvwNT5Py
	 ILemdjnRKi0ZeAqRk6hfOBsUZ6HbuxegqcOJHsXIdV2VLsClsywxgwvYUunxZbI6sm
	 xviDMWAaJJVldxsvqX2jVSEZF8s77bxR4DgV5KpLtC8E0pTJWs+FK8eqGzI/1whnMf
	 1FMqHBfmEXoLA==
From: Kalle Valo <kvalo@kernel.org>
To: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless] MAINTAINERS: wifi: update ath.git location
Date: Wed, 26 Jun 2024 13:26:32 +0300
Message-Id: <20240626102632.1554485-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_032639_011730_C0620EB9 
X-CRM114-Status: UNSURE (   8.15  )
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

ath.git tree has moved to a new location. The old location will be an alias to
the new location and will work at least until end of 2024, but best to update
git trees already now.

Signed-off-by: Kalle Valo <kvalo@kernel.org>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..969412b75c46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18376,7 +18376,7 @@ M:	Jeff Johnson <jjohnson@kernel.org>
 L:	ath12k@lists.infradead.org
 S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath12k
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
 F:	drivers/net/wireless/ath/ath12k/
 N:	ath12k
 
@@ -18386,7 +18386,7 @@ M:	Jeff Johnson <jjohnson@kernel.org>
 L:	ath10k@lists.infradead.org
 S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath10k
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
 F:	drivers/net/wireless/ath/ath10k/
 N:	ath10k
 
@@ -18397,7 +18397,7 @@ L:	ath11k@lists.infradead.org
 S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k
 B:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k/bugreport
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
 F:	drivers/net/wireless/ath/ath11k/
 N:	ath11k
 
@@ -18406,7 +18406,7 @@ M:	Toke Høiland-Jørgensen <toke@toke.dk>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath9k
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
 F:	Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml
 F:	drivers/net/wireless/ath/ath9k/
 

base-commit: 321028bc45f01edb9e57b0ae5c11c5c3600d00ca
-- 
2.39.2


