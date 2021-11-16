Return-Path: <SRS0=S5NU=QD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E59AC433FE
	for <ath11k@archiver.kernel.org>; Tue, 16 Nov 2021 17:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 347A561A7D
	for <ath11k@archiver.kernel.org>; Tue, 16 Nov 2021 17:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 347A561A7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V0zCVH0pbBkMqF9QxTUwR03PsF+6XjhC0WDi8KYPfvM=; b=yTTQEKbWD4KFDR
	LRgyQoqVc5zYV2U9EJWZj68nZkjBfIGRfnw8yjcirVG91F/WaNmp0Cv2yRF+IYlqg0vM0CBeu88yG
	ilxCYKxhxA/ixl8/QygesXn0lkVG8H1KfFRBT2+ApFIUY/saDPYpCsT9+1wizhS8knY0D00GIr5sK
	PmlE+YIykfQye3tC4HeUxhAejTfMSYE9vclV/oOGNroGr2HRCyL2ayL0vwnYNEKJPmJfLbMBspupH
	oz6MTdIgpJbBfBGBFL0EcMGIa4ol0mK9ZA0kp6YBglpsTqrI4JJMpv2UmLjRPM+MpQTC3y4Y6g8fc
	sA59OfjwsuEwdUJjdPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn1q5-002QE7-Ti; Tue, 16 Nov 2021 17:01:45 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn1pz-002QCa-7I
 for ath11k@lists.infradead.org; Tue, 16 Nov 2021 17:01:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637082103; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Rop6+pKPEvQU+xQMfRti5sOltyR79Vc41v+uGCw1LOs=;
 b=ovwKAkVhx0lJ0NLIk1hZ/rFzi9XUfxbndj2X9zxphEe4l1r0db8jMx98N82PiLRs2hghEZmI
 9TNxWsz0aJ61WT66wcS/+qxOArJseA2tkIRE4MIndRjkVgo+P/xamloetDNP9k5H2GUe/Yrl
 n43pLQimUvpnZjtWelNcTyf0HV0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6193e3d760a72f6110eb4ecb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Nov 2021 17:01:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6CA74C4360C; Tue, 16 Nov 2021 17:01:10 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EF318C4338F;
 Tue, 16 Nov 2021 17:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EF318C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v2 1/2] dt: bindings: add new DT entry for ath11k PCI device
 support
Date: Tue, 16 Nov 2021 22:30:57 +0530
Message-Id: <1637082058-6398-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_090143_861525_10F370E6 
X-CRM114-Status: GOOD (  10.92  )
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
Ath11k firmware uses host DDR memory. DT entry is used to reserve
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
