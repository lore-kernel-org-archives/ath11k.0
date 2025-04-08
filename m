Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D252C36010
	for <ath11k@archiver.kernel.org>; Tue,  8 Apr 2025 19:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ORcREYdVJdoYu+7x4X+UiIhsSg5592tE7nVnhqMOMzE=; b=y9QvUGvNHjGphjzkeanKP02Bjo
	myUs93Htj9XAnQGG0Z9vVufzE+pKXmx7rOH3J8rLg+WrygGT6h4n30vYvXvMPMtgREsOd/z/eRMrW
	dxq3c/L5AbOHe3XGem3fwcQ3qwsTsliIFbifLO1DR7UnUcNPOaxjp3tjlWiqy2dqvWzmFNTrW+IU4
	GsMv1yhKEIGJH+QO7cTpqlvQ7Bwz3F41jNH91Lzu5/YT5ZdSzyF8fIWpxCA2AAySlqo+7c/JVNirU
	veJqtxEAdTWzhxabl8a+Ux4uo97wZiw8lUIgmNxqCy4yYJ6igdXh9gBQdyVZ/4ymqDElF/+8ij8l3
	pUamTfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EIL-00000005CLo-1aZW;
	Tue, 08 Apr 2025 19:07:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EEV-00000005BdO-2gjN
	for ath11k@lists.infradead.org;
	Tue, 08 Apr 2025 19:03:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4EB8BA479B6;
	Tue,  8 Apr 2025 18:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE3CC4CEE5;
	Tue,  8 Apr 2025 19:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744139018;
	bh=pHSSTO56neWEEEtpVKmutcv8dw9yWs0shUPmz9GS6v4=;
	h=From:To:Cc:Subject:Date:From;
	b=jHGbB9wrS9Ga5nO6c0XIStwD4hEx9MwNOOY6sWYkQHLfuTLHDwrqeMnev/R8Eytb3
	 XMBwXMzr/I5AKWpi5uzAkRBTixYzLesS10cKeUpijGLkpq1iN5gnEuzobgwtUXKgd2
	 x7Hee3peXsAH5HBtzxDAzMNfxZd8SQDa9AF9mZ6JNCKQHC1y17umW6tT2PNuMJwT81
	 dA2e6VCBSK3iBRYkZtOIlp17ky+mKuO4Hpeg1hOmn4w1Z7QNNbwnLG380iwzNdeGZs
	 Jxkh2bTYEhWGeKNff2lSODAvwGwfajmmXBoMu7cDK9cnz3z4/g7DypdvsSNKfIyTyO
	 0PsqvzaYQTRqw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath11k: Use of_property_present() to test property presence
Date: Tue,  8 Apr 2025 14:02:11 -0500
Message-ID: <20250408190211.2505737-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_120339_741670_92A5FDED 
X-CRM114-Status: GOOD (  10.20  )
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

The use of of_property_read_u32() isn't really correct as
"memory-region" contains phandles (though those happen to be u32s. As
it is just testing for property presence, use of_property_present()
instead.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
I'm assuming this should still go to linux-wireless list? I had to 
manually add that, so looks like recent MAINTAINERS changes aren't quite 
right.

 drivers/net/wireless/ath/ath11k/pci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 412f4a134e4a..87ef7f321065 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -929,7 +929,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 {
 	struct ath11k_base *ab;
 	struct ath11k_pci *ab_pci;
-	u32 soc_hw_version_major, soc_hw_version_minor, addr;
+	u32 soc_hw_version_major, soc_hw_version_minor;
 	int ret;
 	u32 sub_version;
 
@@ -955,8 +955,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	 * from DT. If memory is reserved from DT for FW, ath11k driver need not
 	 * allocate memory.
 	 */
-	ret = of_property_read_u32(ab->dev->of_node, "memory-region", &addr);
-	if (!ret)
+	if (of_property_present(ab->dev->of_node, "memory-region"))
 		set_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags);
 
 	ret = ath11k_pci_claim(ab_pci, pdev);
-- 
2.47.2


