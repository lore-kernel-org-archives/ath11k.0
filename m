Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95152606EE0F
	for <ath11k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=se9EG+qj;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=SoUG0BXk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=; b=se9EG+qjZvW4q1
	2e69u/4x8z95FY9iWaQOhlb43hLOrJhu2xSokRERpjx99DXMzR0eopwdNAE6UUMb4IRLCLilQiJc4
	KW4nmyCKoV3FdCs/0KPoXM42iNDCWtGx1kaC1clrYXD89M1UXZuvm6vu8cJ0apiPT5HSxEfu0mb2i
	P5+dIpIZBhquUhX7Gp9ji8Ld7np4Dg+hhcHPf0pfPWPdfaOYNxXUbMETgkpiNnXBcMTWQ5nz870co
	KCbt+GZReLQrxh3DyklD2KNVKDRDmjkACni/lgyqRWRQOXlqOJOwOKkzzjfFGLT2Ag4pTotN3RLnG
	dZu4pnUL5y5fWosIm77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Ls-00000005zSk-0fSC;
	Wed, 11 Nov 2026 08:06:40 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lo-00000005zLo-0pSZ
	for ath11k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:38 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so450395066b.2
        for <ath11k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384394; x=1794989194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
        b=SoUG0BXkKCVMc4MESwu3jI7xEe+84mJYxv14UnHBQV0R55hgzS+G0odWtmMlk6XP75
         fr2JQ1ySflxvPC8L5uDXVyoFGV+UykrA51PsXt48xZobY6PUb2I3Ajh77oM9oVuVFkK6
         S0ivP7JlijfgHjZmx79pjD/iTKulPiHTUShJdhjcD8sP1MTdUcz03hRcrsBP9JjdNp8v
         Lly7zY1gmIG/BISd0hIA6TBocWeFQt9WTAGY5Rrpd7EsGCGdPNVa0KzQkeBcukuLeP4t
         vAw6XY18LlOaJumzBy/O9gK6WdzA+qtIU3OgpUCU5VhoIu14ba8qnXjzxrtK20cRD7Tk
         5KIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384394; x=1794989194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
        b=bomZytIAJaWNr6GYVE5J1+jq8+NNrDlzHhtqVkEsP6D19pG4KBMJIF+XSH84jQUHRC
         KDu+IGofP516aM+KVjGP+5Ndn3y/k1JmyOblCanec4P+Qh0k/uShTzeTwUf/woyB6Fi8
         7fSw1JE3GxWAawhxnyYLJmEo/i3d+cisIHntBOmYGXQ5fGdndNk+2Na6JhRgAHOMTPsa
         EYkVhtxbld9BAzkaZe3hYXe5PX4Nb0krzbURibWlTOS3wgfeGsRUUZFhJeLQfSZkHPUN
         cDH9FuAwsMt9JhNyNQD4dWghfLZiau0Jk5ZmOXML5ZlCqKIIhYT5NTu+VkfueT9m9g4G
         2sjg==
X-Forwarded-Encrypted: i=1; AL+hErGfIw28mCyt6XwnRExT8nv1DCbYUdv30KTasFOc/IJeZE8MOcDxd3nLWwQOF2VUHcZK2whoBoA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9p8EmBwmIchZgnffr9qe7iWUf8fb0glL3vFPoLwba7ftlmGoib
	85+S98K+NN4atFGi74XJMb8sBTr2jpEyLh3wx9sL7EGsxo8LCClMahX0lCT5eBTMcQ==
X-Gm-Gg: AYBFou1UKUM4Bj3o+vAf5BsBS9HK11JbLSffqu3SCEAogH66j8D3CK/E+FE0lXpsKWu
	JdX5/zhXkjCjBq8VuN8Lw0pEEK76PfIz6633KOlf2H6d2KNxv+jNCngntX7kK6AsTJ38SvNw/nO
	tdQmUnMnSekQwtajuA04D2S6KHmjgHznB1umxp/DJVsmLJ/jPmF9e8O+s08q+I8ibE2GYJc59I0
	R28Jk6/a3v9L39g3S0LZwHZkcQ+G1R+hTp+eZlI6HK/FmZ/2blJzVxRtxnmOR3yqL5wIBh8MxS7
	Qo4tYZ/unHZyAGd766Je2Vjyb3A+iamaqAD4EDfl4kZmtxHQceXvBuJVy6GvyegTx3v/VJOWMqg
	jx02EE0BkRythT4bNHh0zYiYIsbLu/aZiu5oKJOYgkJq4f5P3G1hY6WVZFbws5TfFCHMeomF9yi
	dxZfxTGMcWCOacIR49Q5pDHoI0PiSiOwbvFftRCdXghBAMhGKrR3C1qbIumHC619lsGt7CyqRfm
	mkTJRsPh7HcXsILuN3JR283v/uMPQHjUPdRyvNS0KpngdpGL/fUKKdC0qaoWgHPBT8KOjx7kj6+
	zrn54BfrgAyhPaAKe3DjE/EYqOs5/xWOFBILh8m0utRNK9ob5o4cBKN86EzN4XxUfxLVw2yR51/
	WNIL5jM6DpyzF49T6Vcyq9oxJfoTFIZfMgd4+TWVmrtOyXyizJeaA1B9pFel2yDOYMBfKInJ9WS
	fAEKTn7BqljpUBqnYxdPM/TVyKo3vSAi8PlHy5+iX+Iclzz2g2KfB5Rvk3A/NdbwJ+40hrTwPFT
	Bal8wuih2So4Hl0oME3/jF0i0S/Wxrdq9QmPyrgi0tEvJ+gXkgZtb+RfAOyIEhFdsOh70fzt0Og
	FF+bxil9/rrkDrWhcNo=
X-Received: by 2002:a17:907:1ca6:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c5066b338dbmr122198366b.30.1794384394508;
        Wed, 11 Nov 2026 00:06:34 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] soc: qcom: qmi: Take responses and indications only from looked-up servers
Date: Wed, 11 Nov 2026 09:06:28 +0100
Message-ID: <20261111080630.244427-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080630.244427-1-julius@bairaktaris.de>
References: <20261111080630.244427-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_000636_262666_2E7B26CE 
X-CRM114-Status: UNSURE (   9.82  )
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

Any local process can open an AF_QIPCRTR socket and send a datagram to
the port of a kernel QMI client. qrtr_local_enqueue() queues it no
matter which server the client socket is connected to, and
qmi_handle_message() passes responses and indications to the client's
handlers without looking at the sender. The ath11k and ath12k
REQUEST_MEM indication handlers, for one, then free the DMA memory that
the running firmware writes into.

A client handle learns its servers from the lookups it registered, and
qmi_recv_new_server() keeps them in lookup_results. Drop responses and
indications from any other address. Handles without a new_server
callback keep no lookup results and are left as they are.

Fixes: 3830d0771ef6 ("soc: qcom: Introduce QMI helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/soc/qcom/qmi_interface.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index 16e2e24b60968..ba9d973279145 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -469,6 +469,19 @@ static void qmi_handle_net_reset(struct qmi_handle *qmi)
 		qmi_send_new_server(qmi, svc);
 }
 
+static bool qmi_is_lookup_result(struct qmi_handle *qmi,
+				 struct sockaddr_qrtr *sq)
+{
+	struct qmi_service *svc;
+
+	list_for_each_entry(svc, &qmi->lookup_results, list_node) {
+		if (svc->node == sq->sq_node && svc->port == sq->sq_port)
+			return true;
+	}
+
+	return false;
+}
+
 static void qmi_handle_message(struct qmi_handle *qmi,
 			       struct sockaddr_qrtr *sq,
 			       const void *buf, size_t len)
@@ -485,6 +498,11 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 
 	hdr = buf;
 
+	/* A client takes responses and indications only from its servers */
+	if (qmi->ops.new_server && hdr->type != QMI_REQUEST &&
+	    !qmi_is_lookup_result(qmi, sq))
+		return;
+
 	/* If this is a response, find the matching transaction handle */
 	if (hdr->type == QMI_RESPONSE) {
 		mutex_lock(&qmi->txn_lock);
-- 
2.53.0


