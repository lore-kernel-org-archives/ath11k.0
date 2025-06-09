Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBF3C71131
	for <ath11k@archiver.kernel.org>; Mon,  9 Jun 2025 11:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trXmmTb9+iQtXzXsm6+OYyYTJ/Ijwx/r7anuZ7WDjWw=; b=Fuu+O6R7vEVUkQK9ADaQCDBV8r
	uqNV1llyNldkSpwXhPHPtUnEO30w3oeYBzYa/Ty42eHGS+wwiagZHcbCsJqXBgiZtl1p/Vh5iV1Po
	vhm6ZTh8W1y4v1IIRuxbuImbgqIFz8A7nbD4GvtgdlXqqxuQ6IkpekUXHf/WpETEaI2dg+bMtVy3T
	Gzwm3oCssGrDp3e2KoQeB1iNcZNMzn+TVgZkqfYyJuCu04FDfC51ji/S7Q9iw3tvtcp3fKu7uL50Q
	SAGhAmnHy9QcHJM//drCJfvQvUyVKbXri+2rMnvi5b6ZvlymrFKk8yKnw/aHm/0CNB+Rooo02DEEt
	BW7EK43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaSr-00000004048-09vD;
	Mon, 09 Jun 2025 11:14:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa6Z-00000003wz0-1y2P
	for ath11k@lists.infradead.org;
	Mon, 09 Jun 2025 10:51:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598Pivm001837
	for <ath11k@lists.infradead.org>; Mon, 9 Jun 2025 10:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trXmmTb9+iQtXzXsm6+OYyYTJ/Ijwx/r7anuZ7WDjWw=; b=idQykFjQhxREgavt
	ro8BulEdWnm3vFkJ63ijYl+aXpJIMBTqI/qBNiI5EsWEO0hXdMvilhUrx0ApIsPj
	kMVrcEejbzR5/uNyazzsHhgA8cZRfgvg2d3FtGskVKHzUiEKBaEnJWZbsALja+hO
	INu+TE6JfahJDswk87f3nq5q4kI+9S92ehij2Nsc1zKRrfgXOc+1mQu14Y6FmijC
	j9XawrDyM7UZDeaGqlhSRSWagIwtZ81Y1fgqEK/wiDOPowuBvwc2euxKd4x8aYJD
	OqfxRhix+vYsVY1nri77MoarKmzqmzCP3OaeuyfcRMd+wlRhy+7pahAyucjMbmEU
	cX7Phw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2t8g2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 10:51:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2362e130be8so6049235ad.0
        for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 03:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466309; x=1750071109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trXmmTb9+iQtXzXsm6+OYyYTJ/Ijwx/r7anuZ7WDjWw=;
        b=BHobkBtZ1zNHkZGXzMV9UjBYjKMwEYGh1XAU7y1N17/N5s+N9Ge2n6leUA8bzbLUQY
         1ZKwBArzHG23dxzO2Qd6zd0slo0nHq30o6X0S/eq8lbVrUrS4/Il/bse9+qwmHJSrW5J
         UULZGO7IqXeJ8Hb9+iu0idVBlkl+lSq5ynAkTQbMSrMhSj9k9q3qohGtIs/DnMCP94ke
         0R0MXqHlPvEgRFKgUcrw/wunvQufKtqHQ0tWj3d8HtYz7BJ4FCNiskGFxL0AatJSwUEt
         QfjUSwsZocmaOJtfBOHLMAhYcTbaGJNwamelfLAw2Xw3PKM7cV+xA5tUxPTCL/8ytr47
         yy3A==
X-Forwarded-Encrypted: i=1; AJvYcCURLLCCx4/HYPv1Kzzx4cJ9IUAGtbqRHW6PX5K62jhUllIP3IOp8ECVjfwWl+3dA3zfbufurzc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUCMg/WGdOmBFx6F2Ngl3VkFN2y0tj/jSznvExCXNuO4rPThyh
	y1FpVy/ABCkJ4V74A3m76Pq5rEjQa+lNoKN99p43Q+nRXxscE1RJVhro9p0tM+1337rotoS2bGn
	OMr4owuXnRrjxfmQla203idJu4YEYRUuSxSdeI4k3FNOEMUER0AKRUrEeIm2jBgIp
X-Gm-Gg: ASbGncumViumnWE3xj16tUS7b0qh5uTBR/hMi0GP6NUNFmZt7cG5TWFFTglsNoe5fAo
	AfbtW4lllbt4eFtAMD78eqGyu4gl5Di/+auS0v44jeehCTb2yS1XKKKXzjOwPbNz2QVL2yFEvT8
	p/vhZeilWw5wOgkgDh4rc8eK1o7fEtLDxma7RvYSjRv84EE+M87uTicqKsAfBpq+ndQcFhBGFZN
	X25lE7F0S2EBf5n8tpsxJIy1g+ZO7SdqECCpuzA+l3+cfCbYf8Mnn7TShLpuN4U433Ckh3SFScm
	x+LnIvmuDSlTyTj7MdyaRNLwJWOaFkIC0rWpHUhafIC9haIRRfRiHmrh9g==
X-Received: by 2002:a17:903:2f89:b0:234:f6ba:e68a with SMTP id d9443c01a7336-23601deb581mr175174345ad.45.1749466309322;
        Mon, 09 Jun 2025 03:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVIBaL6LFV+aORegVX21PIPCDgyOLJwe970K4Psyui5I5RzzMmiu9YvY/qJul52CvnRP4MyA==
X-Received: by 2002:a17:903:2f89:b0:234:f6ba:e68a with SMTP id d9443c01a7336-23601deb581mr175174135ad.45.1749466308958;
        Mon, 09 Jun 2025 03:51:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:51:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:23 +0530
Subject: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth before
 & after link re-training
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-2-3faa8fe92b05@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=4213;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=X8kM5XQ2zNivc2GPNSP+hcWuDzJRXGt58sYRPrO37J8=;
 b=44trExxx+0SnN8VK1fum6kk+5lB/Y8962mnM92Ux5aBz/J1awGcAPvV4X7K9NF1edQMrkzXZk
 xjn3VZksWO0DreDpPSZuPv/AKS7y1vUXKk7gZYK6ODu2L0/4reTmKin
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 6jgu7YIYgkvSWiOG5agcRHdaSHGEZuCH
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6846bcc6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=AH_oHoLqry_2ofrPVhgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6jgu7YIYgkvSWiOG5agcRHdaSHGEZuCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX50DlNjOLkeqc
 keEzv9AiFhfuM67hNn5SB+ReexkUlAgdwOnyKIMcL52A3/gXn84rYVibgeQrwvt07b8vGNczChi
 x/+9yKYeH7qRxUaYHf1LhSwGl0u83Nfb0oKpMovcK/tx4GqbkgfDtJABdPOnkQDDFrYMF4cg+wZ
 AHBfUIP6n2TzxHXwsyToB6Olp/ld4Q8I6L9SZSXPGLOPxH9hBVCQ8w/dpv8Rw8GgzpO7ifv1Eyx
 GO1MB5lvVhP8CmUX2s0+WPByqtjsfIO/hlRaRdmRpG97TJp8hnJziqiEl91WFyfLV0xzwhRlCaC
 oI+1d2YoHQyfKcWUGI3u0bqe6YE8ldAEdG1HCpeSt4Vck+lJ9WK2lBKKPPcubEllFtvTi484Lvo
 CDa68Es6Tc0I/LP3dRUW5bPtuLxYLU6VaWZwwG5zKTg69Tg2P1r7oeiDJIqMkXyvCL7lGpD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_035151_634009_50CA5455 
X-CRM114-Status: GOOD (  20.37  )
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

If the driver wants to move to higher data rate/speed than the current data
rate then the controller driver may need to change certain votes so that
link may come up at requested data rate/speed like QCOM PCIe controllers
need to change their RPMh (Resource Power Manager-hardened) state. Once
link retraining is done controller drivers needs to adjust their votes
based on the final data rate.

Some controllers also may need to update their bandwidth voting like
ICC BW votings etc.

So, add pre_link_speed_change() & post_link_speed_change() op to call
before & after the link re-train. There is no explicit locking mechanisms
as these are called by a single client Endpoint driver.

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
 include/linux/pci.h       | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 36f939f23d34e8a3b25a2d1b9059e015f298ca94..dafb8d4f1cfba987e1ff08edfc7caba527f0c76b 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -140,6 +140,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_rootbus = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
 	u16 target_speed;
 	int ret;
@@ -152,6 +154,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * The host bridge driver may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (is_rootbus && host->pre_link_speed_change) {
+		ret = host->pre_link_speed_change(host, port, target_speed);
+		if (ret)
+			return ret;
+	}
+
 	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
 		struct pcie_bwctrl_data *data = port->link_bwctrl;
 
@@ -176,6 +188,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 	    !list_empty(&bus->devices))
 		ret = -EAGAIN;
 
+	if (bus && is_rootbus && host->post_link_speed_change)
+		host->post_link_speed_change(host, port, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 05e68f35f39238f8b9ce08df97b384d1c1e89bbe..1740bab514b0a9a61c027463a1fb154843312a22 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -599,6 +599,24 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	/*
+	 * Callback to the host bridge drivers to update ICC BW votes, clock
+	 * frequencies etc.. for the link re-train to come up in targeted speed.
+	 * These are intended to be called by devices directly attached to the
+	 * Root Port. These are called by a single client Endpoint driver, so
+	 * there is no need for explicit locking mechanisms.
+	 */
+	int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
+				     struct pci_dev *dev, int speed);
+	/*
+	 * Callback to the host bridge drivers to adjust ICC BW votes, clock
+	 * frequencies etc.. to the updated speed after link re-train. These
+	 * are intended to be called by devices directly attached to the
+	 * Root Port. These are called by a single client Endpoint driver,
+	 * so there is no need for explicit locking mechanisms.
+	 */
+	void (*post_link_speed_change)(struct pci_host_bridge *bridge,
+				       struct pci_dev *dev, int speed);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.34.1


