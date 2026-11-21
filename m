Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53265606A330
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0p1vD1nr;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=KxtsCQB4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s88wbEfs1LyrsI8Y5Ny0Pr/96EyRBnxWAeHAPxpjPjY=; b=0p1vD1nr+fYjaz
	3inUkYbxFR2RYpbGvieOf199O91n+/EdK6fTl46rxpxOiCvWdRW5JT04Uk6elsYzfP5DPH23kltUh
	w7VHqoCTxkbd95hbHew+78fFySMvNAuCqW4LdxRL7SZRT0Jfctxa//sTfCG0llvZ2xBom7c6PpWL6
	BUmpssbloUkZ/M8i0ICDDry4ikAD/zrxguMyrGyiApwjZWhhAXKjjjakhElV4sm+Rgt0/9Ka41chd
	wAbkNA3h6V8SbGNoCYhwAKZJxI2N+SY+bJbetyLk2FEpCa/Cg+et+Q41yUI/7aBhWwhMNIKPPQ+7b
	dGxE5hdprtaRxUXtKLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBp-00000000SVj-4AYE;
	Sat, 21 Nov 2026 23:08:13 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBX-00000000SFC-1aqC
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:08:12 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so337990666b.3
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302474; x=1795907274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s88wbEfs1LyrsI8Y5Ny0Pr/96EyRBnxWAeHAPxpjPjY=;
        b=KxtsCQB495nSutFH8BJFCi3WG57FP0j2+MLlTcnjKbbWtP36fxS1V+MohRIE6v2+8n
         uKfchQ9DPvrO/oVRUWZof3Kj+HmG6NbWrOi6d+kwTL1Z4UwUTsxPmx3i9t72UtIsaFfd
         WdA1ULpKH+12ySnSe2pXtyA4d9Tiu8Rkvg0/T4OJPiPkkkD90qY2B8NTVBMW8UKOU7x1
         99KW9ehzCKT2QCPQFijBG+8WGMVqwJOHaCXmbYHewWs04EQXiarJr1q7ShTyqvz5a8nR
         zCKdnp19CiMf8ZvD+GIsX5ngFJ5oVJkuWk4w/ZTEvUQfCuzQqqXtlDH/N5QIgRwnRTBf
         izAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302474; x=1795907274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s88wbEfs1LyrsI8Y5Ny0Pr/96EyRBnxWAeHAPxpjPjY=;
        b=L++giNfXUViqg76dVkRFNe9/STcV/aQJHh+IyTXJ/LN22Zf5Ojen9IOkO86r6OOq4X
         ogQY8gw3cjrqyOjBMbyEMW/j0ll2k9NtYz3/8zYvmY5X2zYUu2G2pjW8LHnFFEGDffGj
         525usR2M/1ibcUZZRq6pDSlBlcYZxIST6s8IkVhmHMDu4JRot4ifDwvYXmQ4Jljvo5Ev
         fu+RcQMLyWldvWuw4Z+BMngugEXElEmJSNGiBvAqQp3O/ZxJmPRa8fnr8TMVQMQjHowj
         UYTXU3z705sWQf0Mz1/L79l0z6KYgEZVgghwyAJ/O5C5hEBJkT53nOiUxEY5jE97vZhG
         kOFA==
X-Gm-Message-State: APuU4Z8co2hae71b/S67YiHT/k+Dp3cMCTRbzdXfeAPhbZeVHtlQrZir
	v2MKBjp0Io7dK+cwoV/T5elm7756ZMFq4MBSQO/riEwyvRURnwHTC2q8P+NWwElpcw==
X-Gm-Gg: AZFdTZfOu/buQJEq6mwhPZQ0BX4sjtNFO6EJPF1pJoKi7TZDylSadF97KvXAQygtxM5
	NYLJ7qSAOgRm9xCXD9IyCNAdBxgCOaMiH3KO90mDgozTRhP5kaUxC3ZcJOK04lrpGCx6fbXpPoH
	lwbZskOG3qcYbyr6FShGxW43KsdKlKxL3TeD9Pn02O6HrpsJu0fVgta4xKk6PBrU7sdwapmvvat
	2tvTFXgrkgsNmytVP1jaLz7fGanPCxjuKKnbaxxqQ2/O5aDdl2MUg2Z4ot//FRVq8MWLMf3HOX2
	1ee3DnS7iO3bEqbQy3GpyDfjzt6oyNbq0J+o6Qz3ariJm9RtZsE+jLObNXDBN5AOtKGMAr1oyKr
	4AnvuFYJmaM6JqZd8rUshmuQx0COXW3cDsxzXvQnlFC9JJ+Q/+fOP+Yub1fgv4C3/WaiADoKybd
	RlGgkLvR6JnAb3A09VrlTpUZJ5nchlld+KOeya6xktpFUWieJHVc9HAcRsGDlabDnyDhmjv0HF3
	lXqOuCeEbH/mwerKKnemf1F/C0EQyXXSHcUSgYN4EJT4iIQniOSI9nfawOtqwKvBhyYusLZHcHV
	0LfIzmTmXQasxAiwpMNHjuLI+kN2EHm3dcsIf/GJ+d5fP/13jLAtDwV5ZLgZ7WrA4ky4HyK7RDC
	ysPubMjmBGgEyN+LKFcfWYs4YRooRNaovGx0amtwrNOcL+b/o1QBQ5Le0qft4cdefWQNEam4/ek
	mYlNhOcJdY+L6aW8/Kx9b9Pia9od15M6VcD/Ls69AGYxrOe+l0rL83WKSALu+LjFPBb5krlZ1xS
	b8Vt1d/ubq9z7aD5nWpeLGekddWQaxlOi2HM7lf7cmeOAon/Kd+oHcEm36nTp0iQfjoV4yB52A1
	SnkBehSNOLLnGs7cFs3PXIXb9LSDxGV2uBzGGLwNaqBMGohVim/cMNQGmGor8y3NsVJHCOMCYBQ
	=
X-Received: by 2002:a17:906:f5a9:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c513aadb0femr716344166b.44.1795302473838;
        Sat, 21 Nov 2026 15:07:53 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:53 -0800 (PST)
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
Subject: [PATCH ath-next v3 11/13] wifi: ath11k: free the queued QMI events when the QMI service is torn down
Date: Sun, 22 Nov 2026 00:07:29 +0100
Message-ID: <20261121230731.1206043-12-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150756_848711_B93AF660 
X-CRM114-Status: GOOD (  10.83  )
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

ath11k_qmi_deinit_service() releases the QMI handle, cancels the event
work and destroys its workqueue, but frees no event still on
qmi->event_list. Releasing the handle reports the exit of every server
it knew, so ath11k_qmi_ops_del_server() queues a SERVER_EXIT event there
on every removal with a known server, and the event work stops early
once ATH11K_FLAG_UNREGISTERING is set and leaves the rest of the list.
These events are leaked.

Free the events left on the list once the handle is released and the
work is cancelled, when nothing can add or take one any more.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/qmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 3ce7c4e5c51c..4a3837958e01 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3361,9 +3361,18 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 
 void ath11k_qmi_deinit_service(struct ath11k_base *ab)
 {
+	struct ath11k_qmi_driver_event *event, *tmp;
+
 	qmi_handle_release(&ab->qmi.handle);
 	cancel_work_sync(&ab->qmi.event_work);
 	destroy_workqueue(ab->qmi.event_wq);
+
+	/* The handle is released and the work gone: free what is left */
+	list_for_each_entry_safe(event, tmp, &ab->qmi.event_list, list) {
+		list_del(&event->list);
+		kfree(event);
+	}
+
 	ath11k_qmi_m3_free(ab);
 	ath11k_qmi_free_target_mem_chunk(ab);
 }
-- 
2.53.0


