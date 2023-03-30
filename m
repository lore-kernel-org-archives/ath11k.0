Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6CFC6FD1D
	for <ath11k@archiver.kernel.org>; Thu, 30 Mar 2023 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XojPooLsqDymTjew0uQQMbkNXCBxDds5Lqb1Fs31gxc=; b=vjX0mjjIJtIrbe
	yBLBNnhflLsUlS9n8EhD9IMXK0Lo3yECXtqsX19ZGqyzdZeV7E/0vMAwJakniflG6swnSDfCTJMKM
	BP7gFYv4T87oBCBNVlqjMLSLAjHoYSb4j7+yDFzXnT1ljCHwCuqUVw/GFt17s8C40BSjfa9nQ9/oc
	ej5oNm7dAq5RB0FyKD0+e6XCcU7v2v1OUeftWlMdvIqExibR5h81K5uD0TZxgJED+KZyqn2DdQsnC
	ADOY7uMAqEaKklcpCZ8N8A5y3qRdJ6igkhLq8EV06oE4V+0ND4gQMMW8wA40MK8x1MvD3H9llsg0T
	lqdspGY73H8qfnQoOpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phtPC-0046S0-06;
	Thu, 30 Mar 2023 14:37:34 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phtP8-0046Pu-2A
	for ath11k@lists.infradead.org;
	Thu, 30 Mar 2023 14:37:32 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B5EE6219D1;
	Thu, 30 Mar 2023 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680187041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BspglNfkJsUS3r3lZLHtaMvBOeJH8poZYcalK2MjJCo=;
	b=ZRAEANHjfjlm+/1Rnu369fVYRGG3XxIkifyQlbE3ZuIbYhwGZdqXQoaJDUvHqFAsCsVGad
	22CfTKt2mh5JQZsCYRDwYU22l70i2nVCesaVFhopS0uS4yOGOdTfopvbtVfxKp5C1ftrLL
	MFnaVDjZU/YjU+0gbN+NHeuqa5dczuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680187041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BspglNfkJsUS3r3lZLHtaMvBOeJH8poZYcalK2MjJCo=;
	b=gyFQC9v0shXwm3T/y/HeCn0C4d119rgfEFucqMMGOqrVyBl7wbuh4WK0NA5byfaYwBZfUu
	r2OOy8DwATUs8TCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95841133E0;
	Thu, 30 Mar 2023 14:37:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YvK2I6GeJWRkMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 30 Mar 2023 14:37:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH] ath11k: pci: Add more MODULE_FIRMWARE() entries
Date: Thu, 30 Mar 2023 16:37:18 +0200
Message-Id: <20230330143718.19511-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_073730_869291_7A216326 
X-CRM114-Status: GOOD (  10.24  )
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

As there are a few more models supported by the driver, let's add the
missing MODULE_FIRMWARE() entries for them.  The lack of them resulted
in the missing device enablement on some systems, such as the
installation image of openSUSE.

While we are at it, use the wildcard instead of listing each firmware
files individually for each.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

I can rewrite without wildcards if it's preferred, too.
But IMO this makes easier to maintain.

 drivers/net/wireless/ath/ath11k/pci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 0aeef2948ff5..379f7946a29e 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1039,7 +1039,8 @@ module_exit(ath11k_pci_exit);
 MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11ax WLAN PCIe devices");
 MODULE_LICENSE("Dual BSD/GPL");
 
-/* QCA639x 2.0 firmware files */
-MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_BOARD_API2_FILE);
-MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_AMSS_FILE);
-MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_M3_FILE);
+/* firmware files */
+MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/*");
+MODULE_FIRMWARE(ATH11K_FW_DIR "/QCN9074/hw1.0/*");
+MODULE_FIRMWARE(ATH11K_FW_DIR "/WCN6855/hw2.0/*");
+MODULE_FIRMWARE(ATH11K_FW_DIR "/WCN6855/hw2.1/*");
-- 
2.35.3


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
