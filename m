Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBEDF5580B
	for <ath11k@archiver.kernel.org>; Mon, 20 Apr 2026 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uIx1jtwgFWjTPmF0LP5ePZMcwCJhNzdE/rAynE/II+M=; b=bZ1duQn8Ge2jFboe/CvdRj7N8e
	1nbR/SjuqIE+XfPTT1hm6EhUJzSA1Y7T+Sdnv3PlcnRJCy0CzHvIqfNyy0W8STw1JjWWmF0nsq9PP
	OODI5MqJcZI0pk/zvy4fbaBlCffd/yR91kcNZBB/nb6F47fEKteLhGR7y7KE/9zwu2BQKctW5xeUW
	g/LCXqfJlC3LLQN4E6YEKYxAamSI6P//1cYvtD0d7G1ltImqsy3ZoLFKJ9TY7MmWri9+kQYkZ54s6
	QVITtWFvmMtEus3yAWXoWE6RhmK2lfXE6tD7YnquJnrGfw7pRzgxrLQsw0Z+DFmbvYFtfuZrFMPHy
	YR1FNHfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmQC-00000006leu-0r9Z;
	Mon, 20 Apr 2026 11:04:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmQ8-00000006ldy-44gO
	for ath11k@lists.infradead.org;
	Mon, 20 Apr 2026 11:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776683043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uIx1jtwgFWjTPmF0LP5ePZMcwCJhNzdE/rAynE/II+M=;
	b=UQbv0dJQjugmfSfwbOevEpcMVTsnWkeowEK2l8ST/fz4j3fXIYWRHxqGxaY/ykV35xh9D9
	Z7Wxd3W1Gvea0t5ZisSnkNUHsjTafXQo0VVm06Vucptz6TMvXACho1/TNQqqNQckeofF7X
	prcVw42oJS/XB206NJ2U5su8g5cPWms=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-232-VfT_hqAzOkOCHwHmXfVFNw-1; Mon,
 20 Apr 2026 07:01:39 -0400
X-MC-Unique: VfT_hqAzOkOCHwHmXfVFNw-1
X-Mimecast-MFC-AGG-ID: VfT_hqAzOkOCHwHmXfVFNw_1776682897
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 274F618005A9;
	Mon, 20 Apr 2026 11:01:37 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.67])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7E6811800446;
	Mon, 20 Apr 2026 11:01:34 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath11k: fix warning when unbinding
Date: Mon, 20 Apr 2026 13:01:29 +0200
Message-ID: <20260420110130.509670-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: TYkqYQH9liQViJKYhng9z5d2sh549aIweXc3J8mQW7Q_1776682897
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_040405_095499_2A25F610 
X-CRM114-Status: GOOD (  10.65  )
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

If there is an error during some initialization related to firmware,
the buffers dp->tx_ring[i].tx_status are released.
However this is released again when the device is unbinded (ath11k_pci),
and we get:
WARNING: CPU: 0 PID: 6231 at mm/slub.c:4368 free_large_kmalloc+0x57/0x90
Call Trace:
free_large_kmalloc
ath11k_dp_free
ath11k_core_deinit
ath11k_pci_remove
...

The issue is always reproducible from a VM because the MSI addressing
initialization is failing.

In order to fix the issue, just set the buffers to NULL after releasing in
order to avoid the double free.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath11k/dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index bbb86f165141..5a50b623bd07 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1040,6 +1040,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
 		idr_destroy(&dp->tx_ring[i].txbuf_idr);
 		spin_unlock_bh(&dp->tx_ring[i].tx_idr_lock);
 		kfree(dp->tx_ring[i].tx_status);
+		dp->tx_ring[i].tx_status = NULL;
 	}
 
 	/* Deinit any SOC level resource */
-- 
2.53.0


