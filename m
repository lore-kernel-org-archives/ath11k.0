Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC8FCCA483
	for <ath11k@archiver.kernel.org>; Tue, 21 Jun 2022 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbZLR1zWhBbu/LxGI16fv6t/fWH3pm2lNJrCUzaRowE=; b=jJvpxA293HFfmJ
	ikWkbIgxIrzwagnQAAo2fBGclZt0XHXvGGngaolObTtvUGvUr9O4N0PGDJGM2ASMMMgl2qCZdFgrP
	vMOabKV+xY0jOMlvBq/6alu3WvUXsLK+ClZN3WNtHyQ7k9gb5P4h8wqxhvX8/rcW+bbl4HxfJf2IP
	xXpwAySIs+QhOaXGahCbrUe2Eh0haEa6ionzvBG5iGWORbSdWXKNGkTqyNDEBEfRa9W8i5Lz1HQYU
	yjchjCfJcQLVq/FmvqIcbXKpxZRpNYURIizQfyZJVnlzdu1Q2YkLFVCXV4a/x4gXAZgFAPYJy8W7y
	7F4hv57Fs+8xlISZA4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3eKF-005mar-7q; Tue, 21 Jun 2022 13:53:51 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3eKC-005mZD-Cv
	for ath11k@lists.infradead.org; Tue, 21 Jun 2022 13:53:49 +0000
Received: by mail-ej1-x635.google.com with SMTP id fu3so27669116ejc.7
        for <ath11k@lists.infradead.org>; Tue, 21 Jun 2022 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+bnD9hK3prWl6/gYLDJgj48e9xi4+igUWjv8z3KjEBQ=;
        b=LowuFnu5EJgFHfzLAZhiUV7XOQNZYlScpKJ1ehzxo7KJUk/9pWR71H5EwqtpxEx3Fb
         YfUSnzxFnVD5ot3ZdEG/1igUSRaTi/xWfLb5fuEOpbNSFVuKIjJTVrwwTHeCLKoMRJiK
         KzxkPB4jtqUyMX0mNr0addwuL2bf1o/va3KQGfEucHbsrEipOW/Tu6qRQGWNAR36wPQ+
         0l4e/9P2t8Qt6/XCOfuMjO/QegqXx1ndv31XZaecmI15AW/LMCT7QJ6ogvgzx/NhjVmj
         ZQ5RnwLxa8kMBixDilmjmSKpGebk/zzlWsGhbtnErPIUxik2SZ6+HuZ2IUPl9ttXvmGG
         G9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+bnD9hK3prWl6/gYLDJgj48e9xi4+igUWjv8z3KjEBQ=;
        b=TbJ7dIqbnTy4InP60pzbBY8qxl37d3n15zLIeoP+GzQe03u3DJAYTJ7NknrOS07UwY
         Y1smo4wZFJaUk+dDgI4b53DqOM2vGDMF6bjYWkkO0ZZz5+ZeNCa47xxUtZqHNc8VVYe6
         W1hDbYd8etG+P5vzOZwJw1n6JrMkCkR48Fu1+AydULzJsqWFrqdLWYQjJ2PDmSL/dmBj
         l5ir1RDWCN2mRgvlaygCDGtxGfPVL7hgElsHEV84vY5aZUGO+BNOrZqQs5djcaorV7uJ
         CCRpdnr968toGDnaXlRL+SMIqBBSeK4bEuKUm8yckUqsROtO095oj8o/kcbbPVKSJjEA
         cCTQ==
X-Gm-Message-State: AJIora/P2PGJduDM+sk9Wc4eCItT/5r3vDLM8yPzTCACsCGxB8h7PQND
	tAlgyH4b8uKPf3wJsM2rhG4=
X-Google-Smtp-Source: AGRyM1t1OnGmn/19PEpvpFJ5PtSkks3BLBi/GIwdyVDyqV8uzkzUJ+za1jeXY1Kw9XAFhVPac2/SNw==
X-Received: by 2002:a17:907:7b8a:b0:707:59d4:14a3 with SMTP id ne10-20020a1709077b8a00b0070759d414a3mr25833143ejc.51.1655819624627;
        Tue, 21 Jun 2022 06:53:44 -0700 (PDT)
Received: from fedora.robimarko.hr (dh207-99-158.xnet.hr. [88.207.99.158])
        by smtp.googlemail.com with ESMTPSA id fy11-20020a1709069f0b00b007104b37aab7sm7325408ejc.106.2022.06.21.06.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 06:53:44 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 2/2] ath11k: search DT for qcom,ath11k-board-id
Date: Tue, 21 Jun 2022 15:53:39 +0200
Message-Id: <20220621135339.1269409-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621135339.1269409-1-robimarko@gmail.com>
References: <20220621135339.1269409-1-robimarko@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_065348_475752_471C61B9 
X-CRM114-Status: GOOD (  14.99  )
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

bus + qmi-chip-id + qmi-board-id and optionally the variant are currently
used for identifying the correct board data file.

This however is sometimes not enough as all of the IPQ8074 boards that I
have access to dont have the qmi-board-id properly fused and simply return
the default value of 0xFF.

So, to provide the correct qmi-board-id look for the qcom,ath11k-board-id
property and use that.
This is what vendors have been doing in the stock firmwares that were
shipped on boards I have.

It should be added to DTS like:
	wifi@c000000 {
        status = "okay";

        qcom,ath11k-board-id = <658>;
        qcom,ath11k-calibration-variant = "Edgecore-EAP102";
    };

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 00136601cb7d..9d27b4968d10 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2172,12 +2172,14 @@ static int ath11k_qmi_request_device_info(struct ath11k_base *ab)
 
 static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 {
+	struct device *dev = ab->dev;
 	struct qmi_wlanfw_cap_req_msg_v01 req;
 	struct qmi_wlanfw_cap_resp_msg_v01 resp;
 	struct qmi_txn txn;
 	int ret = 0;
 	int r;
 	char *fw_build_id;
+	unsigned int board_id;
 	int fw_build_id_mask_len;
 
 	memset(&req, 0, sizeof(req));
@@ -2219,7 +2221,9 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		ab->qmi.target.chip_family = resp.chip_info.chip_family;
 	}
 
-	if (resp.board_info_valid)
+	if (!of_property_read_u32(dev->of_node, "qcom,ath11k-board-id", &board_id))
+		ab->qmi.target.board_id = board_id;
+	else if (resp.board_info_valid)
 		ab->qmi.target.board_id = resp.board_info.board_id;
 	else
 		ab->qmi.target.board_id = 0xFF;
-- 
2.36.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
