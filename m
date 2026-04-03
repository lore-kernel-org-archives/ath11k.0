Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D757E85370
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00QsAJAs94/ZqUyZhadzKRAFArz8oATvGeKh7GrAju0=; b=SZdm8PTuvkK5QrwrNa/S/1KluQ
	wquK0VkVZ2H4TcMnkIYnfy4gJVivLpyY4wBBHNDnn6SI4Ay1ToFSY0oyPxdzwK0KT+O59cGnp7r/G
	TfJm68dsP2heccmGVI7mhun+aAYT1E6/xkHF6Se5uR30GJ0h/2/WWCX2lfvBGu7ni/2a6q/n4xl9I
	eyVTyqzqf8y+m0huFsde6YU0lheGhyMhbRkN18eMqL/P2QkKOVKj1A0zgjJrM8iqFjgJjDtQIzOYJ
	atufdJdY7dae406E3f/spc5weuPdURH8Dim3rb5c8wMo0j7fD5HfrTpdNOaySv5kjbwiGgmWB9dgR
	uLikytdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8eze-000000026P5-3mdx;
	Fri, 03 Apr 2026 13:55:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezZ-000000026LE-20oY
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 13:55:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b93698bb57aso386397866b.0
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224519; x=1775829319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00QsAJAs94/ZqUyZhadzKRAFArz8oATvGeKh7GrAju0=;
        b=gAl15j0qjsF20YkNYpOcRxhb3zeaS7EwRoqwRbDK06GyhBVlr/mYfaFBmTRxo+Jkkk
         XFaaBd5isFKgZN0j+i5TiB3NaihYqpfMmKT3cI08ofgiNWB7//uEs3mjYYZF5jIhbABn
         wqAhxR2PQ9aRVmWFuZ8jn0Rr9pV15f5FZ98w9SU1teDs320e17PGWrqT5dFljbyov8vt
         O6DY0GnfC+fIPiqkgjqmIb0W1SO8tGFFS8EQECHi7FmwuPv3eibwwOSOYtKkEs7aCbW7
         DiN4DCGi0N5hv/Jk0xhkLXIg1LGNhtbZHxKEYd9BEIF+quMdU7JQYg5vr5+Ic1zjwZN8
         CToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224519; x=1775829319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00QsAJAs94/ZqUyZhadzKRAFArz8oATvGeKh7GrAju0=;
        b=kMpnX5in/kOHMCLsLVDA++dDJZcY5aQ4Fe5GdSwCO/vkuR9bVu2Yq8Ne7dWYUHhwtX
         z7lav5nDnYc3K3t74Kqifwf2202Pe04ic2ssVw6sZIXgttnsPbRcoPmLYL9/u7cuMInF
         FtynMhgdVodoKV53IZcvemacObQbORBNr9v2UZ9/JKw7L22rv7KWb9mU5qc4dHnik5gN
         oJjR/Nx98iD9NsfKMILfIEtRsDROxpH/lW+kutlEH2WxSLowiJwaED0J8WCDfazcdBc1
         3T2UWY4dGy6UXouykfrEfNpL7KKR9GdIoAHWr+WoxsZWoBE/rTXJHDcYnLuXNxkR6Dwo
         kdSg==
X-Forwarded-Encrypted: i=1; AJvYcCXUYp416nv4ZiizVGucqyOZVUXLbWg/Wsm1K3T5iiHzKXYhmbtYwGoZFs2Ze+VQa+XzdHWXYC0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYxH9bos5Ma96O4MaydhTEMH7C83Deo2Aw53hM1Rne9HJDuPtl
	t5oFLoYBzk7gIEJw5Ufs8b1eKSfjaZIGE0Y4hDfj52MwXCbpLbvu0cNWQtXp07WUlCY=
X-Gm-Gg: AeBDievHepoiD8/Lwy01uT+mwbRD7QMC8UVlSgMydVZ9qFw2/gXIn0y5cqiELjGuwdm
	OPp+PxS2Llhz8sgoVs6Kc8oU546UxPZFKtwiO4NJXGpb0xQcun2FLTEL5T9VRCMiTx6Cg+I7N+D
	Vc+d3P7QklzTtNy8/BuA6UyxgATrJ/YgW0CljAolQDHxzu+5JboIuD39aiEmt4Ba5Wp5oPmeJHT
	u5QBXQgZokPbXsvoQbOFKnk+Z0Ax2RusfE6ZSzFpG9rTlyjBQZ0IDAs29alJ1zVwDaw0CG+LEKJ
	d6tNbSzev9hq0lYQjySlia50JvVgp0DTCydbseYzZCZ0Fd9Ens/Bnz/TiIMOXvY6OnL1h/gJqSo
	glrIaxyO6anbkOZ6nHx/how0ptmvjljOwywGoqMplMrYVvsODPXAWlHr0aXp0ylsFQibl5Hl08N
	UpWgukAMxcEal19DKxsfDbFii+FYNBCpA7OBtmYGf+t5php9EFHPAGR9v1kSuJbpRDKOS2vawFP
	+RO5VEpXvPruoc0J9p/gJbNKCwwduRcHzaDHQ==
X-Received: by 2002:a17:906:6a02:b0:b9c:cb1:a61b with SMTP id a640c23a62f3a-b9c658742acmr142510866b.16.1775224516202;
        Fri, 03 Apr 2026 06:55:16 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:49 +0200
Subject: [PATCH v2 3/7] dt-bindings: net: wireless: ath11k: Document
 WCN6755 WiFi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-3-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1239;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bX0RSkEhHMY0CQeWiiphb/xjS1x++AeW72AXUrJMhfA=;
 b=DTJTtJ7BKJd8qPXVe3nd0JrxaYiQE2N8bwiN41dxZ5jihuyHGd6fmesGzuo/2w99jisvtHofF
 h8Mx18K34cAAflNUNQSKgyj8B17L/9Yc4dJVyM76qpuovDBjx8PeKjI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_065521_541770_5C888DA8 
X-CRM114-Status: UNSURE (   9.72  )
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

Document the WCN6755 WiFi using a fallback to WCN6750 since the two
chips seem to be completely pin and software compatible. In fact the
original downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 0cc1dbf2beef..94f8f8551756 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -16,11 +16,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,ipq8074-wifi
-      - qcom,ipq6018-wifi
-      - qcom,wcn6750-wifi
-      - qcom,ipq5018-wifi
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-wifi
+          - const: qcom,wcn6750-wifi
+
+      - enum:
+          - qcom,ipq8074-wifi
+          - qcom,ipq6018-wifi
+          - qcom,wcn6750-wifi
+          - qcom,ipq5018-wifi
 
   reg:
     maxItems: 1

-- 
2.53.0


