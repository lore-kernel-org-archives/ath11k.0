Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F94C5478C
	for <ath11k@archiver.kernel.org>; Fri, 23 Feb 2024 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NFnawQLqckakB5qhJof+/PNCBcsfRpomgyB1w5DcmpI=; b=v/deNcD6yYXNwWxygiMQkOSUID
	qzV4LqnS+oUZcZMvaxJQYXKbNkH/WMBa6xSlklQHxGTrPghVvgVGpyZnndeSs/5cp7FY0SS/PuUoQ
	mndKBlybstx6YfNX5nkvAmuVb/vy7FyNyGY5R+l5iqD2qG3HaoWaUd0VCVw0aHq4XK0Qok6I791DL
	pzIQaU5tabiXcU8aebWY5QXDz1VM9NXsQOwunNK4mqGQCkwDf3cw1e0mIhshBh8PEs8S5AjOyaHwH
	PxPc0bzjUjuakym7ferq+FURiLxfOVxf1pcjPv9OJkcMcz+4zDnFVjFigpsQycGVTd9/mdwKzWXzs
	cwksb/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdRRQ-00000008b3f-1WpN;
	Fri, 23 Feb 2024 09:02:00 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdRRN-00000008b2O-283D
	for ath11k@lists.infradead.org;
	Fri, 23 Feb 2024 09:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=NFnawQLqckakB5qhJof+/PNCBcsfRpomgyB1w5DcmpI=; t=1708678915; x=1709888515; 
	b=DImYfY8sDqUT1OHQt1KpSlV9aj3F8rocXrtAqC/Ez4eRTlUJTyjH9d8ZEodjVXqZJMit+9OFlHG
	OaTDCYDv0BBIVQIo3qd1g1X1XyjqjMEp7uhyBib2NV7C0t2SN0lKGSBChv5BTh5JcU8lQc3b4iSNH
	8dx4fPIUavm4YnE7Rnw2+mSCOp40Go5037zVNIIL2x+uioVZIgo9+6wuskngSeCiYGW7f7FhM8W+J
	8WuMJh7jZnA0sXabPlDht3yrGuzQ9jZnbCFCNjnqOL3deS3xu789MlofBM7fMkHYbCiSGMnjrz98p
	YbSJPxUoOXSEBO018aVDpUhHD432ksn2UJjw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rdRRG-00000004yKf-17gB;
	Fri, 23 Feb 2024 10:01:50 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH] bitfield: suppress "dubious: x & !y" sparse warning
Date: Fri, 23 Feb 2024 10:01:46 +0100
Message-ID: <20240223100146.d243b6b1a9a1.I033828b1187c6bccf086e31400f7e933bb8373e7@changeid>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_010157_702732_D7D18D82 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Johannes Berg <johannes.berg@intel.com>

There's a somewhat common pattern of using FIELD_PREP()
even for single bits, e.g.

 cmd->info1 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_MSI_SWAP,
                          !!(params.flags & HAL_SRNG_FLAGS_MSI_SWAP));

which might as well be written as

 if (params.flags & HAL_SRNG_FLAGS_MSI_SWAP)
   cmd->info1 |= HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_MSI_SWAP;

(since info1 is fully initialized to start with), but in
a long chain of FIELD_PREP() this really seems fine.

However, it triggers a sparse warning, in the check in
the macro for whether a constant value fits into the mask,
as this contains a "& (_val)". In this case, this really
is always intentional, so just suppress the warning by
adding "0+" to the expression, indicating explicitly that
this is correct.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 include/linux/bitfield.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index ebfa12f69501..63928f173223 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -66,7 +66,8 @@
 				 _pfx "mask is not constant");		\
 		BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");	\
 		BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?		\
-				 ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
+				 ~((_mask) >> __bf_shf(_mask)) &	\
+					(0 + (_val)) : 0,		\
 				 _pfx "value too large for the field"); \
 		BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >	\
 				 __bf_cast_unsigned(_reg, ~0ull),	\
-- 
2.43.2


