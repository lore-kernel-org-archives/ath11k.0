Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46C6C98311
	for <ath11k@archiver.kernel.org>; Wed, 23 Sep 2026 12:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lr1sSD6oPVRFzXyEte48EDlfhqEqMis7rkdiY7FM2Sk=; b=FZ0/FR1SeBoPyAL4FLRhM3+6JE
	/3IIQULwstLapThyduQVJCBBtvGrLlnRS3Vm2Atm9EXDXth4UuMhbBXqX9Y6gFkD++1BoJUSyhL25
	0IvmRnpyqm7IU5ubBGc52xQhZR7ZVwKzrCjzvsmfOUPauIX3RSBurQN75bdhi9k1l2QkOMfXMpj+r
	sDp9HL0S2n0qjZ2VnKZ/L2LgBJ7QUAirL21kkkMORiIS4VfETDgIXuXRNqKsMhRPrYVPkbcApvKSd
	CoezvL5OR9IxK+otDGpwWfSPb6Vk9ZxB5v82gUU14NNkxjHav72oBElQRx7DdO/B/H/T7tDVZo3lp
	BUUUIPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lj2-00000008BCy-3CVA;
	Wed, 23 Sep 2026 12:05:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Liz-00000008B8X-3YJa
	for ath11k@lists.infradead.org;
	Wed, 23 Sep 2026 12:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B8FF44841;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E8F9C2BCFC;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790165121;
	bh=f5A3aOPcpzcnyloEZkCpzWN2JqMgiC0WgPDk/yfr8jk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HVBX4hOh/YRnQc4UjLUWKa//MqZ9sZsYuIRRDHjz6E181sNABE+xo1K+++sp+Vm5O
	 YoeCJsQBQMR7x7xUVnFfZB3/POrK/G+PpSApVZGgk+D48YOGr0y85pUwigahoyfVF1
	 6REN0Q2O5OzshLTXCZ9ZtQ5JNC0ePgkyQ/Ka/djvJgXi7VDMgucYCsbGT6/PN4Ofic
	 CxXesyhSsGw1MTmcmkvy3BXjx7ZMeKYYX+01aOJkX5g1zu7dU70ZqjLcZcjZtZ3y5T
	 +dAlCNMQfiwqsPKeNMbtkiIFaOE07jmSjVHrmbVK/jFblkENL00sU83gjX+ukcfZtB
	 ZAWFkQqjwWGPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFABC9830C;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 23 Sep 2026 16:05:15 +0400
Subject: [PATCH ath-next 09/16] wifi: ath11k: Power down userPD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-ipq5018-qcn6122-mpd-v1-9-86729521a75c@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790165117; l=1688;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=f09E/N0UiP2BKaMQj6y/PbCNtm6/77F+Gx3rtxqkmB0=;
 b=8Th6YZPBmOceHukUz3XAVEKAdI2Cb3gd5mOzw5oZb3/5aqmJLgMbeVE3tRwO8PaAU9+RY1cc6
 W713+4AAuEVBuPqzDvgliJZ/m4MhgZmELOS/ZXzN9j2FWPOlmA5dlAo
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

Set the stop bit in SMEM to stop the userPD. Wait for stop-ack IRQ to
indicate power down completion.

For IPQ5018 wifi specifically, invoke an SCM call to power down the
radio.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 2c41cf585d00..1b9115311bed 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -491,9 +491,32 @@ static int ath11k_ahb_power_up(struct ath11k_base *ab)
 	return 0;
 }
 
+static void ath11k_ahb_stop_user_pd(struct ath11k_base *ab)
+{
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+	unsigned long time_left;
+
+	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit),
+				    BIT(ab_ahb->stop_bit));
+
+	time_left = wait_for_completion_timeout(&ab_ahb->userpd_stopped,
+						ATH11K_USERPD_STOP_TIMEOUT);
+	if (!time_left)
+		ath11k_warn(ab, "UserPD stop wait timed out\n");
+
+	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit), 0);
+
+	if (ab->hw_rev == ATH11K_HW_IPQ5018_HW10)
+		qcom_scm_pas_set_wifi_power_mode(MPD_WCNSS_PAS_ID, false);
+}
+
 static void ath11k_ahb_power_down(struct ath11k_base *ab, bool is_suspend)
 {
-	return;
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+
+	if (ab_ahb->userpd_id > 0 &&
+	    ab_ahb->userpd_id < ATH11K_AHB_USERPD_ID_MAX)
+		ath11k_ahb_stop_user_pd(ab);
 }
 
 static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)

-- 
2.53.0



