Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77F5606A32F
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ffGit+hP;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oBnV9XRN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QZOY5idD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=; b=ffGit+hPbYN47K
	ebe51HbgZER6zh0PLzIYs8la+KlVlc+37nYVkFf2pN74rZ9NB90uwcGDzLyyBUNFoAjHkKFisJJSd
	/KysXKIqFmntm1hrtVVuAFBGtiDVXam2W2LEGG70HbkddPIXdlp59osLbm+fEtxgQctH64gu/rsAr
	yVi+2aMtQdZmL93tLKw1uuOvxXnmaiCLrhtmrQrtst4J/FRL2FqkQFDvy639qRdeONcz2NmJNFQ+p
	O3fKHrHV8PRUvvKVasQV0I1Pu2TaBdkf+x9DpCDoIA9BSDU4AWPpr0aYWtg1dTo26v105W5Mbd1aQ
	lvR1KJjGsTFDHSzxYAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hJ-0000000BwGR-1q8Y;
	Thu, 19 Nov 2026 12:57:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hH-0000000BwFY-37rQ
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 12:57:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJCjcKY2348367
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=; b=oBnV9XRNseDfl5P8
	2AscwJxNZGf20yy6EJFwl3Zm3gjUkPbkGy+EOIa2qpQ1BM0bJCsmhZTiidPWYwi/
	y0OcXHMgnn2Wbo1hxB+UbsgFJb5iYfX0hYmw3+t6EyUo/mkWWxI+G62pX+qE5Tp9
	4+X2XVG62d8B0H8bqdN5TND2DDhCPYh74yspvPaqJTQGLwUktWx47Qpv4YMmFTx0
	ooNYWnUAmGK2rfgIqn4PJJfhVP2L7kwRs2n0jzrCxfNH9vDtOVrj+VDyAmGi+Naz
	UwWRud5F9UecXjDeeFCDeTk/9PirC1a0tsNoufyDkuUju+Yyp/9yHRk9dkju9tyB
	5uQAOA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux9kqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so5362194eec.1
        for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 04:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093021; x=1795697821; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
        b=QZOY5idDV3ASDf+UsRbq2VXckZGpzaQwN2av5qmz9nURlVr6dWkxGR2RlXLiIL70A8
         fpC8Xe7He28BCgiwXjK9oJO1EN9o4O3qJq9Jm1ItP2T3QyR5tFpepZMvhIrorgeCszfB
         VW01DbaSx+nFFJm9IFECBsMjknYSLC26JrGkyHOLtMl/Mzr5mnE5FaZlj8sdxqTJaovz
         jLmaiy6d3ykc2DWlYMRbcaFnv/NQJ6OodpEALkWoDBdxx+N1rgbwiGxmCRRgzwk6sHPU
         Ylab3/wuc1k28qKundobr/xzOJS3+d4CnnJw4Xlf9H30PhDx/5YLPzA47LQwJNfANjOa
         4xRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093021; x=1795697821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
        b=VNCpFj/1WMQZFz8/wqTJ4oVOuMB1HkJIorSsrKkrRMAtu2OKJdt12ysTpWCgjQ/zTS
         j/SMZksqUo3L9u80O9KBkgQXV9C9cnUCgpKOhm+JC96aJ/bAAPV75J1O3Jq9airSuubb
         9u+imMbPvdLeXVLgrEq06jKToBwjn5Fyc5piFF762ygRYcws9DCIsTio9uZJxiwbO6PP
         DpIfXgqTwzXMpAWj70my0/69b+Tt1g1jQ1tuc/5hRonh0uEW5DfPR/ZcsKV8sbbDhkmk
         2b7WMlvVZeN3WmgrAh50VSrDg0PXfwiwJModOT4Eq220FR7oLv09JF0824/wf9Qevx3b
         6mSg==
X-Forwarded-Encrypted: i=1; AL+hErGSOU0UtPsD7gbR9jorkTbWddu/AkeI0NsXIs3nmyWmShHFWPYHeO8u4BLh6Ml00rYjrOlHnm4=@lists.infradead.org
X-Gm-Message-State: APuU4Z96njux87PH7z+cwPbnJmsx+fQLFUhSUr3BnZc9DyejGoTUSxRw
	SfNLdLbiRW3iu9MZ3Koc6I3HWYFJUmS1epHM8YCl3O0M3+jRVgE7OW5Tcb6eUTSDDuhEOZLk2Zs
	6Hoxam37djNt5Gaveb7sUlQokdiLZ1K4uCtDWOw0r9y0hb5JrioWpRsNAWlcohQEt
X-Gm-Gg: AZFdTZdFbQ/9VPHFL7CQ2VYnkMomaOrkTtTx61iDbvJm1UN0QE6nZ7CE3cm20wVpdAW
	kngjektptmqsYsiWxHBIQTSK0o5MBDco3xsK90BH+d1HT0l8jbCcDKsJgcdoXkQ5tCM/oIBSL/0
	dbHSkEX32MHftypWMSriD56NjbHCGTOd4L6wNySKIF7amVXzavMR++j2Tz0XmmdJFvg0hVSlht9
	gm9af4YVlEI2pf7HY5LhqAQCq78uVRNsGUBztOY42yKsFbsV8S8Dna/Q5OrsbsFPBoIQJ6dmygl
	gRDXMldAa7QVCYk1OSg9AlcH7sARsXlduZqap+6KgkPigjpqBhe4r54TlldnzevAfkWOE0NygSC
	LqTbmvL336M4MxFm6Bnq11pJwYRr9qxcTDJB0WHCCta6B95OjR2lk7S4gz0VpejPArc6XGWKV/n
	HRTFG00L36
X-Received: by 2002:a05:7301:4b08:b0:36c:b138:651e with SMTP id 5a478bee46e88-38280a3c809mr4958717eec.22.1795093020375;
        Thu, 19 Nov 2026 04:57:00 -0800 (PST)
X-Received: by 2002:a05:7301:4b08:b0:36c:b138:651e with SMTP id 5a478bee46e88-38280a3c809mr4958700eec.22.1795093019864;
        Thu, 19 Nov 2026 04:56:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:56:59 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:33 +0530
Subject: [PATCH v6 1/7] PCI/bwctrl: Set host bridge OPP and optionally
 disable ASPM around link retraining
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-bwscale-v6-1-9a9a715fcb46@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=5883;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ym0w2JFu4Q8J6SLUhmOn7q9U3/O2c9O+f8dhYs9nmZk=;
 b=GKA/21jMYBH5Y5+9KJeS83+AIQ1zL5YHNq0gXkifEGDCeF/dctt/LHjNzfDkOJyveKlXI/nLH
 qP9dXMNA6ynDswC28JhwmChVx+Iz5srSsrFpQNqJaXTrRR71SdZjLoM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: vqs_GKdadb1-Lubrd7YsqvZKhbWBNXaY
X-Proofpoint-GUID: vqs_GKdadb1-Lubrd7YsqvZKhbWBNXaY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfXy/wOp64Y4TFB
 Jbpjgo8f6sWjGC0TynsIqIuIxmxy1oV+6tAiZs3p7mbvdclZ6uMOCZPqDm+Bj7KrtkYbB7ffqbH
 kXAW9Hp2v2kRlMolyluB2P+DzfXDBXU=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afef21d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=m7h7XtmfQhPoxq-7kmMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX8Ok5GlHmPH97
 4+nwRi1jTbjS0rawfUoNyF1EOwWOqopAVk2sjOKvJBk8zFtxWJ+1zxmdY6v43XPuaxrK/3/NM7L
 ZwvimaqcEMK96e+ha5ZAy+O00Mx+7e2ewI90wsyKqpZjEmUOrkGpzLg+ewf6yM3KCOlDxoB3eHK
 BVzpovGF1XBmoZS4h1W4uahSEqjuMgnoP0WiM4fXFs7x+DkwQK+BfRkALxjkEuWzmrHc+WlmW1v
 lfte7tc96p3oUP8rxYkU6sBSCAr+2/gfABwWmXQu0DnorroU8UL/lCv9LdAn8QJ2Qpcdcyd/qgE
 9lyBn8z6Set1wttBHXuA6RtBpzfQ2mX0wj40xEbDF64gmE+nOHhjW/Maw/31OPf5dV7ReibqWCs
 LjH1fVCI4E+sKE7uSAHAE7E0NjanpQU5e4yCwXB3QTiK9IoK7z3jgACtoyUqhWJhSq2Lgldmif3
 Loskwp5XyQC1FKFwnaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_045703_911985_1AB28830 
X-CRM114-Status: GOOD (  25.24  )
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

PCIe host bridge devices may need their operating point raised before
retraining to a higher link speed so that hardware resources (e.g., RPMh
votes on Qualcomm platforms) are available at the requested data rate.
After retraining, the operating point must be updated to reflect the
actual negotiated speed.

Add pcie_set_opp() to look up an OPP on the host bridge parent device
using a key of (total link rate in kHz, LNKCTL2 Target Link Speed
level). The total link rate is the per-lane rate multiplied by the
link width, so that OPP tables can carry separate entries per generation
and width, e.g. Gen 3 x1 and Gen 3 x2.

In pcie_set_target_speed(), call pcie_set_opp() before retraining only
when upscaling (speed_req > cur_bus_speed), since only raising the
operating point requires pre-staging hardware.  After retraining, call
pcie_set_opp() unconditionally with the actual cur_bus_speed to settle
the votes.  Both calls are skipped for downstream ports of PCIe switches,
as those are outside the host controller's scope.

Some controllers also require ASPM to be disabled around link retraining.
Add a disable_aspm_for_retrain flag to pci_host_bridge; when set,
pcie_set_target_speed() saves the child device's ASPM state, disables
all ASPM link states before retraining, and restores them afterward. The
child device is used because the ASPM core ignores requests made on the
Root Port itself and configures the link through its downstream device.
The states are restored with pci_force_enable_link_state(), as a
plain enable does not undo pci_disable_link_state().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
---
 drivers/pci/pcie/bwctrl.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/pci.h       |  1 +
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 3b1122461ffd..c1e749df5bbe 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -28,9 +28,11 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci-bwctrl.h>
+#include <linux/pm_opp.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include "../pci.h"
 #include "portdrv.h"
@@ -98,6 +100,37 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 	return pcie_retrain_link(port, use_lt);
 }
 
+static int pcie_set_opp(struct pci_dev *pdev, struct pci_host_bridge *host,
+			enum pci_bus_speed speed)
+{
+	struct device *dev = host->dev.parent;
+	struct dev_pm_opp_key key = {};
+	int ret, freq_mbps, width;
+	unsigned long freq_kbps;
+	struct dev_pm_opp *opp;
+	u16 lnksta;
+
+	pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
+
+	freq_mbps = pcie_dev_speed_mbps(speed);
+	if (freq_mbps < 0)
+		return -EINVAL;
+
+	freq_kbps = freq_mbps * KILO * width;
+	key.freq = freq_kbps;
+	key.level = pci_bus_speed2lnkctl2(speed);
+	opp = dev_pm_opp_find_key_exact(dev, &key, true);
+	if (!IS_ERR(opp)) {
+		ret = dev_pm_opp_set_opp(dev, opp);
+		if (ret)
+			dev_err(dev, "Failed to set OPP for freq (%lu): %d\n",
+				freq_kbps, ret);
+		dev_pm_opp_put(opp);
+	}
+	return 0;
+}
+
 /**
  * pcie_set_target_speed - Set downstream Link Speed for PCIe Port
  * @port:	PCIe Port
@@ -118,9 +151,12 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_rootbus = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
+	struct pci_dev *child = NULL, *dev;
+	int aspm_state = 0, ret;
 	u16 target_speed;
-	int ret;
 
 	if (WARN_ON_ONCE(!pcie_valid_speed(speed_req)))
 		return -EINVAL;
@@ -130,6 +166,27 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * Host Bridge resources may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (bus && is_rootbus && host) {
+		/* Get function 0 of downstream device */
+		list_for_each_entry(dev, &bus->devices, bus_list) {
+			if (PCI_FUNC(dev->devfn) == 0) {
+				child = dev;
+				break;
+			}
+		}
+
+		if (child && host->disable_aspm_for_retrain) {
+			aspm_state = pcie_aspm_enabled(child);
+			pci_disable_link_state(child, PCIE_LINK_STATE_ALL);
+		}
+		if (speed_req > bus->cur_bus_speed)
+			pcie_set_opp(port, host, speed_req);
+	}
+
 	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
 		struct pcie_bwctrl_data *data = port->link_bwctrl;
 
@@ -154,6 +211,12 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 	    !list_empty(&bus->devices))
 		ret = -EAGAIN;
 
+	if (bus && is_rootbus && host) {
+		if (child && host->disable_aspm_for_retrain)
+			pci_force_enable_link_state(child, aspm_state);
+		pcie_set_opp(port, host, bus->cur_bus_speed);
+	}
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9cbcadd08f3d..352079393edb 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -673,6 +673,7 @@ struct pci_host_bridge {
 	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
 	unsigned int	broken_l1ss_resume:1;	/* Resuming from L1SS during
 						   system suspend is broken */
+	unsigned int	disable_aspm_for_retrain:1; /* Disable ASPM before link retain */
 
 	/* Resource alignment requirements */
 	resource_size_t (*align_resource)(struct pci_dev *dev,

-- 
2.34.1


