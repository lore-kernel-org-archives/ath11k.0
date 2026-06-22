Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06E5CD98E4
	for <ath11k@archiver.kernel.org>; Mon, 22 Jun 2026 02:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/dZrKZyJQsh8CVq0V1vQx87a/QiFzODktdeo6xpWzw4=; b=nMpLE6M8fw5tnKsD5ql36Ufzjj
	3J0dE6MCiXaE5GTedn0Thi/+Ql6B4Vvh8OceKBFneqyLwYaLkPWocaHjyHd5AraRuxhvJNoGivASx
	jHpB3ClbyujJa9gQQfjbOTAh+daQmwr0JNMwn6AmZ/lZ77KNwoaydbAOYJn9WEgE2p1kyq+7xUldO
	HQq3Vs8HEIx9zGcQMd7sbqK3gQu6BTL4Vg5JY57iO0smBWX8de4w7M0AQCPHQdXJzsjHtcdgN9PVP
	EHP5e4wiUD6ICXSkrK/ZVZXXc3HA/ihimpchFihGoyiRpO7gb6qj8ELp7tagWFVWit1rf4koibzsw
	RQ3o7BxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUr1-00000004KZ7-3xUg;
	Mon, 22 Jun 2026 02:57:44 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUqy-00000004KYl-14IV
	for ath11k@lists.infradead.org;
	Mon, 22 Jun 2026 02:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782097034;
	bh=/dZrKZyJQsh8CVq0V1vQx87a/QiFzODktdeo6xpWzw4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=XBTvLEnmzBfaYFKSDBi66rkPNaIh2yqgAZjsnJk49fON2lU56gMLiCHNUcspGXHK1
	 5hrvWYTBVwsaZ/ydofeWDc9NeVrB5Cpvi4hHKsAqiLY2DgecQ+H/ghLRYoWQi7Y8zO
	 02eXX0yePFk3KOBS0B57TuHRlOGun5rHL7p7j8/I=
X-QQ-mid: esmtpgz13t1782097029tf773796c
X-QQ-Originating-IP: pQAhdQ2K8DBH86OGSYD/2Bl7UlibMqvqKXMwSU7VKEI=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Jun 2026 10:57:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3873773278757756852
EX-QQ-RecipientCnt: 5
From: ZhaoJinming <zhaojinming@uniontech.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: [PATCH] wifi: ath11k: fix resource leak on error in ext IRQ setup
Date: Mon, 22 Jun 2026 10:56:59 +0800
Message-Id: <20260622025659.1235658-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: OapyzHutjwH/z1OrIGPVJ617gkaKfgP7BZAlBmZl2KmQdumzbHbzDKS/
	VwpN9/92Z4YZTK8Cf9MVjEfYoItwOLU8K/GAyI/le47vS+3GuGIBOQJy6DZocBZr7YvO0z7
	jPqd3lMCiOdyG6G+YHrPPitOFKmF0995fwxW9L0Jn6Pm6wlhH1Fg1axcZlMtSIDuqO3Xnjv
	BCovHc96nY1gM0Z1aoKI5PD4mrIlKZSSbQaLe7e6xVuj4/Dzf5vnvaDzXK+FzuBlR2h1Juc
	beZh5r0KCkCYdJiFw6rc5qMcf9Lsm1a5xGZavj1xyZyU1Gts3dK7tUeCxeYOFyIZYATzD+t
	RQakM0lEqdk6ybBcNjHmPHrmTB+SnK9dyxv5iZZlTX8WcIm88oQjhpt3PDQzJsa0BkxvuJf
	QQwv1OABIPwA66EWFPwqOx1/ypO5Nvfk9sbuQ4ubWP8OAwcFMwqppCSD02GL2Ice6HqerQe
	3uYZVSpE5fwwKpG16fWx30QAGJo12F0pOoULUpa44VXdrgl0tIN5k6B5u1rDQip79dxCjWO
	ZX3nsDPdhb32qGhIg+eRUcp6dr2rrawO3OyOnyT9E8wZGbolUmdpSflXm/zeUnENq+JO2lg
	0AFv+SmkOIY6SCLe8MiSRFlc2HTSfyF3sTGMLWcWmw+l5vLviivNiljHwSLtNcITwTR0kUs
	2KhOkAeTVdGo9XP7UPXRB+wh1gp6sAS2/s48sGGzBkxmHlFJrK35NusSL8oMbmDX8zpo2HU
	uOLQ1FWEWIS3WWlDRPrmxcMrmYrRCL6xFnqCzGyUvjfF9s0fmFlLOYFzTyYjkKZroeMOTKF
	GNtCC0Ae2zTy3d+HYCTRLEHNI+IbtLS4Nuy6dkwpqeSxVuogrII7Try7XcTvkX247TWoS1j
	PygKulq9ZOD1sY+jsPUP6pVhzGx5jvxh3nyik7USNK9kZvnMvqbBdMaebdFSDHRd/JbnX5n
	X3D8dze/peG2M/nZlW19JtP+ZSBdOrjrstdRd1ygPVXmBJOwYZf2XAfpvUaAo8LvkyeSGR6
	CsZzC8KgeNwBu9kOcvEEjrheFqLmI=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_195740_830162_AE24E10E 
X-CRM114-Status: GOOD (  12.65  )
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

In ath11k_ahb_config_irq(), when a CE request_irq() fails, the function
returns the error immediately without freeing the CE IRQs that were
successfully registered in previous loop iterations. The probe error
path does not call ath11k_ahb_free_irq() either, so the previously
registered CE IRQ handlers remain attached to the interrupt lines and
are never released.

In ath11k_ahb_config_ext_irq(), when an external request_irq() fails,
the error is only logged and the loop continues. The function then
returns 0 indicating success, leaving the device in a partially
configured state where some external IRQs are not registered. This
causes enable_irq()/disable_irq()/free_irq() to be called on
unregistered IRQs during runtime and remove/shutdown, triggering
WARN_ON(!desc->action), and missing interrupt handlers lead to data
loss.

Additionally, if alloc_netdev_dummy() fails for a later IRQ group, the
function returns -ENOMEM without freeing the ext IRQs and napi_ndev
that were successfully set up for earlier groups.

Fix all three issues: propagate the error up to the caller and unwind
all successfully registered IRQs and allocated resources on failure.

Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 30 ++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index f566d699d074..041c0fefe8c8 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -536,8 +536,10 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
 		irq_grp->grp_id = i;
 
 		irq_grp->napi_ndev = alloc_netdev_dummy(0);
-		if (!irq_grp->napi_ndev)
-			return -ENOMEM;
+		if (!irq_grp->napi_ndev) {
+			irq_grp->num_irq = 0;
+			goto err_request_irq;
+		}
 
 		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath11k_ahb_ext_grp_napi_poll);
@@ -600,11 +602,25 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
 			if (ret) {
 				ath11k_err(ab, "failed request_irq for %d\n",
 					   irq);
+				irq_grp->num_irq = j;
+				goto err_request_irq;
 			}
 		}
 	}
 
 	return 0;
+
+err_request_irq:
+	for ( ; i >= 0; i--) {
+		irq_grp = &ab->ext_irq_grp[i];
+		for (j = irq_grp->num_irq - 1; j >= 0; j--)
+			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
+		if (irq_grp->napi_ndev) {
+			netif_napi_del(&irq_grp->napi);
+			free_netdev(irq_grp->napi_ndev);
+		}
+	}
+	return ret;
 }
 
 static int ath11k_ahb_config_irq(struct ath11k_base *ab)
@@ -629,8 +645,16 @@ static int ath11k_ahb_config_irq(struct ath11k_base *ab)
 		ret = request_irq(irq, ath11k_ahb_ce_interrupt_handler,
 				  IRQF_TRIGGER_RISING, irq_name[irq_idx],
 				  ce_pipe);
-		if (ret)
+		if (ret) {
+			ath11k_err(ab, "failed request_irq for %d\n", irq);
+			for (i--; i >= 0; i--) {
+				if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
+					continue;
+				free_irq(ab->irq_num[ATH11K_IRQ_CE0_OFFSET + i],
+					 &ab->ce.ce_pipe[i]);
+			}
 			return ret;
+		}
 
 		ab->irq_num[irq_idx] = irq;
 	}
-- 
2.20.1


