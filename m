Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7F8C433F5
	for <ath11k@archiver.kernel.org>; Thu, 25 Nov 2021 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1iTIF3TSSKoWUKlR08kVVEB6aO2KpHYFS17I8M0Wl/k=; b=hWAL/jd/EKfJDv
	4gEgsG9B6tCg7G4fFiADWRdJAxKRTkfdMecYbMleaP7VYiXJ6pFPUYsLIu4LB73fETjeuI0JhVHeR
	s5rgW24D7pw2X5Owf88ECOsuX3wW3e3dDkjFFrNDNk/+thZ1+djLZPjPbsH+jhNrNP/ZxOFmd8uY6
	qFz5Uo/aOh7GicsIhoDdWr2wCoiLceSYyTF6wH64HXTTef1SBe3qwdX3FADxoAn6TmoH0I3Kf+13F
	dqiCQu8Lhv6nUANK/1/9VD88Urjr8GdnnieO26q2TIUspqTtFIOCsIcBmWhkTqdAAwZdwX+Gz4P1u
	zkxjfGux9wG1k/TmHOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqCnk-007FAu-6c; Thu, 25 Nov 2021 11:20:28 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqCni-007FAP-8Z
 for ath11k@lists.infradead.org; Thu, 25 Nov 2021 11:20:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637839226; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=fl1apb7+urmR2/38O0MvaGw8/lSqGB1vgky91yBeifw=;
 b=vCwp5MMJWBFi3ULjpl3nPxz51aPqEzGdnHAkhwuI7MARiCzfiVJeiifipZy29w94PyDQvQUu
 uDOvo+R7m5/dO/kQPgK5hQTZKXGtHOBb2/dEkJpJyEr+FIcpoQtt39v9SUURhmbvG2vdaW35
 vSa9p2S//bjkGDhOrZmxITM05N0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 619f71791abc6f02d0ce5a28 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Nov 2021 11:20:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 40C72C43618; Thu, 25 Nov 2021 11:20:25 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C4CCCC4338F;
 Thu, 25 Nov 2021 11:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C4CCCC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v6 1/2] dt: bindings: add new DT entry for ath11k PCI device
 support
Date: Thu, 25 Nov 2021 16:50:10 +0530
Message-Id: <1637839211-1503-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_032026_395257_332E929A 
X-CRM114-Status: GOOD (  11.41  )
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
