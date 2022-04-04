Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A461C433EF
	for <ath11k@archiver.kernel.org>; Mon,  4 Apr 2022 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rWwj0dXz4EtV0w1WqoP/ifJQRREBrZoDq/HGSoYizmE=; b=BgYcnXekf9/es+
	/1DOijzfMVy68KjwfTlxCi5YvgrnIG+by74/LhK4p3N8x6fuvM97q/WZVWGl3+H+ZlhXOMLYlvKVl
	RQB15fVgtbqgzyjrmPKBG+mxXhGw5ifapgiH/Oly9JdLGh/sZbebaCZnhymhkkt0QBrlYoj2iE1Bn
	GR+uwL8T7BmwUQfY9r6rj6u03SC9L6o2fOt4mASRPIc75JoTWxEYSpynco+Vo+LP1pLf2ur89SzCv
	E8jqK5vZJFKiTSET9h5q5qxShpSA0MNjyRp0lrYvSyXKtlK9RkDEGrQIPTcUHVaTU5DakPC9ECU6a
	0PXJS+Y2QofbTwAkSkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbKLo-00EclS-So; Mon, 04 Apr 2022 10:54:24 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbKLm-00EciS-0v
 for ath11k@lists.infradead.org; Mon, 04 Apr 2022 10:54:23 +0000
Received: by mail-ej1-x629.google.com with SMTP id bg10so19056475ejb.4
 for <ath11k@lists.infradead.org>; Mon, 04 Apr 2022 03:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rS2vrUQCqgIxoLaF1HFbbKKb3g/Rll3Hg3bNlGXWWFU=;
 b=ZAx3AW9FCKPXQ+1FGU6mGDUl1IVpQ4wMwtwj6DSs2ypTFDomv2BzAG6MBG/NPa6TtU
 DmoF7im1yJipBSKOiduBGIq0o1/KoWntvkA7iw32NZBl9+PvWnTQusrJR//uhPAzRUMV
 FQ87WHbcQfvTVBjuaNiwTZvhzrpkXV9U7zNuvWAXppDNRh5hIsWlanX0Gq9TlQH0vYhx
 o91pOje2KRe5ez/u2e44jjsEL2+PX0q9+qvJzA3z0zr/Ph2Uqvlaf3QpKhoSueGn/6C8
 dQlqZTZ3zTwaPaWKjPaACF1Dk4Q5zgnaQEfs5W8ibPsXfIN62CATcO9emI3VftyTBlmx
 OPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rS2vrUQCqgIxoLaF1HFbbKKb3g/Rll3Hg3bNlGXWWFU=;
 b=Ddlm2M8XeUDq/wXmTRQ/ZChauvVy713MQFmOjU+N7ykf73HHfF3vyi1BlJhC9JowKA
 IfJjlZHWMrJZojWavn+nTOPxIbluqwhvFDjzrZWiwUJlA9jo5rnPVQloYT2oRyhw7gk9
 xDcpLyMIZafJi20rdyp1MrP6VlTd8B13byFjZPOvRxN44ZrT/iXans+dnnXMnVDBpjaP
 lqgSQlfxL3XSEC6nT3f+yWDsQMPkQG737aBCu04zmJqCxcn9E9ttV2iJf3wfNQugh5Oz
 wQy9+/BDQ0LCJee3na4wtowwZ786JBs6IlRQeIe3UI+J8oT8hYmuvXswjXJ6rhVQ//Rx
 X2ug==
X-Gm-Message-State: AOAM5329RYbU1nGW6ig8HgZA04l1U4dFAFCWYyFG2iQ3C1WxhxOWA1Xw
 9LpDQq/fJWsQiEKxLiFGuxQ=
X-Google-Smtp-Source: ABdhPJy6OPm3Dpjp6lG1jC2bFmA2drnES4LgmLg6gDlTOw3cssB9sithUubMN20eC2fLccxnrfb0Ew==
X-Received: by 2002:a17:907:8687:b0:6da:824e:c8b8 with SMTP id
 qa7-20020a170907868700b006da824ec8b8mr10315919ejc.428.1649069656910; 
 Mon, 04 Apr 2022 03:54:16 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de.
 [95.90.187.85]) by smtp.gmail.com with ESMTPSA id
 qa30-20020a170907869e00b006df9ff41154sm4273210ejc.141.2022.04.04.03.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 03:54:16 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: kvalo@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] ath11k: do not return random value
Date: Mon,  4 Apr 2022 12:53:24 +0200
Message-Id: <20220404105324.13810-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_035422_108195_3872FC0A 
X-CRM114-Status: GOOD (  10.75  )
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

Function ath11k_qmi_assign_target_mem_chunk() returns a random value
if of_parse_phandle() fails because the return variable ret is not
initialized before calling of_parse_phandle(). Return -EINVAL to avoid
possibly returning 0, which would be wrong here.

Issue found by smatch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 65d3c6ba35ae..81b2304b1fde 100644
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
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
