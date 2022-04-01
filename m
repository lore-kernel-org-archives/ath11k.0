Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEEAC433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvDR30MXxESSCLJqaHJLiPfHbWsmXAQGzW3u9ee//q8=; b=UwN2T5G62RrRnZ
	an6YYr9WktDAKpqH8ExtBok5HB1qyd2YALhJZ3cZRJDg0WBUBY6gwJBX1+DbXqxYgky6kTHnHIEl1
	Vnor65Wxe3r6Vw6l5l/y9VsxVV0eaq2mbGLRvjfExpZycsH2nwn+ovZMuJnrYLe0u10aT3uLT8EKH
	lFAvaNlC3sMCXDGEznIDZ1+3hrxFepZK0+v+9+wal8YIoQv3cB9TSD6oLDh3mwYQ6Zm8uaDJpiqhJ
	EBQvWBdVD5rj57DhFHhMPk0HDW6vPHgHifTG+31NSbO3o/Bjy9iVfibrDoFuB5URzsq3wPdnIHNta
	RhOXAnAilqUN1Ar8NO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIcp-006EoV-RO; Fri, 01 Apr 2022 14:51:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naIU4-0069ku-Ix
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 14:42:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29923B82502;
 Fri,  1 Apr 2022 14:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED40C3410F;
 Fri,  1 Apr 2022 14:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824157;
 bh=655SPyw+7+b05qOtVv9OrDh+FzGI99dWI1geAjap6zY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fn9FY5D6uMnUVBy0mmoIfkeDESmiMNkiCaBUZA9wYjbstLIctWT/YCeK7Ifz1QH8f
 dFvkRFNRWdaJ6uXxVBooyAm9WZBceRZfiIthckXqKPhUu5pX1FvgeApxZOyqrSWN4G
 pV6M43Fc4vRUdCFJGe3x61uBNbN/25Rr8coS12S6YmEMuEoauYiarC3+yryUotVHlA
 +vZef0UNoQdWIeqBrc6YfT8ciHNRv/OX2gzkkUa4rymG+0ayducckaBlzlVHjnsRcL
 vQj3YmwQGsb6yOMhyiTGjpYvDSMrNKLjFkTu0JOyGXYEkMVdswluhhGeiUbpJZCgfl
 xQCPifObhhgyA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 Kalle Valo <quic_kvalo@quicinc.com>, Sasha Levin <sashal@kernel.org>,
 kvalo@kernel.org, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 09/65] ath11k: fix kernel panic during
 unload/load ath11k modules
Date: Fri,  1 Apr 2022 10:41:10 -0400
Message-Id: <20220401144206.1953700-9-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401144206.1953700-1-sashal@kernel.org>
References: <20220401144206.1953700-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_074240_979538_F3D93E00 
X-CRM114-Status: GOOD (  10.07  )
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

From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>

[ Upstream commit 22b59cb965f79ee1accf83172441c9ca0ecb632a ]

Call netif_napi_del() from ath11k_ahb_free_ext_irq() to fix
the following kernel panic when unload/load ath11k modules
for few iterations.

[  971.201365] Unable to handle kernel paging request at virtual address 6d97a208
[  971.204227] pgd = 594c2919
[  971.211478] [6d97a208] *pgd=00000000
[  971.214120] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[  971.412024] CPU: 2 PID: 4435 Comm: insmod Not tainted 5.4.89 #0
[  971.434256] Hardware name: Generic DT based system
[  971.440165] PC is at napi_by_id+0x10/0x40
[  971.445019] LR is at netif_napi_add+0x160/0x1dc

[  971.743127] (napi_by_id) from [<807d89a0>] (netif_napi_add+0x160/0x1dc)
[  971.751295] (netif_napi_add) from [<7f1209ac>] (ath11k_ahb_config_irq+0xf8/0x414 [ath11k_ahb])
[  971.759164] (ath11k_ahb_config_irq [ath11k_ahb]) from [<7f12135c>] (ath11k_ahb_probe+0x40c/0x51c [ath11k_ahb])
[  971.768567] (ath11k_ahb_probe [ath11k_ahb]) from [<80666864>] (platform_drv_probe+0x48/0x94)
[  971.779670] (platform_drv_probe) from [<80664718>] (really_probe+0x1c8/0x450)
[  971.789389] (really_probe) from [<80664cc4>] (driver_probe_device+0x15c/0x1b8)
[  971.797547] (driver_probe_device) from [<80664f60>] (device_driver_attach+0x44/0x60)
[  971.805795] (device_driver_attach) from [<806650a0>] (__driver_attach+0x124/0x140)
[  971.814822] (__driver_attach) from [<80662adc>] (bus_for_each_dev+0x58/0xa4)
[  971.823328] (bus_for_each_dev) from [<80663a2c>] (bus_add_driver+0xf0/0x1e8)
[  971.831662] (bus_add_driver) from [<806658a4>] (driver_register+0xa8/0xf0)
[  971.839822] (driver_register) from [<8030269c>] (do_one_initcall+0x78/0x1ac)
[  971.847638] (do_one_initcall) from [<80392524>] (do_init_module+0x54/0x200)
[  971.855968] (do_init_module) from [<803945b0>] (load_module+0x1e30/0x1ffc)
[  971.864126] (load_module) from [<803948b0>] (sys_init_module+0x134/0x17c)
[  971.871852] (sys_init_module) from [<80301000>] (ret_fast_syscall+0x0/0x50)

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.6.0.1-00760-QCAHKSWPL_SILICONZ-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/1642583973-21599-1-git-send-email-quic_vnaralas@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 9ff6e6853314..190bc5712e96 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -366,6 +366,8 @@ static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
 
 		for (j = 0; j < irq_grp->num_irq; j++)
 			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
+
+		netif_napi_del(&irq_grp->napi);
 	}
 }
 
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
