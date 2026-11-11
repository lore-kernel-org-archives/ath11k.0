Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8FB60A2618
	for <ath11k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iep7soe8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KSRTxqsk;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=FCD+Sooi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=; b=iep7soe8vnxJho
	EmQKHgifn1z9YOZogQXG5QuOh0l51v64Z++11bUnsFC2MxEixwP2uAOGyNOMDcrvlwQ1Yyto95kR2
	3ekEPtKMJAm52hC0RctlI+ep7yszkEzBshPAKHYEcA2GTQHcE4rPX07+xLF2kLwAAiGcxM++QK1u0
	Qn6h1WNrwzqSvcfWEcFICf3WSCZKXkgeGAzuDd4Bi+Jg8Hg4LlxVReYRHrIKp+Dq5N+oUeBeOw4Bk
	PjTIBdsDhhk/5kEpVk5u+p78J/HoLiapHp61buqQd7Bk14n14H2xDerN/C4EeRIOC66jGMYgtFmGc
	WURY95wM3uAjxmIgWH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lu-00000005zY9-3acH;
	Wed, 11 Nov 2026 08:06:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lt-00000005zTl-0tkZ
	for ath11k@bombadil.infradead.org;
	Wed, 11 Nov 2026 08:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=; b=KSRTxqskYaNjeXyyMsV7RZAkAP
	cgoacApbhsCyXRgoqjQNrpHZc8zeYUCkX9GB0ciVpekRfzU0yP4UIy+NqBgGmZmjTRZDzTHI7/xr8
	b/rpnX/oID453nFED5mG/313VjDFrWdEJK74Eua0qcKsEZmJ7KHwv8g+3d24V226kWJqZjmjQaNOi
	R9ckhgTzAlCaEZCGhU4jtIWpeKytkixUN8hm92C2TV46ylLmEB6RQJ4cKsRtjMdlUXfxHDD95S7xX
	eckltKf0Hx4m/OeuYbswXUXm9BZf4BVCbK3tsu8B/6ewWbkEK1pItJbwqkhblZAuUh7b0wqfCEtbI
	h7qf6EgA==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lq-00000008t6o-0N7W
	for ath11k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:39 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c4395d31228so386009266b.1
        for <ath11k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384395; x=1794989195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
        b=FCD+Sooiu0OiGaONm0kBPganakH8RiYAgXTEvgWgqWIEjsf7FZ2mi125yRSVJWntFs
         itgtfCZy0LWu+HMxfMmztEIhznxvXD+b8pVOGK6hd5Rxe1e589YWzs8d4H/IGsos3szR
         qycGz0meft24YSCJcLDwK0Q6GczGVYRdsyJ1GotXTgbN3CPPiR+RoN1Aby0JF71sNqQC
         2fKxR4B2W/r8xIBshDoWfx7wfwbX6atpfzvtKzjNMsMzzy8HoFysMu8P8UFOZf1NZLxE
         Nbz5cL3eInePVTZIcuOCM4T5CuokB87JFkfvQ0iOjtZ7KVl2p2GWH1ebUi6wGyKM2gwb
         6b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384395; x=1794989195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
        b=cImfvrRcq7QRfjzvOUjwNd8WHyW7KrsLzbRcvsjJB81az5eh3CFy8AxJsb2E6RJYTT
         7WTM3gN9TRrP8b8BoRd6ZMhvtora3pLeLfntfRK4HBBH5kk6haGBQaJsuAbqiGi7l6yr
         GfG45Cc1dMzLcYl2A4LOyjx/vtK1CauU2yu3WKFGcjuKGx3IGTelnVbI9lmeqwrNeaAF
         EKdnVBVLc/HeOq/6O5LAy4IwAwIUpE5K/7O3I4qAB3xHfZdlITHd//m5AgzhP3SAJLTw
         ssph1CV/4Ma5sdkaavRRJpOcs4OlqM9ip1dDPq5uVTz+g9906q0WHZ7oFeWtQuHXMq0F
         usOA==
X-Forwarded-Encrypted: i=1; AL+hErE4QHLdz+UwXjJcxGqTUt1jrZIfjd4b4eazgaByvGynFrl0pO/g3F5ONQEzbkLqhDBQKqI0kNM=@lists.infradead.org
X-Gm-Message-State: APuU4Z/5BanEm4QUEbRYWa6R0U0OdRm1h7r004yThm+mCvcs1XNNJI4Z
	p9AxmN7bym8AVG82USgmMCZ87jnww4gmyoZynkeOjCpduGi9ewOUhW6T3QfUUg6+3yABEUkVxqn
	p7fTW5gH9
X-Gm-Gg: AYBFou03YjMxeRE+urU6iY67w0qJmBLtEExowM+oKc0FhvX2771fErazd1qsbv/TY23
	Wwv1nO+3WQ/6BPsSOE4WAAujdua1gxxU2eFEUGvTC3m4PMvBTJl453UZ8CtkF/lIATrgqagYvPG
	I3mfL+aM1jk8M2gr7miWDcUru/s1IaGfaZLXqpxsN1GAAYNcW2YXd/ajQn1SUGOx9DEcN/3TbmX
	nsl/TLiZ11qdTd4oy3VNiYcOftCk47kgDYwrH1o+WO/gWtWmktlXmAVqay8zFkKkHOkfLspky1o
	LODMdVy4CgY9jv+DAYwXhZb6sFWtEM+fGMYkaskEGWSI6nr8SlB4JVSMkSjyHKBEDMuRPBBVvMb
	EPDlhLUnbMuh+3XnjtPwdlPGCuVxeqg7Z4107XLhXav5Z8NFbaHY5UuqYcGRzEXXVs3RtGAqq7n
	ttuMVVaickVB6irOSOSBqP/xhJ9kmXXtLRsBK/y+ere/FnD8M6F5h3jBnqg6Ie0CAYuylRlHfNq
	oSWVtq2MAUiYKVlbXi+3eaqEoA+rFAiN1O4MQvBO0il8m/VAxwbI67qWsZC8d0YRAza4140hggg
	T0itAQEgpha8c/RpTsUqPn6Mzje1KG/DLqifoVJL1Z2SAF5uT7xrJohEytOIc+zlpvdoJxy3flZ
	oXd1vTndkmnrKnJtBJDWUlQLkfcWewjY6hDl7M4U3aQGQtwVY0hpviaPH8RhBmrIm8HUAEAA25+
	u30WG0o2JQ/69ktZfCYo1ucjrLoKGlxCSdEISX3ZS4eKIUUgH3ewA+HWl5+UBw8C74CJVFdaXK9
	ck0eqKVN94O5vd93Qghamg3KRfZNLYlHI2tqc7BcBDMqWOLrwiZIRdt8mu9Ad5LokHhyMAHaWOi
	Er7gDQlqm+o4WA0kmWg=
X-Received: by 2002:a17:907:3d0e:b0:c49:d1c5:431a with SMTP id a640c23a62f3a-c5066d58e34mr133683366b.38.1794384395369;
        Wed, 11 Nov 2026 00:06:35 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:34 -0800 (PST)
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
Subject: [PATCH 2/3] wifi: ath11k: ignore WLFW servers on the local node
Date: Wed, 11 Nov 2026 09:06:29 +0100
Message-ID: <20261111080630.244427-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080630.244427-1-julius@bairaktaris.de>
References: <20261111080630.244427-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_080638_289302_9DEAE60C 
X-CRM114-Status: GOOD (  11.90  )
X-Spam-Score: -0.2 (/)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Any local process can publish a server for the WLFW service through the
QRTR name service, which records it on the local node.
ath11k_qmi_ops_new_server() connects to every server the lookup reports
and starts the QMI handshake with it, so that process takes the place of
the firmware, including the REQUEST_MEM indication whose handler frees
the DMA memory that the running firmware writes into.

The WLFW service is provided by the firmware on a remote QRTR node.
Ignore servers on the local node.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b9579..c4e4b9c5ec0da 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3172,6 +3172,10 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct sockaddr_qrtr *sq = &qmi->sq;
 	int ret;
 
+	/* WLFW is served by the firmware, never by the local node */
+	if (service->node == qmi_hdl->sq.sq_node)
+		return -EINVAL;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;
-- 
2.53.0


