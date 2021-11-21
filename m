Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC65C433F5
	for <ath11k@archiver.kernel.org>; Sun, 21 Nov 2021 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1iTIF3TSSKoWUKlR08kVVEB6aO2KpHYFS17I8M0Wl/k=; b=pnU80tSHNof/dz
	9I8qQUJG8zHNSXteIpXr4KfDb2a3FEsIrT5Z+LKDkkxyrso89wOjXP37lOpjVSsQ+NYnqGLbWqzfk
	TH/sqJX6Jz7VYSydrte0RD7tPkLPUeCKklgqcGznBWgD4QZMdZ/cPgEa/Q0s6nAZTbMwdD/7Tmeam
	sYUwwPrUmOl71jBVv5EpEglcqHfcUk5+8oMteJ+yvDdqNExh7tA0ZOv0S88V4+ePll4h3JiI4HXaV
	OEcCtXTTVkLTas6mNLF+48yH88yN9Ms5rlnpwvdqWaB+akAHGA8WpNcJLcBvIjF0UYK+Ljm0pnPUl
	tXheMamJ89aP74O4rd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1monjW-00Dm3R-Cn; Sun, 21 Nov 2021 14:22:18 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1monjT-00Dm2D-F8
 for ath11k@lists.infradead.org; Sun, 21 Nov 2021 14:22:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637504534; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=fl1apb7+urmR2/38O0MvaGw8/lSqGB1vgky91yBeifw=;
 b=n1BLmANciF/yV0eBkd9EQbgRso6hbZb6VrPGtlyRfzpwP3KhYIOUgJaVZk2g4V7CL4rsFdYZ
 j2iTkpnTcHhr9oSDDMb8XF+szNU6drlGwwH/OK5cWp9vTzPIj4EA4Z+M6v+6QrH7Br2BVldu
 YO9Y8Lp3z71l9eAhj0r03QMWvB0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 619a5614074c4f3da335897f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 21 Nov 2021 14:22:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DA6BAC4338F; Sun, 21 Nov 2021 14:22:11 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F46DC4338F;
 Sun, 21 Nov 2021 14:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7F46DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v4 1/2] dt: bindings: add new DT entry for ath11k PCI device
 support
Date: Sun, 21 Nov 2021 19:52:00 +0530
Message-Id: <1637504521-30997-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_062215_613916_66D943CD 
X-CRM114-Status: GOOD (  10.72  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Ath11k driver supports PCI devices such as QCN9074/QCA6390.
Ath11k firmware uses host DDR memory, DT entry is used to
reserve host DDR memory regions, send these memory base
addresses using DT entries.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
V4:
  - Fix dt_binding_check warnings (Rob)
V2:
  - Use reserved-memory (Rob)

 .../bindings/net/wireless/qcom,ath11k.yaml         | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 85c2f699d602..cdf7b873b419 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -150,6 +150,12 @@ properties:
       string to uniquely identify variant of the calibration data in the
       board-2.bin for designs with colliding bus and device specific ids
 
+  memory-region:
+    maxItems: 1
+    description:
+      phandle to a node describing reserved memory (System RAM memory)
+      used by ath11k firmware (see bindings/reserved-memory/reserved-memory.txt)
+
 required:
   - compatible
   - reg
@@ -279,3 +285,27 @@ examples:
                           "tcl2host-status-ring";
         qcom,rproc = <&q6v5_wcss>;
     };
+
+  - |
+
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        qcn9074_0: qcn9074_0@51100000 {
+            no-map;
+            reg = <0x0 0x51100000 0x0 0x03500000>;
+        };
+    };
+
+    pci {
+        pcie0 {
+            #size-cells = <2>;
+            #address-cells = <3>;
+ 
+            wifi_0: wifi@0 {
+                reg = <0 0 0 0 0>;
+                memory-region = <&qcn9074_0>;
+            };
+        };
+    };
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
