Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A32CDB482
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 15:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k8LIy7DpU9ngg0RRQLgDJEUEeGwb32UlbRkpROf3+No=; b=FRmW6Q9/Ak4McH
	umpZbNpQDs1NhdARDwMJ3hrgJKNpFe1aIu2OGs1HEUVl3+rDpxOsiRJIPtCvX/Maq7ZlQetK4uXLK
	X7CgtsDJTbZZ6bNvQ8GZhuCA9vcX5UXWBLTQcrsrjoywMhWUxyILjax9z3dd1gB5emJjfHtC5iNVG
	yffPCjcDc6HzluGcbzasTJavThSh3O8nlhfDd4xppQL+nrEEvyCeng+tF6A/3LIfHFB9ztw8tQtTW
	Ig934md/ckLAJQHzyB9zaCe5uyb6FS+G5qyfEhriTpUo9VFq/3fCmSJIhjHlOfkpKb//wshv4H3o7
	d3CNyJG8HPkJdYioKheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVLV-000GGy-2E;
	Thu, 19 Oct 2023 15:54:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVLS-000GFh-0q
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 15:53:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9E71CB8290B;
	Thu, 19 Oct 2023 15:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B09C433C8;
	Thu, 19 Oct 2023 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697730836;
	bh=wa4WXUdBJDSprT0pug2ujhG4LLF9gr+xArqonoxADzw=;
	h=From:To:Cc:Subject:Date:From;
	b=sXKWpTylvlESxh+A9Ob0R/6Ik+gMuidD6esDgwByGAV8s6TPXDJolqJ8+l+mEAHYh
	 d1M59feYyobvivShElD7sHFA1952PL4IhTuygo2gVnCTiM2/+aOmL/VMxuVNXQlC4B
	 Pkvr7U9z4QIB8r2Jy2rKHXVbYa09DwZn3Xd8/Aeg4Ou4eBbaFlpGA3Be3uOG7gU4aZ
	 WtR6mxZnlEKNWalKmfIDIYPn/XQKlFxyTwnjR2f24gw0BqI3BQbR4AIdNxYFE0gNg4
	 RyNzKWp8mWJSCHYMNKmjQcGRBOQ8FnAi+LDtskbRn2XKQ/Ygc/VHfWOZL9VNFS+mPd
	 ljpK+AzNp49rg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtVLT-0008Eg-2K;
	Thu, 19 Oct 2023 17:53:59 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Carl Huang <quic_cjhuang@quicinc.com>
Subject: [PATCH] wifi: ath11k: fix gtk offload status event locking
Date: Thu, 19 Oct 2023 17:53:42 +0200
Message-ID: <20231019155342.31631-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_085358_456720_9CD89E10 
X-CRM114-Status: UNSURE (   8.77  )
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

The ath11k active pdevs are protected by RCU but the gtk offload status
event handling code calling ath11k_mac_get_arvif_by_vdev_id() was not
marked as a read-side critical section.

Mark the code in question as an RCU read-side critical section to avoid
any potential use-after-free issues.

Fixes: a16d9b50cfba ("ath11k: support GTK rekey offload")
Cc: stable@vger.kernel.org      # 5.18
Cc: Carl Huang <quic_cjhuang@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

...and here's one more, this time using the
ath11k_mac_get_arvif_by_vdev_id() helper.

Johan


 drivers/net/wireless/ath/ath11k/wmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index f0eac6cb84fd..78af659b1ccd 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8618,12 +8618,13 @@ static void ath11k_wmi_gtk_offload_status_event(struct ath11k_base *ab,
 		return;
 	}
 
+	rcu_read_lock();
+
 	arvif = ath11k_mac_get_arvif_by_vdev_id(ab, ev->vdev_id);
 	if (!arvif) {
 		ath11k_warn(ab, "failed to get arvif for vdev_id:%d\n",
 			    ev->vdev_id);
-		kfree(tb);
-		return;
+		goto exit;
 	}
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "event gtk offload refresh_cnt %d\n",
@@ -8640,6 +8641,8 @@ static void ath11k_wmi_gtk_offload_status_event(struct ath11k_base *ab,
 
 	ieee80211_gtk_rekey_notify(arvif->vif, arvif->bssid,
 				   (void *)&replay_ctr_be, GFP_ATOMIC);
+exit:
+	rcu_read_unlock();
 
 	kfree(tb);
 }
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
