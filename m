Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435A0CD6E79
	for <ath11k@archiver.kernel.org>; Tue,  9 Jun 2026 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uGOt1nUcopWPIrPA6jhedcr+UXADNIFtFpE2Wo40jXI=; b=zrcjeWZ0ROotzoyxxaqnz2tMNY
	mJ8yq7WImky+eYwzEILRqTzA3vl31W6yN3fXXZIpxGrWZldTuu9GNurAV5VPgy/B8ngwuSxvvKGQD
	lQsFKNssDyty25z70LKrDZWLMdVE191wxsYxEch408TrN1ixohxbd1WeOpfVDE2pp4HrrEqsfXq9w
	Lxp/83IowDEUSh/Ut1TSywHtkoW+mE6vmuL07H/FoMQkSXMg8GlD60UQNkEv5ijMXHcYGb6dJ4qZm
	zvuVQ2DaNbxcfgw7Z9V5y0/HVnd954/SZCdiy81sm2XfnSKpXRKtrxNZH7QnsGktbjm3kMWpAkdw1
	IVeP7G9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsiN-00000005CdZ-2KzL;
	Tue, 09 Jun 2026 09:25:43 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsiI-00000005Cbo-3ZJc
	for ath11k@lists.infradead.org;
	Tue, 09 Jun 2026 09:25:42 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADHNekP3CdqzRrQEg--.260S2;
	Tue, 09 Jun 2026 17:25:35 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath11k: fix refcount leak in ath11k_ahb_fw_resources_init()
Date: Tue,  9 Jun 2026 09:25:28 +0000
Message-Id: <20260609092528.220547-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHNekP3CdqzRrQEg--.260S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDKr15GFykJFy8AFyDGFg_yoWDJrg_GF
	4Sg3Z2vryaka1jgws8Ca1ayw4SkF9rWF97Ga1IqayrWa17AFyUAry5uFn8JF92kr40vrnx
	CFnrXFy8Zw1q9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcFxUUUU
	UU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4NA2onp3TYGAAAsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_022539_270214_65978CFC 
X-CRM114-Status: UNSURE (   6.94  )
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

of_get_child_by_name() returns a node pointer with refcount
incremented, but the error path when ath11k_ahb_setup_msa_resources()
fails does not release it.  Add the missing of_node_put() to avoid
leaking the reference.

Cc: stable@vger.kernel.org
Fixes: 095cb947490c ("wifi: ath11k: allow missing memory-regions")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 08d3a0c8f105..8a08275db40a 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -996,6 +996,7 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
 	ret = ath11k_ahb_setup_msa_resources(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to setup msa resources\n");
+		of_node_put(node);
 		return ret;
 	}
 
-- 
2.34.1


