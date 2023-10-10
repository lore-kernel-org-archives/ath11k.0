Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348D3CD68EE
	for <ath11k@archiver.kernel.org>; Tue, 10 Oct 2023 06:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qzU6+7vvXjfBEP85CiKmrwTEDVwTPuZCEDra1p98Qcw=; b=yM4X8LFyjOmvDC
	3OqUUG1aiGmrbfe3qnUtTqA9M/+B0n7bVeTkuHeJM8QVJ1m3ENakZi87XONoDrPK82TdhzXVhltZb
	PwQfz0mNhFBbufQzHctrD5oEfydnlNzj23yR87sAtCx4vihzxxCg/WUwxIshdWmSF1rdWj2yTfRuS
	lGW0Iy0VKcNNOpPtrKd9n4FxRnSk4guOeewdwAWKgnGzneW7NepuoZ8PNFiGGf5gpyUn443B51ufX
	KAqxVWzytsfLakSdGzGIKvRKx1NkmNCdpv9gYnPRE5kr0JXS44UXQzuLf0Np+42+wyToEKcCPzHzL
	oSi4vRuNsCD50pdhaoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq68v-00CZJV-05;
	Tue, 10 Oct 2023 06:22:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq68s-00CZIB-0c
	for ath11k@lists.infradead.org;
	Tue, 10 Oct 2023 06:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B279614E2
	for <ath11k@lists.infradead.org>; Tue, 10 Oct 2023 06:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E04C433C7;
	Tue, 10 Oct 2023 06:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696918973;
	bh=5NOg5uNUDnpZqHcJPhdo5YvKO0Os9HQIPC4c1sGnyPw=;
	h=From:To:Cc:Subject:Date:From;
	b=aacs0stuQVdFu4ERHSz8s2LC+p5c5tLKNMXRrUalh77ExMDnIB3vKNqv44Evd2ayr
	 utToWvTgLQ2BjLk3bwmatsi8PuN4eAqMAfdcRW3Grwl51Gxb2mw0FJaGFepz+cu+hZ
	 7WPNyi5IMVbyjEfslpwKzMwunW2Ih6ZULp7C5FdHyr/zQQVNa8KFYhbh9yLW+8YhYA
	 JoCXY9MxS6ll30E4m9rQJhTDBi/6GRYX+m3NL+nIg1y21xwNP4kCjR1AgdeHg9j0Df
	 J3iWVsuI+qr15tiywJnC8BKoxbo/wxitHBkfOROhtldeI5RIQOBxjPf+68AkwNRZJR
	 XuUf7vWYlCylA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: ath11k_debugfs_register(): fix format-truncation warning
Date: Tue, 10 Oct 2023 09:22:50 +0300
Message-Id: <20231010062250.2580951-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_232254_290276_C5BF4A3A 
X-CRM114-Status: UNSURE (   9.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

In v6.6-rc4 with GCC 13.2 I see a new warning:

drivers/net/wireless/ath/ath11k/debugfs.c: In function 'ath11k_debugfs_register':
drivers/net/wireless/ath/ath11k/debugfs.c:1597:51: error: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size 2 [-Werror=format-truncation=]
drivers/net/wireless/ath/ath11k/debugfs.c:1597:48: note: directive argument in the range [0, 255]
drivers/net/wireless/ath/ath11k/debugfs.c:1597:9: note: 'snprintf' output between 5 and 7 bytes into a destination of size 5

Increase the size of pdev_name to 10 bytes to make sure there's enough room for
the string. Also change the format to '%u' as ar->pdev_idx is u8.

Compile tested only.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 5bb6fd17fdf6..6f89e24cb612 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -1591,10 +1591,10 @@ static const struct file_operations fops_ps_state_enable = {
 int ath11k_debugfs_register(struct ath11k *ar)
 {
 	struct ath11k_base *ab = ar->ab;
-	char pdev_name[5];
+	char pdev_name[10];
 	char buf[100] = {0};
 
-	snprintf(pdev_name, sizeof(pdev_name), "%s%d", "mac", ar->pdev_idx);
+	snprintf(pdev_name, sizeof(pdev_name), "%s%u", "mac", ar->pdev_idx);
 
 	ar->debug.debugfs_pdev = debugfs_create_dir(pdev_name, ab->debugfs_soc);
 	if (IS_ERR(ar->debug.debugfs_pdev))

base-commit: 54ca82af78699713bae8b086f46ae13179772085
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
