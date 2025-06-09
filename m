Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83645C61CE8
	for <ath11k@archiver.kernel.org>; Mon,  9 Jun 2025 11:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUF8yzByRJf1RQQuiOGLMtV8Nk65na+X12bzWOfrOVE=; b=dJofF+k53OI8Bq6j4fDmpVygSn
	YsSLKFK+kTe/KnU7wZGN+cNnIjZ5DRQA0Qvc3JEYWqOGVGif9ArmOpfPIXF8dblOgAbbXE83UMaXC
	2d4D7ybGn4hju8nJV9yp9ZSuliBInX6Fau8GSF8YxdH1ji5fPC+bDgxtf+LjQ69bNrYEpgAWInP7h
	TZieGVdOH6GhVOqIV2y42NmxZxZcX8RtdEjA7Ta9e/fKsfSUjpKo1zWsK1v1F4joRxW+ahSAxbnvC
	QWe4Rne9IqZpOJvub0VeUAI0EPW8y344067eZnUZk/XMEmh9B0ZO6w6lh4mHEV1YOYgm6JLRNnMHT
	hLsOGerQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaV1-000000040X8-19dW;
	Mon, 09 Jun 2025 11:17:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa7D-00000003x8Q-1WWT
	for ath11k@lists.infradead.org;
	Mon, 09 Jun 2025 10:52:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599WecA002402
	for <ath11k@lists.infradead.org>; Mon, 9 Jun 2025 10:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUF8yzByRJf1RQQuiOGLMtV8Nk65na+X12bzWOfrOVE=; b=kQMf5LCtCgY4wnD1
	QxDHGnv2KsCBR2Ov2/TV3t1GnebESF9jap9tux3aahchAUgyKtR4fGVlOPPLF8iW
	8DNchwlqVyXuiJ/1HjQkGm15Al1Upuw51nF3c4RNivHiYOcx5YOhTEi5ELjj6ioc
	US7vAFeUaA5ccDjGdtQdjHxpPZeFZWx8jcLzktqKVF5/69jP61olPPfSNTkSQfZB
	BroEWChvtE+e1cUIz4cARTSogfkioGkXnRNjiD9qobioOkZWs1pTAKu8lJEm6B39
	g6xVGRbtMEZFIXsON69f2XPVTrfARbnDy7s02wma26pnDDkmp3eMkCfwWqOBO/+T
	evR8JA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn65njj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 10:52:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23228c09e14so63005035ad.1
        for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 03:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466350; x=1750071150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUF8yzByRJf1RQQuiOGLMtV8Nk65na+X12bzWOfrOVE=;
        b=UqecRSw/saa3AjlhyS6H7QJU1BphgVTBw5KAk+DO9SsWDf8A3nLRVVAz41tZopVBco
         wyGIGjGkl6knVb2YfSqrXCyOFFANcr6uzxpS2wZSTkXCajgJskE4OE86GK/+51b3VhIh
         MVTYVWhNUQzIwrSX1tgEefs7JI4NiSgjMTGItKKyqKyHnQcjLL5kvuzNYJ+Lczr0Fod6
         bw/qTaSJDZIaheX7boqQ+Oxq0i4RYCMlidiIHpnpF4gvhn0iJw+x0dirX8uDsMiIDDwj
         oPOBaS5r12XgDnzsY/W0dfXgtWkhGWFHxR0s4ELYDBuirQ+xcAiD5RklNrGp26Sp8FOM
         Ep0g==
X-Forwarded-Encrypted: i=1; AJvYcCUjEAchDfVqK2HDAP7MYBl5cSfiSX4Q49kvT23IgVVALEjj2O5I8FAMG2wekH0PTEB1Cam3vTk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXqmJf3iKVyi1vsLtKccWHfNNmXM1V/HarQ1Rq2GYIdCDR9LPw
	eoNYruZsvq57As7AjheL5PyD+i8O2In7VArYWodI/W4cLIpUjynXU5yiEa60/6SxF2uRjAJK/qB
	ujoz4c1JWxKFkmHL3LlXTJolf6ww37BnAdz/yDeEStkBbchztWLNxMlTMXAcjcZfV
X-Gm-Gg: ASbGncuKv6r7m6I1ZbgOaYb1IJ4Jt91vfOQt27GsnJ2td2HmOu9Aqb6wCfd6CbRV6XC
	8YufAIUMRuwF7GVIFsrp2lEop2kx4agk3wEC4FCaFZhN3v7aczLKCvPQzUk5CidZhdeJ61H4XzA
	xYyx45JBqBtCQDqTkHUg6rfeQimANs6FNPZcWhhztqMcZjJ5EsN9REvIMzt24H5A7/7aoo5QEJv
	OMa2KnV0OLLVNPWQ1GvG+auRji0MsTAj50VFM3+NtH+Q82bgf6QAL5rtVD8lNxDPpe/2d+1Wm0Y
	3izr5bZ1CrQ/KDj3MOiLpXuK/UmtZCs1RPkZFwRYkP0FLppkPBg84Qqebw==
X-Received: by 2002:a17:902:d4cb:b0:231:c792:205 with SMTP id d9443c01a7336-23601cef4c6mr188219015ad.4.1749466350025;
        Mon, 09 Jun 2025 03:52:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbCDUCeQUKgzoGTBiAoX5HLibQ9U2gBaucDdLb/rI9EiBZTximeF45g4cVpAaAruBmWLb8Fg==
X-Received: by 2002:a17:902:d4cb:b0:231:c792:205 with SMTP id d9443c01a7336-23601cef4c6mr188218635ad.4.1749466349659;
        Mon, 09 Jun 2025 03:52:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:30 +0530
Subject: [PATCH v4 09/11] PCI: Export pci_set_target_speed()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250609-mhi_bw_up-v4-9-3faa8fe92b05@qti.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
In-Reply-To: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=790;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3MJFNTnmCvNNxzu47ggz59THY99XF+Lv2H8IXU9t+XE=;
 b=/R2j/FvpgVZbKkZ9tHBBRAwTesasN8RhM+TPye32z0glIhUL4IAq4QqKy/A+LYtuKn0+9WKlU
 lekp4bMiZL0AmW9qZ4+HATjTgAYe2/X/37ni6hGW33aJa4Z1+D8rYN3
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX/GdKfend5jsI
 teHjMXRnOFZ4Jj9/YlzyMyoxU4rDzHs8fLkmpFHcd9ZpzeoYshw+NQgQ8z7fypZbBxhrhS1oLpw
 WdEJHvIhJV17UYZtEwlk5hs5NMx6M2vyufyJzv4r9WvZgT7hBtZWJNgfPghEIB3YOpEnH3T5jFJ
 wtq3dB0LVoZ6Tdd4yRDgtJaq24JvBu7+XBsr1gM1jo+FIwR59tuPGoDGjfZw0Tjqx8+k3DsSDQ6
 ThLrOW8opT6K3D3ssQOin94KDnGMALafv68OgKQp8LOaXhzLeI/n/pZHWVwTxU0TkGN/U+GQxZO
 TmtYhh7j+Ow0JRje57rDXhVRcNMQVdHzNwUN/h8wy5TnT6S95AjE6MqPsGdc72KwWbAeKbE44ON
 i2rQnQKgxzXNln19dwbH3hIiSIYBdN9rSZK1E4Otnj9AZdZt/qckCVfGWI/deEwh0Vd/xabV
X-Proofpoint-GUID: U2hpbND037mTPClaa7frsySuNDaN8Om7
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6846bcee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=5E3R6_0bZ0f_H1kkCjQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: U2hpbND037mTPClaa7frsySuNDaN8Om7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=975 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_035231_406948_4A8EF772 
X-CRM114-Status: GOOD (  10.74  )
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

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index dafb8d4f1cfba987e1ff08edfc7caba527f0c76b..b388e02c37ab2815b562108b24b9e98811053d62 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -193,6 +193,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1


