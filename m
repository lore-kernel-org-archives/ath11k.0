Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E67CCF2DA
	for <ath11k@archiver.kernel.org>; Mon, 19 Oct 2026 10:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIrInL137ITvZYEldVyaB5myPr+oh/eeEduzPMDUH/s=; b=qtDzorrG7KC7dEQB6Uttyzbfw0
	kx14pJlpkmN78efFJa3kanGVB2VruW8iqauabIct9qAtQlkgMAkkKy8TISCyvlFL3mgbnq8fjUXq0
	nPfOlXz+6egAAlfYEqqqhC0uSNGhz3NQqRwTvfa1ZvPtJqEWuT2NVmMrnwfo/8DcL9KtGBqYGfIgY
	MQg13Bxeshli1gfeUN7H3hIuzLo8OdtpWQ84If2piWuoENf5wJpsOB8TVwf1tlBi7fw79hlaC+UaF
	ios2HoAPQHQWtD47Dy1VU5O+KfkhW4cHJFKyFB46O6BmT4A1CHVIrUTs7zxvTcS9ZXjuDno47+APu
	Mk40sGug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkAt-000000075E2-0C0J;
	Mon, 19 Oct 2026 10:00:59 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkAk-00000007593-0zVj
	for ath11k@lists.infradead.org;
	Mon, 19 Oct 2026 10:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=RI
	rInL137ITvZYEldVyaB5myPr+oh/eeEduzPMDUH/s=; b=Xy4H/F3fyboTprtHtG
	kZ7uN02zsAPLJYbAdrVDAy1hvYrZzALaj9OslKLFip1xdgeJ4TWOFb+GVNSB2061
	HqmamC/redf6Ig8OYhaYDH+2HNeZJWDFj5BCbLUigZ/qOp4W5Y7hLuJlkOQou8gH
	/YpotwoGOegiN6WpabrHFYewA=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3E3g+6tVqofy8Ag--.62619S3;
	Mon, 19 Oct 2026 18:00:33 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	kbuild test robot <lkp@intel.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <jiale.yao@example.com>
Subject: [PATCH 1/4] wifi: ath11k: validate extended regulatory capability count
Date: Mon, 19 Oct 2026 18:00:26 +0800
Message-Id: <20261019100029.1908660-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019100029.1908660-1-yaojiale02@163.com>
References: <20261019100029.1908660-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgC3E3g+6tVqofy8Ag--.62619S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr17JFWkAF1rWw1xCFy7GFg_yoW8GF4xpF
	WYvFyjyryUJF47C3yUAa1xAFy5uan3tr43KrW5t34fuFyxCF4Fv3WYgFyjvr4FyayDJFnF
	gF40qayfWF90yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeXdUUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AHaFWrV6kFkDQAA3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030054_632041_B483443A 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

From: Jiale Yao <jiale.yao@example.com>

Firmware reports the number of PHYs separately from the array of
extended regulatory capabilities. The TLV parser rejects excess array
entries, but accepts an array with fewer entries than the reported PHY
count. The subsequent loop uses the reported count and reads beyond the
supplied array.

Reject mismatched counts before indexing the capability array.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Jiale Yao <jiale.yao@example.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index bbca275a8289..995fee2ffdfa 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4859,6 +4859,13 @@ static int ath11k_wmi_tlv_ext_hal_reg_caps(struct ath11k_base *soc,
 		return ret;
 	}
 
+	if (svc_rdy_ext->n_ext_hal_reg_caps != svc_rdy_ext->param.num_phy) {
+		ath11k_warn(soc, "invalid number of reg caps %u, expected %u\n",
+			    svc_rdy_ext->n_ext_hal_reg_caps,
+			    svc_rdy_ext->param.num_phy);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < svc_rdy_ext->param.num_phy; i++) {
 		ret = ath11k_pull_reg_cap_svc_rdy_ext(wmi_handle,
 						      svc_rdy_ext->soc_hal_reg_caps,
-- 
2.34.1


