Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EA2C433EF
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 14:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B2061181
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 14:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98B2061181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+3Cif9e1W+c27WL2P0tVZetdCyOB2rQHJOCxHI5o85c=; b=XZL02G9xlNVZBi
	YWwFQz+r7sjplpMA3tcDr+yY7pZgVxllDWBT6UlL+7vOUzsjuVY/Y9r27/08PfuB6Kl/68r1l2nuK
	OW6RlqEOHh18tFCMOY+JwYGoSS1jVQgDeNm+amMOzelmVdzxTCRgR9SEsXqjJDekedFW3ECH6LOPX
	X71ypOZeJH+MZk4TtVX/83fd/WYMl2Q80FEDQrhoqW9EI7iRbA8zt2sR1f9wPRzQYmLQo+4ta13qu
	8BQkRFuIlQySVBlfzpjghyqFSOBTziodqmFQLfGwlkFKX6kIovCZu//1iBsxGSERhw2aTvsSRpddY
	hE9cCCiFN95cg59yzzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mniBy-00846G-TU; Thu, 18 Nov 2021 14:15:10 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mniBv-00844z-CW
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 14:15:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637244907; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=VU8pidLC2r5304DrVYrsbQSM+ifrch1Vq/R8dz9gwts=;
 b=i/f7PDAXvKot3XhJbLQMBgIaps+SwsxGK9x1l81pR3eaa3RxpqTX9/OnL/JI74BELOkEwMiE
 oUKRU0vc1xFjxW1OnisCVzLXSACw6/IxiZBLxUrBb5EYpL5hY+Na1K0gJRQ9ipBE93RQVvVV
 5yXkSCaSvqSU+MYK96AAfTz1NQ8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61965fe7c48ba48884ca7281 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 14:15:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DADEEC43460; Thu, 18 Nov 2021 14:15:02 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BE1AFC4338F;
 Thu, 18 Nov 2021 14:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BE1AFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATH v3 1/2] dt: bindings: add new DT entry for ath11k PCI device
 support
Date: Thu, 18 Nov 2021 19:44:51 +0530
Message-Id: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_061507_915752_A2761B1D 
X-CRM114-Status: GOOD (  10.40  )
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
Ath11k firmware uses host DDR memory, DT entry is used to reserve
these host DDR memory regions, send these memory base
addresses using DT entries.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
V2:
  - Use reserved-memory (Rob)

 .../bindings/net/wireless/qcom,ath11k.yaml         | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 85c2f699d602..5a8994f6cb10 100644
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
@@ -279,3 +285,45 @@ examples:
                           "tcl2host-status-ring";
         qcom,rproc = <&q6v5_wcss>;
     };
+
+    memory {
+        device_type = "memory";
+        reg = <0x0 0x40000000 0x0 0x20000000>;
+    };
+
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        qcn9074_pcie0: qcn9074_pcie0@51100000 {
+            no-map;
+            reg = <0x0 0x51100000 0x0 0x03500000>;
+        };
+
+        qcn9074_pcie1: qcn9074_pcie1@54600000 {
+            no-map;
+            reg = <0x0 0x54600000 0x0 0x03500000>;
+        };
+    };
+
+    pcie0_rp: pcie0_rp {
+        reg = <0 0 0 0 0>;
+
+        status = "ok";
+        ath11k_0: ath11k@0 {
+            reg = <0 0 0 0 0 >;
+            memory-region = <&qcn9074_pcie0>;
+        };
+    };
+
+    pcie1_rp: pcie1_rp {
+        reg = <0 0 0 0 0>;
+
+        status = "ok";
+        ath11k_1: ath11k@1 {
+            reg = <0 0 0 0 0 >;
+            memory-region = <&qcn9074_pcie1>;
+        };
+    };
+
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
