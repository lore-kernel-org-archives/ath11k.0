Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCC7FCA19D
	for <ath11k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=; b=WwlC5qlux1HzcPA/MC5Sgpn8LR
	h4IgtyQ+sDFCrAHWSFX80FXfAzARvWPGeaJHUI/KbmYcnUAGc9hzbj3OuDsJ57YD8n1Xlkxp/tOUn
	Duk1lZTlvvhm0E8sAV9kdJM7MM0k6aJiG9LsflyaNDDZar6wA8kZZrT96kmK93XGC8BJaKb4IV6Hr
	RnAa2rYbt4bCOFEHRFtCb8N/buc9jnLf0SkiLxT4UkxBPh9ijfr88+FlfKIOYXJHo49cEc72mj+Nt
	1WZ6w67lhbIkYXg2phvaCFxlupLylPn1z5TSaizIQQj9nQNkQwwl6mvMzX0aaP3+otmpSzVTr4IQe
	B8HDfs2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjg2-00000008HG7-08ms;
	Mon, 09 Mar 2026 23:06:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfy-00000008H6s-1Ymj
	for ath11k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=; b=Mcd2vqLlUfdMNTuofAzBmFgRnc
	2aadAS4E69zSKmnBRCJJkIgSJa7f861K/dkLVyqUVx2WSnoErMjxRFecp20UxlM/sXhDrppAjbrj/
	RszTf0RU5sZZF0QS7j0ERq2+m1C5JqvJ8IhQ6bviRHkhqfKWSObiwC8//mhnSH6KJkXlyDU4dgiLp
	34zF7OB6Zr6xkJFcKMSBCaL8nidGiMc8lJEOskeH2DnLBek9uBwtWL50ZMqGVugmxYed2flm0/B0a
	ZcxRT3evtg4sDSkDgl0CJh1ZfMicUYoo3P7ix1WCBWuxzb9vFnk0uAAyVE+Cf8v2mwBwFmsFF955o
	/bMVqZhA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfr-0000000DJrB-0OXI
	for ath11k@lists.infradead.org;
	Mon, 09 Mar 2026 23:06:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBkuS1660056
	for <ath11k@lists.infradead.org>; Mon, 9 Mar 2026 23:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v2mAeI36jMe
	fxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=; b=cR9bULr3HuHIdluNoBJGFv+4inn
	oEkch/dAK8iHZXChBmP5YbxIOSs9RppPQ3TOJwqxNc6KjUG44l0NGpnP6kv+bW+n
	93OhKIOseaCH6RpcaT4bQYVVTt2zIv9g1XXzGixEOaqkG8xPAETVQCoustms+8/l
	1XL6XKajpsOZ7fXoIessDCYomEMqLT1Sx6X3lbhM3jZxWSOKB3YGmGnJ74qcBg4q
	AsE7BsGsPW2E1XJkUAqbhWuTQ8OdZtuPblMct+hrtcMMvkjsLExjzi9rEA4GjGOg
	PXDfBsHsJPiT4nYN8l0FHvpiUBgWVuZ9EIQhJ32d6/k+OSx5hXtL/yADkxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr41k9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 23:06:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so30909701cf.3
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097565; x=1773702365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=;
        b=ETsO95OwoO8h88TNU3pgo6sApl4897mXlk6ysc/Y+yBnmK6muo8wxGEwdLKOsNs5su
         DIaIwTt17slBCRBf1+EZSX/vvSfs98geVtiZfLpGY87fkKWKismoqp42/3s9Aa6LSYkd
         FuIKaC3zEyxYsOEuUzUM4irKLeb9jGlcqVXLSA1RbUa7KJbCvUTddLKGJN/DMLVD25Ap
         zrbDr/G8lsxXaLmDwzXDHstwCedAx5Ktyv7NqKSCqeYn/iQLCn183o/LME3morDL9uIl
         DwSNBW5Z23IqcQU8oE8yvqODoPlJHHpDJ34EqO2H0yjgUT1suZYGpfwsNYkQHZMuWAsr
         WWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097565; x=1773702365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=;
        b=WFgh4RdE3R3N+1i1OnlrG3ZhKmi7vhkUXzQgOev21u7R3x8iiQeFHEl5vaXfFLzhzb
         b7CkZr3jkfKWwtHPWsX2f8JySIJ6pIXdp3Y6PsxKdzpbCQJS2GNJcj9xKLOeEGHnCgrO
         VLmBMiuF6EzAC3jSdwgA4YIolgZLc8WahOaUuJL5T2GRpezntBL/Say8JXugUXnIgRCp
         YTbONHddNqgC0ezC+e6zAR6Dk3yxQZuwsAyRRPp4gEFA6I3EiTxKprAzfADCRL3r71d0
         ZhL63sR/pmzkIiu0w331OonZkAt8VYcUj5YdaS+8PcalfEcD8HPIL/pMAnwyHELRvmog
         /ruA==
X-Forwarded-Encrypted: i=1; AJvYcCWHE+bm3ELiJMHsY/YZgxep9NX7yLLDqFyUKtE8QWkfLENXRDgdPg3qUUeu5bw5pYcNRg8Wr0w=@lists.infradead.org
X-Gm-Message-State: AOJu0YwThSaO8XZM+ik9XttuluvoiqIJ/1ZtPEZ7B63BzI2trsrvTohh
	Dbj2e0Thd7XkLxlIN4+orgSh7gvYH82ncc4vk5TfI9SadVfYVhzUeEKyS9zaN/KqAqsixU5ellm
	7JV5qggV0+TemxrSN/CSBmkoiAsppUtmDlEnROtBo3ODz6A/Ghez86DdksL8mTfpY
X-Gm-Gg: ATEYQzz4qQTnttUi4CO0ksA4cZq3S+yYQ5ZN6HE8sNwAxtgj4RjrPf333TozWmgI9Qj
	oyYGwGzgI/lOgnqGbwoYGvJTLAiHHm40xqVgfZem1REhQNrJ72jvskwMtwb3fEYJZF6EQ+be+ag
	WbLUD2NZ6iX4uatEnkMj+v052Yt1JpWpV0Z5D3oLIdlr/DnXb30dJ2ZNSj2FS6qFwaeALTLlvyb
	aBEti3RL3zlDoHz3qxwwLXoCIPjbEFTKAzg2PyiGW0MYJVIgYzmcoZrHt65uGlN7EnoYGH9Osl5
	lZXBg5bzuF3beX7dUTdHXInvqCKYy6X+Yi18PUqYmjO4qv1n2L08ahb9Ra4YDko+bzFhFWrV5xB
	tdobMoe/22ab924+EfRN1wv/YaKja4L/JFpJMPSnMbXZktAQ4ZQ==
X-Received: by 2002:a05:620a:571:b0:8cd:7cea:aead with SMTP id af79cd13be357-8cd7ceac62fmr770644985a.2.1773097564722;
        Mon, 09 Mar 2026 16:06:04 -0700 (PDT)
X-Received: by 2002:a05:620a:571:b0:8cd:7cea:aead with SMTP id af79cd13be357-8cd7ceac62fmr770640485a.2.1773097564261;
        Mon, 09 Mar 2026 16:06:04 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:06:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 8/8] samples: qmi: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:37 +0100
Message-ID: <20260309230346.3584252-9-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX8AY8aKAE9MSj
 XFw17dNdGZrdcnG6dN40bXP0VqZ1sAYWR7yOFbCV/vS5hZYylVXbtj+wtfhR1eaw4/cE8IxwASV
 VtDK0SaCaJ1oy20XtsJQ7hAXpl/9J9CQNmQYSLr5PbqIRA1a7Hf9Pq4rf9pu3nPMjE8AvJbRdED
 Zf2CgwQ0Eb3ZWJx4PgFcGIw+fHwCPR6N4lXB30WFRNBvgOlLUauouidITsShZHpcw4+F03VQw9m
 l5nHnHNngY+ztz747EuWM4SNF0wY08T+GChqsG+Rf5fpGMUZZMYqCMg63U5qQlnI5sZMsuiAsnN
 F7awCzQaJ+rTHBW1pQhGNvD0/lgMMKivG+3xaB6wsR0MwoMYWulTjmLMAoGosA5fHdSP6/JKGbT
 BPrfhdGq4r96+46eucCzuZUFxJmhf1jFw9GdNJ7FAKsSiTk4cocLhcYHtGJsdbxyFPS49uvmg7G
 PY20MQDqKgqSvdHaMdQ==
X-Proofpoint-GUID: jsjHQNDpafWCOxgR4hsdmNSeWgga2qZZ
X-Proofpoint-ORIG-GUID: jsjHQNDpafWCOxgR4hsdmNSeWgga2qZZ
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af525d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=RE031ben1CQMdFOqpmIA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230608_993238_1BE8360F 
X-CRM114-Status: GOOD (  15.01  )
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

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 samples/qmi/qmi_sample_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/qmi/qmi_sample_client.c b/samples/qmi/qmi_sample_client.c
index d1814582319b..247ec5e54c4f 100644
--- a/samples/qmi/qmi_sample_client.c
+++ b/samples/qmi/qmi_sample_client.c
@@ -592,7 +592,7 @@ static int qmi_sample_init(void)
 	if (ret < 0)
 		goto err_unregister_driver;
 
-	qmi_add_lookup(&lookup_client, 15, 0, 0);
+	qmi_add_lookup(&lookup_client, QMI_SERVICE_ID_TEST, 0, 0);
 
 	return 0;
 
-- 
2.43.0


