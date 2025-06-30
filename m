Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DD5C8302A
	for <ath11k@archiver.kernel.org>; Mon, 30 Jun 2025 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WO427gDVIXndoIGXFM1y8OPxz33+jCFBhBk8n2lT7ww=; b=TVE1JntroZBhi43QYQJV5sMNDw
	ojV5vGUmqXZ6ZKmDiAbuvpUOVMOeVcmvcsrpbX8ozyKOFYy6pIKtrKIVRFBlvUbi850HDYsSntl/7
	l9yJQsoQ7aoGclQfXQ+1e+7eUodcb15bfTj4Zf2YXF9FaqU//v0LLku9dIr6XsEU5UI1gRHdT3eem
	5tmgpBbTJRdF3CK9AHqD+ZNwFOJR8mOmeOhp2bgsDyktZmIcCLmH5WsWT/92GqP1Y0++GlqpNTUuS
	G4lRhZlyvpFGbCNWRnbSwR40HLXRACll9QEHNzuFeRpn/lJwKPCrCCrHyAvdQ+QdtztCmB6GDGnFo
	9CacAZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Dd-00000001Ub7-2EXD;
	Mon, 30 Jun 2025 07:46:25 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9CV-00000001ULl-3He7
	for ath11k@lists.infradead.org;
	Mon, 30 Jun 2025 07:45:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751269475; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OWkc/fd86IBru20W3fkAZl/Np/x51Yjfb+/KldMe2iU3VaemuI4mSCVzoBSc3eKULXVV7n6VVR1OGwX+D6OJb30fBcjP2GUbRqXxJ8f0VHYq9m20CVjFMMAHXu9yKGospUPzi/t1k2HEu5Pjw6kaNVjrZnpv8hBRjSzoGp6xSMY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751269475; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WO427gDVIXndoIGXFM1y8OPxz33+jCFBhBk8n2lT7ww=; 
	b=TFoyVYEg5FHan2RAk1ce9EY6yLX3C+zJOQmjHDqrB1SQ8kHFz2Z/r7aZaOIgBaVije7p7R5anzKxDqRUYXb2AVwvpiSc6PuZy+2E3kaUZwRnsQUBLtMl643LtCHDKarjaR9gKWYokGozrl61NDC0DTvldNOeHwrznmXuPfLdmQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751269475;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=WO427gDVIXndoIGXFM1y8OPxz33+jCFBhBk8n2lT7ww=;
	b=LONoxqnf+xcD0f6vTP3N7eVWZrY7ompALw78D2YASYEb8nYnmwGfCsr1MOU74T5u
	ymZ0vSFvBqSynanoY4hq8QJ0f84j46AvXCSyvKOgifOGmdt5hWhRE5xcnCAG8TLGwOX
	ymJAGQGUdkcn04py5GckmsjV8MtFh6epHGNRA2GU=
Received: by mx.zohomail.com with SMTPS id 1751269474311920.2371976298095;
	Mon, 30 Jun 2025 00:44:34 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Yan Zhen <yanzhen@vivo.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Alex Elder <elder@kernel.org>,
	Kunwu Chan <chentao@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	Sujeev Dias <sdias@codeaurora.org>,
	Julia Lawall <julia.lawall@lip6.fr>,
	John Crispin <john@phrozen.org>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: kernel@collabora.com
Subject: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
Date: Mon, 30 Jun 2025 12:43:29 +0500
Message-Id: <20250630074330.253867-3-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630074330.253867-1-usama.anjum@collabora.com>
References: <20250630074330.253867-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_004515_878755_A6EB7AC2 
X-CRM114-Status: UNSURE (   8.31  )
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

Don't deinitialize and reinitialize the HAL helpers. The dma memory is
deallocated and there is high possibility that we'll not be able to get
the same memory allocated from dma when there is high memory pressure.

Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 4488e4cdc5e9e..bc4930fe6a367 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	mutex_unlock(&ab->core_lock);
 
 	ath11k_dp_free(ab);
-	ath11k_hal_srng_deinit(ab);
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
 
-	ret = ath11k_hal_srng_init(ab);
-	if (ret)
-		return ret;
-
 	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
 	ret = ath11k_core_qmi_firmware_ready(ab);
-- 
2.39.5


