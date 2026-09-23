Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC92CC98315
	for <ath11k@archiver.kernel.org>; Wed, 23 Sep 2026 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaAZ9kCMZrk5xvH2pBRro/RLM2/L4osWyG2hxWh6EVk=; b=S29iGgvep2bKo4EqKo+h1rCCRp
	ZNGlrY4Z1tIM8zvrI9V0fzEwGrYZMYyBUse4yWgKh4nYwy/hxS2IGJ8gv9A5FsYe2m7x9aX+w4px1
	H/7sbUaYNZxld/Iq4B1wQABrKlrWaVXRlGMHUH5LbyMraLEeVkfgJVyCah9rgrzTBc6uyt2S3Xf75
	o+KXRm2eCBRRkrFRSKy99yRT9SG0eXsLzEJeS7Q2otwhGc3Os/03fV7wHk7dOx9N/dy2O6vFYuZRQ
	IipY6Np561rw5tZ3qjGru9DDCz8Ws7CQepHvbusuUAMeDUvTfXCk1WENosguMxUAjdNF7HpW5vGJT
	fL1Dw6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lj1-00000008BAM-0tqs;
	Wed, 23 Sep 2026 12:05:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Liz-00000008B8C-2OVH
	for ath11k@lists.infradead.org;
	Wed, 23 Sep 2026 12:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31E54447B5;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B04BC2BD04;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790165121;
	bh=AIpgeoob11JrgFR2zIPw+UNx7APizElkKKPNQhREDUA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GERWzTMHdq7+bB0PPBBepqEbzWgZqUwBIRF7XmrDJ6KDPco+kQldQAPRxlABCMupS
	 Vv7koV9iUDk6SY5/n+Nzdk9ouKiBk4/hKceGadKOPFwNjXoMK8Oron+c3ZXM+GcoJQ
	 grkthrRzLYlXknQ0Fbn9ZVm4pjpdJU/Qe+wBGKsPUecl6brZaW8vzOYPDRfe01KX5s
	 C7iXNeml+1T2oVFoI9ALowzv6vZKMNMb+iLM6iVavmA5prbCjOXurVZjSC+9Wdnt5E
	 RMwAd8mwdWK3U3AutdOYk5HBi3gGjjhClcaVkkgCEJD5etTJbR/nBUiXmLQ5Tr88TR
	 3oHpRdfSHxx/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E438FC9830C;
	Wed, 23 Sep 2026 12:05:20 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 23 Sep 2026 16:05:11 +0400
Subject: [PATCH ath-next 05/16] wifi: ath11k: Add ability to set BDF and M3
 dump memory addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-ipq5018-qcn6122-mpd-v1-5-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790165117; l=4319;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=OEbvWqdqRA5K8/mH7uT4NFreSkqPWXIOdUNpo2XK8O4=;
 b=t2JEXaDKoHwBk5X3Jg6Aw7RhynOO3AQZ3IoT8CEM2qYvlXLUoFO7xI4y/wxSlCdElt5sfwcgc
 ztz630J0jFqAkk+fTkMhwrf/fT4MqHZlR6HYo0WrzQG63slf1+yENro
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
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
Reply-To: george.moussalem@outlook.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

The BDF address is currently hardcoded in the hardware parameters.
However, the BDF address for multi-PD firmware can vary based on the
target and firmware. In addition, setting the M3 dump address is
required for IPQ5018/QCN6122 multi-PD firmware and functioning WiFi
operation.

As such, add the ability to lookup the respective reserved memory
regions defined in the device tree and use those addresses for the BDF
and M3 dump.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 62 +++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index bd81e8d3d5f7..771ef9b5304f 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2037,6 +2037,45 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 	return 0;
 }
 
+static const char *ath11k_qmi_get_mem_reg_name(int mem_type)
+{
+	switch (mem_type) {
+	case HOST_DDR_REGION_TYPE:
+	case BDF_MEM_REGION_TYPE:
+		return "q6-region";
+	case M3_DUMP_REGION_TYPE:
+		return "m3-dump";
+	default:
+		return NULL;
+	}
+}
+
+static int ath11k_qmi_reserved_memory_to_resource(struct ath11k_base *ab,
+						  int mem_type,
+						  struct resource *res)
+{
+	const char *rname;
+	int ret;
+
+	rname = ath11k_qmi_get_mem_reg_name(mem_type);
+	if (!rname) {
+		ath11k_dbg(ab, ATH11K_DBG_QMI,
+			   "invalid memory type %d\n", mem_type);
+		return -EINVAL;
+	}
+
+	ret = of_reserved_mem_region_to_resource_byname(ab->dev->of_node,
+							rname, res);
+	if (ret) {
+		ath11k_dbg(ab, ATH11K_DBG_QMI,
+			   "failed to get reserved memory region for %s\n",
+			   rname);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 {
 	struct device *dev = ab->dev;
@@ -2073,7 +2112,11 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			idx++;
 			break;
 		case BDF_MEM_REGION_TYPE:
-			ab->qmi.target_mem[idx].paddr = ab->hw_params.bdf_addr;
+			ret = ath11k_qmi_reserved_memory_to_resource(ab, BDF_MEM_REGION_TYPE, &res);
+			if (!ret && !(ab->qmi.target_mem[i].size > resource_size(&res)))
+				ab->qmi.target_mem[idx].paddr = res.start;
+			else
+				ab->qmi.target_mem[idx].paddr = ab->hw_params.bdf_addr;
 			ab->qmi.target_mem[idx].iaddr = NULL;
 			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
 			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
@@ -2107,6 +2150,16 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
 			idx++;
 			break;
+		case M3_DUMP_REGION_TYPE:
+			ret = ath11k_qmi_reserved_memory_to_resource(ab, M3_DUMP_REGION_TYPE, &res);
+			if (!ret && !(ab->qmi.target_mem[i].size > resource_size(&res))) {
+				ab->qmi.target_mem[idx].paddr = res.start;
+				ab->qmi.target_mem[idx].iaddr = NULL;
+				ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
+				ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
+				idx++;
+			}
+			break;
 		default:
 			ath11k_warn(ab, "qmi ignore invalid mem req type %d\n",
 				    ab->qmi.target_mem[i].type);
@@ -2300,6 +2353,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 {
 	struct qmi_wlanfw_bdf_download_req_msg_v01 *req;
 	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp;
+	struct resource res = {};
 	struct qmi_txn txn;
 	const u8 *temp = data;
 	void __iomem *bdf_addr = NULL;
@@ -2313,7 +2367,11 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 	memset(&resp, 0, sizeof(resp));
 
 	if (ab->hw_params.fixed_bdf_addr) {
-		bdf_addr = ioremap(ab->hw_params.bdf_addr, ab->hw_params.fw.board_size);
+		ret = ath11k_qmi_reserved_memory_to_resource(ab, BDF_MEM_REGION_TYPE, &res);
+		if (!ret && !(ab->hw_params.fw.board_size > resource_size(&res)))
+			bdf_addr = ioremap(res.start, ab->hw_params.fw.board_size);
+		else
+			bdf_addr = ioremap(ab->hw_params.bdf_addr, ab->hw_params.fw.board_size);
 		if (!bdf_addr) {
 			ath11k_warn(ab, "qmi ioremap error for bdf_addr\n");
 			ret = -EIO;

-- 
2.53.0



