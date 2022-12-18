Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9208C3DA79
	for <ath11k@archiver.kernel.org>; Sun, 18 Dec 2022 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFe/yUcF61kqD+V+S6OQtXkGfC9Ph5jsFfenCw0LjVo=; b=1ZD5F6iQNx1nbp
	T80oAkUpjPJ+gTuPdcR4Ovnhrti5UQKb3WsXeETdA8wizjC5F1c7rxesCfU3XfQxF4QvrR0cF+TMx
	d7QzV8olXN1EJU4Gc0NFDZRWaEFBRSQu+GlQ2IwSHD+K72Gd0ab5IMKQcVpYEalR4xxuGMVFhSy/g
	roBnb3m9ST1v+SglvnCqHdQb44RgTfwCgzef5aftjYjBClc7FKBP6Lbx186g9ADYSP0zHef3Irx6r
	qQ5usk55KFl5lZQL1sRIc+6jRgI3j7mEy6KAKwyAEodl9AKQrfI5Jv1gNwV5vGXMVolSCYjJZMeGT
	OvpSGzeEpkKSkKTVcL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6w87-002md1-IU; Sun, 18 Dec 2022 16:03:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6w82-002mak-0p
	for ath11k@lists.infradead.org; Sun, 18 Dec 2022 16:03:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7EDCB60C58;
	Sun, 18 Dec 2022 16:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D47C433F0;
	Sun, 18 Dec 2022 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671379384;
	bh=ZOe+bKsqQUZL1HRBM3mff0Yg2ydfyAUrZqNFuRXj4wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ndRy8/55HHHEYUkE0qTKk56c3SeTmwUyBSVTrHMvp8Zv+xvPSCDJqHnefGrLDo5p/
	 O1XxZ12yXv7EMiXSWYSyWs4cKRN+exoA6R9JdTdoBG/uXVao839HOwKr1Tr1DvsvK2
	 520h5R0clX8eqcbhSJNPBd4FSk09dQkfH1L8epfu04BqmPvP0/okRMp7ZECzGjTpFa
	 eG3lgCUaDxUG8aysovtl55GdFP7l3GoV5x2X0hHYXjYurQTLkny4rtEL3oXA8FcgSj
	 N9G13hy2si3NT3lZg/RlXv6en6xwmf0yy663aDVsM3p6uVaErbQ+hh45eC/lgUhhor
	 yHYBDNmJVFf2w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 20/85] wifi: ath11k: Fix qmi_msg_handler data structure initialization
Date: Sun, 18 Dec 2022 11:00:37 -0500
Message-Id: <20221218160142.925394-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_080306_728188_E16F385D 
X-CRM114-Status: GOOD (  10.29  )
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

From: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>

[ Upstream commit ed3725e15a154ebebf44e0c34806c57525483f92 ]

qmi_msg_handler is required to be null terminated by QMI module.
There might be a case where a handler for a msg id is not present in the
handlers array which can lead to infinite loop while searching the handler
and therefore out of bound access in qmi_invoke_handler().
Hence update the initialization in qmi_msg_handler data structure.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20221021090126.28626-1-quic_rbhattac@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 51de2208b789..8358fe08c234 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3087,6 +3087,9 @@ static const struct qmi_msg_handler ath11k_qmi_msg_handlers[] = {
 			sizeof(struct qmi_wlfw_fw_init_done_ind_msg_v01),
 		.fn = ath11k_qmi_msg_fw_init_done_cb,
 	},
+
+	/* end of list */
+	{},
 };
 
 static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
