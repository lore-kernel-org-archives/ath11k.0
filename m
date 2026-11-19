Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2D8606A320
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zWe2vHQ/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnOJOxjc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WUrNd6r7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=; b=zWe2vHQ/TtlCMV
	LktuZTyZzIxKTXTeOxtcDiYNDyr35uOt6wajw8sagDNCH399iKnHgf2pTjXaYrcOQAmS+O76HBqX2
	egoJZLhPT4UNDxUVVvW+hdWLir0PSY066mUrtDf75ywBQRmmGBJsCGjoOy/b3ZORf48C5f1TQcMbP
	YzjSygbBdm0jzv75Epk/a+s+JKbcYdoHb6uFIPylOvM5c+JOo/AwineqG7DYlLAUqli2RMVhS2pw9
	8dyGEtqWERFed3uUyzzizWWEgFjvZCN01jlJCaSnt7spu4UF2okcgcCyDFyjNff/AKpofxnqDlr+s
	ccPCOlwJR2d8Peul49Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1i3-0000000Bwny-0P9l;
	Thu, 19 Nov 2026 12:57:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1ho-0000000Bwcg-0dAy
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 12:57:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkV6G085336
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=; b=fnOJOxjcVJhPPc8X
	Tq1g+pIsA0wtmc0yQZgp+hJyTnaAjcvMFOlPWCQmFNS+YvR1W4YMTSSEdKAOjwF5
	vY1dJAWVXzi8WMUovDx3M13R9Xlc6+sUm1eKZYq4NjV0QKGWS0t6uhhZNMi7HXxS
	MecjPt1HkZbkTiJo0JG3sUv5Lxikt8M9mpu+p/KsDr2aKqZLl4wmpKA+Qqd1OzwE
	Sb9DJ0l4qQhtOzLWmOE3KIQs+7daAohIPeiE4nGyPLYImaFfquMhinR8q7JAgQI7
	0H0F+6wYjCna5DBYU+vGbaeNyHtTlrye4ngFKyr16yKtn1Pe7k9pJeEp5m5C1XVK
	EtfqWg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2saw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so1438111eec.0
        for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093054; x=1795697854; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
        b=WUrNd6r7bznRnSmv0glUx3RGXsZinZsltp9TC6RIIk+718D11XrFrOrMz8cocGdFGk
         8nQnlrv4g9a/DoNQLaWvkFCJ+qYaunVYNqi29OBBCOItfUmSupzjGLQFdX5kHvF4DKK2
         gvpVQbMdi09I7Vu09UuP3AOM79RtMJVo5CFPUrFrLfkA8KNWtCEwt9MpZjfB4DWYmJmO
         lYQfzuy+baf3UWfv5sO+11xwEn4AYG7WzXnzp+MVeBSc0Hd49UfTZu71vILE4wvfFB9J
         rleVoQsUtpk1OZUxQve7AGIf5J70qm/1BLQNaqp0loAPARs+alPuZo9612w8HnUHcq+F
         48Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093054; x=1795697854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
        b=cjveyziLrq22CbbE3DZmLoW66wNx6KsPJBB2gC6oFKNHbxRaPFNqHq2SOs1gSR3QHx
         lnG1nO6yHlN+NZS7Njd1CtruG+DMK1hIJaiKN3iGv+JvFLbcPbiJkj8YPUKv26glu7OD
         /SBFHIbLKfpq7YEKy2iBYvE+WZRvwMAYxdfIPCvoHDrrld87MvWIJ4r37WHYa7S9KQhU
         tmW38ROR+epJmQyj6S4vSLysHWa/fwgWrzWnhVtS24LgzFLmINmp68MuozllwY8xy3FW
         mmDsuFOpBhOvApVYDHO8A1sg6N/fPdiZ09gXU4hYzTkqPE6qUza51qscYjyENljkyN84
         GUjw==
X-Forwarded-Encrypted: i=1; AL+hErFE9THe/rm3VmWopEaNybNSzye4Cvu3U3rJOaMlTlgvmDbukPBpzUoGarcrg7CPYmk81VYuBSs=@lists.infradead.org
X-Gm-Message-State: APuU4Z/RZdiuFbYlnhmqme0Y4sVSuc2PrSd+HIoI88B1NZc9ucPDdqBr
	lNOUMWpmEl+I36+NTwZsVR4mhPP8kOOwVt2ABClwfgLXldhXJYbyodGFeZlGQO47T84EIG3hW+Y
	6O9r7J6xZRmiY2FXfBPKZk62SSm8DfLLOIcR6zjOJqPSRoTXaf1eNLQ94MyKJjF0cXqNTm7BZ
X-Gm-Gg: AZFdTZeOQDkYaSPsueI30uuDwLsYVkfOqzRA8HboD7loChKUM0nJhNTXzsQ7xU/PKPD
	9Yjfppz94Oe/5xnaDwoopBawOafcGKuk+oN7brikCKRf++KlCeeA7ONzrs8f+bkmVWffNOy1bT+
	t3jFUUk/ou3dUDSirZ0zU0qQM5Jkaq9/0iyeRRYyttMHy9rPq4BUf2C+b5MiPoBiVoih8KbOWYK
	NoUDYUqwSRRGqkftVKvVpB/maMg+jKOgnoMpdTIfmAXoI4KQ7ekOHRqNDutRtSl8OzdzQkGMuIB
	ccdpuYPp6cABmSHJYb6uVJYRFPy4SOWMJXVlgsrCzNG0g3/FIfBR0nGS+GbxMeT6PsXRo+k0HQL
	K9c76pFXfrPBElfzNJML38lj+dgfzUscibkm4N5BYGHkjCUOm3Cx3S5T4q1TRv3VMlO7EWt/aUo
	236X7J2w9l
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr4987977eec.2.1795093053759;
        Thu, 19 Nov 2026 04:57:33 -0800 (PST)
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr4987957eec.2.1795093053264;
        Thu, 19 Nov 2026 04:57:33 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:39 +0530
Subject: [PATCH v6 7/7] PCI: qcom: Enable ASPM disabling during link
 retraining
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-bwscale-v6-7-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=1086;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dixWhgN1FcwflBXIi0Se/61aBMCRn0NVL4pFbQ5pD1M=;
 b=PUZk3GeenFpAL675pkSjVwlCW6zpIzwS6Gmvb7s0aa9docOEiXMtvktcnV9mru6evKsNiDilX
 wUhqKH8Hy86C6QnFabVSxqG6C4LbGY+SWRnz4vitzqM5gfjezA/UxS4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: uDuyEIjD3gj-fCnJ9XStb9Ytd18VqczJ
X-Proofpoint-ORIG-GUID: uDuyEIjD3gj-fCnJ9XStb9Ytd18VqczJ
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afef23f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=R7JsESPv6PNixK4vMH8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX3NryurvPtoT2
 VXkc+dItYM0snhgIgjgW64BPd/y2RSK8xvtnr4MDNpvHhqhZX7vq6LblPzHD+K72yxgOTb/ImkD
 Fkv2W7cxJguEidXrrke2UaDs0iLrdsQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX2gCpE87XgxQe
 FyN7Va1ymedd/TPkq8q6kp1ftamkKwSo59KHAwJLx2W20Q42vJDbuRVxlJgmTRSPZE+dwuY3XhU
 xInzNMv1N7U3shGbDdSWI5fGAsLF5jImOokBmPv2967Zi99WfiOKaU9MMjglIJmbWTSl2fCVlLU
 hiOn0b3q7f63ZeusqeP6R9FW4pZAOmy4valAl7i8BR1G4/r9IeJemWzBe4U78p2LYA5Aw6Rjs6K
 pz+08q7LBpBr7Ib/4UOiJbjDOF6/I72kVL2K+p9wxZS9sFmwPLgC3D/NLPyLLUd77iN77eumxuQ
 3yAh+8aXQNcOJ1q3OcpPDVRmn86AzpVuXN0OdCXydBXbW4+MSRDkUVnD5V/puI336ifcd8ZxOcj
 rOFEr01+lLsQrs2E9ahgog/e9sSrJxLaTvi/YrW6+9o2txx8Lg7wz+79ySGo/k9NNcNEz+Ks9kB
 dpp+1pTqzZTIaMMkCtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_045736_332568_29858715 
X-CRM114-Status: GOOD (  14.28  )
X-Spam-Score: -2.8 (--)
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

Some Qualcomm PCIe controllers require ASPM to be disabled while the link
is being retrained, otherwise the link state transitions during bandwidth
scaling can fail. This is a controller requirement, not a device quirk.

Set the disable_aspm_for_retrain flag in qcom_pcie_host_init() so that
the PCI core disables ASPM around link retraining. Future targets fix
this in hardware and will not set the flag.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 9b113536a82b..473f2fce258a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1514,6 +1514,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 
 	qcom_pcie_perst_deassert(pcie);
 
+	pp->bridge->disable_aspm_for_retrain = true;
+
 	if (pcie->cfg->ops->config_sid) {
 		ret = pcie->cfg->ops->config_sid(pcie);
 		if (ret)

-- 
2.34.1


