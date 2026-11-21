Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB0560A3819
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O5cjuLX/;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mRaZcJhj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6btR2aaFXry8/+OvCG761RoKG42Ek6YtGx/y9HYL3Ck=; b=O5cjuLX/8Z+4yE
	zWrHBkFXiW4Wps1uTfzcGWPsJS1fqHFML2Lj0SUpVc7lOGre2drNqoLGxANpnM+AbTtrF0GlngxMp
	COv7LdOJ0imVrgbXu33aFr+aE15Oo+URghP4PxD9ygdWB+Gh2vpkvIXHpJMH3fwQTczMMSfhGIBjo
	feN8AULCTmStyXBXz9cl5JfvRR8kSRBCZcqMIO06N3OtZq6hI8CYgVKkTIuO3UsFXdy4pYw1ZlOMl
	3wf622lVY6sY6hY5YY43Ov2UT1+vprIAgXABe+If70yJPSTaL3VH6jkcsDqgs6N+5K7ej7BtKUIQC
	EZCYnazFyE8+6mzKHrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBT-00000000SBD-2wkE;
	Sat, 21 Nov 2026 23:07:51 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBP-00000000S4U-2dXb
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:07:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c4d28f75d62so360114566b.0
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302466; x=1795907266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6btR2aaFXry8/+OvCG761RoKG42Ek6YtGx/y9HYL3Ck=;
        b=mRaZcJhjDYwfoinPIAEO9atL19Vw+Fy10/UNueqCXHbzXAm6TxrklYUdUcQkda8Xph
         dXRa5KyKWRzb5/GBhJ/5OSluRDg3M1HJJlSekbw5ahe/yVD4P0tUclXzEVCNUpw5qUQM
         y9hxC87J7wcVg7esT5DA5BnpEiX0VSmbo19TCEPyLZRDUgJjne7ysQO0wc3nkuBqIOKi
         Ud6E3vUhxAVEpAWjKgCnqvcdVCSr/eMb/vMIf/aNSqIUncniAcP4+m5R94pmFF1mB0eQ
         qyHBq36meBTAXN3mpAdVPYklftslUNgh7FLyoOnMOiqvPTLOyIBJuSg2zhHkO2ozn9xm
         7DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302466; x=1795907266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6btR2aaFXry8/+OvCG761RoKG42Ek6YtGx/y9HYL3Ck=;
        b=QEneONJtnM0oJTrNZs1aRNG2E159mtvlFE+yXZPNX9F5/JwCFf2MO+8R3VVl9AMXSW
         sWs23EL7mmPqTmF6nLhkjHaIERjVnc+D+OZGFW0VGpvczLxvtLTcAPsH6lkguND0nQwt
         z0XPs+aohBj4d6h4bdIuJg4M6ii5l16fxHafRaYSbAUYooDFKHyNyqYizMDzhmkZch2k
         IQ48qkEQ/LrhNZNttRf7YQuQPeRACqLQv+/8UKoskXz1egSKsEyIt65Tgn7cKl+qDF9D
         1IVbOsGJcr/WjRhiisH4W5n6ZIfDTjVktZPNqugi4X9f0KVK2xOXuiC7krUzt947nIOY
         sWnQ==
X-Gm-Message-State: APuU4Z8HuxMc69ANTfXz2mROQRmBVPo7A49QIq8GgHf7Pe8yMbfyrTyE
	tfg+rKx8G2qtDh1keGzTFP17LokU0IKTw+V+3qQjZ3cFhYmf4ElQpivwwYx6r7A2Fg==
X-Gm-Gg: AZFdTZeL1T+BQgg9CmZeH4SlQgFX6SoUEozinV88e4GBqcAxo9Barl8bg0TkC1OJf3e
	/6kVK3y4KRC9HVVidbhgd9oAOmQ1JitsgI1aDcQTtHiDqw0IAVHIrQucSz40okiX6e6nTmtVvIb
	qyZ8ZvMiaLSZhIjAjgkYt6ZQbx3JV8rhotTlM1Yo4nC/pSK29FiyUGNTcr550B8yrWfGnIn0WrQ
	Sri9t2A2fd1Es8F7MqESJejbrB4OUIvszdsUsouuHYOxYIMkmMh/WsBSYDt9iOUERFbme7YWGga
	FZLWsdY1rg44Nao3DOhvg96Hc9+raHR96BKCoeh5k9GRq9Pn7B80KTDZDnh5Ja4It07EQU3kzfX
	PPStgsoAbtWctGgba2MmgUzbGjveUh3wAFdpxTLAymvfS1gctkglKp6OZItx+eUXkL7PzblpqHZ
	R2fy14MtFAfkkxk1wbButi2AMuoUrVs4htgKZBdK0XBIW3+yPJUUq6k4eCmrYPYOdYa9cv2wRBl
	EyNPTTklU6QXK6n15+Sid4hI1hEgJD1lsVdHjLD428IrY+/BLuYDRQcbJTCC848MDW/iEgOpTW7
	vVrDyShywAT9WY8F1r0MS7a51gGPHae52JbEZAZdR96Ih07dQHjBg1agEloNzcDzm4qX5a8Po6F
	y0XaqbVtBmPSeWZm6hBV8dSew2+KabICqWuhmqI9RQ/GVbgw1/Nx9dL8nClut50zMngBg4kjPgB
	/w8kN6ACyl++piiT2ZtYJ42GgI2WF9LnPGXAGgbUm7Ep6QVBAGVZy0ClH3PXPEqi8aCbEtVUrY6
	TyY0Cr2GGRVyy4jWGNTKwtGNAZzrtQUbR1FNmQo6HTshc/55keWeqFvj7QdBRoRwB9Qleh7Q0Xz
	6EfgFvTwl0jw1usSvAsrcRWP1E2AM2se6yVk+Xy95NCAW6lh3nI7v0B7xmfsC8ZELB5Vat35/Q8
	=
X-Received: by 2002:a17:906:694f:b0:c50:ff1c:22be with SMTP id a640c23a62f3a-c513aace676mr469413066b.16.1795302465698;
        Sat, 21 Nov 2026 15:07:45 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:44 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 07/13] wifi: ath11k: depend on RPMSG instead of selecting it
Date: Sun, 22 Nov 2026 00:07:25 +0100
Message-ID: <20261121230731.1206043-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150749_680101_6E8FEB50 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Maurer <fmaurer@disroot.org>

Commit 32ec8488d75d ("wifi: ath11k: fix sporadic WLAN initialization
failures") made ATH11K_AHB select RPMSG, QRTR and QRTR_SMD. Selecting
RPMSG makes it impossible for ATH11K_AHB to depend on
QCOM_RPROC_COMMON, which is needed to use the remoteproc SSR notifier
when ath11k_ahb is built in. Adding that dependency gives a recursive
dependency error:

  symbol RPMSG is selected by ATH11K_AHB
  symbol ATH11K_AHB depends on QCOM_RPROC_COMMON
  symbol QCOM_RPROC_COMMON is selected by QCOM_Q6V5_ADSP
  symbol QCOM_Q6V5_ADSP depends on QCOM_SYSMON
  symbol QCOM_SYSMON depends on RPMSG

RPMSG has no prompt and is selected by the rpmsg bus drivers (GLINK,
SMD, virtio). ath11k_ahb needs one of these transports anyway, so it
can depend on RPMSG like QRTR_SMD and QCOM_SYSMON do. QRTR and QRTR_SMD
are still selected.

Signed-off-by: Florian Maurer <fmaurer@disroot.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new in this series, from Florian Maurer's series [1], unchanged.
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

 drivers/net/wireless/ath/ath11k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 99f625b82fe1..2b608d4ed263 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -13,7 +13,7 @@ config ATH11K_AHB
 	tristate "Atheros ath11k AHB support"
 	depends on ATH11K
 	depends on REMOTEPROC
-	select RPMSG
+	depends on RPMSG
 	select QRTR
 	select QRTR_SMD
 	help
-- 
2.53.0


