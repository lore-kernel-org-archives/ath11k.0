Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26243C433F5
	for <ath11k@archiver.kernel.org>; Sun, 16 Jan 2022 14:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xPgKUmvE8o/tVNFhHCNpKRd4BfQtd6Dmipm3XAE3oGA=; b=B/g2SBMt4v9wnJ
	T2xT3Q7rKZx+sY3OTKfS3YerE3citd8esqH/5N2St5V5pDMH8axpv2nUK9URgxxMtAwXj6Gs2w5gM
	0m+1yG1lyihHp1QoJQuhA0aOMqF7+qPGJ1jAPixOFDLbBlh/76FpfSk9E35pvqp+xvWUGFT6NREL9
	wagnZDdL5svAbDHQ3VGXlgpyQ76wvDA66nS/+dP/r0/Cz/9S06o7bTtYkW970IgNGFppRFCsLKfD9
	S7DXwgxXkX2YgXd1RUGmXXlPCQbsLjp6+LHE0dd1t8Q5nnJsSTP0NOXi5iPeadXaCEMTsc+aDjAFq
	c3wGOPERJgAykw4+49+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n96jh-00CZ2V-30; Sun, 16 Jan 2022 14:42:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n96jc-00CZ2A-F3
 for ath11k@lists.infradead.org; Sun, 16 Jan 2022 14:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642344138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JRRT3Yl7+f6HbkWI411SEh1HSKqxqkLW8Pqe76fS2Gs=;
 b=PIFtzaXVa99lKXFHkdFR8GvwKnv5PWCpRq02V7zWQh+gbmAAPQgOtJv8ZK3oObMFzC9EeU
 6HFTjayOusuMT9whJvcJsC+LZl+CmXdKgQATCglucn0VJ9cT6/0RqbQOAg0R+1UeMC+EyN
 GO2XR2CwKw5R3d3t/IMrudKblO/wqYE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-2CTDAU9VNOefj8tPZ7EV1g-1; Sun, 16 Jan 2022 09:42:17 -0500
X-MC-Unique: 2CTDAU9VNOefj8tPZ7EV1g-1
Received: by mail-ot1-f70.google.com with SMTP id
 c12-20020a9d784c000000b00592bc6a710cso3824276otm.17
 for <ath11k@lists.infradead.org>; Sun, 16 Jan 2022 06:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JRRT3Yl7+f6HbkWI411SEh1HSKqxqkLW8Pqe76fS2Gs=;
 b=usWUtjkJoLrRJBLdOw5wKc9GhF3UNPymrK3uhZeF47AOXYKXme90HlbYS0+WKB0sTZ
 Pru0wZtMqtQCGyNkHaLw8TCo6Ys4mRl99i1w02Fxez81fW64y6Yl1R/M5PH1GnRr5VwK
 e2vfiqpFF42oUZQhunPvc/5WGsrBNF3DYec8twb8lrJgjsHxgNWKhx1eyDtzLas640va
 L2YB+iJ8nSGvf+qR0F3eHeToNQFRHtBe1UvvI++yu3e5+Xql6S7Yr6cP4vfMDxTjB/Ps
 LorT0DSuLjMYJ4cxD0DTXROjofqVpj7W8Outj06jUV0flGLUSvX6nrkJJMwG3MIWet/c
 dYNA==
X-Gm-Message-State: AOAM531/tlllfZMv+8E63zMjQO7J8u/1s3vgm8FWGyTDSdeqaBQ7S4nX
 JSytP4/DYP0xBUa4680fJcx5hLnl75F5biS0DlCnO53uEhWg14eFjz3SY7/WcygClM0pdvSRif8
 h5+zJope2zb80XDMPmSbp4g==
X-Received: by 2002:aca:1c16:: with SMTP id c22mr4588766oic.83.1642344136528; 
 Sun, 16 Jan 2022 06:42:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrmwZp7l+rQuzj7d+eeD89HQdHOy2AEvZ4lDFXM1Xjeb9/2maMuS4teFTtAREUYd6VJgPcwQ==
X-Received: by 2002:aca:1c16:: with SMTP id c22mr4588753oic.83.1642344136355; 
 Sun, 16 Jan 2022 06:42:16 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id b22sm2168045otl.24.2022.01.16.06.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 06:42:15 -0800 (PST)
From: trix@redhat.com
To: kvalo@kernel.org, davem@davemloft.net, kuba@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, akolli@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Tom Rix <trix@redhat.com>
Subject: [PATCH] ath11k: fix error handling in
 ath11k_qmi_assign_target_mem_chunk()
Date: Sun, 16 Jan 2022 06:42:06 -0800
Message-Id: <20220116144206.399385-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_064220_727871_D9338C1E 
X-CRM114-Status: GOOD (  10.07  )
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

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this problem
qmi.c:1935:5: warning: Undefined or garbage value returned to caller
  return ret;
  ^~~~~~~~~~

ret is uninitialized.  When of_parse_phandle() fails, garbage is
returned.  So return -EINVAL.

Fixes: 6ac04bdc5edb ("ath11k: Use reserved host DDR addresses from DT for PCI devices")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 65d3c6ba35ae6..81b2304b1fdeb 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1932,7 +1932,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			if (!hremote_node) {
 				ath11k_dbg(ab, ATH11K_DBG_QMI,
 					   "qmi fail to get hremote_node\n");
-				return ret;
+				return -EINVAL;
 			}
 
 			ret = of_address_to_resource(hremote_node, 0, &res);
-- 
2.26.3


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
