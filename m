Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E2CCD3427
	for <ath11k@archiver.kernel.org>; Tue,  5 May 2026 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a6eI7IFmsnRxyoPP9Vp5tmenNOKqs93c4E03CQkljug=; b=1+amraMuM6rtgQJfHLJ0WV2T2Y
	NFFjniakHhrjlMG4Yrf5MwHLGAY5u6BLJ+3aqwxqY4sG7vkV/kGqyNWLDeP+m4kOdceJdR9V2pYwn
	zd+ZmEaSpCIB1mY215ZYLHXkVfpgzkGErAE/Y1gKMpQKbgJSv7OmoP4LeNWxpJBFAtKFrYJs4W7q5
	pJC/2MBY8rer6OkwAbfYsCz9SXlQ9dVRTqIKV++0O7/Hujj7f4qkIWdCMI5GGsIUun2yPOdbqzywR
	7LLZJxqbBIMV7Bdrww5mXxlg2lgumszOSReIzOl8bY9ySKVeCvhTzMbokLpXJ/H/y6xk46LWgTtem
	N66Bhllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJPJ-0000000H2Dg-3ujE;
	Tue, 05 May 2026 17:18:05 +0000
Received: from mail-24420.protonmail.ch ([109.224.244.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJPG-0000000H2D7-13oG
	for ath11k@lists.infradead.org;
	Tue, 05 May 2026 17:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=met-dubbel-l.nl;
	s=protonmail; t=1778001474; x=1778260674;
	bh=a6eI7IFmsnRxyoPP9Vp5tmenNOKqs93c4E03CQkljug=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dHZ90Gpcz/CtCzU4Y60M8eWzofsRUBLzXY8Tf+auivdtZ8GU65PGlS+ZBuE2151aq
	 Ftt9H1D9njHthcnGfxwKEZLc4EBfRhn+DLNr0yyDDj/KhWiMhZj2kqEYNtR44diR5C
	 r4XSy1qMU0Q3wJx6YkVCVf0mqVhhc1YXaMgSJfywD7jJoXajx3qYTwm2Kvc1eLvcbu
	 /IaR3VVqXz4Iz0OZhFtSktWRYWY+U60vyadxz2xX5dBJ9RlJZdBmWm0kJ6uAEUXiKQ
	 wKjTlZRVecmCDudBFoynDUmobmsO23fOFbCl6qshFyhBopcVVIarsxos5p1TfqPWA1
	 ivxnA7b0NLKzQ==
Date: Tue, 05 May 2026 17:17:43 +0000
To: jjohnson@kernel.org
From: Willmar Knikker <willmar@met-dubbel-l.nl>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: [PATCH v2] wifi: ath11k: fix use after free in ath11k_dp_rx_msdu_coalesce.
Message-ID: <20260505171709.547274-1-willmar@met-dubbel-l.nl>
Feedback-ID: 179140708:user:proton
X-Pm-Message-ID: 2281339faea54f13495509c164443c2375dad580
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_101803_163892_E77928D5 
X-CRM114-Status: UNSURE (   7.57  )
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

Use flag for caching is_continuation for use after the
dev_kfree_skb_any.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Willmar Knikker <willmar@met-dubbel-l.nl>
Changes in v2:
 - add bool _is_continuation for use after the free.
 - Add Fixes, label to commit.
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless=
/ath/ath11k/dp_rx.c
index fe79109adc70..16364f76fc3c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1761,6 +1761,7 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *=
ar,
 =09int buf_first_hdr_len, buf_first_len;
 =09struct hal_rx_desc *ldesc;
 =09int space_extra, rem_len, buf_len;
+=09bool is_continuation;
 =09u32 hal_rx_desc_sz =3D ar->ab->hw_params.hal_desc_sz;
=20
 =09/* As the msdu is spread across multiple rx buffers,
@@ -1810,7 +1811,8 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *=
ar,
 =09rem_len =3D msdu_len - buf_first_len;
 =09while ((skb =3D __skb_dequeue(msdu_list)) !=3D NULL && rem_len > 0) {
 =09=09rxcb =3D ATH11K_SKB_RXCB(skb);
-=09=09if (rxcb->is_continuation)
+=09=09is_continuation =3D rxcb->is_continuation;
+=09=09if (is_continuation)
 =09=09=09buf_len =3D DP_RX_BUFFER_SIZE - hal_rx_desc_sz;
 =09=09else
 =09=09=09buf_len =3D rem_len;
@@ -1828,7 +1830,7 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *=
ar,
 =09=09dev_kfree_skb_any(skb);
=20
 =09=09rem_len -=3D buf_len;
-=09=09if (!rxcb->is_continuation)
+=09=09if (!is_continuation)
 =09=09=09break;
 =09}
=20
--=20
2.54.0



