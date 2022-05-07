Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8879AC433EF
	for <ath11k@archiver.kernel.org>; Sat,  7 May 2022 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6zjFZnEvwWmlFyCjIeWHNNiJGWoPfph8QshddNz+j4Q=; b=cCwyIe5CD45p2w
	On3vdyfIRxrztfl3/ZQmxiMJd6+Qqbo9O452Vklvu8eS3tYc6khUEMMKeLDbuk+5Rj4Y3sNzBnAvH
	G9LfVg/msrHeKTf2AjEbHyfcrye1wyIPa8iPKC2C9kmle7VCJoTPCtkhcN+qWPAsMQ85jmrpNbddg
	WffMbQpR5Uk0lngVZfj1rZJJd6z9DaTUD4OL85AdQj1nA8xG4M4ethTxaRd6FE9EDX+4HAvqxN398
	xiApEp8MHD7f2WNl5xTiuX2Zx8h7PAb56V0Mx84ScdN85CSyN3Nf7MRN1rQqhIMOTdGffmdc0a7hr
	1of/hJqWpQu5jPJag2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnPNR-0080wK-DU; Sat, 07 May 2022 18:42:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnPNO-0080vV-DU
 for ath11k@lists.infradead.org; Sat, 07 May 2022 18:41:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso8628815wma.0
 for <ath11k@lists.infradead.org>; Sat, 07 May 2022 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kewTTWx9DrsoNkFyYPFpRhSoXTo723KMXBl58gCLpBA=;
 b=HknaJKY79dBIY1D6VMFQLWs/WIhEgTfNuz3aI6k+tQd9aE8MMxrbCef1C/yUII7xHN
 JMqZ4mWeav2euIn+1sTGGS36vGdaSkoEV0ZoJj6tdyksJNIcsQjebk6QkYhpJkIdP+To
 hQjzgKi+EkJFEP2D67BbeYbAct4F/Ke/Rg0UUtSmVBGVDI9p5yroeXA4ehdPe/EJXP/f
 U2tsU/A1R96w85Rw/7HXno5FEAQ72UpbuoeZC4JgG1Gdmk4bJLTUjlCPJVtIWMYrb3qg
 PVTzgk0TOW3uxKqI/C+yNNs9XyR7Pn01N40Az7SZZWnLW+fbu06z1IX/bpi807y1shS8
 efFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kewTTWx9DrsoNkFyYPFpRhSoXTo723KMXBl58gCLpBA=;
 b=RtI/EaGKurj4GY8Uqf/u1TRcIz35lOO2o7oFSCy8YPzdQJlfBO5F+UQSfYlBU6hx/L
 72eDIp6OJny8Z/wjczcfJwh270+FgaAG4C6vt402F+nqka63d7SF/3A/mVelnRdtYg4W
 B5/Wn5DePPCTS1MwSVfwoiK4Pqz58zySGDwh0O3MBdAxynjLrjJNhk5VFnDwE6E/es+3
 dnHtHaM/ZdjM2ngxkgV/ASH/yaXPl399nKv8BDhXee2hyznjeoAdifb0YP+BKZZYnch3
 u7gWlkz761f26sGlg1T/hNoNfJE/3Fbmu5PDmU49SSm4ZqJQQGJGCRPBIAbFf6iqoMyG
 kigg==
X-Gm-Message-State: AOAM530lhfwM4h/ow2y3G0wT8hubL8OyHrOrGlINoXQCU/tIWh24Q+OW
 4LXdbCghPCpSPBVCI6PdTN8=
X-Google-Smtp-Source: ABdhPJzEhN7/ba6cBlDyUJyzxLGhN8q+DeRTHlhT4eK4i4nAt0Dp7nhCYEOoDXLCHHDpm1NuWdSmzg==
X-Received: by 2002:a05:600c:1992:b0:394:826a:d40d with SMTP id
 t18-20020a05600c199200b00394826ad40dmr3928485wmq.146.1651948916519; 
 Sat, 07 May 2022 11:41:56 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 q1-20020adff501000000b0020c5253d8cdsm6617330wro.25.2022.05.07.11.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 11:41:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: [PATCH] ath11k: remove redundant assignment to variables vht_mcs and
 he_mcs
Date: Sat,  7 May 2022 19:41:55 +0100
Message-Id: <20220507184155.26939-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_114158_515626_8DB250F1 
X-CRM114-Status: GOOD (  12.43  )
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

The variables vht_mcs and he_mcs are being initialized in the
start of for-loops however they are re-assigned new values in
the loop and not used outside the loop. The initializations
are redundant and can be removed.

Cleans up clang scan warnings:

warning: Although the value stored to 'vht_mcs' is used in the
enclosing expression, the value is never actually read from
'vht_mcs' [deadcode.DeadStores]

warning: Although the value stored to 'he_mcs' is used in the
enclosing expression, the value is never actually read from
'he_mcs' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1957e1713548..014eaabb3af4 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1951,7 +1951,7 @@ static void ath11k_peer_assoc_h_vht(struct ath11k *ar,
 	/* Calculate peer NSS capability from VHT capabilities if STA
 	 * supports VHT.
 	 */
-	for (i = 0, max_nss = 0, vht_mcs = 0; i < NL80211_VHT_NSS_MAX; i++) {
+	for (i = 0, max_nss = 0; i < NL80211_VHT_NSS_MAX; i++) {
 		vht_mcs = __le16_to_cpu(vht_cap->vht_mcs.rx_mcs_map) >>
 			  (2 * i) & 3;
 
@@ -2272,7 +2272,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 	/* Calculate peer NSS capability from HE capabilities if STA
 	 * supports HE.
 	 */
-	for (i = 0, max_nss = 0, he_mcs = 0; i < NL80211_HE_NSS_MAX; i++) {
+	for (i = 0, max_nss = 0; i < NL80211_HE_NSS_MAX; i++) {
 		he_mcs = he_tx_mcs >> (2 * i) & 3;
 
 		/* In case of fixed rates, MCS Range in he_tx_mcs might have
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
