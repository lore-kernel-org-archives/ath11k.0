Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2586D606A330
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bf69wmbg;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=x6hHqDWt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JnwF+oS5w2IlCzPszI1C/3O+0i/sc/fD9zkOECKdkbE=; b=Bf69wmbgFWGoRh
	ZwA24ELAw/fhI//POn1480xZ8HLNvxOjSqhinRmTV9t6I8l3QUCPDcaMlKqawrSgkIsDRBSdJfGdB
	EIHf2jupAiVoEt3dNlOfW99rWqWm2UfD2+urpG4uZjSl02pVc8oRyB/rSi1iZfM0z7pcl5zq/OKPr
	e0iPmBksFQ54kb+0AzZZMf5BmyONgMII1zQfKXNyuv6/6lbbb8B/kIgyRBUCXVyZhec2hjPlIlhJx
	c00+dDqxLCbvHnTovO279NflClDltl5NPBu74NQirBaG4PYkQc22ImFRcEqZdCGRQGoZUU0QWG1++
	dYJdfZb3wsJOnY06WnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBg-00000000SN2-1gxX;
	Sat, 21 Nov 2026 23:08:06 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBT-00000000S9F-0rN8
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:07:52 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c247f6687dcso317411766b.2
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302469; x=1795907269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnwF+oS5w2IlCzPszI1C/3O+0i/sc/fD9zkOECKdkbE=;
        b=x6hHqDWt7Wovw+1k/AB+lEoel4qVpG9McP1L7ql36zQbuypUeqhgI6xZmunnKWtrh5
         Oosyw1aZD7Wdbe0dEtLeanTjTc7JHRtj/lRHz8CfawKRvyXHQKUf0cLJ2cidsd86iFxQ
         JIs32V1jAUQaje74atToncp/XIXPMM/P48OY3Z2Kaa8qimKzvHriEvzf+cBHc+WzYeOI
         /N2eT37PQv+rzbRFiXeIb4dv6VkOhjd8lzKGgKPeXg3UwGPu6F5YyDhQ/WE780D3r/B9
         aiAHQp0MaNwF/3cysBDsA5vnPhA0AIE2FW8d9uFF6GFnQg1or+7pcer/IDp1NURoFxmB
         Th7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302469; x=1795907269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnwF+oS5w2IlCzPszI1C/3O+0i/sc/fD9zkOECKdkbE=;
        b=P/wMgG7cUe6VOad/Et5NpaS3s80wHDKZbPkgMNbqBbmXhCpsWhCA2VpQcxnOcGt2vG
         qm3DcxNvH9V72X+KgVKr4RiYqk19bqDwXylMflsiBeXXacwBnPPxiuNrhoOSsTT/z849
         5GrQTHVxAnsDiogwHF/A2NFEpQcXFZ1215J07Ny/Yx2raedKKYAMjlFeCSujUNJjRCs9
         4KqLSwYtO3L9VnYt5zxgvzSbZ/V7gW1p9lfWAc/D9BmaoOXM9xNXNMRiybP5HimqVZga
         9Dt1JaAsiVPXyB2vlA+1anl3/z5VVrxGlEGcGjHjHnbz/pn/3DkCDFeVmRrv5Larjw5R
         0ZNQ==
X-Gm-Message-State: APuU4Z8l23FBTcFj08YTzvc3keHubp2Wjh2CNlCzFs+dtEauLzQvMgky
	UVhVqF1KHvNjKyXQzB2PIus9WcdST+Vxso6PgUNgLAZpbR2uBcZh1kWR4B60GpW+gw==
X-Gm-Gg: AZFdTZea+u8T9SninMGC7Lkeu54eYj3Wkzm749l6de/i2tuXboTIFpB1vdUpqqDADXj
	aSodlaLe5IMdDRh3nr3YzjbdQMGofwsLlHuUAaPZ0ynyghnzJJzlbrvDkOSrF6swhjUueNREj15
	4E+rzSdqnbGmz4ZGL17wuV96aoz45xeqlERy4S8XgUJRMTDiPfF2rkb3YKMxWfsiyEqYDizDIrQ
	Ov+sn+qMkPE2rCYdYAWLBub8VuxExAdzi7Q3J/ToZQkfzsSROKIv5gV3P8c9SMUnXkNerp9Id6I
	zQ+xe3XZk9tzo+Sr2q7r7+DUMiMmPGUYQ2LKVIk3RyKDhLs7D/YG37aCjDdj8A4l4UVlvmkOGAx
	8BOK4GS/M29kdX2H39L/D58P9HitKY19dbMJOMUEln73zvQXeIXdcTpssDtSoJv8E1Znbe0BDu2
	76h4tL2hJpvszYCrUxNGeF1SJFA/SuHzPjCQwOmGhD6tR1G1URNDzQP0hg/CXcnzasyN9DybmA0
	wrOEEZcElroWFDXGFHnebcmjvGSLJAGEDcD91hNL2k/RGk+yvmaTBfwDG3WKCEyN5ZA9NHlI9UY
	3UMs9dLcOdmeh0oeSNqW/c/81wgnOvSce+LVALTJgr37kmW8d3gDiXXL0lFs50JBQF8QM8MwMCU
	+EGfY4N9v4hcq/YMrQ5e1WDtdXSpl9YHfBS/xNL437K8rdmruB2ccFVpsHiy0mFeprxab5zQhgw
	6PTFpuS/mDtSYAhLtLGlNfbo1rEg/hKFrNPw9Wnsr4YJBR4kI/6Q+PrLyf1mzzj4EKh9ndx26A7
	qy9zPOMJE3MyWM6Bunvaw6IExXmu3u37OGFAiexoQdiMqBzc5/jX6RR/E4wMYHY+Mz59nMcPUfH
	hSeQVrv1dkhikJ3HD59fgUcIYeNtXIFL6lG8iZzjJd3sPy8ODwoKkuU3nKP6n58AQHRj1rxkmb4
	=
X-Received: by 2002:a17:906:115a:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c513a89ec1emr503984666b.24.1795302469619;
        Sat, 21 Nov 2026 15:07:49 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:48 -0800 (PST)
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
Subject: [PATCH ath-next v3 09/13] wifi: ath11k: release the QMI handle when the QMI service init fails
Date: Sun, 22 Nov 2026 00:07:27 +0100
Message-ID: <20261121230731.1206043-10-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150751_268264_E14751FE 
X-CRM114-Status: UNSURE (   9.75  )
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

ath11k_qmi_init_service() returns an error without releasing the QMI
handle it initialised when alloc_ordered_workqueue() or qmi_add_lookup()
fails. Its caller ath11k_core_soc_create() does not call
ath11k_qmi_deinit_service() in that case, so the handle's socket,
workqueue and receive buffer are leaked.

Release the handle on both error paths.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index aee32aec8732..3ce7c4e5c51c 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3334,7 +3334,8 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	ab->qmi.event_wq = alloc_ordered_workqueue("ath11k_qmi_driver_event", 0);
 	if (!ab->qmi.event_wq) {
 		ath11k_err(ab, "failed to allocate workqueue\n");
-		return -EFAULT;
+		ret = -EFAULT;
+		goto err_release_handle;
 	}
 
 	INIT_LIST_HEAD(&ab->qmi.event_list);
@@ -3347,9 +3348,14 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to add qmi lookup: %d\n", ret);
 		destroy_workqueue(ab->qmi.event_wq);
-		return ret;
+		goto err_release_handle;
 	}
 
+	return ret;
+
+err_release_handle:
+	qmi_handle_release(&ab->qmi.handle);
+
 	return ret;
 }
 
-- 
2.53.0


