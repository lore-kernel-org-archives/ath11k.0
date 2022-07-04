Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851EECCA47C
	for <ath11k@archiver.kernel.org>; Mon,  4 Jul 2022 03:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=koVZ+Omu+jnIgiuJDK6arieZ0QP83SONrRD13bNQn90=; b=ncM+Idgt/AkH3h
	D5DNgqOQtsqEdXSKQnovRdSZidhWUwY3N7Z2kx8+FkULVYgU0PWbwxUlRPfFj/GIIxSKJeEh4wt9g
	VwrrhFrQIhSh29EOW2Gj2bCQaDWSnhOZcasJbGkWaLMgqJ3bJVygujbYdoJ6e7wyatvTnJq4GE+mK
	Y4glyzT2gqp7CGE3mVL9kKKFW3yRdCEQuyxbHlcO/qKgyiUoPidoy/p7xW2tOrTlFt5/wnI71Fc1b
	lBA1ut29DoTW7SZSW9AIWlnsMTETduaqYxr9xAAGxSKiVyFvdjMe2BaZky7RHwzDIiEeu4wk6Ipn8
	Gb73CGR9DOTF8Zm6OMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8CJr-003uzX-9w; Mon, 04 Jul 2022 03:00:15 +0000
Received: from [2400:dd01:100f:2:72e2:84ff:fe10:5f45] (helo=mail.nfschina.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8CJn-003uwE-Qv
	for ath11k@lists.infradead.org; Mon, 04 Jul 2022 03:00:13 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 313B71E80CD1;
	Mon,  4 Jul 2022 10:58:17 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsuYchCKhMV0; Mon,  4 Jul 2022 10:58:14 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	(Authenticated sender: jiaming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id D42631E80CCF;
	Mon,  4 Jul 2022 10:58:13 +0800 (CST)
From: Zhang Jiaming <jiaming@nfschina.com>
To: kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liqiong@nfschina.com,
	renyu@nfschina.com,
	Zhang Jiaming <jiaming@nfschina.com>
Subject: [PATCH] ath11k: Fix typo in comments
Date: Mon,  4 Jul 2022 11:00:04 +0800
Message-Id: <20220704030004.16484-1-jiaming@nfschina.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_200012_105243_9B858305 
X-CRM114-Status: UNSURE (   7.76  )
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

There is a typo(isn't') in comments.
It maybe 'isn't' instead of 'isn't''.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 drivers/net/wireless/ath/ath11k/hal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 1dba7b9e0bda..bda71ab5a1f2 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1165,7 +1165,7 @@ void ath11k_hal_srng_shadow_update_hp_tp(struct ath11k_base *ab,
 	lockdep_assert_held(&srng->lock);
 
 	/* check whether the ring is emptry. Update the shadow
-	 * HP only when then ring isn't' empty.
+	 * HP only when then ring isn't empty.
 	 */
 	if (srng->ring_dir == HAL_SRNG_DIR_SRC &&
 	    *srng->u.src_ring.tp_addr != srng->u.src_ring.hp)
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
