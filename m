Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F51FF8855
	for <ath11k@archiver.kernel.org>; Tue,  5 May 2026 14:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/KyseQicvAhQoRnr9vZMXYYrcYZAuumgn80kI4HgiCc=; b=Arqh3yWmrVlFe8J0wKo5pM9em4
	oek6wdwClcWQMiwRrHsEuJMtxolAR+BiVOFHN41IwU70XHp0fhGhqypkwHdhlNgcVg1UGgWFjGJms
	QXrH9DH1GLCIbnjqPZweBoKXB80Lg7VocAWtWkZfAKtvw/ysMvmjMyra3QPf/aIjnpzxyOq2f8I1a
	NfowZKScE1ZC3C4rEtxTHjc7IxTrDR7tCWiNXKYH3pSguT20SeGv/mB/vF92RzW2Dab+5a1jnS7Qr
	uEEJzMoFGoRftVMN1o3ZjZcghL2tPaMSrYdAsdtcMsozHFb9QJJQ0nf6M2fvH5DtShkISNspz9gqO
	932ppgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGnh-0000000GVzN-2WMy;
	Tue, 05 May 2026 14:31:05 +0000
Received: from mail-4399.protonmail.ch ([185.70.43.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGnd-0000000GVxs-1nyk
	for ath11k@lists.infradead.org;
	Tue, 05 May 2026 14:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=met-dubbel-l.nl;
	s=protonmail; t=1777991457; x=1778250657;
	bh=/KyseQicvAhQoRnr9vZMXYYrcYZAuumgn80kI4HgiCc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=H78AhBdBJtmGXQVu9MXrAuUlsNsiNgxlDwOepYB4E9dSh8qwoMTKji9XWXKblr4Ti
	 tExgM88R0J0ozJj6q6Phubh9QB1/CW2/Z2GwdhlwImXnYvQTIv7Ql5vX/s/mKaxFmq
	 7QLV6NkVMB8mHjRT4Zt9ua2NoYT+BTPS5RrHl0ocq69Go9v2NWc9WzZTUUe025JO/U
	 f8gzgoPCfFr/1xXwacFbLCVXNN2sVJYyPQ/N7agTKfIHXKATXM6iyQSvewKaNNKgfB
	 vk1axkGCNKU02QCAqcpp8bOYYBC4PWwJY4BwxKnOybHZD9fVcn691skB/8JUYyF26x
	 3U5GwGYyq5VfA==
Date: Tue, 05 May 2026 14:30:50 +0000
To: jjohnson@kernel.org
From: Willmar Knikker <willmar@met-dubbel-l.nl>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: [PATCH] wifi: ath11k: fix use after free in ath11k_dp_rx_msdu_coalesce.
Message-ID: <20260505143025.234292-1-willmar@met-dubbel-l.nl>
Feedback-ID: 179140708:user:proton
X-Pm-Message-ID: 66a23df030ae86d941826c72772648a86dd64969
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_073103_417070_1E30D560 
X-CRM114-Status: UNSURE (   6.67  )
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

In ath11k_dp_rx_msdu_coalesce the loop uses ->is_continuation after
the dev_kfree_skb_any. This can cause a use after free kfence.

Move the use after the dev_kfree_skb_any after use of ->is_continuation
inline with the while in the while loop above this one.

Signed-off-by: Willmar Knikker <willmar@met-dubbel-l.nl>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless=
/ath/ath11k/dp_rx.c
index fe79109adc70..02bd9787d6b4 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1825,11 +1825,12 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k=
 *ar,
 =09=09skb_pull(skb, hal_rx_desc_sz);
 =09=09skb_copy_from_linear_data(skb, skb_put(first, buf_len),
 =09=09=09=09=09  buf_len);
-=09=09dev_kfree_skb_any(skb);
-
 =09=09rem_len -=3D buf_len;
-=09=09if (!rxcb->is_continuation)
+=09=09if (!rxcb->is_continuation) {
+=09=09=09dev_kfree_skb_any(skb);
 =09=09=09break;
+=09=09}
+=09=09dev_kfree_skb_any(skb);
 =09}
=20
 =09return 0;
--=20
2.54.0



