Return-Path: <SRS0=J1Y+=N2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855E3C433F5
	for <ath11k@archiver.kernel.org>; Sat,  4 Sep 2021 11:50:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3527760FDC
	for <ath11k@archiver.kernel.org>; Sat,  4 Sep 2021 11:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3527760FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sEbLK0cJtjs1B2JxQMeBb5ZEaShdqi8oUbrtulG9cuc=; b=N1DTdiT13RovHQ
	EJbF9yyith2FxXaucgHR+N38goaHLA5S8DjbS9LlYuIF5peUitteWEJN14m/2TUCqA8QHU/zMtcfL
	MJHVh9nzJZBeXIxynACFfl0Hkz7c1HXkHVzTXj56j1f3UaaxRBBPe0dhCXsg+bZxYGCRlsnaxGKPv
	g5/f4X19WvA117e+1tzctQQRPA0DbnicRXv7DnlGIHvypU6x+VehGsvMJADDXzdenPeYE10UZN10x
	vtJX5mt6yaqgJOfOW4qVIkWZbWatKRVHYOSA7kCI6E3A4UCItprmU5+3qmPnYT7gC2VPv4dmlUaJw
	185RVQk+lOqCR4EO11cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMUBk-00E4dy-Kq; Sat, 04 Sep 2021 11:50:24 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMUBg-00E4dd-U6
 for ath11k@lists.infradead.org; Sat, 04 Sep 2021 11:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1630756195;
 bh=v23ee+m+JJjtewkqOV9p0pm3JlwVl9WxkFvaAGuX1Ok=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=aFui8fkZ7Z58f+hoFtAARRQYR9O68rtrzMTniksFo0yE+lIEfO8ModCfBVi3mXR5i
 EiOQClEbqBjrK4Gn5fkW3frJ1W1wJ28rxOIoMIaAkazaBm4BVzWTUpmsjw9B6B7DvV
 +BTYZq34iQwbt2CERbZuU6dSHBuhNNARphYOxqDg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MNKhs-1mbF5F0Vek-00OpPE; Sat, 04 Sep 2021 13:49:55 +0200
From: Len Baker <len.baker@gmx.com>
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Len Baker <len.baker@gmx.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Kees Cook <keescook@chromium.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ath11k: Replace one-element array with flexible-array member
Date: Sat,  4 Sep 2021 13:49:37 +0200
Message-Id: <20210904114937.6644-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:80dhGiw6SsS128pziswnDI1u80tDjGhkmv0etse23Btp6AiuXMU
 erX4Fha1+Rio79fF8pR8DDJ243friSWaqCt5kJWcTfJS8wa/JbBXL4tgdUSUZYaPB9y7t0X
 9ZEW64C2K3McSXftObLTHx2lBttv0XJ/hCJFeLcUY4zh87JmoJAlgu26uWiTJbTQJy6b4hi
 SILt2HJn0e/o9Q3rmEX8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hwJ/wysCuJA=:gLwWR3WSAne682ae3N83h7
 50mzDgEeO35RizI+pFCaDClySune61eyNXfXjLGv6+ZINVl5WeMkJTnPUt+6yi6iloIqsY1Bo
 3oEgJpt+dDyr33uMSv10s3FwMTuBd+b3R+KBHY2fFqSVHuI6DKRQICn+TrH+k/U5ftBNaaHhb
 sju5YC9m1VdKaetngY17T8nk28xhEZCAYKpsYvYNuVoLYu4b8Y122XoJq2NCNbhJlHKFtWTUQ
 6wlAv7cn+wobzXEc1s4XmWZNF5dMwSmrSv5wYpBP/jlCUvh/wV1NcwYpWPz+UhZWdkuZpVMEN
 Jd7AF4eu4eXPmLexUxlWjZfuw7mwsxoWiyWT8+0mZT5RFufCGtdJV2MS1gAgK7/vtScsB3fBo
 +CBPGDQxKx046dbIJYdy81lWeSDDdn9HGLCeSvZdNrFtIlNYwYQkCKOWgsvbxOUYMm8z9+ZWs
 1/ghu6bCKaR9DSMjZ1Y4/en4DCsoOS6o2ExUB5DCL6ZTCizzqsPCZuBk+Jn2toPzILlSJiujM
 3qI4SwhsxWgjMaOQl8sWt//D9QYjh7ILxAljt7JMEfuDmsQd37zETumtwPmq9MqADN1JnPQCf
 PEJ7+Epmtn9Q8NuHDceo3VwcbtG1BPh4CfQkyt9R2e6JweyG69DslwhMhFiP1OG8OFKsLAjoq
 Ll5CkkmUvYz2eQy/0Ir/ZQg8BMAXp4K+ODHOsTYq3Q/dmz7bMYRZlHVasI5iWQwegyhLRgA4J
 0qI0Z/Ppfx3xXsBJnnJBn8q50MP30dlVQ6APQm8uvH52NUZ7wqGebKiKPEecS18MFHIlLO8mC
 xqJL1by3fzzt8VWO8+6pTSN99WU4chbNeaS3+8ntlhIoOcEu2VK0Xg9xOzNGCu/69ZG2zNlss
 W5gftl2UUdcsuZv10FcUv2tiNEcB58aL5bHPNyUAbzPuexYpcxrVUj+5m5Yb8dLzbCDuY68TD
 R7xEjJB3zUAyDJ77S4e3lrUoOWJQQu41sVXPm1Pu0JuKGbr06Pk5rh1I8edO/OnbcYSyPSSMe
 VzUVBm+roYpznFZXx6FxTnuataFDQOcwfoWxNbh2Q/3YfR5E4xVGCAzmb0e3ZwmPa9Fy6oIBc
 spnMijX1mfCTHO9cQgrpNdhlNAB4gtHtDXSthY1/3jqmx+N4q4T9CiZTw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_045021_312503_B1D05DF9 
X-CRM114-Status: GOOD (  10.82  )
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

There is a regular need in the kernel to provide a way to declare having
a dynamically sized set of trailing elements in a structure. Kernel code
should always use "flexible array members"[1] for these cases. The older
style of one-element or zero-length arrays should no longer be used[2].

Also, refactor the code a bit to make use of the struct_size() helper in
kzalloc().

[1] https://en.wikipedia.org/wiki/Flexible_array_member
[2] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#zero-length-and-one-element-arrays

Signed-off-by: Len Baker <len.baker@gmx.com>
---
 drivers/net/wireless/ath/ath11k/reg.c | 7 ++-----
 drivers/net/wireless/ath/ath11k/wmi.h | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

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
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
