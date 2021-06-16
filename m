Return-Path: <SRS0=tth9=LK=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4448C48BE5
	for <ath11k@archiver.kernel.org>; Wed, 16 Jun 2021 19:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8664F6135C
	for <ath11k@archiver.kernel.org>; Wed, 16 Jun 2021 19:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8664F6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LQA97M2Z2CMAoSccGDkmAijG1iODQCOCwKGOc7JHGPI=; b=otEsxPyYJqNmrH
	A06ncq5c9nZn5Hi6lFt+lszE4iu/p1BCJG9GbC+Lf16/DhPbAIe585fBl+5EKAxD5sMXv+0S7a24t
	/qHwNDOXrebW2Ttmqg6uaBWHUHpW0DavXB79b6/oXUAOnV4hi9v0k6yAmasDAsCx0jLs8ai4AbJ7D
	njRnCO/BH/R8NK3SAV30tAjg38sD25nsJ5SCdz0RlgC6GWeRzSQI+crPVujuemATIId01FSQgiqdR
	b/phz2+YcWkODtyMFuLkmU53BYxk+Qg98hhQLwJ/yFlwc6I1ysqtt8MpopHUXY/bUBHs72/JyEns3
	TBxR2xJ7nfscUF5fsWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltbc8-007cAF-Mh; Wed, 16 Jun 2021 19:54:16 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltbc5-007c9Y-Uv
 for ath11k@lists.infradead.org; Wed, 16 Jun 2021 19:54:15 +0000
Received: by mail-pg1-x533.google.com with SMTP id n12so2860872pgs.13
 for <ath11k@lists.infradead.org>; Wed, 16 Jun 2021 12:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ta3RbqOIn8BZORbiR4sH2Jl3iefLLCl3kYqOTHV1WDg=;
 b=QrkdJQqzr0NXGF3lxt9ugTPrUAhMSlDlW2SJ9fsA+KH7cm92Li7mXBFD4Wkcsn+sBO
 h8sV1XrNnlfzD0rRV96WfNd0eu5gQQ49QyP9rH5ggr4oiClHxuS+xESkSA1cO4kpL2IZ
 KTEQwm3qKh8NbOrUh0BV80kglJ0Di9sVT+K1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ta3RbqOIn8BZORbiR4sH2Jl3iefLLCl3kYqOTHV1WDg=;
 b=NUpOygZMznDom7kRKBHT3LwH//dhuWwOnDl6K+8RN7f4Igd8SN6p1YyJHXJjUcrHP4
 m7t9JRsXxauzkrE9RZxc1d+Oy0/UNorWZ3wSuUQmXc5rCd6DKwnRI8nE2SurTaq/kIoB
 NnlK8cgCVXEgluJas/I6f+HFuGtYMDEo3oYHgyEt9QLLPg3u4o6Hl7zRtlUV4gicJNi3
 B9Qht/1HJLeKqdQLhL7UuhUANVpvH399fcWlY+6Ocz1/E4/elFifnSydGYGH2Uy+TokF
 gTdpRveY/wEgLwE2+D0q/n5eBC5uaBZfmZ8FafKQHBujKlh3Qh4bBvhpr77yUEQ1MyiQ
 bSDg==
X-Gm-Message-State: AOAM532kFdhi9QqTSRcLpDqV1bS39VgjLKX+EnSy+/gdRxl8rsXZ2BVe
 JUZO96m0pIlzKyGmz69uX6V09A==
X-Google-Smtp-Source: ABdhPJyV+Ew0riI0HXcKYe6MIMC6k+k3ndOX4eMCoUivqhy2b7e4mAVzoRSDmJfa0dGNcFL/NH1rSg==
X-Received: by 2002:a63:e043:: with SMTP id n3mr1310592pgj.106.1623873252926; 
 Wed, 16 Jun 2021 12:54:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c184sm2794609pfa.38.2021.06.16.12.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 12:54:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: netdev@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] ath11k: Avoid memcpy() over-reading of he_cap
Date: Wed, 16 Jun 2021 12:54:10 -0700
Message-Id: <20210616195410.1232119-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=a0cab8be0bd22cb947a89c25d20b00b86ac2fb47;
 i=eJo4iKawiWzp/TGJDTmVIE2lOKR+PQjNu4KYQ5F00YM=;
 m=+6EB5srPoGi1D7Om5kP3HXtskB0VIFJiBD3X5t+nWWw=;
 p=fNBF6uun0+FYmLLA4u44niS95J1JvHuPRqCzmoIK3D4=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDKVuIACgkQiXL039xtwCbTbRAAj9W
 ByUby95Dh+bLBWJHMugD4XSE2xrtVClsmeigQTMJnmvAxy08rlzrjqIoG+amV8BauQFvk6jc/zFZX
 0u4vjIF7f9p65oQ4fBw9YlvkbHTVPqDgO8952UQ1F7Q9gVB1L1Fyz3lIFUkEl3raJljKDCOaEnPee
 CMZ9iDO61/WRyFCY/iXQ2ofLoOIevL+Fc/TqZPLX7dKZjSwpLrLzw6BrGPNdvc2GyBQqmy5qIHJt9
 kT2K2w2QmATu1iZvTmsxAykWfJeoGhIK9yydYRgXatZDNBEI0Ad1XQ0YKllOVCHZWEyaXekZi7iWk
 VpyL1Z2mLn2zto3be8ZZLOUrKk5xI60KFnmhv1aPWu6YxL/4y6ELEK0qfIl2VZ518wt/jw3uY3nul
 4kvV/wG7UFBhRhwt/A7Wi0yV0C6IXgswZga/1vHxfIGHl82M54CyCGEIWtYoC8J0raeshqamo1bbI
 R7SKkItM6CdhAB5PTlBjy+2XTAYs5SwqCf8SLdwU8pujY/0zvFmrL8P2vbFcrVyAgaZ4R3GBP8vci
 SyUAlI2nAP3Qy3y/MeVF+n6mLNY7vY28SI9ethoHlKWaZ9cGfLB3bHo2QLSfbEYeilPEM1L9RhDQH
 m2EL6AmnX8+pqOSu0Pqyd6RHXXtB6rxa4Z35r3ed+A0kQ/L1XchTO6mEVFXyTw0w=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_125414_054306_8B251A96 
X-CRM114-Status: UNSURE (   8.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring array fields.

Since peer_he_cap_{mac,phy}info and he_cap_elem.{mac,phy}_cap_info are not
the same sizes, memcpy() was reading beyond field boundaries. Instead,
correctly cap the copy length and pad out any difference in size
(peer_he_cap_macinfo is 8 bytes whereas mac_cap_info is 6, and
peer_he_cap_phyinfo is 12 bytes whereas phy_cap_info is 11).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9d0ff150ec30..b1178a0b7fc3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1314,10 +1314,16 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 
 	arg->he_flag = true;
 
-	memcpy(&arg->peer_he_cap_macinfo, he_cap->he_cap_elem.mac_cap_info,
-	       sizeof(arg->peer_he_cap_macinfo));
-	memcpy(&arg->peer_he_cap_phyinfo, he_cap->he_cap_elem.phy_cap_info,
-	       sizeof(arg->peer_he_cap_phyinfo));
+	memcpy_and_pad(&arg->peer_he_cap_macinfo,
+		       sizeof(arg->peer_he_cap_macinfo),
+		       he_cap->he_cap_elem.mac_cap_info,
+		       sizeof(he_cap->he_cap_elem.mac_cap_info),
+		       0);
+	memcpy_and_pad(&arg->peer_he_cap_phyinfo,
+		       sizeof(arg->peer_he_cap_phyinfo),
+		       he_cap->he_cap_elem.phy_cap_info,
+		       sizeof(he_cap->he_cap_elem.phy_cap_info),
+		       0);
 	arg->peer_he_ops = vif->bss_conf.he_oper.params;
 
 	/* the top most byte is used to indicate BSS color info */
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
