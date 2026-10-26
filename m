Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069A606A31A
	for <ath11k@archiver.kernel.org>; Mon, 26 Oct 2026 04:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hgPDsVBj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A9xPFhAH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3KuQhni7ciZxPrEr6n6P/Hr5PqJj3sEm40NyKjGJZn8=; b=hgPDsVBjRRCltE9NsAqpHN5yRZ
	P8JasCZMe+jqd6QiQtpNFUKSrqj6lqHUvazD8QtbfgOfTRqRdb3usZG/UBfLK4a9fxQjo0hKg3jPj
	/mw3XEh9RkOW8NXv+yWB1aeZIHjMZRHN7X4X8ptp1Ua0RUkFPnpEgSDc9GDDlQwe8OziOgxpNS5et
	K+pK1Qt12DcpfQ2h2vDH2HkqiW6byU9ATM3ZS+jozKL7BodcKacaNbH4T3viYJHCzdfbMNXSZi69m
	z5qRxUauJncxT2Vg0/3Fy45dH6IxPk4YnJ9Y3XFx3FSjDiq1m4OrKkQLb1SGBht9hf5bJM7XCpwXr
	8YCCeqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBvf-00000001h7m-1gYL;
	Mon, 26 Oct 2026 04:03:23 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBvd-00000001h7R-1V9i
	for ath11k@lists.infradead.org;
	Mon, 26 Oct 2026 04:03:22 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3550c917fd3so3892034eec.0
        for <ath11k@lists.infradead.org>; Sun, 25 Oct 2026 21:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987400; x=1793592200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3KuQhni7ciZxPrEr6n6P/Hr5PqJj3sEm40NyKjGJZn8=;
        b=A9xPFhAHmlT4EVuf6BjK4JsAOFTOUSr/lub8mbL7+aKwzLtU9qohwTFLmhLxc6E0j0
         QGGIbVHFbixJzCwTaJwXmZIjCQQEwf06FNYPut/aP7SEOCCTKIENncYbAkHWI7r3fuw1
         eSTFjot9fzpq45+Jv8Ge4wGQr7GLBMPUkeXMXou3ckUZWq/oqc5at78JTdSfVygaPEZh
         IpqZnDYpCPEmE2VPgGRXY+/qsaxgBUkKL3oCpAKIKhAMgYKKAoc5ZpyIoC9SCkT4GGTg
         70yEyGDyLNMYKNKwlHtM0JeflA5XFoSKUE76d6u27BndC9IR024b6IYUts+bkq3AUy7F
         r++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987400; x=1793592200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KuQhni7ciZxPrEr6n6P/Hr5PqJj3sEm40NyKjGJZn8=;
        b=m2pmUMARA9lo4wkI173ktSpySB5gkhXJ8nS7EtiP2aCVxvI5+zrCIvLXAGrF4ciYGw
         UvV866cJfdttP3wbjeNF0BCsctjLxu8lxv4zzVW2qP24gmi1AUeL/O3J1uAW0jEBnrBh
         6GwNg2Cgr9KkBzrDcM0LyYMgT4KyCjCI1iBTRisBDXNE/v/yzisvgDCO+8ct0tr3IpZo
         wykEGSZjHRNJrG6b5pKetk9rVRAlN5PGE/lOYMmI7BAb2gse9m0e2WvRR5hzk1IQJYBS
         77igPL0ldKsgnkW6txacSf7cKkbgHzcOCddeH3ov0xjjWGeSn2gllTeMNoiyoKWGS/Cl
         Vz3w==
X-Forwarded-Encrypted: i=1; AKwUvByhsmQZejOoNZycpu90FLktujcn6i7abFft2eFfg2ks9f4JG0Vy7JiC7A0VGhazUjdkCe1l3hY=@lists.infradead.org
X-Gm-Message-State: AFq9FYK5lWoIaKnAY/Hk9+be9TbQWFP2p0okGxzwe5/X9eTFMPhfIhua
	jkQE0IYD1h+FKs1GTkE6GPNTuti7AWYC+kIYuDSDqlg4g+3UeRklRNil
X-Gm-Gg: AYBFou3LCbZDPLTFy+BNsv7yCut8O1JJ/nUQMSi1CVYd9BnjsIPmXtBgMC7Iy4hQha2
	NJSE8Lf8N3OW4IkfggGPzOHC3xs6TxHQPnf0ih0yOBjsoCd6Q21a6Q/GZuGyvX2MIZLf2zo92VR
	uczBEggeFR4ji4hyNC9tHOeF4GcMBu7rwHFr61xJ0g333N6hFg0EJm3d77l1Ki+2dMOXWtuDjWz
	xe7ixvjvVlwxXm8Ue1ujdXem/Dw5i2Otgn8fn/jo9YmABcmy3Q7HpbNaPvboXNsMl0aTWm/rOex
	oNE3xjbQpR4khdUJJZVma1B0ZCD0GMRz28aOh7LLewQzAWB8JL1MwASUVgZf3+MGZfXZqrL0G7t
	edgqNo0yNo2j+ME8EYmQaNhG1ZoceCAXF/WJKsB4FURnENAdIsh4hPSDlYnjq3K5qUyYVbQ3YZB
	hPbuw15cIF/7QNIQg4zQ9K1gaU1AGTSI5brAb2ZgAsCIQ0cmHQPz0wIhcI0AkyBciM23MJPIixh
	bB/ubs6yHm03av/mtcLCeEvQ/+4dp300yKLDPhFnOwHs+9wiKAPxOvOgdx3taLPz12zLoy5/z99
X-Received: by 2002:a05:7301:5404:b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-369e8336354mr9216297eec.5.1792987400302;
        Sun, 25 Oct 2026 21:03:20 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm13973765eec.7.2026.10.25.21.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:03:19 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: jjohnson@kernel.org,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH ath-next] wifi: ath11k: refuse a peer whose address exists on another pdev
Date: Sun, 25 Oct 2026 21:03:02 -0700
Message-ID: <20261026040302.2635133-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_210321_425610_B0386526 
X-CRM114-Status: GOOD (  18.05  )
X-Spam-Score: 1.5 (+)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a Netgear RAX120 v1 (IPQ8074 v1, firmware WLAN.HK.2.0-01792) a
client that roams between the 5 GHz and 2.4 GHz BSSes of one SSID
crashes the firmware. hostapd adds the station to the new radio at
authentication, while it is still associated on the old one, so
ath11k_peer_create() finds the address on the other pdev, takes the
"transitioning to another band" path and asks the firmware for a
second peer. The firmware then asserts:

  ar_wal_ast.c:286 Assertion 0 failed

followed by "Failed to add peer ... for VDEV: 1" and "ce desc not
available for wmi command". Both radios stay down until a reboot.
This happened with FT-SAE and with plain SAE.

Refuse the peer with -EEXIST when the existing one is on a different
pdev. The station then fails authentication on the new band instead of
taking both radios down. Moves between vdevs of the same pdev still
take the existing path.

Tested only with this firmware. The hostapd side is being fixed
separately (do not add the station to the driver at authentication
while it is associated on another radio). With that change band moves
work (24 of 24) and this check is not reached.

Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
RFC because the existing code deliberately lets a peer move to another
pdev ("Assume sta is transitioning to another band"), and I could test
only one old firmware (the RAX120 v1 has early IPQ8074 silicon that
needs it). Questions:
- Does newer IPQ8074/IPQ6018 firmware accept a second peer with the
  same address on another pdev? If it does, this check should probably
  depend on a firmware or hardware flag rather than apply to everyone.
- Or is the hostapd change alone the preferred fix, with no driver
  change?

 drivers/net/wireless/ath/ath11k/peer.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index b30a90698..42686e41c 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -392,6 +392,20 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 			return -EINVAL;
 		}
 
+		/* IPQ8074 firmware WLAN.HK.2.0-01792 asserts in its AST
+		 * table when an address that still has a peer on one pdev
+		 * is created on another pdev. Refuse it; the old peer has
+		 * to be removed first.
+		 */
+		if (peer->pdev_idx != ar->pdev_idx) {
+			spin_unlock_bh(&ar->ab->base_lock);
+			mutex_unlock(&ar->ab->tbl_mtx_lock);
+			ath11k_warn(ar->ab,
+				    "peer %pM exists on pdev %d, not creating it on pdev %d\n",
+				    param->peer_addr, peer->pdev_idx, ar->pdev_idx);
+			return -EEXIST;
+		}
+
 		/* Assume sta is transitioning to another band.
 		 * Remove here the peer from rhash.
 		 */
-- 
2.47.3


