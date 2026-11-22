Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53145606A680
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NbYBxVMk;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Pwwk8w1r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z5aYDtbjooX6OdgNuNX1vYLxnENxkXdoT7fGCkr+rps=; b=NbYBxVMkHjOpbB
	y9aEwQbVrpXnHJ01U+XJWlmBONwn0zL9JQKYm2438eavvlg1IHbdXD88XKEwFRgDQy60+tcAmMD2J
	m7+w57tQqlUY3ghbHc6bIkAAZV1Wc6g+0q7XD6gxRXrn9xcL4nY8y3TFjHaMsiGD05J7mFR31qsq6
	5tiGW9BuH4SKo1ge9e5h0PSh6hW3LSahiqIXDgFkvaz/Kr4Fdj99R7Zq1/lmFG+18EIJlluCbBvoB
	rJHEy4g/wYIt5JGRI8yZ6kN0adlpWOtYl6Ym4w801a/5emteA2BjqYdkziHQ81d4ofFdcWYIwPRl0
	rxB2HqXczc3LUMEd3f6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Av-00000001EcA-01tC;
	Sun, 22 Nov 2026 15:08:17 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9As-00000001EaN-0lSw
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 15:08:15 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3723136a12.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 07:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795360092; x=1795964892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5aYDtbjooX6OdgNuNX1vYLxnENxkXdoT7fGCkr+rps=;
        b=Pwwk8w1r1uJdZTfQrp6ykY+vpWVSfRlhR/gKidy2mq9Df2oVgQ3+NYPiCpGsKqqRbk
         WIuuywjyeooJ02hYoDLKXPgQqgBcjBkfRuMLnPAwFpxWRs7CLdyFLCq0RO1CSC9dRm3I
         usHWS4OzPAzcG/FReEpCo/hsj+uhfO0DPf28wnqPj0GRIzsJsC53BUBcrlrr5psYGAxM
         DEBghaWKnnfBsLbFqBeN0t1sqqV46A/cOR58z3yDybcQ0bEFInCIlipTUnQX5Er++KNU
         zyvR9SbtddJf7kEyIh4vkAewXO/mxAVsSHu8J+Hlj1KVZtqUMog5N1ZINq5toOgvb32+
         SkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360092; x=1795964892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5aYDtbjooX6OdgNuNX1vYLxnENxkXdoT7fGCkr+rps=;
        b=UmApDGz6bxielyqijeWExh2g+xnGJPR/Q6rfLH81C+P4xhmOFytuZS1tK9YtpNosyF
         1mC6zMuT7UZL7rgBhHGW63YoNRSHoPLAFbMa8f2v9c89zb+r5qxcoJ0fz5qPIL/OEXFf
         RgHeajfGjdl099iANI76S7vsTFyxX7cgaVUMdQv1yyf/N/QBOusxVLHYbAaoePqoUiNA
         bnV/oafKI2IH5baQ5BVgcztiy5C9OJ9MhNCSpniex47SeQmJgyx73WI6Q3WOhNg1GlCN
         wvD9m6rnQDfrd6Ya0pbBex//HGw+faZJvU0JMlUUkE/Y+x/A56zWQnqkDFP4pH9DfL/4
         UG1A==
X-Gm-Message-State: APuU4Z/Zkk6lgpmewyhtWjb6dd4c5AorQzOOuymqV/pfFI/sg3Uc36i+
	Ki5BqFS8QuKlGDdwCwqo8I8MwmEPqEIpR4WqjVHGQ/mChWoWGtqrG09piwMygYJdoQ==
X-Gm-Gg: AZFdTZdwAmj3TngnnfzSkZTEo+SmgL1dpFWVWSpMmDdQB1Fd8E0XK/PzYU5NNJyZ0C9
	+Tsx+8fdwzr6L5thh2bjgiZ52P4EJixUxWP279KgOJTHzpNsS6kZgA7LEfn2zUTVTov+ASWFQCa
	O1WAVOD90pX29/U9sYYTTioVJSzkhu6Mm1264htOGgJeY+IvqjxVrHroXrGHyBsL7GeyH+saPVF
	/+9aqdSv2DQA0QgwrAmJA37saKTQHRWm4R4i0K7XLdswoWy/GJzFfJDEgjwaO4dTZNFyaq2Ihrp
	FMp/UJ8a3PVsVvcrdpr+twTFnqr7hZyMR6PwlCUboYG6IBXfFv6tEixgsqmeKCar49sBI+Z9G9D
	golvSpKZmKOI8uGtFC1NHromgpCqhWXkyWgIKUuf8pM8/aFpnjnZ/Q2WqwJVNlVRE/z3Z09uxFT
	te4HshzWtvaV0ssCDfNaiKWPHoed1ML707uCNpGCmpSeZZNlpbVPrELzgaoQdlV+jTevBE8cdvE
	a44OL0vKe1D8+KnVdiAomd/G4tBMbczhDC/gai2mTtvl8DfxdlQoLbC9bx9xXXvsibLq4VYi/tl
	0Y2VZCiRe374L9mn5mKboQ2f0iinuNXMaUReZ7sgaXNQbP+2N2hPvyYEDIqmx4vRvTY8AkGuU/w
	bFlv8LNdXxB+5xy42dB4trVfu5wlEDuE4wcRkK/KK4mvoSo87+BNgEO8zUhTkG6EQ5NWMjiFYxc
	btx8XPs6ueRr6aTecgYEBYbndg9uTA7SAcjPa23PECbyPhCTYgXw+Dd/31l4cB/BRzEDKTgt8tV
	NFvak/9TQt8T0nH0FPACni5dcrxZjYztA1PI40/6o71UJJOYSFg8Sje9XyYqMueQ/tpaIYb8aYW
	c7LSP5tHCjU=
X-Received: by 2002:a17:906:1955:b0:c40:4848:f7fa with SMTP id a640c23a62f3a-c513ab1dc62mr553994466b.44.1795360092258;
        Sun, 22 Nov 2026 07:08:12 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.181.130.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm324618466b.20.2026.11.22.07.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:08:11 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	John Crispin <john@phrozen.org>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v3 1/2] wifi: ath11k: forget a key the firmware failed to remove
Date: Sun, 22 Nov 2026 16:08:10 +0100
Message-ID: <20261122150811.3135445-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122150811.3135445-1-julius@bairaktaris.de>
References: <20261122150811.3135445-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_070814_242870_1A4DE78F 
X-CRM114-Status: GOOD (  15.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mac80211 frees a key after set_key() with DISABLE_KEY whatever the
driver returns. When the WMI command to remove the key fails, ath11k
returns before it clears peer->keys[], so the peer keeps a pointer to
the freed key. While the firmware is down, removing a station frees its
keys this way, and the following ASSOC -> AUTH transition passes the
freed keys to ath11k_install_key() from ath11k_clear_peer_keys().

Clear the host reference to a disabled key also when the firmware
command fails, and still return the first error to mac80211.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v3: return the ath11k_install_key() error for DISABLE_KEY;
the PN replay result no longer overwrites it (Sashiko review of v2).

Changes in v2: new patch.

 drivers/net/wireless/ath/ath11k/mac.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..48795c72d2982 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4521,6 +4521,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	bool is_ap_with_no_sta;
 	const u8 *peer_addr;
 	int ret = 0;
+	int pn_ret;
 	u32 flags = 0;
 
 	/* BIP needs to be done in software */
@@ -4615,17 +4616,25 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
 	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+		/*
+		 * mac80211 frees a disabled key whatever this returns, so
+		 * forget it below even if the firmware did not remove it.
+		 */
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
-			goto exit;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
-		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
-		if (ret) {
+		pn_ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
+		if (pn_ret) {
 			ath11k_warn(ab, "failed to offload PN replay detection %d\n",
-				    ret);
-			goto exit;
+				    pn_ret);
+			if (!ret)
+				ret = pn_ret;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
 		if (flags == WMI_KEY_GROUP && cmd == SET_KEY && is_ap_with_no_sta)
-- 
2.53.0


