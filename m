Return-Path: <SRS0=q65b=NO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C538C4338F
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 17:19:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C3161528
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 17:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23C3161528
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=es0c2vbeLdvUBYP8B7a94NzesREkj9eMqbtIzsLIDQ8=; b=AR5klIJ/w+wHow
	c0iPFIfD1YCThE9E0mTU9GSSbBTzZc5fmphrLCnh3i6ehv1LOyYEydFA4NcXNr4l4jP9wIRRqIvat
	sXQKcRBv2kXYIaUWCeadGhUdZh+t8UgComS93YXsh8DXdQa6isApYdOqr2LH3UwNOxxos3la2KK1j
	YaJ1PwbVlj1sNi2BAjuk7dr9UQYBDR8PbsEJhpLc8oVAoK0f62JMc4MzVPKqlLz+drEB89FraMHVi
	pKOv9Sirj+Hk1TbSJ/3EbZcSh/6SJ8BjhdSwOtWBrmb2gYvb6yrl/CupwCpOYEZlIAwPhFeAo1ZCl
	M8AyyYj41ybrqAbmtEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIDb7-0007wO-HL; Mon, 23 Aug 2021 17:18:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIDb2-0007uY-5p
 for ath11k@lists.infradead.org; Mon, 23 Aug 2021 17:18:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6ED961501;
 Mon, 23 Aug 2021 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629739131;
 bh=sXFez6GCJcIUZP7DNnqylGtMEnOm11ZhHcPII95H6rg=;
 h=Date:From:To:Cc:Subject:From;
 b=KcM68az9xJ3QqQDGOGi8XcXdovAC7wHrbTtBKPeji1izXq1+0xpCvg8MZ231KbKYK
 XQ3E1fbYdVsTlL+Hd1leFAKj2lo90mgEbk0UT3Wb2indGHOlcIKJ6fA+SWQAoVNO0e
 9T2kve/00ustILUHoVFMozWEMSRKw26OSnxWuULf1qnJBUxze1bmWnRVnUT+RGJlt3
 MPETqjS3NbwMKnXhDVy52QbpHJ00mJmlJzzZhOoxRxxRcDMtepK1xPWSaw71v73u7X
 s0MCLiyjHGqel7QpDxZQYCFfNj7q8WWg72hNkZinheYS3ktpv7iTAnYe7OGiRvfvlh
 x40hX50jvUd0A==
Date: Mon, 23 Aug 2021 12:21:59 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] ath11k: Replace one-element array with flexible-array
 member
Message-ID: <20210823172159.GA25800@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_101852_327355_7A6FA577 
X-CRM114-Status: GOOD (  14.02  )
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

There is a regular need in the kernel to provide a way to declare having a
dynamically sized set of trailing elements in a structure. Kernel code
should always use "flexible array members"[1] for these cases. The older
style of one-element or zero-length arrays should no longer be used[2].

Refactor the code a bit according to the use of a flexible-array member in
struct scan_chan_list_params instead of a one-element array, and use the
struct_size() helper.

Also, save 25 (too many) bytes that were being allocated:

$ pahole -C channel_param drivers/net/wireless/ath/ath11k/reg.o
struct channel_param {
	u8                         chan_id;              /*     0     1 */
	u8                         pwr;                  /*     1     1 */
	u32                        mhz;                  /*     2     4 */

	/* Bitfield combined with next fields */

	u32                        half_rate:1;          /*     4:16  4 */
	u32                        quarter_rate:1;       /*     4:17  4 */
	u32                        dfs_set:1;            /*     4:18  4 */
	u32                        dfs_set_cfreq2:1;     /*     4:19  4 */
	u32                        is_chan_passive:1;    /*     4:20  4 */
	u32                        allow_ht:1;           /*     4:21  4 */
	u32                        allow_vht:1;          /*     4:22  4 */
	u32                        allow_he:1;           /*     4:23  4 */
	u32                        set_agile:1;          /*     4:24  4 */
	u32                        psc_channel:1;        /*     4:25  4 */

	/* XXX 6 bits hole, try to pack */

	u32                        phy_mode;             /*     8     4 */
	u32                        cfreq1;               /*    12     4 */
	u32                        cfreq2;               /*    16     4 */
	char                       maxpower;             /*    20     1 */
	char                       minpower;             /*    21     1 */
	char                       maxregpower;          /*    22     1 */
	u8                         antennamax;           /*    23     1 */
	u8                         reg_class_id;         /*    24     1 */

	/* size: 25, cachelines: 1, members: 21 */
	/* sum members: 23 */
	/* sum bitfield members: 10 bits, bit holes: 1, sum bit holes: 6 bits */
	/* last cacheline: 25 bytes */
} __attribute__((__packed__));

as previously, sizeof(struct scan_chan_list_params) was 32 bytes:

$ pahole -C scan_chan_list_params drivers/net/wireless/ath/ath11k/reg.o
struct scan_chan_list_params {
	u32                        pdev_id;              /*     0     4 */
	u16                        nallchans;            /*     4     2 */
	struct channel_param       ch_param[1];          /*     6    25 */

	/* size: 32, cachelines: 1, members: 3 */
	/* padding: 1 */
	/* last cacheline: 32 bytes */
};

and now with the flexible array transformation it is just 8 bytes:

$ pahole -C scan_chan_list_params drivers/net/wireless/ath/ath11k/reg.o
struct scan_chan_list_params {
	u32                        pdev_id;              /*     0     4 */
	u16                        nallchans;            /*     4     2 */
	struct channel_param       ch_param[];           /*     6     0 */

	/* size: 8, cachelines: 1, members: 3 */
	/* padding: 2 */
	/* last cacheline: 8 bytes */
};

This helps with the ongoing efforts to globally enable -Warray-bounds and
get us closer to being able to tighten the FORTIFY_SOURCE routines on
memcpy().

This issue was found with the help of Coccinelle and audited and fixed,
manually.

[1] https://en.wikipedia.org/wiki/Flexible_array_member
[2] https://www.kernel.org/doc/html/v5.10/process/deprecated.html#zero-length-and-one-element-arrays

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/109
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/ath/ath11k/reg.c | 7 ++-----
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.h | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index e1a1df169034..c83d265185f1 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -97,7 +97,6 @@ int ath11k_reg_update_chan_list(struct ath11k *ar)
 	struct channel_param *ch;
 	enum nl80211_band band;
 	int num_channels = 0;
-	int params_len;
 	int i, ret;
 
 	bands = hw->wiphy->bands;
@@ -117,10 +116,8 @@ int ath11k_reg_update_chan_list(struct ath11k *ar)
 	if (WARN_ON(!num_channels))
 		return -EINVAL;
 
-	params_len = sizeof(struct scan_chan_list_params) +
-			num_channels * sizeof(struct channel_param);
-	params = kzalloc(params_len, GFP_KERNEL);
-
+	params = kzalloc(struct_size(params, ch_param, num_channels),
+			 GFP_KERNEL);
 	if (!params)
 		return -ENOMEM;
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6c253eae9d06..0a634ba04509 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2285,7 +2285,7 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 	u16 num_send_chans, num_sends = 0, max_chan_limit = 0;
 	u32 *reg1, *reg2;
 
-	tchan_info = &chan_list->ch_param[0];
+	tchan_info = chan_list->ch_param;
 	while (chan_list->nallchans) {
 		len = sizeof(*cmd) + TLV_HDR_SIZE;
 		max_chan_limit = (wmi->wmi_ab->max_msg_len[ar->pdev_idx] - len) /
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index d35c47e0b19d..d9c83726f65d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3608,7 +3608,7 @@ struct wmi_stop_scan_cmd {
 struct scan_chan_list_params {
 	u32 pdev_id;
 	u16 nallchans;
-	struct channel_param ch_param[1];
+	struct channel_param ch_param[];
 };
 
 struct wmi_scan_chan_list_cmd {
-- 
2.27.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
