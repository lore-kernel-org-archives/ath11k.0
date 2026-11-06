Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C367F606A31B
	for <ath11k@archiver.kernel.org>; Fri,  6 Nov 2026 02:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YQjI4rnp;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUzEdP9w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MmiCxQwR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nf/bH+V3LpW42TMR0N1eeqd5iHEPLwJw3sYgg0jZ6eQ=; b=YQjI4rnpZvYvMl9/17/iQ3bZD/
	QpOPHfzFGma612A4xiI85TfZktxattgeTASF5+1Gaybst+Nci1w+/geYgqDxiwpTwau+vdigkNEw9
	BCvYLjLvnE7cNRSm8PosPE11yQIFaefayNnar/hlOXL74abAoKSX+GNYzqpI3UIxqX23Ft7dshfhq
	63NPg/DouOCOTBZpanDe56nkrb+rVs6cxzQIGYqW5pz0w9/LDzQT4b+ipjYWimlkpCURydWUkY2H0
	eU8DRzHt+kXvyaZsWRaPrXOMQ328O2j7LA4VJMzaH6m+LKlMhoPfNI31NHa/shcvY0R2QuI8r+nqv
	nEVsBn2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9NV-0000000B2Ig-1vQw;
	Fri, 06 Nov 2026 02:08:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9NT-0000000B2I9-1MxH
	for ath11k@lists.infradead.org;
	Fri, 06 Nov 2026 02:08:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeqYA2262090
	for <ath11k@lists.infradead.org>; Fri, 6 Nov 2026 02:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nf/bH+V3LpW42TMR0N1eeqd5iHEPLwJw3sY
	gg0jZ6eQ=; b=nUzEdP9wl8T+wVbNvUHQNbNYOp805ZLOGUbPqvGISohFkbl6eko
	ba311OLu8/745KDhbd5YBSGkizx5HwUOt1fnck4enNBHX1vtxC1vqYOg/ezT12iq
	j8/eIDOJfpKBVmZ2EGygUK0gJPYQJiJ23KaYOKWi/7MyE8suU2UyDJ5vKd/3dsjS
	uoVigoEbWhr/HC8wUvO0nZYW4n9LkFEEaDPhZi3jIQ24cKP4wT5xf79sbb8W5yIX
	4UL7y1vaeuij+CtsKW5xBZzomIS8w0yz5wm4kyYeBNQGzwRv7Dndnffh2tiYdmYO
	SQAn5rcu4M6PXAtsk+sBfvcdwcGSPbvv4cg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa0dup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 06 Nov 2026 02:08:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so232311eec.1
        for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 18:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793930905; x=1794535705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nf/bH+V3LpW42TMR0N1eeqd5iHEPLwJw3sYgg0jZ6eQ=;
        b=MmiCxQwR5sTgZXE7dyFWHG7RxocrrAbvydFP+YVN/fY/mzbaHtqOfvsc9Nmmkp0ufw
         +sSyq6bntFahQlaA2AIFbM4saNOw3Ivg3X5VQoG5cR43SFMaJPLz3oGtMhkEuK9gkxae
         wWZ7VCdjNQz1/8/fOTlMXxfaZkgYgM5xZVSRU3B/2/Z5rn2SiuuRUVdbGNM77KcNpjBB
         BQUCagWrm94ciXGwqfc82l6bUcUECrH8yjLtJj+M9MYDZbKnsuTgj2HugKGXsH/IHmZp
         cECvL3YNeEExiJQDSONEUJBBwRPiW3r2nCmhob3UoB4CXIFQNgNzKF3gmmEL5JsAIc4A
         zNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930905; x=1794535705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nf/bH+V3LpW42TMR0N1eeqd5iHEPLwJw3sYgg0jZ6eQ=;
        b=EobxSohx5KnR225O7Td9M2lueWnoavBeVMU5fivjplTKO765yGyXfAwa0GZvvf3KgF
         98VLzllU+9f4SuAjuhASte/Ypqm8jDSzHOT258/xFbSTk9bAl07CQIAm4H69r2FGRH6M
         +JVt94rCK91sOuHKcvT2I2aSl8hGK1vCJPwMmD4mqBmUmqbBL23On470yZ1PXgbsN4kk
         8jc96DvHQKTZ98/1g9BXtdMxJYE2fLjKfQD1fDSNUB63jqZVq/obs7Yh/99rcvnpHMLn
         a1d5amSbdI5UliaMg75xSoHYVfFkA1bR62CZhP4h2a9VxVmtnnjSlPxDdwUYGTuNk5GC
         jbsA==
X-Forwarded-Encrypted: i=1; AKwUvByoPxYxI6+44hBaXNcl7lQI6MgiPfbcWp+drQYXK5PHUIA/Ad/2Jc1e55zWyouBtJ8WR3kCZgc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9/tkOtMzitzNhDetSKyeGEdt83oXGh68yOM5p5EYlHn27Dl9gS
	8j3PUMpMPPY0sIJ9JmmGs6Y2J13oODs9mi84waw/zkYALVMiBEhYALleN3o9bWk2GrUiZvsaUzW
	C/tQ2N+j5SUoMrdkl5/pwEAfY2g0wYTeFTa2n1sHKASrORkfWYbDlz+6w11eoShJy
X-Gm-Gg: AYBFou1qdfC5CkPKwayhl+Db8C7639mErZChNvfPzPI7LHG4AH6s9CuEAQmtr44N2KL
	JnO+PaLnM0JI5Bcp/vHM1NKPzUand/DVQO0bFkiVLcKmQAbFLQGKBcRbSpBWMoNFb4tUEV6xGRB
	uCV845uiJGnOuV/aMSLu0chGqe1LEZvsdEnXhKUWbNv4+crVnzSs2bIzTh9d0D56VLAKBXodkrC
	dvBKYegxnSnI9nvWK+gQio8XVD1COnYFs+Dko8QsvKQ9auP/ultSYUDFM9uiSLQ4v9PsSHHPRBJ
	m0Pa/3cZtJh1hdu0a+fMhydDjFqqOo99J68uWf09TKSL0Gl57yn9eNa2h04eGC5sm01tOsiKqU8
	VpSsgA2VIw5qw0kBCJFR8Hll2MJNbiXdlwLvNMoDcky0EaT3kUm2QCCET3Nv3/tPtM/50Q0y1hz
	iohbKrdSML
X-Received: by 2002:a05:7022:4183:b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1b25d30ec8cmr1490436c88.20.1793930904789;
        Thu, 05 Nov 2026 18:08:24 -0800 (PST)
X-Received: by 2002:a05:7022:4183:b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1b25d30ec8cmr1490393c88.20.1793930904197;
        Thu, 05 Nov 2026 18:08:24 -0800 (PST)
Received: from hu-hongchen-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm1324796c88.9.2026.11.05.18.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:08:23 -0800 (PST)
From: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
        ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
        linux-kernel@vger.kernel.org (open list)
Cc: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
Subject: [PATCH ath-next v1] wifi: ath11k: add usecase firmware entry for QCA2066 hw2.1
Date: Fri,  6 Nov 2026 07:38:08 +0530
Message-Id: <20261106020809.3580396-1-hongcheng.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BXOIky-94A5p8_CPeOjAlxA15PRR2YKI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAwOCBTYWx0ZWRfXy7P8aB/4QXSH
 ZEqYDuSB5K48r67iR5ccb0CLw6BM71PaSf7TAbPDqVxXHF4jblMiF7YRqhqSa5GQ2w4aD3wn45d
 lTT8s3IsUsrupaEFym1Bxi3VCCg2GOQ=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed3699 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=SfIHIsIoJ2N3z6ihRgEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAwOCBTYWx0ZWRfX8diewYEI9HNw
 sAGgt1csFPcZygk/BgXAnHG4SmPY5JYHQh5fiIo9WGBSjObGO9P0RI2Mv9tFMJqkmOgc2n4U2aI
 PEDZ3L0sz3bb/DXfwJzFDCGJ54pHvmHOc1buwmvwpS1AG9rEAPz3mWDuzaW5fjs6bgV4/UXeT7f
 WElE/+d9MYledWcFSLJMARsJTosnLY6sxquy2xL1mBQt7bmD180N8MvxO1RzL2sD3djV/j7w40L
 wzl0hey3vLGGjiz6YLDrd+sJqk1ka30PCeB/+nTtN28ysyU8aYOCkDtMOXTc6D/xxxqQefQ9mYd
 pO/oi076o1ynY3lFenZElZxu4FO+hqIufPrUW8lMF3Dj87IReqmq/PQQyJqZhtv/dL8DdfhCkcS
 fAzrYrqzXK18kewsXtdgUMRlky+gadVKjLvy3bp+EGk/9wb0Z9GwHhnLDWAfrCHH/s/WziU/WJC
 BlQrVLOuqtQEXfct+rQ==
X-Proofpoint-ORIG-GUID: BXOIky-94A5p8_CPeOjAlxA15PRR2YKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_180827_485519_93F1566F 
X-CRM114-Status: GOOD (  10.67  )
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

The Monaco Monza platform (QCA2066 hw2.1) requires a usecase-specific
firmware variant located under the nfa725 subdirectory.

Add a new entry for "arduino,monza" compatible string to ensure that
the correct usecase firmware (nfa725) is selected.

Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..b58dce133244 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1049,6 +1049,7 @@ static const struct __ath11k_core_usecase_firmware_table {
 	const char *compatible;
 	const char *firmware_name;
 } ath11k_core_usecase_firmware_table[] = {
+	{ ATH11K_HW_QCA2066_HW21, "arduino,monza", "nfa725"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,lemans-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,monaco-evk", "nfa765"},

base-commit: 5c8eab13e391aaabd5a1ad58f3ee4bb10ce7573e
-- 
2.34.1


