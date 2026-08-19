Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16274C5DF81
	for <ath11k@archiver.kernel.org>; Wed, 19 Aug 2026 13:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZm8p07OPUwjWzI9g+/BN5XpGEETr3ffQKeDhE670RY=; b=mK78p52f4IRxtDIH+KS4jrl8Bv
	bdrB6tv2557dJyyiVfp0hPGyf5EqDNZXpJ+VuN6FhKzz7agaHG0y3d0AD9c144Moy6h7yyAGMVRsJ
	PNCR+ESve1UvWGJJipK0uGoO1965va82HUUiXBBRSaSBz/oTLn8W5o+o6P6JLQA0Vu9CcXtmkO2KI
	xzbdzcG3ehWuqD+btaAXY9nlFIrGZ9k4PnrcG6RzcDsnUKen0o90dY9ZeLoSkDCiaFG1SJ9xeFKn5
	O960DDyafH3DYmhpxlbiTRxocVvBntHPSm9M76GpPzn+bkhNExqM78bBkxPPHWppwYICxc4UynAl0
	QndgePww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJI-00000009riX-1t6A;
	Wed, 19 Aug 2026 13:26:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJG-00000009rhF-23eA
	for ath11k@lists.infradead.org;
	Wed, 19 Aug 2026 13:26:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JDLlkq399308
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZm8p07OPUwjWzI9g+/BN5XpGEETr3ffQKeDhE670RY=; b=anGZIaxGsLZQRJhu
	tC8Tf1KIAXcfjXEgxXtHkEnY4f3lRaKQjfFctshUG7cuNcl/+ZxmgTwQCfBUA7Uy
	GYy/ug4hdsAVNdkcO09ckYeY8AOvxL8djFVmbv8kWey2FvLp1814TzGxxpEC8ad/
	k+jR1lBZ/W7mmfIKnzejZLp15yWU/UaqDlLl4CFGVvfwslMi4jBP/nlTZspabY4C
	k3zDvtC2vqnUSEVdp5LZUiEoO3Cowes/hw4UePbNf2NOOPmXIFgv9+o1tcVHrZ/3
	i9h+vbd1SF1P+4rJZe+5in5JdjhYnl1WpQvsm33dbnxQpqI/lHLJMsY3Pae5CEPb
	pIA6Og==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa00kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so13978385ad.1
        for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 06:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145985; x=1787750785; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZm8p07OPUwjWzI9g+/BN5XpGEETr3ffQKeDhE670RY=;
        b=VhUW3Mpme0q/4Hr+Op7ZogpuNHEnVBtrR8wls/wei0saWpFf/bY0TtOZeM5zefgXOi
         sUzBfRR0aiyE2jQbEAWFEhPolVACvhapPBNxPOgRJJ0W90O+yRH4rYPwCnm6NhbiWEMe
         SSO3UzMeIZTPFRl1XUkDv1qpazSEyloZ23J1yi8UpZ9NVJHKJP77brtybVmq6+sfM8TK
         JOFIrALULWbC3UWrK9T2+aCldRk5BZyBMOB8cwfpdjHJlfOyBSeArGYXTVjgGBXXNjuD
         sxQHtH5lQdTpI+qh+1JJxGd0Ppihy/y6UQnndUfW1zb9gpFZUIw/5P2uOrclSJYIVV8K
         QXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145985; x=1787750785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZm8p07OPUwjWzI9g+/BN5XpGEETr3ffQKeDhE670RY=;
        b=Yemns9f4Zlx8boZ9tFSf/ez2un36o2xThi9jDfFikRl0fHtqIn4JquI6ORL+QNFVQD
         wPaq3ohiv7/A3EQCEiM21/quW66nqtdasQTuO+P8RAQDrMMWHRBB3kJ7s5ayM4HyQaSF
         oq8yz6YGKoKX4SbS/oAjeJv0GSaIWG+FHZz5IextnD08bEOZdqHdC07+GmEyOr92KkqH
         +38/DmMBcRW8VlnC24iF/arBFlLkygD/ipnlr8kunGztmPnt2p5ArJfdxscM7AIDyObn
         2mcusnenYg5QPZ4XGVoypLz91H084k+Yoqt6YOuICGf29zEjiuYDip9xYycLOmoBv/uM
         xpow==
X-Forwarded-Encrypted: i=1; AHgh+RobPuLIJyxowkvfsWAYA2xGhjwUfKRAJLfEtgXtVMPoYxgrQfLeblWXoo+3HfciKbRZ6WqV280=@lists.infradead.org
X-Gm-Message-State: AFuF++khtR4bvjTQNZ4NLNWpD5xRKxcToZxOA/8ildpiTgr8wmSoqF50
	uw7GRVlTRgOhcwVtUsJ9zMenJj4Tpkzlk0gqU30ITCZ2mtIl0OZKXxiDihAJXYO3soqEl/POQn5
	JinUd6bRIFbxbCzfXl3UWacZvG84b2/aqz6v6FHTvDifbydNeY+YSQ+Y143jTdeT1
X-Gm-Gg: AR+sD12dpHNB6DZ7c/kTyNJwJt2EwK/p0YstI/+JKHMopGm1gU2bXCivPKqwMjNxZem
	/C4lPlfHtt82S0vEhx1sodC3YIjFlv400PNRbLkU2n+ZVT5oBdG2gMu0k5nBeIBQ9KagIwHJsx6
	+PSRCZqyDP1GSQeMg37OlcoqZG5zyVFjgNBmyHFyxTjrXqHprk8k5BYiSagxjEpkAwzegaaYeVb
	/D1DQcOjVog09ziSqRtvXCVxXnTIy7abjhKn9jAmhaltXWpHq/vNAaPMh5bJMbLc52/05SfKEE1
	sHMyJ2CWHgu5x/K0FTnkrX3mvSjHbNWcL66tPDC5Dx3uVQhOUTKIxe1fFj2YBS0ux4WrDyYDkTV
	+hxBk3oBEQ/IST3+oc+5Bm8tjMN3fZe9VHo8=
X-Received: by 2002:a17:903:32cd:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d5fca022b5mr42665855ad.13.1787145985190;
        Wed, 19 Aug 2026 06:26:25 -0700 (PDT)
X-Received: by 2002:a17:903:32cd:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d5fca022b5mr42665355ad.13.1787145984708;
        Wed, 19 Aug 2026 06:26:24 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:52 +0530
Subject: [PATCH v5 1/6] PCI/bwctrl: Set host bridge OPP and optionally
 disable ASPM around link retraining
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-bwscale-v5-1-6dea79786b37@oss.qualcomm.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
In-Reply-To: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=5454;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=SxCA5XEAWKCcLkJi+5jHbvA5AUH+9sF5/jS3yVkOn+A=;
 b=+05IMJ0Y0LiMP+RJM/+lS+Ieb366h5UNezsjnd0NgWZJXOIggWGrqhPxMjNciQkqd7wJ9Tsh4
 r6NglZRdgamDYFX2v5ULcjIPuRYE0iQYRf+qfr13iweVLysNF1dR4Zo
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a85af02 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=m7h7XtmfQhPoxq-7kmMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vJdTyiTrJJJbhx1zEsA0_m6JKjTlTppm
X-Proofpoint-ORIG-GUID: vJdTyiTrJJJbhx1zEsA0_m6JKjTlTppm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX2vFa9xWjXIFC
 Ml4scOYoRwDAhJiEkv7DUEiVeERU2R25LPRBSrl0m1GBHnoJd7vxky6qRs4H5uRmW3U3Cg/t4bA
 57Zv2odV08viBNDGstf2AnMYoj8ko8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX45Zg+pd7Ih2X
 6Y8elh2EKmfr0hm3zxOQi7adW5G1K6yHe5DnbtGIs8Ud35Dhg7UJWairpAx9RcvfzxFJ7f6M8Sx
 U52rsDrJZhqPx4Rj9BSmNTIWCnN7z54nSMxiQeDSVNgDhT4v39QC4t/+8zcClLXHzjLSH4S9Lyx
 U7jsKjS00KtYN4wxcdzfoo8b2j7OFvXh/0JvLT67MX9wyLG8Tmlx08Nu1/CwG7mEZLautfWm4CO
 YVQ/KW3zNWNQVwbUwLMf9zux+JFUkxV4mDUHNX6hIch8SO0UNOTHzA+4+PwCs8yySS5+p64Wae8
 +pBvrQmWOh1+oaW+cwSbhQMrimsDrMQa+j+sE0pXhOHvkxV9tDz+yDT78So5sZSoLOcBANiKvva
 4Dz/p+VVXedeHMyo/qbKQiJcP09inXY+BLXSHyhEg5YK1a0sxBuXlTVVUXeuLF5woSbiAR6+AX0
 pEcaf5qVpe3gowSHQEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_062626_609513_529E56B6 
X-CRM114-Status: GOOD (  24.92  )
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

PCIe host bridge controllers may need their operating point raised before
retraining to a higher link speed so that hardware resources (e.g., RPMh
votes on Qualcomm platforms) are available at the requested data rate.
After retraining, the operating point must be updated to reflect the
actual negotiated speed.

Add pcie_set_opp() to look up an OPP on the host bridge parent device
using a key of (per-lane frequency in kHz, LNKCTL2 Target Link Speed
level).  Keying by generation rather than total bandwidth lets OPP tables
remain width-independent.

In pcie_set_target_speed(), call pcie_set_opp() before retraining only
when upscaling (speed_req > cur_bus_speed), since only raising the
operating point requires pre-staging hardware.  After retraining, call
pcie_set_opp() unconditionally with the actual cur_bus_speed to settle
the votes.  Both calls are skipped for downstream ports of PCIe switches,
as those are outside the host controller's scope.

Some controllers also require ASPM to be disabled around link retraining.
Add a disable_aspm_for_retrain flag to pci_host_bridge; when set,
pcie_set_target_speed() saves the child device's ASPM state, disables all
ASPM link states before retraining, and restores them afterward.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/pci.h       |  1 +
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index c4c8d260bf96..6fa1522c47db 100644
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
@@ -120,6 +122,38 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
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
+	freq_kbps = freq_mbps * KILO;
+	key.freq = freq_kbps;
+	key.level = pci_bus_speed2lnkctl2(speed);
+	key.bw = 0;
+	opp = dev_pm_opp_find_key_exact(dev, &key, true);
+	if (!IS_ERR(opp)) {
+		ret = dev_pm_opp_set_opp(dev, opp);
+		if (ret)
+			dev_err(dev, "Failed to set OPP for freq (%lu): %d\n",
+				freq_kbps * width, ret);
+		dev_pm_opp_put(opp);
+	}
+	return 0;
+}
+
 /**
  * pcie_set_target_speed - Set downstream Link Speed for PCIe Port
  * @port:	PCIe Port
@@ -140,9 +174,12 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_rootbus = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
+	struct pci_dev *child = NULL;
+	int aspm_state = 0, ret;
 	u16 target_speed;
-	int ret;
 
 	if (WARN_ON_ONCE(!pcie_valid_speed(speed_req)))
 		return -EINVAL;
@@ -152,6 +189,24 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * The host bridge driver may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (is_rootbus && host && bus) {
+		/* Get function 0 of downstream device */
+		list_for_each_entry(child, &bus->devices, bus_list)
+			if (PCI_FUNC(child->devfn) == 0)
+				break;
+
+		if (child && host->disable_aspm_for_retrain) {
+			aspm_state = pcie_aspm_enabled(child);
+			pci_disable_link_state_locked(child, PCIE_LINK_STATE_ALL);
+		}
+		if (speed_req > bus->cur_bus_speed)
+			pcie_set_opp(port, host, speed_req);
+	}
+
 	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
 		struct pcie_bwctrl_data *data = port->link_bwctrl;
 
@@ -176,6 +231,12 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 	    !list_empty(&bus->devices))
 		ret = -EAGAIN;
 
+	if (bus && is_rootbus && host) {
+		if (child && host->disable_aspm_for_retrain)
+			pci_enable_link_state_locked(child, aspm_state);
+		pcie_set_opp(port, host, bus->cur_bus_speed);
+	}
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 18e814064b51..d1f2d382189d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -662,6 +662,7 @@ struct pci_host_bridge {
 	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
 	unsigned int	broken_l1ss_resume:1;	/* Resuming from L1SS during
 						   system suspend is broken */
+	unsigned int	disable_aspm_for_retrain:1; /* Disable ASPM before link retain */
 
 	/* Resource alignment requirements */
 	resource_size_t (*align_resource)(struct pci_dev *dev,

-- 
2.34.1


