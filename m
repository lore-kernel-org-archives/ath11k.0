Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004F6C10DC2
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGyoGO1ZfQ1dmeM+RgDclbsrFbOphr5TLoBFYBOuhBk=; b=WKY0khjFr5pngg
	6Uvd4vFayzpR3X10mrRG/wrEa4nS+uAq/308VXd2NCPjkVrR6L2I+g5tRPkUGZeaM5Ks/vrjH6Vzf
	6qvpePayFBAtqKdrlyUKLDz8aBsFPl3BsvAypY5gpV+uiKX5h6jOvh983di0bJVpYmTZ0RtOOA2im
	GZJ5JcFubRpzREhGPjh6UrYITtSzU4pTto9L+E5ny502CCxAay6WrxqDwuLqGUqXiT21ou0qejLO/
	jqcfLUkegZ9Gh9wZ/TMVSKdLgUCc7kYlvQp589d3YlyneCXp1+J9cINqiEY8vG6OwDRMhj6Ivu1WA
	bXWcfKz1uTNz0QtzqK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eLw-002xVt-24;
	Mon, 27 Nov 2023 16:20:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eLY-002xHM-1S
	for ath11k@lists.infradead.org;
	Mon, 27 Nov 2023 16:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA0FA612F0
	for <ath11k@lists.infradead.org>; Mon, 27 Nov 2023 16:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6E4C433C9;
	Mon, 27 Nov 2023 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701102031;
	bh=m1Qw8/vtVY4p1/3aRSjL1MDaqIJS0lXW4t1xxd50gVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jnhv8dezDS7gj22Ipkygfaz8Oh01NtpkbtnMvC1YMrOCXFNJ1CjH5uIyPAZ7FCJqH
	 ZpARgkT+/wXCnpCrRqjZlzmDwLGe9IL6mIe6aRQU4W+f3dFjsk/+kzomYkJ8WgUNWf
	 qbF8etvasH+C7FPJF8hLwvJjg8s4+2bmdewlY4NZJFD4YKD7GSj83SOQnX18VxEGfl
	 cO4JcE8W4JNF3r4JKLTDp4X///S6kEsBifJs/+kS2fL3Mi9TaxSx5Slv0WdnzSwo2L
	 L/ACLcete2C36pJW3I740d2d+tBpGDfrlJ56HLTkqAUMl+TnBXlvQpJv7zShxbnxmP
	 d+fLbIKWfzdaQ==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC v2 5/8] wifi: ath11k: do not dump SRNG statistics during resume
Date: Mon, 27 Nov 2023 18:20:19 +0200
Message-Id: <20231127162022.518834-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127162022.518834-1-kvalo@kernel.org>
References: <20231127162022.518834-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_082032_683934_72A4E00D 
X-CRM114-Status: GOOD (  11.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Baochen Qiang <quic_bqiang@quicinc.com>

Both the firmware reset feature and the power management
suspend/resume feature share common power-down and power-up
functionality. One aspect of the power-up functionality is
the handling of the ATH11K_QMI_EVENT_FW_INIT_DONE event.
When this event is received, a call is made to
ath11k_hal_dump_srng_stats(), with the purpose to collect
information that may be useful in debugging the cause of a
firmware reset.

Unfortunately, since this functionality is shared between
both the firmware reset path and the power management
resume path, the kernel log is flooded with messages during
resume. Since these messages are not useful during resume,
and in fact can be confusing and can increase the time it
takes to resume, update the logic to only call
ath11k_hal_dump_srng_stats() during firmware reset.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index c270dc46d506..97a74563d4a6 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3249,7 +3249,8 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 		case ATH11K_QMI_EVENT_FW_INIT_DONE:
 			clear_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
 			if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
-				ath11k_hal_dump_srng_stats(ab);
+				if (ab->is_reset)
+					ath11k_hal_dump_srng_stats(ab);
 				queue_work(ab->workqueue, &ab->restart_work);
 				break;
 			}
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
