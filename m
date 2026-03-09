Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5419CEFCD72
	for <ath11k@archiver.kernel.org>; Mon,  9 Mar 2026 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=; b=Jw9mgbjGA4F91Z6mm3tYYYzE+W
	CyS5EdjOdCgtHjrojDEoEDBYJYPcOQ2VcJtMfaTgB3kvEJWBosYw9xfPDgiC87GMZF76nOxz5Lbkk
	zwYtXkkriPWFqBOslcZeMIQ/GKgompdCTblcKsAkcQ8Bhhd+0QnJIPYfYm1fP+n0tqWKmfvBmf4Ic
	X7zZ1k0G7mbFFTbb+kQxxUgaUbDm1GUzS3+SceVM/HL21AibCP7P7adP3Sj59NMjQcfcKDjlZgtOe
	bpniWmAiz3SMnETb5kZaTppWeEuE42IXqJA08+eC4wJr5jP50kvjrJqu2ZcdACnkI8+sfDffVjNXP
	RvBIqgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfd-00000008Gf2-1QEi;
	Mon, 09 Mar 2026 23:05:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfb-00000008GdD-0WBh
	for ath11k@lists.infradead.org;
	Mon, 09 Mar 2026 23:05:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCVfa1204906
	for <ath11k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PTfKdHxXDsD
	Bf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=; b=lBfD8/nsjfep7uWpNTtXTTH97LP
	adqHrnvrTVmVgz0lWbAL5VcrdHrI4FRTSXkiz+u1QcKmurgn/d88hHz/4iBBAoj+
	SgF0dP66UX7GP3KqmHq4FBR51A54fIi9wNxDZIo/awWFssBbLgEaNe0j8xL0eSu4
	6ohLKXiqBj9NRM3ztv9YLcdyDch7tWK3LyfdOBKXfoqDRIixooDyqouwjHgLJuOl
	Z4pMUTPjrfg3DUOyVZm3GPKNXh9IR5fH1JW8M+0dXX3xAhqbHxUTvP+UD3hMdiGU
	wmJYD7HdlW4rfeiSqQS1ja79m2ZdhWjJOgTQi0iWoF0sex2KenSTQG+ihSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct0329n2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd900cd3a7so454402285a.0
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097550; x=1773702350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=;
        b=kb6k+DbRAGP6XCXyUnnLO0cLUyf35S06hP7k7mSUu+MrE2ruwdw7gNlSSgvtcX5oLG
         qKOhd1bTUNFBmd41VG0rnsjaz8bZke7842MbQma6DY4zODST/yrv5+PcmjXFJxS+2LWV
         HotH+TbMVfUSRPqpRcYI0ANuFjfOL3KhcV4xqSQ7v4GTsNz3I/XBd09nfAJwHCJCtfPn
         +pVxWI8sJ8cCj4+oUTssy1yU99ORV2KYMHOkbDgY77hhqEIpyo2cftDkBPDttPJGbSWr
         v6ZHhk72qMPvJSlz3qAefareyKf8tUPPka4o4YBzerUsfkPx9pxH1zlNe6Z4PUz2AjWM
         +peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097550; x=1773702350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=;
        b=E4Al6cV8/74JdjLr945Al/88FshNM1xlzxJTdeqxast85t9JJlMuQMpA6/HVzVA9Jt
         vpI2dhePDrKuL1mbOFrJuht2TUKJWreY8Wnp7EHoisqXzlcBTnbyjbHwpD/vGj/JM7cZ
         I7UI7RFdZ8xcwj0rMuhyYZSGB+/Uaiw4V4WfmRNdZSs6LyZZ453vEsLY4SW2FBAwnAwY
         C43QcXAm56+5kV25dM4L8U9AxM+85SgZ7xkIAqb/aND7kwpXquRum4NFndEVBeY0htxr
         DM+Z9v+gNuCTMWC/kiUT7Bamifg29tAtUV4xmBMDMV9yIlYfWWPWiOqKDYyECPya3ZlI
         XmDw==
X-Forwarded-Encrypted: i=1; AJvYcCUgyhluEbHqW9xyw3CuDId8/WfvUp/6w7XlAXeaEfd8rLTz4ZuCsyROPxrLmeXS0b5Xw9aafCA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6BR41sqMh55HuNrNccquL4RWo4gahLWQrvJggW1pb9QBtiLgC
	7b8SQbUMLGZefEmv1rWuGyYpiary51Hirxne7wTkuwSaHE2N9Rc+BcqHG2zgyjFtOb/gTtmyD13
	Vtn9MfrWbCtfJWvdbSyVGlpUpIjGLmYPkUWMVq0Msv1ADM+ruhnEpI8FdTLvAv+3Q
X-Gm-Gg: ATEYQzyQaDXNgbfrCNBw4qpY/LISaYpvWQPtNApui9S2eIq1GaORdPluVcoQk/w51bM
	cmDojsVpbzoKREsOoQcL4XDEgQWvD4cXXhktXz66V0p0XvmJ4dQNPXZcpOZ487kjOsyl4qeDA7F
	TWDP6JUy2LNUG9DfEWmAQIwpn5UVWzhMA9nqYxCDEdQ9GfW5yoCh8BwIukM+7uljU6V2vqvAJ9I
	B6tILF+6TGaPsngnopLzhlLFLRevjyfkAVqiYKW1etcLUAFHUfkcpHXDxospeJODJcQrnjKRT8E
	bjnpDgXo3P5y0H0ZpbJ0Q4c4zRyllvpAYjcB+xXcuf8IFmlOkjaiqt9hBKGKJWlHDioA55jv32D
	iHjwQyfk0i8cq/gRTua2Ui0bpRNIp/O8fMXcP11cTB6qvruZbDQ==
X-Received: by 2002:a05:620a:4002:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cd6d38f9bemr1747205485a.30.1773097549750;
        Mon, 09 Mar 2026 16:05:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cd6d38f9bemr1747199885a.30.1773097549238;
        Mon, 09 Mar 2026 16:05:49 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
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
Subject: [PATCH v1 2/8] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:31 +0100
Message-ID: <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX+E7phwT694Lp
 kbE8ZN8y6/hqiSr+LB5N/EC7HXf/LZiVaVlkGGIt+Ptc5LZnsto/L1DdWaj7ui3AHWt3ceaNuTW
 w2IlX8nqQMCWcgx6ZaJzXNlVwRXFQjnruiiCOXRH4MgjVdF29Mt+GqSyCQZWFd2ou34C1YMNgac
 Slv8PZX6R/vskJrTAt6i6tUU6a9xhqPhDULB8G/9Zf+FEZPZnTRy+Abw/9EmT70CVf9LEjlJgYO
 KIB7VR3XRbovzDclNyTNF3rZ90iUJEESP2GQfozGJuW3qjHYo+03grxhoyClRkTp+esFLKmv/wo
 dtBit5hVfpy5xlFErcoElw7m5S3Pma/HJC5fr6sxEEpC9j2vCLeZ7cfgHKO+n1sKnd3h66O7BFP
 +UaJu29VnNsyv/5oKmKSlSb4kNZKwC2upzwvXU4uzSWoHx5faC1Opdc6kUWLi0jcHNLBZLpedBI
 LVxkQgK1G8RXYFKblWg==
X-Proofpoint-ORIG-GUID: iDAl2VmKOaWGjSgwx6dMV-VbTbmpYrKW
X-Proofpoint-GUID: iDAl2VmKOaWGjSgwx6dMV-VbTbmpYrKW
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69af524e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_160551_168263_D7B15B52 
X-CRM114-Status: GOOD (  14.32  )
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
 drivers/net/ipa/ipa_qmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index d771f3a71f94..37936ad132a2 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -66,11 +66,9 @@
  *   determination of when things are "ready"
  */
 
-#define IPA_HOST_SERVICE_SVC_ID		0x31
 #define IPA_HOST_SVC_VERS		1
 #define IPA_HOST_SERVICE_INS_ID		1
 
-#define IPA_MODEM_SERVICE_SVC_ID	0x31
 #define IPA_MODEM_SERVICE_INS_ID	2
 #define IPA_MODEM_SVC_VERS		1
 
@@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	if (ret)
 		return ret;
 
-	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
+	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
 			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
 	if (ret)
 		goto err_server_handle_release;
@@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	/* We need this ready before the service lookup is added */
 	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
 
-	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
+	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
 			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
 	if (ret)
 		goto err_client_handle_release;
-- 
2.43.0


