Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D36CD5BB0
	for <ath11k@archiver.kernel.org>; Fri, 22 May 2026 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+6QIFUay/hg2xkAFLiW+meafenw/9VGhbxcOU+YUEk=; b=HVvzH4td0YHanHlVVuBCN+mWRB
	6L0vkJYHMXdeaADiddxMaerdIHn5zKyBioXVRNjdgKAzdEnktxGURhf72t0dwHKlbacaG/ThhSpkI
	j0LwiWNcNQa8vkQl+JStm0WxJajiDSAKnjW9MLnh6WHLFNmaf1CI0zemEyeXQidp0paOm0VGQCGy4
	v4j14fOvmSVurHqi+tkixvLyaH0+baAMFJJn1DTaQC2q6Rx04mKgAyT7A0hfIYKmbqneHuxD6/Lbt
	AEkHV9sxNknCpESgLkGRlDe4tWN7q/i9UdJy9YQqYKhLlT8IIVbd6J+9MJp0gN5GO1wMLYEN0iWkR
	SpvL21ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhB-0000000APOw-06yV;
	Fri, 22 May 2026 10:01:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhA-0000000APNX-19sy
	for ath11k@bombadil.infradead.org;
	Fri, 22 May 2026 10:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P+6QIFUay/hg2xkAFLiW+meafenw/9VGhbxcOU+YUEk=; b=OpwuwYEUjdY86zZeIJHfZPG5uj
	3w/E9Vq64cUilElCeaEauJSSAcjsfbmOrGwRNacrVtAVHp+fufkLma95sYEjOnJYE0I5irwUNSkid
	VVkgIhOxpOeRcbwBaj1rp+Jt5HFMH4PGHjV8og3k3WbqIfHsOWPaS+9arh5Wy0M75oADK3hI9sEzK
	LmxZr+6rq+C1mAu4cuhLq/y4ZLOvq7JppggVh/fUStFCOudiUbf4QDKYxey28YHE8M1OJdJmoMTtc
	n7PnAAl4ojTD0dZ2hvgqAyuzBTICk/loeS34vJbbTnXiyo6Dk+LNP6HZiONlXdv+kc/8Pu7Sv2ckQ
	KOsjnTlg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMh6-00000003vAD-1NyO
	for ath11k@lists.infradead.org;
	Fri, 22 May 2026 10:01:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9C5kI3005097
	for <ath11k@lists.infradead.org>; Fri, 22 May 2026 10:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+6QIFUay/hg2xkAFLiW+meafenw/9VGhbxcOU+YUEk=; b=RgzlyxGB94tPSA5n
	VmceMUIf6T/pLYNQQdcpkxCalmE7Lg26vv2WwJqGcuj4W7nHxcjpcLM1mBh+iXE+
	72/xMMGiPCSy7eXlSFdyXhFM5lU2AVcEYijhJ3Pvwg8nESKOBXpZmVgkT4GMycdv
	ic8HSEjmbIz0XqwzDPbrZirpSCFDLRtUNlBVker1EaBUd4nnlU7n8EjkQSNIJLS4
	8Z+eaVoJpuyr42ZlyZia5YePGd9O5XuqnE9GP7ajY929j37pU30rk4XZMrBPB8KH
	5TmBdinMtcQfwbL69AJe9yj5FeSUdPjKDOny2ntiBeYmvcT8iiep0pyxYhJKlwvw
	VQ3lWg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9ew3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 22 May 2026 10:01:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso4388241b3a.2
        for <ath11k@lists.infradead.org>; Fri, 22 May 2026 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444083; x=1780048883; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+6QIFUay/hg2xkAFLiW+meafenw/9VGhbxcOU+YUEk=;
        b=MdtrN538L1wqON0bkVf39iT+f+7/FxfhHQ6/VQ9oexoZT1pUn8uH0HLqe82ba6cU1r
         kPhbaKTBnnaPjEzgK9UjWdi9Jg2FSnlL4wL4VhkN5sCg83jpGaKQYCdcjHBTeUFKE/0d
         JoPhZewRws0uGvBxmg0Z/mXA5dI0q3aj58uW5r/qBhBPiryoOaVWdrVF+c2qoeucR7lY
         BVNySXOGbhiExf5/9foTC3J6ROhLISPORUp9Rl7XthFWY8Js69QZFhTk1EIe9sOQo+29
         R+wa3ls8ZTqcDd7JI7M5kRDFse3+mzuXZlhsO2ccUeE5qDZOHeNU22yp8YkBbdoTRNGW
         LBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444083; x=1780048883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+6QIFUay/hg2xkAFLiW+meafenw/9VGhbxcOU+YUEk=;
        b=dH1mzHsKjC3YHBuWMKZswIi3j2V2SBcy7sjWJk245cTdpooV/6RYsgkMBeVXEmdrp9
         8I5T6jvUaY85ulsjOHEFaOIjcFj+1gcpsyYWrH8R+btUkU2SgTHTsuJWEmoUEQpbx6vJ
         fJRZa6+1ol0nwBhJoiOjksqhFuHXFq+X+IqfVoW0EK+qoIOJZUGH2sIKAmLrmAZYje7e
         Na/AYHeRgeXdakZiIRm29f52PxpoBGKcCUjQPQShLl2onp66I4JRVJliYHWovprbnJs2
         kd61sbBhooSUMB2Iw8h9ld9VcSCVVIqBH+KkRSMINKvlp9ycgM9Vk74j6/tM7TvcCEHk
         JL2w==
X-Forwarded-Encrypted: i=1; AFNElJ8LWvqXdVlewRqsy0np6sQtzGRo0BI7rT7NNx7KgCUutFJ2MWBfba2Kj7DJa/ErVfqCUavwGQM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+25Mns88mQD1zYOxdqO5aCwDOlRUFrfbmz2/nV0Szl3TzDVwR
	1F/n/MQqvHNlO24jND+5hqR7XZq5cSvjALPPFFDuo96fyj0C3diVhZ0CS61Rvye8Q1prg3tBmtL
	gnecw0fg00nAT8KjEV7aNsZ3jAp0IQD+Hou1MP+cyYhUHwsCVrmilBL/OLGOh2hab
X-Gm-Gg: Acq92OEByCla9VMP2z7ywbu2q5QuffJ3DBezZqMD7Ot9sFgsMFO9z2KD9hc+kP9/r2d
	45MEyBdpucP5JT37zU+Ic6FharnqFkT2ZTYdRAZEslT2/pPaRf3lo1eNnVwPqSmjjSUlv5dAQS9
	P5NJMP9iV/1AQheuVxt7TaiTBrG0TlvqsMbybULFtyCKib0//S9x3IhtoVU0TleusrVoAq6GBa/
	Y/Yi9k/RxxZC965hcrBMv1DP/OUA7RARkAJF9lowJw+/gDzLeIM37X0/zmDyXWOLXHmwdWI6T1h
	/6eW4/mRZ1hD8OhKVMDl9k75ON7jqA14E30e3yn9xuWRBfoyGBlwNpkSkFqbfM7msk+G7eW321R
	ZglgIjHBhh7hvzLqNzztNZWPBGTUA0oKVrXuypoY3bRPVS8zvLszqvyfh
X-Received: by 2002:a05:6a00:438b:b0:82c:9f7e:518c with SMTP id d2e1a72fcca58-8415f32e17amr3015046b3a.25.1779444083221;
        Fri, 22 May 2026 03:01:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:438b:b0:82c:9f7e:518c with SMTP id d2e1a72fcca58-8415f32e17amr3014968b3a.25.1779444082645;
        Fri, 22 May 2026 03:01:22 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:01:22 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:35 +0530
Subject: [PATCH v2 4/6] net: qrtr: Hold runtime PM during active data path
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-4-fbebf41a82bb@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=5157;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=BhFCU11Vli0eY4peRB1YT42TDHVLDyHFog9G3pGgq0Q=;
 b=UVBS6HbShn+y5fJQr2GY5SAYIopHLLknf3feWh42YxN8Cfo16vZuvf1XVAOydKz7dA3b3K6eD
 /OQhLOIVtQKBDTOurt56nsyDbIEnzo5jjzEyQsOPqQr9m2m8ymwcde3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a102973 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mqvsnErzViNTL7-QoTgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX5l0afPD91/n/
 5pLpzP3tnsQtIsAYJj0FM5AiVRJmhxliS8avWWPNla7C7vMSEU81CbX8kjeynk5XRqisMXGxPim
 fDnlDjH8q9xN6EW5PTrjecyB53NAaDJfSKbFdOn//nHzZ5Ug8m3dSy8/6+7Q2HC+CFlCRRFwSkc
 cqQkLvb+IUZQdi2Qd7KahbUGUzX7wJm7yNwSj7Vwx8KYu4uxn9nree2qeIP6oGEEKDZrf1NEI7h
 oIhvLCI21Ms9PE3o08mUDEs3GWS/Wrimnwl8qzun0JAc9qDEueEoNKCamJe3aMmH+rTEOyXHrEE
 ptDo+aVEPo6dnl7sDABJ6f23U7fun4NG8h+/LPi+AImeS+d0cHznk/3opEKQd6n4ObGXnN5TGVw
 L+X8JjlX4VWs+K/V+QOltwgwskOfa0m330tKjDHWrWYhS8n3+56jRysgFwEE6ugu8oTtKp9dQ18
 gVt3ZGUQ+p4YXW1W2vQ==
X-Proofpoint-GUID: jmNT4JQG1rCXFlID3DuwkBaijnELjWNi
X-Proofpoint-ORIG-GUID: jmNT4JQG1rCXFlID3DuwkBaijnELjWNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_110129_089525_5EB2EC27 
X-CRM114-Status: GOOD (  19.19  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The QRTR MHI transport driver does not coordinate with runtime PM, which
allows the underlying MHI controller to be runtime-suspended while
transmit, receive, or RX buffer refill operations are in progress. This can
lead to stalled transfers or failed buffer queueing once runtime PM is
enabled in the MHI core.

Add runtime PM reference counting around TX, RX, and buffer management
operations to keep the controller active for the duration of each critical
section. Enable runtime PM during probe and take explicit references around
these data path operations.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 net/qrtr/mhi.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 80e341d2f8a4..cba7a5daf7a4 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -6,6 +6,7 @@
 #include <linux/mhi.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/skbuff.h>
 #include <net/sock.h>
 
@@ -38,11 +39,20 @@ static void qcom_mhi_qrtr_dl_callback(struct mhi_device *mhi_dev,
 	if (rc == -EINVAL)
 		dev_err(qdev->dev, "invalid ipcrouter packet\n");
 
+	rc = pm_runtime_get(&qdev->mhi_dev->dev);
+	if (rc < 0 && rc != -EINPROGRESS) {
+		dev_err(&mhi_dev->dev, "pm_runtime_get failed %d\n", rc);
+		pm_runtime_put_noidle(&qdev->mhi_dev->dev);
+		return;
+	}
+
 	/* Done with the buffer, now recycle it for future use */
 	rc = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, mhi_res->buf_addr,
 			   mhi_dev->mhi_cntrl->buffer_len, MHI_EOT);
 	if (rc)
 		dev_err(&mhi_dev->dev, "Failed to recycle the buffer: %d\n", rc);
+
+	pm_runtime_put(&mhi_dev->dev);
 }
 
 /* From QRTR to MHI */
@@ -54,6 +64,8 @@ static void qcom_mhi_qrtr_ul_callback(struct mhi_device *mhi_dev,
 	if (skb->sk)
 		sock_put(skb->sk);
 	consume_skb(skb);
+
+	pm_runtime_put(&mhi_dev->dev);
 }
 
 /* Send data over MHI */
@@ -69,13 +81,21 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
 	if (rc)
 		goto free_skb;
 
+	rc = pm_runtime_resume_and_get(&qdev->mhi_dev->dev);
+	if (rc) {
+		dev_err(&qdev->mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", rc);
+		goto free_skb;
+	}
+
 	rc = mhi_queue_skb(qdev->mhi_dev, DMA_TO_DEVICE, skb, skb->len,
 			   MHI_EOT);
 	if (rc)
-		goto free_skb;
+		goto runtime_put;
 
 	return rc;
 
+runtime_put:
+	pm_runtime_put(&qdev->mhi_dev->dev);
 free_skb:
 	if (skb->sk)
 		sock_put(skb->sk);
@@ -90,20 +110,30 @@ static int qcom_mhi_qrtr_queue_dl_buffers(struct mhi_device *mhi_dev)
 	void *buf;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (ret) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", ret);
+		return ret;
+	}
+
 	free_desc = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
 	while (free_desc--) {
 		buf = devm_kmalloc(&mhi_dev->dev, mhi_dev->mhi_cntrl->buffer_len, GFP_KERNEL);
-		if (!buf)
+		if (!buf) {
+			pm_runtime_put(&mhi_dev->dev);
 			return -ENOMEM;
+		}
 
 		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, mhi_dev->mhi_cntrl->buffer_len,
 				    MHI_EOT);
 		if (ret) {
 			dev_err(&mhi_dev->dev, "Failed to queue buffer: %d\n", ret);
+			pm_runtime_put(&mhi_dev->dev);
 			return ret;
 		}
 	}
 
+	pm_runtime_put(&mhi_dev->dev);
 	return 0;
 }
 
@@ -121,12 +151,22 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	qdev->dev = &mhi_dev->dev;
 	qdev->ep.xmit = qcom_mhi_qrtr_send;
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	rc = devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	if (rc)
+		return rc;
+
+	rc = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (rc) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", rc);
+		return rc;
+	}
 	dev_set_drvdata(&mhi_dev->dev, qdev);
 
 	/* start channels */
 	rc = mhi_prepare_for_transfer(mhi_dev);
 	if (rc)
-		return rc;
+		goto runtime_put;
 
 	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
 	if (rc)
@@ -138,12 +178,15 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 
+	pm_runtime_put(&mhi_dev->dev);
 	return 0;
 
 err_unregister:
 	qrtr_endpoint_unregister(&qdev->ep);
 err_unprepare:
 	mhi_unprepare_from_transfer(mhi_dev);
+runtime_put:
+	pm_runtime_put(&mhi_dev->dev);
 
 	return rc;
 }
@@ -151,10 +194,18 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 static void qcom_mhi_qrtr_remove(struct mhi_device *mhi_dev)
 {
 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
+	int err;
+
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err)
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
 
 	qrtr_endpoint_unregister(&qdev->ep);
 	mhi_unprepare_from_transfer(mhi_dev);
 	dev_set_drvdata(&mhi_dev->dev, NULL);
+
+	if (!err)
+		pm_runtime_put(&mhi_dev->dev);
 }
 
 static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {

-- 
2.34.1


