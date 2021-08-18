Return-Path: <SRS0=1CV/=NJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9E7C432BE
	for <ath11k@archiver.kernel.org>; Wed, 18 Aug 2021 06:24:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3497561106
	for <ath11k@archiver.kernel.org>; Wed, 18 Aug 2021 06:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3497561106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20KGPwDORfyIHbr19ENn+VvXbbEdiXbbjXLHhiea4Tc=; b=EtOkAmZlGykhCQ
	JqQ/XMdwk+95Odv4t0WjR13fau4iH7K6cXWBhxDcbjCI/twJ1vL1E2VBNa2SOBLen39NsF2k7yVt5
	R9ukiRbb1Fxti7hGDe3zSVll9v7+AmHxWMJRcFzTkPuTTGq4tB78HUxb82qDaQO0HLdc2HLSJXges
	bkU66Jl0P77GpYalTRddRzl//jzoE5dw4ct/q0UaPIx7TmLBoyjlMvxDC3EhFv/N4bI/vuYRt8CCS
	cH8Q6oPXnA0iTg+trqvjrdFfzGcxnJf3yGcgntZGAcogj7jljZMRuDYa516vpey01BsLjSj5QRicc
	Ua8qqh6vh2LYNZGPUT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGF00-004MKt-25; Wed, 18 Aug 2021 06:24:28 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGEzr-004MFu-QH
 for ath11k@lists.infradead.org; Wed, 18 Aug 2021 06:24:26 +0000
Received: by mail-pf1-x42b.google.com with SMTP id i133so1102472pfe.12
 for <ath11k@lists.infradead.org>; Tue, 17 Aug 2021 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvaO3IOaijbnIA6KqFSDgFo2qxgHnLpT3XyLd7qDOYY=;
 b=kDXEIEitA/zilEeOzVZcblUGb+gd0VUzPPKPAZRekMacsTOzvDvGIy5nd+Plg3xGqF
 ljL/5yphBqGZuftKhE1BcSTKZc0Q9ZAZtIBhK+w2XzKNzqFl0DOizZMClRh8F3cCrW6I
 4nLShAKzqA0o+5ZrPzG62J+rwCOEUexcSDo3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvaO3IOaijbnIA6KqFSDgFo2qxgHnLpT3XyLd7qDOYY=;
 b=lIYM7pj1I711eOkmN3EOxyDVD6oA0HAzCvWuPQXdfMACrCQ0sFp7fbYUD2f3qwJXcd
 ipfIAnmsG5TOWpGVrD6YdZcUoYnVYdlAxkId5WhXGWPrpyCd+B5sIZhcBxnD0CnG29nK
 Ky6fXZT0kkRYxv2h6Mg54WFTBv2reMQtJonQ3E7xEYGmjrzmiX9HvFnj+ZLjXKnMH/eZ
 QrVhwVOMtPVd0creFjYbwAgyRyXIlqaFW8rod4GzDgrXh8+Z8M0fKnkh7nWAcQIXqY6B
 Fxa71cQ7TS1XGOHPTGD5BFAjER1WsPuyZV4tZBCpdbXk4mYTpL897/Kdh5Xzmb4XxFal
 XSKg==
X-Gm-Message-State: AOAM533MSFvNYqxqZsDZMYofAB656hhblMfHb8wjAlxhVja56tecHCek
 /7z24PcV7mB2S3TM2q2j6w69nw==
X-Google-Smtp-Source: ABdhPJxLnTYg2dyG52a8dlHZQo2KnsFk9IIV2ZT2c1iszf6YYPkQGA1eSgtlSotuJmQJc5qNxJ68Bw==
X-Received: by 2002:aa7:87d1:0:b029:3e0:e44b:6429 with SMTP id
 i17-20020aa787d10000b02903e0e44b6429mr7687468pfo.81.1629267857946; 
 Tue, 17 Aug 2021 23:24:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l12sm4445453pff.182.2021.08.17.23.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:24:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 45/63] ath11k: Use memset_startat() for clearing queue
 descriptors
Date: Tue, 17 Aug 2021 23:05:15 -0700
Message-Id: <20210818060533.3569517-46-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3372; h=from:subject;
 bh=NQT3fqVVXi8ODh6WoJGB8sg9K5wYYHx+7JpT5FAL4cU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMopXDUfrKda33TUBFxN6HBO6TlnPSMDcCCdRDS
 0aeVcWmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKAAKCRCJcvTf3G3AJhzGEA
 CY8p5TOKzJnk1TIbV+Hzc40bIrnKi3XB25slGqFlL9PC0EefG0LRY7a/kfnqj/FIFz17UsuycljRiL
 cACD/vfRToJ7yzKKAmxJEdfFC9iw7Xzoq9md8jDhbHG+5rEQLDA2Y8/KjGoyRoAVQUeCsHcJe+UAXU
 /C5fU4ck0d6s6EiIVlN7DyLPX1dt3uBgOwRyBODvNuiyvNXvhGO3XJv0FCDFCT5z75xj1tU14JGWyN
 PD0hj1XmCBY1e9AxpCMIlhi+/X5qb5jGTLXX/Md1KsTZvmbxvau9ABz55gWYFUQGS3X+k1Rlmv5T+v
 lQWqSK/nXQAlXtMjB9ywh5KsA5aVqsKNBUXndQA68SKCaNf/TyoXdI1m4yYbWg/BcAGWta/La0zhv8
 6uPbEVUb8Vg2ZE5Iqlcs/ld7qL4G/K1NRERjZr+0R73esdLiYb9TgQFqKMWrJPe98lypwjAdWColpN
 I8cEBcItkU3uu4rF/5fh/NmOKClsPYi08PLRs5e03i6wu9s1aoaETYlf1CnhWQasVpVUQKL19q5EaQ
 6mL+ds0GvKbFFnRg94o4s2GHh5vlbNIY8AZQMoUGgZ+Kclor6FXedzWgb33JBTE6JU4bg97H5xgdcx
 ZY2UZxJPJIziE2+vb6CbU1ZYgZ27bDV0FLUmziQd/krKAdEaAHnqHTqhCInw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_232419_904524_450102A2 
X-CRM114-Status: GOOD (  12.69  )
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

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_startat() so memset() doesn't get confused about writing
beyond the destination member that is intended to be the starting point
of zeroing through the end of the struct. Additionally split up a later
field-spanning memset() so that memset() can reason about the size.

Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 325055ca41ab..0bab425f5dc9 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -29,8 +29,7 @@ static int ath11k_hal_reo_cmd_queue_stats(struct hal_tlv_hdr *tlv,
 		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
 
 	desc = (struct hal_reo_get_queue_stats *)tlv->value;
-	memset(&desc->queue_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_startat(desc, 0, queue_addr_lo);
 
 	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -62,8 +61,7 @@ static int ath11k_hal_reo_cmd_flush_cache(struct ath11k_hal *hal, struct hal_tlv
 		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
 
 	desc = (struct hal_reo_flush_cache *)tlv->value;
-	memset(&desc->cache_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_startat(desc, 0, cache_addr_lo);
 
 	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -101,8 +99,7 @@ static int ath11k_hal_reo_cmd_update_rx_queue(struct hal_tlv_hdr *tlv,
 		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
 
 	desc = (struct hal_reo_update_rx_queue *)tlv->value;
-	memset(&desc->queue_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_startat(desc, 0, queue_addr_lo);
 
 	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -762,15 +759,17 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 	 * size changes and also send WMI message to FW to change the REO
 	 * queue descriptor in Rx peer entry as part of dp_rx_tid_update.
 	 */
-	memset(ext_desc, 0, 3 * sizeof(*ext_desc));
+	memset(ext_desc, 0, sizeof(*ext_desc));
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
 				    HAL_DESC_REO_QUEUE_EXT_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_1);
 	ext_desc++;
+	memset(ext_desc, 0, sizeof(*ext_desc));
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
 				    HAL_DESC_REO_QUEUE_EXT_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_2);
 	ext_desc++;
+	memset(ext_desc, 0, sizeof(*ext_desc));
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
 				    HAL_DESC_REO_QUEUE_EXT_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_3);
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
