Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB771C4321E
	for <ath11k@archiver.kernel.org>; Fri,  2 Dec 2022 13:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ukil7hIp85o11TU527gzIpdb8nd20A6y5zGLqUCCGtU=; b=nJCta7Bxszq0TC
	bzvqD1okctMjtn1H2i3FJcEHmqNQ5c4Q2oWBge16P+8XjhOPTMLWjRjZ0IxHICFf3hr9gM4m3vwYg
	XwIZ1JVgi2R0mdRTk6gBavaHCB4U6SgGsE83gxvyBL3KD2gtYcb2wtkRLjHfn6E0AMB31yxn/iMiq
	Akdw95f7WzqN7ELExWtmMgBhyoZLZfu2JWt7NkGGzFzfnkL92BQ+3wAQDGmVH8bUbribG0ykAKiTY
	eDZ8mPpu+Nafo4s9vyNGDxKWbiu0M9S4w9x6X3Jkf2HcJLh5lMWK9PL0FLyLiYhODJ4ralime/7PI
	v70JzvR1I8bNnYcK0LiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15jx-00GY3G-Si; Fri, 02 Dec 2022 13:06:05 +0000
Received: from [2001:4bb8:192:26e7:bcd3:7e81:e7de:56fd] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15jv-00GY2K-VG; Fri, 02 Dec 2022 13:06:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH] wifi: ath11k_pci: add a soft dependency on qrtr-mhi
Date: Fri,  2 Dec 2022 14:06:00 +0100
Message-Id: <20221202130600.883174-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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

While ath11k_pci can load without qrtr-mhi, probing the actual hardware
will fail when qrtr and qrtr-mhi aren't loaded with

   failed to initialize qmi handle: -517

Add a MODULE_SOFTDEP statement to bring the module in (and as a hint
for kernel packaging) for those cases where it isn't autoloaded already
for some reason.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/net/wireless/ath/ath11k/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 99cf3357c66e16..9d58856cbf8a94 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1037,6 +1037,8 @@ module_exit(ath11k_pci_exit);
 MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11ax WLAN PCIe devices");
 MODULE_LICENSE("Dual BSD/GPL");
 
+MODULE_SOFTDEP("pre: qrtr-mhi");
+
 /* QCA639x 2.0 firmware files */
 MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_BOARD_API2_FILE);
 MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_AMSS_FILE);
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
