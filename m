Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654126078F0F
	for <ath11k@archiver.kernel.org>; Tue,  3 Nov 2026 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hNTVzbg+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lS8HPnWp/ZiXusc6VF2DVeURTql02ont/sKJfBhomm8=; b=hNTVzbg+HJl7pGpIMNAbUplgc+
	EvIO1qMI3dnSKAO185I2j55iDYVrOHufOP2eNAMS81EM6IeK6v5mDm1CyCsWYR/3E1bfs7wb+CZey
	sZD36nyWiJGbxMWTZWpGNG9Z8aoO8MV7DzzsvauTWHiorhSgdjlBi56n++WK8L0AwyzrgD5YkRLtS
	0AIy7Bl0kKyrPfWe+DEWHabr9He5T7qBakTjKBNvHL3+iOV7f0KrG/2o6cCR0rXZf3qkXIY7xf3wG
	YRcRGhsL3XyAblTkaHfsz4XlwfLDY51HmXUUaZaibmv1f1a5/wsEX76geU/uE5NKMI6YB8/FjBLrn
	P5H6qrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBlR-000000020Dp-0GVh;
	Tue, 03 Nov 2026 10:29:13 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBlM-0000000206x-1x1W
	for ath11k@lists.infradead.org;
	Tue, 03 Nov 2026 10:29:11 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACXoZJyt+lqWao7AA--.3025S2;
	Tue, 03 Nov 2026 18:29:06 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] wifi: ath11k: release the rproc reference on teardown
Date: Tue,  3 Nov 2026 10:29:15 +0000
Message-Id: <20261103102915.1341148-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXoZJyt+lqWao7AA--.3025S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW8XF43Cw17Xr4rJr45Awb_yoW8trW7pF
	Z7W3yDKFZ8Ca1xtw4kXr48Z3WxZ3W3t3y3WrW3K3s3ZwnxJFyUt3W5XFyjqryYkry8GF1a
	vFWay3yUuFyqy3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv014x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWx
	JVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VU1
	SksDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwYAA2rpnO5vkQABsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_022908_881529_637AB1A7 
X-CRM114-Status: GOOD (  10.78  )
X-Spam-Score: -0.9 (/)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_core_get_rproc() looks up the target remoteproc with
rproc_get_by_phandle(), which takes a device reference and a reference on
the remoteproc driver's module.  The resulting pointer is stored in
ab_ahb->tgt_rproc and never released: ath11k_ahb_free_resources() only
tears down the firmware resources, and the probe error paths after the
lookup jump to err_core_free without dropping the reference either.
rproc_shutdown() does not release it, it only drops the power reference.

Release the reference when the AHB resources are freed and on the probe
error path, so that repeated bind/unbind cycles no longer accumulate
remoteproc references and the remoteproc module can be unloaded again.

Fixes: ba929d6fe31a ("ath11k: Remove rproc references from common core layer")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 27d01411b6e9..cc93ca22d3ff 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -852,6 +852,16 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
 	return 0;
 }
 
+static void ath11k_core_put_rproc(struct ath11k_base *ab)
+{
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+
+	if (ab_ahb->tgt_rproc) {
+		rproc_put(ab_ahb->tgt_rproc);
+		ab_ahb->tgt_rproc = NULL;
+	}
+}
+
 static int ath11k_ahb_setup_msi_resources(struct ath11k_base *ab)
 {
 	struct platform_device *pdev = ab->pdev;
@@ -1262,6 +1272,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	ath11k_ahb_ce_unmap(ab);
 
 err_core_free:
+	ath11k_core_put_rproc(ab);
 	ath11k_core_free(ab);
 	platform_set_drvdata(pdev, NULL);
 
@@ -1295,6 +1306,7 @@ static void ath11k_ahb_free_resources(struct ath11k_base *ab)
 	ath11k_ce_free_pipes(ab);
 	ath11k_ahb_ce_unmap(ab);
 
+	ath11k_core_put_rproc(ab);
 	ath11k_core_free(ab);
 	platform_set_drvdata(pdev, NULL);
 }
-- 
2.34.1


