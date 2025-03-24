Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA63EC3600C
	for <ath11k@archiver.kernel.org>; Mon, 24 Mar 2025 06:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VBu8ophptbvfrgO7bjoOrtL4PJRNIQCA0MhDsHD96LY=; b=fh6+VehKwGi89jQwUcFp47n27Z
	sw1P2xUA1uYPRy7lrhk+3uLxLtIkkhmYc8rkjxvJenfAOIEuLxgUufEiBkxrnAx2XXPPmoPv4worY
	80tk8FrimL8Z4wkjqjOSZ0dUCUtWLcY6Qfd2IBB+8QgE+nG3K+Hzma07PDomZTw56KzIu5rUU0TFj
	yG52gNMUc+UB4t6kfs7x4fafNI3TMtbhGxNjP045lkb52SDNjDnrx8oLTD1/L3vej8RTZtywxikB1
	kc36gKIZbdqEEBr5Qm4BXyBIMrOmUj63gzH+6i7pZNtJKvi+6OEBBFWYELcWo6NQd67akUm6njgHJ
	jfFFvrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbQh-00000002LB8-2orn;
	Mon, 24 Mar 2025 06:36:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbF9-00000002JWd-45ac
	for ath11k@lists.infradead.org;
	Mon, 24 Mar 2025 06:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B19B438C1;
	Mon, 24 Mar 2025 06:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33183C4CEEA;
	Mon, 24 Mar 2025 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742797502;
	bh=9XXXo3EWZtEobiajEK/dAZklZgfyP4VnNuDdDAvYcz4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=o1VApnjZqBgmj6Mn6l0B+/7J8UV/5HCarFDwFRGPWpNB2lMe4LWw8HdZ/up7oF1Ii
	 xFwYrE97kSNtVwi1a1t51GoX7q/xejRw4/j9yTmUNMhbQlkSXyxYwygNv4bgsiM4Hs
	 hq6efF+UQ40WBYdj1OgBGtUMn77ee5ozDYGN6h8JWDx7I7pViVf37tbZ/sRWrilJ/h
	 MpDDhh7Tyi5dWbQtWzXWhmtSOqLbt5Gc9ta1G0ELHIDlBhRSucmcXmbdFFOnuMpnwr
	 bpRolNp7kGQcVvPULcoZrvgZC1HKuYtIKtohUdsgASlV5fE8Bd5dHMuBDmwJ+SX4RK
	 qjgunBCTF/mHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A65FC36008;
	Mon, 24 Mar 2025 06:25:02 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 24 Mar 2025 10:24:59 +0400
Subject: [PATCH] wifi: ath11k: support fetching mac address from nvmem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-ath11k-nvmem-v1-1-d82bdf72820e@outlook.com>
X-B4-Tracking: v=1; b=H4sIALv64GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMT3cSSDEPDbN28stzUXF3LJJM0U5M0ExNDCwsloJaCotS0zAqwcdG
 xtbUAm2N0AF4AAAA=
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742797500; l=1623;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=KFf/U6jpX3DLdf5cfXG9vG8Hbqcu1hFbIGhlckUUI7s=;
 b=PoKhNSfsaNEQZQFXjHirGqsZeV20EcazdhX8I5TzQPa2R5lvPNK6z6IzkvT152fkvWA0wqYRc
 pYhUAbz+GmRA9jGIGq7rRxXYScv+jjqoQr0WP0xU9nY4HQw+aRbHwa9
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_232504_062550_67F76DA9 
X-CRM114-Status: GOOD (  12.28  )
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
Reply-To: george.moussalem@outlook.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

Many embedded devices with ath11k wifi chips store their mac address in
nvmem partitions. Currently, the ath11k driver supports getting the
mac address from the 'mac-address', 'local-mac-address', and 'address'
device tree properties only. As such, add support for obtaining the mac
address from nvmem if defined in a 'mac-address' cell by replacing the
call to device_get_mac_address by of_get_mac_address which does exactly
the same as the former but tries to get it from nvmem if it is not set
by above mentioned DT properties,

Tested-on: IPQ5018, QCN6122, and QCN9074

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 97816916abac..49af6b9fc867 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9,6 +9,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/inetdevice.h>
+#include <linux/of_net.h>
 #include <net/if_inet6.h>
 #include <net/ipv6.h>
 
@@ -10379,7 +10380,7 @@ int ath11k_mac_register(struct ath11k_base *ab)
 	if (ret)
 		return ret;
 
-	device_get_mac_address(ab->dev, mac_addr);
+	of_get_mac_address(ab->dev->of_node, mac_addr);
 
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];

---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250324-ath11k-nvmem-9b4f54f44188

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



